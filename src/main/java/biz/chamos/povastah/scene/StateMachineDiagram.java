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

	public StateMachineDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer){
		super(projectName, diagram, writer);
	}

	protected void declareDiagram(INodePresentation parent, int hierarchy, Point2D dpoint, double z){
		IStateMachineDiagram subDiagram;
		if((subDiagram = subDiagram(parent)) != null) {
			try {
				StateMachineDiagram nestDiagram = new StateMachineDiagram(projectName, subDiagram, sceneWriter);
				nestDiagram.existsTragetNodes();
				nestDiagram.writeDiagram(hierarchy, new Point2D.Double(), z);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected IStateMachineDiagram subDiagram(INodePresentation parent) {
		if(hasSubDiagram(parent)) {
			return ((IState) parent.getModel()).getSubmachine().getStateMachineDiagram();
		}else {
			return null;
		}
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
		IStateMachineDiagram subDiagram;
		if((subDiagram = subDiagram(node)) != null) {
			double expand = 16;
			Rectangle2D r = subDiagram.getBoundRect();
			r.setRect(r.getMinX() - expand, r.getMinY() - expand, r.getWidth() + expand*2, r.getHeight() + expand*2);
			Rectangle2D p = node.getRectangle();
			double scale = Math.min(p.getWidth()/r.getWidth(), p.getHeight()/r.getHeight());
			sceneWriter.write("  object { " + povrayName(subDiagram) + " scale " + scale + " translate <"
			+ (p.getCenterX() - scale * r.getCenterX()) + ", " + (-p.getCenterY() + scale * r.getCenterY()) + ", " + subHeight(hierarchy) + "> }" + CR);
			sceneWriter.flush();	
		}
	}

}
