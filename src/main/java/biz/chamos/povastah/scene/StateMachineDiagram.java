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

	public StateMachineDiagram(IDiagram diagram, OutputStreamWriter scene){
		super(diagram, scene);
	}

	/**
	 * サブダイアグラムを宣言をする
	 */
	protected void declareDiagram(INodePresentation parent, int hierarchy, Point2D dpoint, double z){
		IStateMachineDiagram subDiagram;
		if((subDiagram = subDiagram(parent)) != null) {
			try {
				StateMachineDiagram hierarchyDiagram = new StateMachineDiagram(subDiagram, scene);
				hierarchyDiagram.existsScene();
				hierarchyDiagram.declareDiagram(hierarchy, new Point2D.Double(), z);
			} catch (Exception e) {}
		}
	}

	/**
	 * サブダイアグラムを返す
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
	 * サブダイアグラムを持つノード型である
	 */
	protected boolean hasSubDiagram(INodePresentation parent) {
		return parent.getType().equals("SubmachineState");
	}

	/**
	 * ノードが描画対象でない
	 * @param ノード
	 */
	protected boolean isExcludes(INodePresentation presentation) {
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
		return super.isExcludes(presentation);
	}

	/**
	 * 指定ノードを描く
	 * 
	 * @param node
	 * @param hierarchy
	 * @throws IOException
	 */
	@Override
	protected void draw(INodePresentation node, int hierarchy) throws IOException {
		if(drawInternalMachine(node)) {
			drawSource(node);
		}else {
			super.draw(node, hierarchy);
		}
	}
	
	/**
	 * ノードにダイアグラム階層があるときサブダイアグラムを配置する
	 * サブマシン状態(SubmachineState)にサブマシンがあるとき配置する
	 * 
	 * @param hierarchy
	 * @param node
	 * @return サブマシンがある
	 * @throws IOException
	 */
	protected boolean drawSubDiagram(INodePresentation node, int hierarchy) throws IOException {
		IStateMachineDiagram subDiagram = subDiagram(node);
		Rectangle2D bound = node.getRectangle();
		double scale = 1.0;
		if(subDiagram != null) {
			double deltaZ= 48.0;
			Rectangle2D subBound = subDiagram.getBoundRect();
			scale = Math.min(bound.getWidth()/(subBound.getWidth() + deltaZ), bound.getHeight()/(subBound.getHeight() + deltaZ)); // povray object scale 24
			double posz = zposition(node) - deltaZ*scale;
			double shift = 12.0;
			Point2D point = new Point2D.Double(bound.getCenterX() - (subBound.getCenterX() + (deltaZ/2))*scale, bound.getCenterY() + shift - (subBound.getCenterY() + (deltaZ/2))*scale);
			scene.write("  object { " + id(subDiagram) + " scale " + scale + translate(point, posz) + " }" + CR);
			scene.write("  object { " + type(node) + " scale " + String.format(COORDINATE, bound.getWidth(), bound.getHeight(), 16.0)
				+ translate(center(node), zposition(node)) + " }" + CR);
			textOnStage(node, new Point2D.Double(bound.getMinX() + 10.0, bound.getMinY() + 10.0), 0.0);
			return true;
		}
		return false;
	}

	/**
	 * リンクを円環で描く
	 * @param link
	 * @param sourcep
	 * @param sourcez
	 * @throws IOException
	 */
	protected void drawLoop(ILinkPresentation link, Point2D sourcep, double sourcez) throws IOException {
		INodePresentation node = link.getSource();
		boolean isEntity = subDiagram(node) == null;
		if(isEntity && node.getModel() instanceof IState){
			IState state = (IState)node.getModel();
			isEntity = state.getRegionSize() == 0;
		}
		if(isEntity){
			super.drawLoop(link, sourcep, sourcez);
		}else {
			Rectangle2D bound = node.getRectangle();
			scene.write("    torus { LOOPRd, LRd translate<" + bound.getMaxX() + " - LOOPRd, -" + bound.getMinY() + " - 4.0, " + sourcez + " - LOOPRd> " + materialClause(link, true) + CR);
		}
	}
	
	/**
	 * 内部状態ステージを描く
	 * @param node
	 * @return
	 * @throws IOException
	 */
	protected boolean drawInternalMachine(INodePresentation node) throws IOException {
		if(node.getModel() instanceof IState) {
			IState state = (IState)node.getModel();
			if(state.getRegionSize() > 0) {
				IVertex[] vertex = state.getSubvertexes();
				Rectangle2D bound = node.getRectangle();
				Point2D point = new Point2D.Double(bound.getCenterX(), bound.getCenterY());
				String stage = "    object { StateInternal scale" + String.format(COORDINATE, bound.getWidth(), bound.getHeight(), 16.0)
					+ translate(point, zposition(node) + 12.0) + " }";
				// vertexをstageの凹にする
				scene.write("  difference {" + stage + CR);
				for(int i=0; i < vertex.length; i++) {
					try {
						Rectangle2D area = state.getRegionRectangle(i);
						point = new Point2D.Double(area.getCenterX(), area.getCenterY());
						scene.write("    object { StateInternal scale" + String.format(COORDINATE, area.getWidth()*0.95, area.getHeight()*0.95, 12.0)
							+ translate(point, zposition(node)) + " }" + CR);						
					} catch (InvalidUsingException e) {}
				}
				scene.write("  }" + CR);
				textOnStage(node, new Point2D.Double(bound.getMinX() + 10.0, bound.getMinY() + 10.0), TEXT_OFFSET_Z);
				return true;
			}
		}
		return false;
	}

	/**
	 * sphere_sweep{ linear_spline | cubic_spline }を記述する
	 * @param link
	 * @param lineRadius 
	 * @param sourcez ソースの高さ
	 * @param targetz ターゲットの高さ
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		INodePresentation region[] = new INodePresentation[2];
		if(link.getSource().getModel() instanceof IState) {
			IState state = (IState)link.getSource().getModel();
			if(state.getRegionSize() > 0){
				region[0] = link.getSource();
			}
		}
		if(link.getTarget().getModel() instanceof IState) {
			IState state = (IState)link.getTarget().getModel();
			if(state.getRegionSize() > 0) {
				region[1] = link.getTarget();
			}
		}
		if(region[0] == null && region[1] == null) {
			super.draw(link, sourcez, targetz);
		}else {
			String difference = ""; // difference StateInternals
			for(int i=0; i < region.length; i++) {
				if(region[i] != null) {
					Rectangle2D bound = (i==0)?region[i].getRectangle():region[i].getRectangle();
					Point2D point = new Point2D.Double(bound.getCenterX(), bound.getCenterY());
					difference += "    object { StateInternal scale" + String.format(COORDINATE, bound.getWidth(), bound.getHeight(), 16.0)
						+ translate(point, zposition(region[i])) + " }" + CR;
				}
			}
			
			Point2D sourcep = center(link.getSource());
			Point2D targetp = center(link.getTarget());
			scene.write("  difference {" + draw(link, sourcep, targetp, sourcez, targetz, true) + material(link, true) + " }" + CR
					+ difference + " no_shadow }" + CR);
			scene.write("  difference {" + draw(link, sourcep, targetp, sourcez, targetz, false) + material(link, false) + " }" + CR
					+ difference + " no_image }" + CR);		
		}
	}
}
