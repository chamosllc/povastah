package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.change_vision.jude.api.inf.model.IAssociationClass;
import com.change_vision.jude.api.inf.model.IClass;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IElement;
import com.change_vision.jude.api.inf.model.IGeneralization;
import com.change_vision.jude.api.inf.model.IInstanceSpecification;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

import biz.chamos.povastah.shape.LineSort;
import biz.chamos.povastah.shape.Node;
import biz.chamos.povastah.shape.Point3D;;

/**
 * ClassDiagram Object in POVRay Scene
 *  Enable Class Hierachy Visualization
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/07
 *
 */
public class ClassDiagram extends Diagram {
	/**
	 * クラス継承関係にあるノード間のz値の差分
	 */
	static final protected double DEPTH_OFFSET = -32.0;
	
	/**
	 * ダイアグラム内でのクラス継承順位(最下位は1)
	 */
	protected Map<IClass, Integer> classHierachyOrder = new HashMap<>();

	public ClassDiagram(IDiagram diagram, OutputStreamWriter scene){
		super(diagram, scene);
	}

	/**
	 *描画ノードを抽出し、対象の有無を返す
	 * @return 対象の有無
	 */
	protected boolean existsScene(){
		boolean exists = super.existsScene();
		if(exists) {
			orderClassHierachy();
			correctZofNodes();
		}
		return exists;
	}
	
	/**
	 * ダイアグラム内でのクラス継承順位を求める
	 * 
	 * @throws IOException 
	 */
	protected void orderClassHierachy() {
		Collection<IClass> models = new HashSet<>();
		for(Node node: nodes) {
			if(node.getModel() instanceof IClass) {
				models.add((IClass)node.getModel());
			}
		}
		for(IClass target: models) {
			Collection<IClass> generals = new HashSet<>();
			// スーパークラス群があれば階層の深さを決める
			for(IGeneralization general: target.getGeneralizations()) {
				if(models.contains(general.getSuperType())){
					generals.add(general.getSuperType());
				}
			}
			if(generals.size() > 0) {
				int depth = 1;
				// サブクラス群があれば自分の階層の深さを決める
				Collection<IClass> specials = new HashSet<>();
				for(IGeneralization special: target.getSpecializations()) {
					if(models.contains(special.getSubType())){
						specials.add(special.getSubType());
					}
				}
				if(specials.size() > 0) {
					for(IClass subClass: specials) {
						if(classHierachyOrder.containsKey(subClass)) {
							depth = Math.max(depth, classHierachyOrder.get(subClass) + 1);
						}
					}
					if(classHierachyOrder.containsKey(target)) {
						classHierachyOrder.replace(target, depth);
					}else {
						classHierachyOrder.put(target, depth);
					}
				}
				depth++;
				for(IClass superClass: generals) {
					if(classHierachyOrder.containsKey(superClass)) {
						if(depth >  classHierachyOrder.get(superClass)) {
							classHierachyOrder.replace(superClass, depth);
							spreadRoot(superClass.getGeneralizations(), depth + 1);
						}
					}else {
						classHierachyOrder.put(superClass, depth);
					}
				}
				if(!classHierachyOrder.containsKey(target)) {
					classHierachyOrder.put(target, 1);
				}
			}
		}
	}
	
	/**
	 * クラス階層の深さの変更をルートクラスまで波及させる
	 */
	protected void spreadRoot(IGeneralization[] generals, int depth) {
		for(IGeneralization general: generals) {
			IClass superClass = (IClass) general.getSuperType();
			if(classHierachyOrder.containsKey(superClass)) {
				if(depth > classHierachyOrder.get(superClass)) {
					classHierachyOrder.replace(superClass, depth);
					spreadRoot(superClass.getGeneralizations(), depth + 1);
				}
			}
		}
	}

	/**
	 * 継承階層に応じたノードのz座標値を設定する
	 */
	protected void correctZofNodes() {
		for(Node node: nodes) {
			if(classHierachyOrder.containsKey(node.getModel())) {
				node.getLocation().setZ((classHierachyOrder.get(node.getModel()) - 1) * DEPTH_OFFSET);
			}
		}
	}
	
	/**
	 * シーン記述のヘッダ部を記述する
	 * クラス階層順位をコメントする
	 * @throws IOException
	 */
	protected void header() throws IOException {
		super.header();
		if(classHierachyOrder.size() > 1) {
			scene.write("// hierachy depth: " + classHierachyOrder + CR + "// #declare Depth = " + DEPTH_OFFSET + ";" + CR + CR);
			scene.flush();
		}
	}

	/**
	 * ノード、リンクのラベル名を返す
	 * @param presence
	 * @return ラベル名
	 */
	protected String label(IPresentation presence) {
		String label = super.label(presence);
		if(presence.getModel() instanceof IInstanceSpecification) {
			IClass objectNodeClass = ((IInstanceSpecification)(presence.getModel())).getClassifier();
			if(objectNodeClass != null) {
				label += ":" + objectNodeClass.getName();
			}
		}
		return label;
	}
	
