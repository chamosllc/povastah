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
import com.change_vision.jude.api.inf.presentation.IPresentation;;

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


	/*
	 * コンストラクタ
	 */
	public ClassDiagram(IDiagram diagram, OutputStreamWriter writer){
		super(diagram, writer);
	}

	/**
	 * POVRay出力対象のノードとリンクを抽出し、対象の有無を返す
	 * @return 対象の有無
	 */
	protected boolean existsTragetPresence(){
		boolean exists = super.existsTragetPresence();
		if(exists) {
			setClassHierachyOrder();
		}
		return exists;
	}
	
	/**
	 * ダイアグラム内でのクラス継承順位を求める
	 * 
	 * @throws IOException 
	 */
	protected void setClassHierachyOrder() {
		Collection<IClass> models = new HashSet<>();
		for(INodePresentation node: nodes) {
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
	
	/*
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
	 * 階層の深さに応じてカメラを離す
	 */
	protected int cameraDistance(int z) {
		if(classHierachyOrder.isEmpty()) {
			return super.cameraDistance(z);
		}else {
			int distance = 0;
			for(Integer depth: classHierachyOrder.values()) {
				distance = Math.max(distance, depth);
			}
			return super.cameraDistance(z - (distance + 1) * 48);
		}
	}
	
	/*
	 * debug用 スクリプトのヘッダ部を出力する
	 */
	protected void header() throws IOException {
		super.header();
		if(classHierachyOrder.size() > 1) {
			sceneWriter.write("// hierachy depth: " + classHierachyOrder + CR + "// #declare Depth = " + DEPTH_OFFSET + ";" + CR + CR);
			sceneWriter.flush();
		}
	}

	/**
	 * クラス継承関係による高さ
	 */
	protected double zposition(INodePresentation node) {
		double z = super.zposition(node);
		if(classHierachyOrder.containsKey(node.getModel())) {
			z = classHierachyOrder.get(node.getModel()) * DEPTH_OFFSET;
		}
		return z;
	}

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
	 * ノードが出力対象ではない
	 * @param ノード
	 * @return 除外ノードである
	 */
	protected boolean excludeIPresentation(INodePresentation presentation) {
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
		return super.excludeIPresentation(presentation);
	}

	/**
	 * リンクオブジェクトを描く
	 * @param link
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link) throws IOException {
		draw(link, OFFSET_Z + zposition(link.getSource()), OFFSET_Z + zposition(link.getTarget()));
	}

	/**
	 * sphere_sweep{ linear_spline | cubic_spline }を出力する 
	 * @param link
	 * @param lineRadius 
	 * @param sourcez ソースノードの高さ
	 * @param targetz ターゲットノードの高さ
	 * @param sourcep ソースノードの座標
	 * @param targetp ターゲットノードの座標
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		String type = link.getType();
		if(type.equals("Link") || type.equals("Generalization")) { // GeneralizationGroupを除外したので、クラス継承関係を別途描く
			sceneWriter.write(drawGeneralization(link, sourcez, targetz));
		}else if(type.equals("AssociationClass")){
			Point2D sourcep = center(link.getSource());
			Point2D targetp = center(link.getTarget());
			String start = coordinate(sourcep, sourcez) + ", LRd ";
			String end = coordinate(targetp, targetz) + ", LRd ";
			INodePresentation assocNode = find((IAssociationClass)(link.getModel()));
			sceneWriter.write("    sphere_sweep { cubic_spline, 5, " + start + start
					+ coordinate(center(assocNode), zposition(assocNode)) + ", LRd "
					+end + end + material(link) + "no_shadow }" + CR);
		}else{
			super.draw(link, sourcez, targetz);
		}	
	}

	/*
	 * 継承グループリンクを描く
	 * @param points
	 * @return
	 */
	protected String drawGeneralization(ILinkPresentation link, double sourcez, double targetz) {
		String description = "    sphere_sweep { linear_spline, ";
		Point2D sourcep = center(link.getSource());
		Point2D targetp = center(link.getTarget());
		Point2D[] points = link.getPoints();
		if(points.length == 4) {
			description += "4, " + coordinate(sourcep, sourcez) + ", LRd " + coordinate(points[2], sourcez)  + ", LRd "
					+ coordinate(points[1], sourcez)  + ", LRd ";
		}else {
			description += "2, " + coordinate(sourcep, sourcez) + ", LRd "; 
		}
		return description + coordinate(targetp, targetz) + ", LRd " + material(link) + "no_shadow }" + CR;
	}
	 
	/**
	 * リンクモデルIAssociationClassと同じノードモデルを探し、ノードを返す
	 * @param assoc
	 * @return
	 */
	protected INodePresentation find(IAssociationClass assoc) {
		for(INodePresentation node: nodes) {
			if(node.getModel()==assoc) {
				return node;
			}
		}
		return null;
	}
	
	/**
	 * ロバストネス図対応
	 * 特定のステレオタイプについてはそのステレオタイプに対するPOVRayオブジェクトの型をマッピングする
	 * 
	 * @param presence
	 * @return
	 */
	protected String type(IPresentation presence) {
		IElement model = presence.getModel();
		if(model != null) {
			List<String> types = Arrays.asList(model.getStereotypes());
			if(!types.isEmpty()) {
				 if(types.contains("actor")) {
					return "Actor";
				}else if(types.contains("boundary")) {
					return "Boundary";
				}else if(types.contains("control")) {
					return "Control";
				}else if(types.contains("entity")) {
					return "Entity";
				}else if(types.contains("interface")) {
					return "Interface";
				}
			}else if(presence.getType().equals("InstanceSpecification")){
				IClass objectNodeClass = ((IInstanceSpecification)(presence.getModel())).getClassifier();
				if(objectNodeClass != null) {
					types = Arrays.asList(objectNodeClass.getStereotypes());
					if(!types.isEmpty()) {
						 if(types.contains("actor")) {
							return "Actor";
						}else if(types.contains("boundary")) {
							return "BoundaryInstance";
						}else if(types.contains("control")) {
							return "ControlInstance";
						}else if(types.contains("entity")) {
							return "EntityInstance";
						}else if(types.contains("interface")) {
							return "Interface";
						}
					}
					return "InstanceSpecification";
				}
			}
		}
		return super.type(presence);
	}
}
