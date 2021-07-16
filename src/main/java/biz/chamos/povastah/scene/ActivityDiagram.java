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
		this.projectName = projectName;
		this.diagram = (IActivityDiagram)diagram;
		this.sceneWriter = sceneWriter;
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
		try {
			ActivityDiagram nestDiagram = new ActivityDiagram(projectName, subDiagram(parent), sceneWriter);
			nestDiagram.extractElement();
			nestDiagram.writeDiagram(hierarchy, new Point2D.Double(), z);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected IActivityDiagram subDiagram(INodePresentation parent) {
		return ((IAction) parent.getModel()).getCallingActivity().getActivityDiagram();
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
		if(node.getType()=="CallBehaviorAction") {
			IActivityDiagram subdiagram = subDiagram(node);
			Rectangle2D p = node.getRectangle();
			Rectangle2D r = subdiagram.getBoundRect();
			double scale = Math.min(node.getWidth()/r.getWidth(), node.getHeight()/r.getHeight()) * 0.9;
			sceneWriter.write("object { " + objectName(subdiagram) + " scale " + scale + " translate <"
			+ (p.getCenterX() - scale * r.getCenterX()) + ", " + (-p.getCenterY() + scale * r.getCenterY()) + ", " + subHeight(hierarchy) + "> }" + CR);
			sceneWriter.flush();
		}
	}
}
