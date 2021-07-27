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
	protected Map<IClass, Integer> hierDepth = new HashMap<>();
	static final protected double DEPTH_OFFSET = -32.0;

	public ClassDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer){
		super(projectName, diagram, writer);
	}

	protected boolean existsTragetNodes(){
		boolean exists = super.existsTragetNodes();
		if(exists) {
			classHierachies();
		}
		return exists;
	}
	
	/**
	 * クラス継承関係にあるのクラス毎の深さを決める
	 * 
	 * @throws IOException 
	 */
	protected void classHierachies() {
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
						if(hierDepth.containsKey(subClass)) {
							depth = Math.max(depth, hierDepth.get(subClass) + 1);
						}
					}
					if(hierDepth.containsKey(target)) {
						hierDepth.replace(target, depth);
					}else {
						hierDepth.put(target, depth);
					}
				}
				depth++;
				for(IClass superClass: generals) {
					if(hierDepth.containsKey(superClass)) {
						if(depth >  hierDepth.get(superClass)) {
							hierDepth.replace(superClass, depth);
							spreadRoot(superClass.getGeneralizations(), depth + 1);
						}
					}else {
						hierDepth.put(superClass, depth);
					}
				}
				if(!hierDepth.containsKey(target)) {
					hierDepth.put(target, 1);
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
			if(hierDepth.containsKey(superClass)) {
				if(depth > hierDepth.get(superClass)) {
					hierDepth.replace(superClass, depth);
					spreadRoot(superClass.getGeneralizations(), depth + 1);
				}
			}
		}
	}

	/**
	 * 階層の深さに応じてカメラを離す
	 */
	protected double cameraDistance(double z) {
		if(hierDepth.isEmpty()) {
			return super.cameraDistance(z);
		}else {
			int distance = 0;
			for(Integer depth: hierDepth.values()) {
				distance = Math.max(distance, depth);
			}
			return super.cameraDistance(z - (distance + 1) * 32.0);
		}
	}
	
	/*
	 * debug用 スクリプトのヘッダ部を出力する
	 */
	protected void writeHeader() throws IOException {
		super.writeHeader();
		if(hierDepth.size() > 1) {
			sceneWriter.write("// hierachy depth: " + hierDepth + CR + "// #declare Depth = " + DEPTH_OFFSET + ";" + CR + CR);
			sceneWriter.flush();
		}
	}

	/**
	 * クラス継承関係による高さ
	 */
	protected double nodePositionZ(INodePresentation node) {
		double z = super.nodePositionZ(node);
		if(hierDepth.containsKey(node.getModel())) {
			z = hierDepth.get(node.getModel()) * DEPTH_OFFSET;
		}
		return z;
	}

	protected String label(IPresentation presence) {
		String label = super.label(presence);
		if(presence.getType().equals("InstanceSpecification")) {
			IClass model = ((IInstanceSpecification)(presence.getModel())).getClassifier();
			label += ":" + model.getName();
		}
		return label;
	}
	
	/**
	 * POVRayオブジェクト変換対象除外
	 * @param presentation
	 * @return
	 */
	protected boolean excludeIPresentation(IPresentation presentation) {
		/**
		 * 除外対象要素
		 * パッケージ : "Package" | サブシステム : "Subsystem" | 構造化クラス : "StructuredClass" | 汎化共有表記 : "GeneralizationGroup"
		 */	
		final String[] excludes = {"AssociationClass", "Package", "Subsystem", "StructuredClass", "GeneralizationGroup"};
		String type = presentation.getType();
		for(String exclude: excludes) {
			if(type.startsWith(exclude)) {
				return true;
			}
		}	 
		return super.excludeIPresentation(presentation);
	}
	
	/**
	 * リンクオブジェクトを出力する 
	 * @param link
	 * @throws IOException
	 */
	protected void writeLink(ILinkPresentation link) throws IOException {
		writeSpline(link, OFFSET_Z + nodePositionZ(link.getSource()), OFFSET_Z + nodePositionZ(link.getTarget()));
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
	protected void writeSpline(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		if(link.getType().equals("Generalization")) { // GeneralizationGroupを除外したので、クラス継承関係を直に繋げる
			Point2D sourcep = nodePosition(link.getSource());
			Point2D targetp = nodePosition(link.getTarget());
			double lineRadius = 3.0;

			sceneWriter.write("    sphere_sweep { linear_spline, " + 2 + ", "); // 始点、終点の2点
			sceneWriter.write(coordinate(sourcep, sourcez) + ", " + lineRadius + " "); // 始点
			sceneWriter.write(coordinate(targetp, targetz) + ", " + lineRadius + " "); // 終点
			sceneWriter.write(linkTextureName(link));
		}else {
			super.writeSpline(link, sourcez, targetz);
		}	
	}
	
	/**
	 * ロバストネス図対応
	 * 特定のステレオタイプについてはそのステレオタイプに対するPOVRayオブジェクトの型をマッピングする
	 * 
	 * @param node
	 * @return
	 */
	protected String povrayObjectType(INodePresentation node) {
		IElement model = node.getModel();
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
			}else if(node.getType().equals("InstanceSpecification")){
				model = ((IInstanceSpecification)(node.getModel())).getClassifier();
				types = Arrays.asList(model.getStereotypes());
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
				}else {
					return "InstanceSpecification";
				}
			}
		}
		return super.povrayObjectType(node);
	}
}
