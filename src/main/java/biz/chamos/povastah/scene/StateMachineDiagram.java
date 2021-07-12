package biz.chamos.povastah.scene;

import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IState;
import com.change_vision.jude.api.inf.model.IStateMachineDiagram;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

/**
 * StateMachineDiagram Object in POVRay Scene
 * 	Enable Hierachy Diagram visualization
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 *
 */
public class StateMachineDiagram extends Diagram {

	public StateMachineDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer) throws IOException {
		super(projectName, diagram, writer);
	}

	
	/**
	 * POVRayオブジェクト変換対象除外
	 * @param presentation
	 * @return
	 */
	protected Boolean excludeIPresentation(IPresentation presentation) {
		/**
		 * 除外対象要素
		 * パーティション : "Partition" | 入場点 : "EntryPointPseudostate" | 退場点 : "ExitPointPseudostate" | サブマシン状態の擬似状態 : "StubState in SubmachineState" 
		 */	
		final String[] excludes = {"Partition", "EntryPointPseudostate", "ExitPointPseudostate", "StubState in SubmachineState"};
		String type = presentation.getType();
		for(String exclude: excludes) {
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
		if(node.getType()=="SubmachineState") {
			String objectName = this.getClass().getSimpleName() + hierarchy;
			IStateMachineDiagram subdiagram = ((IState) node.getModel()).getSubmachine().getStateMachineDiagram();
			sceneWriter.write("// object { " + objectName + " scale 0.15 " + translate(node.getLocation(), 30-Math.pow(1.23, hierarchy) ) + " }" + CR);
		/*
		 * pending
		 */
//			StateMachineDiagram nestDiagram = new StateMachineDiagram(subdiagram, sceneFile);
//			double hz = (hierarchy==0)?30.0:30-Math.pow(1.23, hierarchy);
//			nestDiagram.writeDiagram(++hierarchy, node.getLocation(), hz);
			sceneWriter.flush();
		}
	}

}
