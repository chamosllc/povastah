package biz.chamos.povastah.scene;

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

	public ActivityDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer) throws IOException {
		super(projectName, diagram, writer);
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
			IActivityDiagram subdiagram = ((IAction) node.getModel()).getCallingActivity().getActivityDiagram();
			Rectangle2D p = node.getRectangle();
			Rectangle2D r = subdiagram.getBoundRect();
			double scale = Math.min(p.getWidth()/r.getWidth(), p.getHeight()/r.getHeight());
			sceneWriter.write("// object { " + objectName(subdiagram) + " scale " + scale + " translate <" + (p.getCenterX() - scale * r.getCenterX()) + ", " + (-p.getCenterY() + scale * r.getCenterY()) + ", " + (-27.0 - Math.pow(1.23, hierarchy) ) + "> }" + CR);
			/*
			 * pending
			 */
//				ActivityDiagram nestDiagram = new ActivityDiagram(subdiagram, sceneFile);
//				double hz = (hierarchy==0)?30.0:30-Math.pow(1.23, hierarchy);
//				nestDiagram.writeDiagram(++hierarchy, node.getLocation(), hz);
			sceneWriter.flush();
		}
	}
}