	/**
	 * ノードが描画対象でない
	 * @param ノード
	 */
	protected boolean isExcludes(INodePresentation presentation) {
		/**
		 * 除外対象要素
		 * パッケージ : "Package" | サブシステム : "Subsystem" | 構造化クラス : "StructuredClass" | 汎化共有表記 : "GeneralizationGroup"
		 */	
		final String[] excludes = { "Package", "Subsystem", "StructuredClass", "GeneralizationGroup"};
		String type = presentation.getType();
		for(String exclude: excludes) {
			if(type.equals(exclude)) {
				return true;
			}
		}
		return super.isExcludes(presentation);
	}

	/**
	 * sphere_sweep{ linear_spline | cubic_spline }を出力する 
	 * @param link
	 * @param sourcez ソースの高さ
	 * @param targetz ターゲットの高さ
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, Node source, Node target) throws Exception {
		String type = link.getType();
		scene.write("// " + type + CR);
		if(type.equals("Link")) {
			LineSort sort = lineSort(link);
			List<String> linePoints = sort.stringVertexes(link, source, target);
			scene.write(draw(link, linePoints, true) + materialClause(link, true) + CR);
		}else if(type.equals("Generalization")) {
			scene.write(drawGeneralization(link, source, target));
		}else if(type.equals("AssociationClass")){
			String start = source.getName() + ", LRd ";
			String end = target.getName() + ", LRd ";
			Node assocNode = find((IAssociationClass)(link.getModel()));
			scene.write("    sphere_sweep { cubic_spline, 5, " + start + start
					+ assocNode.getLocation() + ", LRd "
					+end + end + materialClause(link, true) + CR);
		}else{
			super.draw(link, source, target);
		}	
	}

	/**
	 * 継承(Generalization)を描く
	 * ※Generalizationのlinkは、sourceがサブクラスでtargetがスーパークラスであるが、points[]はtargetからsoruceへの点列となっている。
	 * @param link
	 * @param sourcez ソースの高さ
	 * @param targetz ターゲットの高さ
	 * @return 継承リンク記述
	 */
	protected String drawGeneralization(ILinkPresentation link, Node source, Node target) throws IOException {
		String description = "    sphere_sweep { linear_spline, ";
		Point2D[] points = link.getPoints();
		int length = points.length;		
		description += length + ", " + source.getName() + ", LRd ";
		if(points.length > 2) {
			for(int i = length-2; i > 0; i--) {
				Point3D point = new  Point3D(points[i].getX(), -points[i].getY(), source.getLocation().getZ());
				description += source.vertex(point) + ", LRd ";
			}
		}
		return description + target.getName() + ", LRd " + materialClause(link, true) + CR;
	}
	 
	/**
	 * リンクモデルIAssociationClassと同じノードモデルを探し、ノードを返す
	 * @param assoc
	 * @return
	 */
	protected Node find(IAssociationClass assoc) {
		for(Node node: nodes) {
			if(node.getModel()==assoc) {
				return node;
			}
		}
		return null;
	}
	
	/**
	 * 型名を返す
	 * 原則としてastah*要素型名とPOVRayオブジェクト宣言名は同じである
	 * [ロバストネス図対応]
	 * 特定のステレオタイプについてはそのステレオタイプに対するPOVRayオブジェクト型をマッピングする。
	 * @param presence
	 * @return オブジェクト宣言名
	 */
	protected String type(IPresentation presence) {
		IElement model = presence.getModel();
		if(model != null) {
			List<String> stereotypes = Arrays.asList(model.getStereotypes());
			if(presence.getType().equals("Class")) {
				String abs = ((IClass)model).isAbstract()?"Abstract":"";
				if(!stereotypes.isEmpty()) {
					if(stereotypes.contains("interface")) {
						if(abs.isEmpty()) {
							return "Interface";
						}else {
							/*
							 * astah*では、abstract interfaceを定義できてしまう。
							 * エラータイプを返す
							 */
							return "ConflictClass";
						}
					}
					if(stereotypes.contains("actor")) {
						return abs + "Actor";
					}else if(stereotypes.contains("boundary")) {
						return abs + "Boundary";
					}else if(stereotypes.contains("control")) {
						return abs + "Control";
					}else if(stereotypes.contains("entity")) {
						return abs + "Entity";
					}
					if(!abs.isEmpty()) {
						return abs + "Class";
					}
				}
			}else if(presence.getType().equals("InstanceSpecification")){
				IClass objectNodeClass = ((IInstanceSpecification)model).getClassifier();
				/*
				 * インタフェースのインスタンスはなく、アブストラクトのインスタンスもないのだが、astah*では描けてしまう。
				 * エラータイプを返す。
				 */
				if(objectNodeClass != null) {
					stereotypes = Arrays.asList(objectNodeClass.getStereotypes());
					if(((IClass)objectNodeClass).isAbstract()){
						return "NoInstanceSpecification";
					}
					if(!stereotypes.isEmpty()) {
						if(stereotypes.contains("interface")) {
							return "NoInstanceSpecification";
						}
						if(stereotypes.contains("actor")) {
							return "Actor";
						}else if(stereotypes.contains("boundary")) {
							return "BoundaryInstance";
						}else if(stereotypes.contains("control")) {
							return "ControlInstance";
						}else if(stereotypes.contains("entity")) {
							return "EntityInstance";
						}
					}
					return "InstanceSpecification";
				}
			}
		}
		return super.type(presence);
	}

}
