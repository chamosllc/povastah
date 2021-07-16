package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
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

	protected void declareDiagram(INodePresentation parent, int hierarchy, Point2D dpoint, double z){
		try {
			StateMachineDiagram nestDiagram = new StateMachineDiagram(projectName, subDiagram(parent), sceneWriter);
			nestDiagram.extractElement();
			nestDiagram.writeDiagram(hierarchy, new Point2D.Double(), z);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected IStateMachineDiagram subDiagram(INodePresentation parent) {
		return ((IState) parent.getModel()).getSubmachine().getStateMachineDiagram();
	}
	
	protected boolean hasSubDiagram(INodePresentation parent) {
		return parent.getType()=="SubmachineState";
	}

	protected double subHeight(int hierarchy) {
		return -7.0 - Math.pow(1.23, hierarchy);
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
		if(hasSubDiagram(node)) {
			IStateMachineDiagram subdiagram = subDiagram(node);
			Rectangle2D p = node.getRectangle();
			Rectangle2D r = subdiagram.getBoundRect();
			double scale = Math.min(node.getWidth()/r.getWidth(), node.getHeight()/r.getHeight());
			sceneWriter.write("object { " + objectName(subdiagram) + " scale " + scale + " translate <"
			+ (p.getCenterX() - scale * r.getCenterX()) + ", " + (-p.getCenterY() + scale * r.getCenterY()) + ", " + subHeight(hierarchy) + "> }" + CR);
			sceneWriter.flush();
		}
	}

}
