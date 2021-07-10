package biz.chamos.povastah.scene;

import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.model.IAction;
import com.change_vision.jude.api.inf.model.IActivityDiagram;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.presentation.INodePresentation;

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
			String objectName = this.getClass().getSimpleName() + hierarchy;
			IActivityDiagram subdiagram = ((IAction) node.getModel()).getCallingActivity().getActivityDiagram();
			sceneWriter.write("// object { " + objectName + " scale 0.15 " + translate(node.getLocation(), 30-Math.pow(1.23, hierarchy) ) + " }" + CR);
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
