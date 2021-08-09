package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.exception.InvalidUsingException;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IState;
import com.change_vision.jude.api.inf.model.IStateMachine;
import com.change_vision.jude.api.inf.model.IStateMachineDiagram;
import com.change_vision.jude.api.inf.model.IVertex;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;

/**
 * StateMachineDiagram Object in POVRay Scene
 * 	Enable Hierachy Diagram visualization
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 *
 */
public class StateMachineDiagram extends Diagram {

	/**
	 * コンストラクタ
	 */
	public StateMachineDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer){
		super(projectName, diagram, writer);
	}

	/**
	 * サブダイアグラムがあれば、そのオブジェクトの宣言文を出力する
	 */
	protected void declareDiagram(INodePresentation parent, int hierarchy, Point2D dpoint, double z){
		IStateMachineDiagram subDiagram;
		if((subDiagram = subDiagram(parent)) != null) {
			try {
				StateMachineDiagram nestDiagram = new StateMachineDiagram(projectName, subDiagram, sceneWriter);
				nestDiagram.existsTragetPresence();
				nestDiagram.declareDiagram(hierarchy, new Point2D.Double(), z);
			} catch (Exception e) {}
		}
	}

	/**
	 * サブダイアグラムオブジェクトを返す
	 * @param parent
	 * @return nullの場合がある
	 */
	protected IStateMachineDiagram subDiagram(INodePresentation parent) {
		if(hasSubDiagram(parent)) {
			IStateMachine machine = ((IState) parent.getModel()).getSubmachine(); // nullの場合がある
			if(machine != null) {
				return machine.getStateMachineDiagram(); 
			}
		}
		return null;
	}
	
	/**
	 * サブダイアグラムを持つ性質のノードかどうか
	 */
	protected boolean hasSubDiagram(INodePresentation parent) {
		return parent.getType().equals("SubmachineState");
	}

	/**
	 * ノードが出力対象ではない
	 * @param ノード
	 * @return 除外ノードである
	 */
	protected boolean excludeIPresentation(INodePresentation presentation) {
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
	 * 指定ノードのPOVRayオブジェクトを描く
	 * 内部状態のある状態
	 * 
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	@Override
	protected void writeNode(int hierarchy, INodePresentation node) throws IOException {
		if(hasSubDiagram(node)) {
			writeSubmachineState(hierarchy, node);
		}else if(!writeVertex(node)) {
			super.writeNode(hierarchy, node);
		}
	}
	
	/**
	 * 内部状態ステージを描く
	 * @param node
	 * @return
	 * @throws IOException
	 */
	protected boolean writeVertex(INodePresentation node) throws IOException {
		if(node.getModel() instanceof IState) {
			IState state = (IState)node.getModel();
			if(state.getRegionSize() > 0) {
				IVertex[] vertex = state.getSubvertexes();
				Rectangle2D bound = node.getRectangle();
				Point2D point = new Point2D.Double(bound.getCenterX(), bound.getCenterY());
				sceneWriter.write("  difference { object { StateInternal scale" + String.format(COORDINATE, bound.getWidth(), bound.getHeight(), 16.0)
					+ translate(point, zposition(node)) + " }" + CR);
				for(int i=0; i < vertex.length; i++) {
					try {
						bound = state.getRegionRectangle(i);
						point = new Point2D.Double(bound.getCenterX(), bound.getCenterY());
						sceneWriter.write("    object { StateInternal scale" + String.format(COORDINATE, bound.getWidth()*0.95, bound.getHeight()*0.95, 12.0)
							+ translate(point, zposition(node) - 6) + " }" + CR);						
					} catch (InvalidUsingException e) {}
				}
				sceneWriter.write("  }" + CR);
				textOnStage(node, node.getRectangle());
				return true;
			}
		}
		return false;
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
	protected void writeSubmachineState(int hierarchy, INodePresentation node) throws IOException {
		IStateMachineDiagram subDiagram = subDiagram(node);
		Rectangle2D bound = node.getRectangle();
		double scale = 1.0;
		if(subDiagram != null) {
			double deltaZ= 48.0;
			Rectangle2D subBound = subDiagram.getBoundRect();
			scale = Math.min(bound.getWidth()/(subBound.getWidth() + deltaZ), bound.getHeight()/(subBound.getHeight() + deltaZ)); // povray object scale 24
			double posz = zposition(node) - deltaZ*scale;
			Point2D point = new Point2D.Double(bound.getCenterX() - (subBound.getCenterX() + (deltaZ/2))*scale, bound.getCenterY() - (subBound.getCenterY() - (deltaZ/2))*scale);
			sceneWriter.write("  object { " + povrayName(subDiagram) + " scale " + scale + translate(point, posz) + " }" + CR);
			writeSubDiagram(hierarchy + 1, node);
		}
		sceneWriter.write("  object { " + type(node) + " scale " + String.format(COORDINATE, bound.getWidth(), bound.getHeight(), 16.0)
			+ translate(center(node), zposition(node)) + " }" + CR);
		textOnStage(node, bound);
	}
	
	/**
	 * torus | sphere_sweep{ linear_spline | cubic_spline }を出力する 
	 * @param link
	 * @param sourcez ソースノードの高さ
	 * @param targetz ターゲットノードの高さ
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		INodePresentation difference[] = new INodePresentation[2];
		if(link.getSource().getModel() instanceof IState) {
			IState state = (IState)link.getSource().getModel();
			if(state.getRegionSize() > 0){
				difference[0] = link.getSource();
			}
		}
		if(link.getTarget().getModel() instanceof IState) {
			IState state = (IState)link.getTarget().getModel();
			if(state.getRegionSize() > 0) {
				difference[0] = link.getTarget();
			}
		}
		boolean connectVertex = !(difference[0] == null && difference[1] == null);
		if(connectVertex) {
			sceneWriter.write("  difference {" +CR);
		}
		//
		super.draw(link, sourcez, targetz);
		//
		for(int i=0; i < difference.length; i++) {
			if(difference[i] != null) {
				Rectangle2D bound = (i==0)?difference[i].getRectangle():difference[i].getRectangle();
				Point2D point = new Point2D.Double(bound.getCenterX(), bound.getCenterY());
				sceneWriter.write("    object { StateInternal scale" + String.format(COORDINATE, bound.getWidth(), bound.getHeight(), 16.0)
					+ translate(point, zposition(difference[i])) + " }" + CR);
			}
		}
		if(connectVertex) {
			sceneWriter.write("  }" +CR);
		}
	}
}
