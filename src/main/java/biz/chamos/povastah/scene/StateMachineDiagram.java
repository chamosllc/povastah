package biz.chamos.povastah.scene;

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

import biz.chamos.povastah.shape.LineSort;
import biz.chamos.povastah.shape.Node;
import biz.chamos.povastah.shape.Point3D;

/**
 * StateMachineDiagram Object in POVRay Scene
 * 	Enable Hierachy Diagram visualization
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 *
 */
public class StateMachineDiagram extends Diagram {
	static final public double VERTEX_R = 0.97;
	static final public double VERTEX_H = 20.0;
	static final public double VERTEX_D = 4.0;

	public StateMachineDiagram(IDiagram diagram, OutputStreamWriter scene){
		super(diagram, scene);
	}

	/**
	 * サブダイアグラムを宣言をする
	 */
	protected void declareDiagram(Node parent, int hierarchy, Point3D point){
		IStateMachineDiagram subDiagram;
		if((subDiagram = subDiagram(parent)) != null) {
			try {
				StateMachineDiagram hierarchyDiagram = new StateMachineDiagram(subDiagram, scene);
				hierarchyDiagram.existsScene(hierarchy);
				hierarchyDiagram.drawDiagram(hierarchy, point);
			} catch (Exception e) {}
		}
	}

	/**
	 * サブダイアグラムを返す
	 * @param parent
	 * @return nullの場合がある
	 */
	protected IStateMachineDiagram subDiagram(Node parent) {
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
	protected boolean hasSubDiagram(Node parent) {
		return parent.isType("SubmachineState");
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
	protected void draw(Node node, int hierarchy) throws IOException {
		if(drawInternalMachine(node)) {
			drawLinkSource(node);
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
	protected boolean drawSubDiagram(Node node, int hierarchy) throws IOException {
		IStateMachineDiagram subDiagram = subDiagram(node);
		if(subDiagram != null) {
			Rectangle2D bound = node.getBound();
			double deltaZ= 48.0;
			scene.write(node.drawWithStage(id(subDiagram), new Point3D(bound.getWidth(), bound.getHeight(), VERTEX_H), subDiagram.getBoundRect(), deltaZ));
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
	protected boolean drawInternalMachine(Node node) throws IOException {
		if(node.getModel() instanceof IState) {
			IState state = (IState)node.getModel();
			if(state.getRegionSize() > 0) {
				double z = node.getLocation().getZ() - VERTEX_D;
				IVertex[] vertex = state.getSubvertexes();
				Rectangle2D bound = node.getBound();
				Point3D point = node.getLocation().settleZ(z);
				String stage = "    object { StateInternal scale" + String.format(COORDINATE, bound.getWidth(), bound.getHeight(), VERTEX_H)
					+ node.translate(z) + " }";
				// vertexをstageの凹にする
				scene.write("  difference {" + CR + stage + CR);
				for(int i=0; i < vertex.length; i++) {
					try {
						Rectangle2D area = state.getRegionRectangle(i);
						point = new Point3D(area.getCenterX(), -area.getCenterY(), z - 0.5);
						scene.write("    object { StateInternal scale" + String.format(COORDINATE, area.getWidth()*VERTEX_R, area.getHeight()*VERTEX_R, VERTEX_H)
							+ node.translate(point) + " }" + CR);						
					} catch (InvalidUsingException e) {}
				}
				scene.write("  }" + CR);
				scene.write(node.textOnStage(24.0));
				return true;
			}
		}
		return false;
	}

	/**
	 * リンクを描く
	 * @param link
	 * @param lineRadius 
	 * @param source ソースの高さ
	 * @param target ターゲットの高さ
	 */
	protected String drawArrow(ILinkPresentation link, Node source, Node target, LineSort sort) {
		String description = super.drawArrow(link, source, target, sort);
		String difference = getInternalRegion(source);
		difference += getInternalRegion(target);
//		List<Point3D> linePoints = sort.vertexes(link, source, target);
		List<String> linePoints = sort.stringVertexes(link, source, target);
		if(!difference.isEmpty()) {
			description = "  difference {" + CR + draw(link, linePoints, true) + material(link, true) + " }" + CR
					+ difference + "    no_shadow }" + CR;
			return description + "  difference {" + draw(link, linePoints, false) + material(link, false) + " }" + CR
					+ difference + "    no_image }" + CR;	
		}else {
			return super.drawArrow(link, source, target, sort);
		}
	}

	/**
	 * リンク元、リンク先の内部状態領域を取得する
	 * @param link
	 * @return region[0]=リンク元領域, region[1]=リンク先領域
	 */
	protected String getInternalRegion(Node node) {
		if(node.getModel() instanceof IState) {
			IState state = (IState)node.getModel();
			if(state.getRegionSize() > 0){ // ソースがStateInternalならソースをregion[0]に代入する
				Rectangle2D area = node.getBound();
				return "    object { StateInternal scale" + String.format(COORDINATE, area.getWidth()*VERTEX_R, area.getHeight()*VERTEX_R, VERTEX_H)
					+ " translate vert(" + node.getName() + ", " + (-LineSort.OFFSET_Z) + ") }" + CR;
			}
		}
		return "";
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
	protected String drawLoop(ILinkPresentation link, Node source) {
		boolean isEntity = subDiagram(source) == null; // サブダイアグラムを持たない
		if(isEntity && source.getModel() instanceof IState){
			isEntity = ((IState)source.getModel()).getRegionSize() == 0; // 内部状態領域を持たない
		}
		if(isEntity){
			return super.drawLoop(link, source);
		}else {
			return source.drawLoop() + materialClause(link.getSource(), true) + CR;
		}
	}
}
