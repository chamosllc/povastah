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
public class StateMachineDiagram extends HierarchyDiagram {
	static final public double VERTEX_R = 0.97;
	static final public double VERTEX_H = 20.0;
	static final public double VERTEX_D = 4.0;
	/*
	 * 3D座標系フォーマット
	 */
	static final protected String COORDINATE = "<%.3f, %.3f, %.2f>";

	public StateMachineDiagram(IDiagram diagram,OutputStreamWriter scene){
		super(diagram, scene);
	}

	public StateMachineDiagram(IDiagram diagram, List<IDiagram> child, OutputStreamWriter scene){
		super(diagram, child, scene);
	}

	/**
	 * サブダイアグラムを宣言をする
	 */
	protected void declareDiagram(Node parent, Point3D point){
		IStateMachineDiagram subDiagram;
		if((subDiagram = subDiagram(parent)) != null) {
			if(!children.contains(subDiagram)) {
				children.add(subDiagram);
				try {
					StateMachineDiagram hierarchyDiagram = new StateMachineDiagram(subDiagram, children, scene);
					if(hierarchyDiagram.existsScene()) {
						hierarchyDiagram.drawDiagram(point);
					}else {
						children.remove(subDiagram);
					}
				}catch(Exception e) {}
			}
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
	
//	/**
//	 * 宣言されたサブダイアグラムを返す
//	 * @param parent
//	 * @return サブダイアグラム
//	 */
//	protected IStateMachineDiagram callDiagram(Node parent) {
//		IStateMachineDiagram diagram = subDiagram(parent);
//		if(children.contains(diagram)) {
//			return diagram;
//		}else {
//			return null;
//		}
//	}
	
	/**
	 * サブダイアグラムを持つノード型である
	 */
	@Override
	protected boolean hasSubDiagram(Node parent) {
		return parent.isLiterallyType("SubmachineState");
	}
	
	/**
	 * 階層構造を持つノードである
	 * @param parent ノード
	 */
	@Override
	protected boolean hasHierarchy(Node parent) {
		return super.hasHierarchy(parent) || hasInternalMachine(parent);
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
	 * ノードを描く
	 * @param node
	 * @throws IOException
	 */
	protected void draw(Node node) throws Exception {
		if(hasInternalMachine(node)) {
			drawInternalMachine(node);
			drawLinkSource(node);
		}else {
			super.draw(node);
		}
	}

	/**
	 * ノードにダイアグラム階層があるときサブダイアグラムを配置する
	 * サブマシン状態(SubmachineState)にサブマシンがあるとき配置する
	 * @param node
	 * @return サブマシンがある
	 * @throws IOException
	 */
	protected boolean drawSubDiagram(Node node) throws IOException {
		IDiagram subDiagram = callDiagram(node);
		if(subDiagram != null) {
			Rectangle2D bound = node.getBound();
			final Point3D textAlign = new Point3D(10.0, -8.0, 0.0);
			scene.write(node.drawWithState(id(subDiagram), new Point3D(bound.getWidth(), bound.getHeight(), VERTEX_H), subDiagram.getBoundRect(), textAlign));
			return true;
		}
		return false;
	}

	/**
	 * 内部状態マシンを描く
	 * @param machine 内部状態マシンを持つノード
	 * @throws IOException
	 */
	protected void drawInternalMachine(Node machine) throws IOException {
		IState state = (IState)machine.getModel();
		double z = machine.getLocation().getZ() - VERTEX_D;
		IVertex[] vertex = state.getSubvertexes();
		Rectangle2D bound = machine.getBound();
		Point3D point = machine.getLocation().settleZ(z);
		String stage = "    object { StateInternal scale" + String.format(COORDINATE, bound.getWidth(), bound.getHeight(), VERTEX_H)
			+ machine.translate(z) + " }";
		// vertexをstageの凹にする
		scene.write("  difference {" + CR + stage + CR);
		for(int i=0; i < vertex.length; i++) {
			try {
				Rectangle2D area = state.getRegionRectangle(i);
				point = new Point3D(area.getCenterX(), -area.getCenterY(), z - 0.5);
				scene.write("    object { StateInternal scale" + String.format(COORDINATE, area.getWidth()*VERTEX_R, area.getHeight()*VERTEX_R, VERTEX_H)
					+ machine.translate(point) + " }" + CR);						
			} catch (InvalidUsingException e) {}
		}
		scene.write("  }" + CR);
		scene.write(machine.textOnStage(new Point3D(12.0, -16.0, VERTEX_H)));
	}

	/**
	 * 内部状態マシンを持つ状態である
	 * @param node
	 * @return 内部状態マシンを持つ状態である
	 */
	protected boolean hasInternalMachine(Node node) {
		if(node.getModel() instanceof IState) {
			IState state = (IState)node.getModel();
			if(state.getRegionSize() > 0) {
				return true;
			};
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
	 * @throws Exception 
	 */
	protected LineSort lineSort(ILinkPresentation link) throws Exception {
		Node source = findNode(link.getSource());
		Node target = findNode(link.getTarget());
		if(isOtherParent(source, target)) {
			if(isInternal(source) || isFork(source)) {
				if(isInternal(target) || isJoin(target) || !hasHierarchy(target)) {
					return LineSort.Both;
				}else {
					return LineSort.Source;
				}
			}else if(isInternal(target) || isJoin(target)) {
				return LineSort.Both;
			}
		}
		return super.lineSort(link);
	}

	/**
	 * ForkPseudostateがリンク元のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isFork(Node node) {
		return node.isLiterallyType("ForkPseudostate");
	}
	
	/**
	 * JoinPseudostateがリンク先のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isJoin(Node node) {
		return node.isLiterallyType("JoinPseudostate");
	}
	
	/**
	 * 2つの異なる状態が同一内部状態内にない
	 * @param source
	 * @param target
	 * @return 山なり
	 */
	public boolean isOtherParent(Node source, Node target) {
		return source.getModel().getContainer() != target.getModel().getContainer();
	}

	/**
	 * ノードが内部状態内にある
	 * @param node
	 * @return 内部状態内にある
	 */
	protected boolean isInternal(Node node) {
		return node.getModel().getContainer() instanceof IState;
	}

	protected boolean isForkJoinLinkType(ILinkPresentation link) {
		return link.getType().equals("Transition");
	}
}
