package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.change_vision.jude.api.inf.exception.InvalidUsingException;
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

	public ClassDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer){
		super(projectName, diagram, writer);
	}
	
	/**
	 * ダイアグラムのノード要素とリンク要素を抽出する
	 * 
	 * @throws InvalidUsingException
	 * @throws  
	 */
	protected void extractElement() throws InvalidUsingException {
		super.extractElement();
		classHierachies();
	}

	/**
	 * find class hierachy
	 * @throws IOException 
	 */
	protected void classHierachies() {
		List<IClass> iclasses = new ArrayList<>();
		List<IGeneralization> hierarchies = new ArrayList<>();
		for(INodePresentation node: nodes) {
			if(node.getType().equals("Class")) {
				for(IGeneralization hier: ((IClass)node.getModel()).getSpecializations()){
					if(!hierarchies.contains(hier)) {
						hierarchies.add(hier);
					}
				}
				
			}
			if(node.getModel() instanceof IClass &&  !iclasses.contains(node.getModel())) { 
				iclasses.add((IClass)node.getModel());
			}
		}
		for(IGeneralization hier: hierarchies) {
			int depth = 0;
			if(iclasses.contains(hier.getSubType()) && iclasses.contains(hier.getSuperType())){
				if(hierDepth.containsKey(hier.getSubType())) {
					depth = hierDepth.get(hier.getSubType());	
					if(!hierDepth.containsKey(hier.getSuperType())) {
						hierDepth.put(hier.getSuperType(), depth+1);
					}
				}else {
					hierDepth.put(hier.getSubType(), 0);
					if(hierDepth.containsKey(hier.getSuperType())) {
						IClass parent = hier.getSuperType();
						if(hierDepth.get(parent) == 0) {
							hierDepth.replace(parent, 1);
							shiftDepth(hierarchies, parent);
						}
					}else {
						hierDepth.put(hier.getSuperType(), depth+1);
					}
				}
			}
		}
	}
	
	protected void shiftDepth(List<IGeneralization> hierarchies, IClass child) {
		for(IGeneralization hier: hierarchies) {
			if(hier.getSubType() == child) {
				IClass parent = hier.getSuperType();
				hierDepth.replace(parent, hierDepth.get(parent) + 1);
				shiftDepth(hierarchies, parent);
			}
		}
	}
	/**
	 * ノードオブジェクトを出力する
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	protected void writeNode(int hierarchy, INodePresentation node) throws IOException {
		final String SCALE = " scale 24 ";
		Point2D point = nodePosition(node);
		double z = 0;
		if(hierDepth.containsKey(node.getModel())) {
			z = hierDepth.get(node.getModel()) * -32.0;
		}
		sceneWriter.write("object { " + object(node) + " rotate -x*90" + SCALE + translate(point, z) + " ");
		sceneWriter.write("}" + CR);
		sceneWriter.flush();
		writeLabel(node);
		sceneWriter.flush();	
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
	 * @throws IOException 
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
	 * @param lineRadius
	 * @param offsetZ
	 * @throws IOException
	 */
	protected void writeLink(ILinkPresentation link) throws IOException {
		double sourcez = offsetZ;
		double targetz = offsetZ;
		if(hierDepth.containsKey(link.getSource().getModel())) {
			sourcez -= hierDepth.get(link.getSource().getModel()) * 32.0;
		}
		if(hierDepth.containsKey(link.getTarget().getModel())) {
			targetz -= hierDepth.get(link.getTarget().getModel()) * 32.0;
		}
		writeSpline(link, sourcez, targetz);
	}
	
	/**
	 * ロバストネス図対応
	 * 特定のステレオタイプについてはそのステレオタイプに対するPOVRayオブジェクトの型をマッピングする
	 * 
	 * @param node
	 * @return
	 */
	protected String object(INodePresentation node) {
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
		return super.object(node);
	}
}
