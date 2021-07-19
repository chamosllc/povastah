package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.model.IAction;
import com.change_vision.jude.api.inf.model.IActivityDiagram;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

/**
 * ActivityDiagram Object in POVRay Scene
 *  Enable Hierachy Diagram visualization
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/07
 *
 */
public class ActivityDiagram extends Diagram {

	
	public ActivityDiagram(String projectName, IDiagram diagram, OutputStreamWriter sceneWriter){
		super(projectName, diagram, sceneWriter);
	}

	
	/**
	 * POVRayオブジェクト変換対象除外
	 * @param presentation
	 * @return
	 */
	protected boolean excludeIPresentation(IPresentation presentation) {
		/**
		 * 除外対象要素
		 * 入力ピン : "InputPin" | 出力ピン : "OutputPin" | アクティビティパラメタノード : "ActivityParameterNode" | パーティション : "Partition"
		 */	
		final String[] common = {"InputPin", "OutputPin", "ActivityParameterNode", "Partition"};
		String type = presentation.getType();
		for(String exclude: common) {
			if(type.equals(exclude)) {
				return true;
			}
		}	 
		return super.excludeIPresentation(presentation);
	}

	protected void declareDiagram(INodePresentation parent, int hierarchy, Point2D dpoint, double z){
		IActivityDiagram subDiagram;
		if((subDiagram = subDiagram(parent)) != null) {
			try {
				ActivityDiagram nestDiagram = new ActivityDiagram(projectName, subDiagram, sceneWriter);
				nestDiagram.extractElement();
				nestDiagram.writeDiagram(hierarchy, new Point2D.Double(), z);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected IActivityDiagram subDiagram(INodePresentation parent) {
		if(hasSubDiagram(parent)) {
			return ((IAction) parent.getModel()).getCallingActivity().getActivityDiagram();
		}else {
			return null;
		}
	}
	
	protected boolean hasSubDiagram(INodePresentation parent) {
		return parent.getType()=="CallBehaviorAction";
	}

	protected double subHeight(int hierarchy) {
		return -27.0 - Math.pow(1.23, hierarchy);
	}
	
	/**
	 * 振る舞い呼び出しアクション、サブマシン状態にサブダイアグラムを配置する
	 * ※pending : とりあえず、サブダイアグラムのPOVRayオブジェクトを呼び出すテンプレートをコメント出力する
	 * 				エディタで編集する
	 * 
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	protected void writeSubDiagram(int hierarchy, INodePresentation node) throws IOException {
		IActivityDiagram subDiagram;
		if((subDiagram = subDiagram(node)) != null) {
			double expand = -16;
			Rectangle2D r = subDiagram.getBoundRect();
			Rectangle2D p = node.getRectangle();
			r.setRect(r.getMinX() - expand, r.getMinY() - expand, r.getWidth() + expand*2, r.getHeight() + expand*2);
			double scale = Math.min(node.getWidth()/r.getWidth(), node.getHeight()/r.getHeight());
			sceneWriter.write("object { " + objectName(subDiagram) + " scale " + scale + " translate <"
			+ (p.getCenterX() - scale * r.getCenterX()) + ", " + (-p.getCenterY() + scale * r.getCenterY()) + ", " + subHeight(hierarchy) + "> }" + CR);
			sceneWriter.flush();
		}
	}
	
	/**
	 * Nodeのラベルオブジェクトを出力する
	 * @param node
	 * @throws IOException
	 */
	protected void writeLabel(INodePresentation node) throws IOException {
		final double scale = 16.0;
		final String SCALE = " scale <" + scale + ", " +  scale + ", 2> ";
		double labelShift = 36.0;
		String nodeLabel = "";
		if(!(nodeLabel = label(node)).isEmpty()) {
			double labelY = 0.0;
			int merginX = 0;
			for(String label: nodeLabel.split("\n")) {
				Point2D point = nodePosition(node);
				if(merginX == 0) {
					merginX = label.getBytes().length*3;
				}
				point.setLocation(point.getX() - merginX, point.getY() + labelY + labelShift );
				sceneWriter.write(" text { ttf LabelFont, \"" + label + "\", 1, 0" + SCALE + "texture { LabelTecture }"
					+ CR + translate(point, 32.0 - 2.0) + " }" + CR);
				labelY+= scale;
			}
		}
	}
}
