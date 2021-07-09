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
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;

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

	public ClassDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer) throws IOException {
		super(projectName, diagram, writer);
	}

	/**
	 * ダイアグラムのステージ、ラベル、リンク、フォントの設定
	 * @throws IOException
	 */
	protected void declareTexture() throws IOException {
		sceneWriter.write("#declare HierachyTecture = texture { T_Chrome_4A }" + CR);
		super.declareTexture();
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
		String SCALE = " scale 24 ";
		Point2D point = nodePosition(node);
		double z = 0;
		if(hierDepth.containsKey(node.getModel())) {
			z = hierDepth.get(node.getModel()) * -32.0;
		}
		sceneWriter.write("object { " + object(node) + " rotate -x*90" + SCALE + translate(point, z) + " ");
		sceneWriter.write("}" + CR);
		writeLabel(node);
		stage.add(node.getRectangle());
	//	writeSubDiagram(hierarchy + 1, node);
	}

	/**
	 * リンクオブジェクトを出力する 
	 * @param link
	 * @param lineRadius
	 * @param offsetZ
	 * @throws IOException
	 */
	protected void writeLink(ILinkPresentation link, double lineRadius, double offsetZ) throws IOException {
		double sourcez = offsetZ;
		double targetz = offsetZ;
		INodePresentation source = link.getSource();
		INodePresentation target = link.getTarget();
		Point2D sourcep = nodePosition(source);
		Point2D targetp = nodePosition(target);
		if(hierDepth.containsKey(source.getModel())) {
			sourcez -= hierDepth.get(source.getModel()) * 32.0;
		}
		if(hierDepth.containsKey(target.getModel())) {
			targetz -= hierDepth.get(target.getModel()) * 32.0;
		}
		sceneWriter.write("// " + link.getType() + ":" + link.getLabel() + CR);
		sceneWriter.flush();
		if(sourcep.equals(targetp)) { // 始点と終点が同じであればリレーションは真円にする
			double torusRadius = 32.0;
			sourcep.setLocation(sourcep.getX(), sourcep.getY());
			sceneWriter.write("torus { " + torusRadius + ", " + lineRadius + translate(sourcep, -torusRadius + sourcez));
		}else {
			Point2D[] points = link.getPoints();
			sceneWriter.write("sphere_sweep { linear_spline, " + points.length + ", " + CR); // 始点、終点の2点とpointsから最初と最後の2点を抜いた数の合計
			sceneWriter.write(coordinate(sourcep, sourcez) + ", " + lineRadius + CR); // 始点
			for(int i=1; i < points.length - 1; i++) { // pointsの最初と最後の値を使わない(ノードの端点)
				double z = (sourcez - targetz)*i/(points.length) + targetz;
				sceneWriter.write(coordinate(points[i], z) + ", " + lineRadius + CR);
			}
			sceneWriter.write(coordinate(targetp, targetz) + ", " + lineRadius + CR); // 終点
		}
		if(link.getModel() instanceof IGeneralization) {
			sceneWriter.write("  texture { HierachyTecture }" + CR);
		}else {
			sceneWriter.write("  texture { LinkTecture }" + CR);
		}
		sceneWriter.write("}" + CR);				
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
		if(node.getModel() != null) {
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
			}			
		}
		return super.object(node);
	}
}
