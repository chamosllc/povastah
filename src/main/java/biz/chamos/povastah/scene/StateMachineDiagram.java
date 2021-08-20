package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

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
	static final double VERTEX_R = 0.98;
	static final double VERTEX_H = 20.0;
	static final double VERTEX_D = 4.0;

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
			scene.write("  object { " + type(node) + " scale " + String.format(COORDINATE, bound.getWidth(), bound.getHeight(), VERTEX_H)
				+ translate(center(node), zposition(node)) + " }" + CR);
			textOnStage(node, new Point2D.Double(bound.getMinX() + 10.0, bound.getMinY() + 10.0), 0.0);
			return true;
		}
		return false;
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
				String stage = "    object { StateInternal scale" + String.format(COORDINATE, bound.getWidth(), bound.getHeight(), VERTEX_H)
					+ translate(point, zposition(node) - VERTEX_D) + " }";
				// vertexをstageの凹にする
				scene.write("  difference {" + CR + stage + CR);
				for(int i=0; i < vertex.length; i++) {
					try {
						Rectangle2D area = state.getRegionRectangle(i);
						point = new Point2D.Double(area.getCenterX(), area.getCenterY());
						scene.write("    object { StateInternal scale" + String.format(COORDINATE, area.getWidth()*VERTEX_R, area.getHeight()*VERTEX_R, VERTEX_H)
							+ translate(point, zposition(node) - VERTEX_D - 0.5) + " }" + CR);						
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
	 * リンクを描く
	 * @param link
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link) throws IOException {
		draw(link, OFFSET_Z + zposition(link.getSource()), OFFSET_Z + zposition(link.getTarget()));
	}

	/**
	 * リンクを描く
	 * @param link
	 * @param lineRadius 
	 * @param sourcez ソースの高さ
	 * @param targetz ターゲットの高さ
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		LineSort sort = lineSort(link);
		if(link.getSource() == link.getTarget()) {
			scene.write(drawLoop(link, center(link.getSource()), sourcez));
		}else {
			INodePresentation[] region = getInternalRegion(link);
			if(region[0] != null || region[1] != null) {
				String difference = ""; // difference StateInternals
				for(int i=0; i < region.length; i++) {
					if(region[i] != null) {
						Rectangle2D bound = (i==0)?region[i].getRectangle():region[i].getRectangle();
						Point2D point = new Point2D.Double(bound.getCenterX(), bound.getCenterY());
						difference += "    object { StateInternal scale" + String.format(COORDINATE, bound.getWidth()*VERTEX_R, bound.getHeight()*VERTEX_R, VERTEX_H)
							+ translate(point, zposition(region[i])) + " }" + CR;
					}
				}
				List<Point3D> linePoints = sort.vertexes(link, sourcez, targetz);
				scene.write("  difference {" + CR + draw(link, linePoints, true) + material(link, true) + " }" + CR
						+ difference + "    no_shadow }" + CR);
				scene.write("  difference {" + draw(link, linePoints, false) + material(link, false) + " }" + CR
						+ difference + "    no_image }" + CR);		
			} else {
				super.draw(link, sourcez, targetz);
			}
		}
	}

	/**
	 * リンク元、リンク先の内部状態領域を取得する
	 * @param link
	 * @return region[0]=リンク元領域, region[1]=リンク先領域
	 */
	protected INodePresentation[] getInternalRegion(ILinkPresentation link) {
		INodePresentation region[] = new INodePresentation[2];
		if(link.getSource().getModel() instanceof IState) {
			IState state = (IState)link.getSource().getModel();
			if(state.getRegionSize() > 0){ // ソースがStateInternalならソースをregion[0]に代入する
				region[0] = link.getSource();
			}
		}
		if(link.getTarget().getModel() instanceof IState) {
			IState state = (IState)link.getTarget().getModel();
			if(state.getRegionSize() > 0) { // ターゲットがStateInternalならターゲットをregion[1]に代入する
				region[1] = link.getTarget();
			}
		}
		return region;
	}

	/**
	 * リンク種別を返す
	 * 
	 * @param link
	 * @return リンク種別
	 */
	protected LineSort lineSort(ILinkPresentation link) {
		INodePresentation source = link.getSource();
		INodePresentation target = link.getTarget();
		if(isOtherParent(source, target)) {
			if(isInternal(source) || isSourceUp(source)) {
				if(isInternal(target) || isTargetUp(target)) {
					return LineSort.Both;
				}else {
					return LineSort.Source;
				}
			}else if(isInternal(target) || isTargetUp(target)) {
				return LineSort.Target;
			}
		}
		return super.lineSort(link);
	}

	/**
	 * ForkPseudostateがリンク元のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isSourceUp(INodePresentation node) {
		return node.getType().equals("ForkPseudostate");
	}
	
	/**
	 * JoinPseudostateがリンク先のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isTargetUp(INodePresentation node) {
		return node.getType().equals("JoinPseudostate");
	}
	
	/**
	 * 2つの異なる状態が同一内部状態内にない
	 * @param source
	 * @param target
	 * @return 山なり
	 */
	public boolean isOtherParent(INodePresentation source, INodePresentation target) {
		return source != target // 念押し
				&& source.getModel().getContainer() != target.getModel().getContainer();
	}

	/**
	 * ノードが内部状態内にある
	 * @param node
	 * @return 内部状態内にある
	 */
	protected boolean isInternal(INodePresentation node) {
		return node.getModel().getContainer() instanceof IState;
	}	
	/**
	 * リンクを円環で描く
	 * @param link
	 * @param sourcep
	 * @param sourcez
	 * @throws IOException
	 */
	protected String drawLoop(ILinkPresentation link, Point2D sourcep, double sourcez) {
		INodePresentation node = link.getSource();
		boolean isEntity = subDiagram(node) == null; // サブダイアグラムを持たない
		if(isEntity && node.getModel() instanceof IState){
			isEntity = ((IState)node.getModel()).getRegionSize() == 0; // 内部状態領域を持たない
		}
		if(isEntity){
			return super.drawLoop(link, sourcep, sourcez);
		}else {
			Rectangle2D bound = node.getRectangle();
			return "    torus { LOOPRd, LRd translate<" + bound.getMaxX() + " - LOOPRd," + (-bound.getMinY()) + ", " + sourcez + "-LOOPRd> " + materialClause(link.getSource(), true) + CR;
		}
	}
}
