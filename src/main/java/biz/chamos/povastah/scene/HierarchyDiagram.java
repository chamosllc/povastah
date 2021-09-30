package biz.chamos.povastah.scene;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;

import biz.chamos.povastah.shape.Node;
import biz.chamos.povastah.shape.Point3D;

abstract public class HierarchyDiagram extends Diagram {
	/**
	 * 描画ダイアグラム群
	 */
	protected List<IDiagram> children;

	/**
	 * rootダイアグラムの生成
	 * 
	 * @param diagram
	 * @param scene
	 */
	public HierarchyDiagram(IDiagram diagram, OutputStreamWriter scene) {
		super(diagram, scene);
		this.children = new ArrayList<>();
		children.add(diagram);
	}

	/**
	 * サブダイアグラムの生成
	 * 
	 * @param diagram
	 * @param children
	 * @param scene
	 */
	public HierarchyDiagram(IDiagram diagram, List<IDiagram> children, OutputStreamWriter scene) {
		super(diagram, scene);
		this.children = children;
	}

	/**
	 * ダイアグラムを宣言する
	 * @param dpoint
	 * @throws IOException
	 */
	protected void drawDiagram(Point3D point) throws Exception {
		declareSubDiagrams(point);
		super.drawDiagram(point);
	}

	/**
	 * ダイアグラム番号
	 * 
	 * @return ダイアグラムの登録順を返す
	 */
	protected int diagramId() {
		int id = children.indexOf(diagram);
		return (id < 0)?children.size():id;
	}

	/**
	 * すべてのサブダイアグラムを宣言する
	 * 
	 * @param hierarchy
	 * @param dpoint
	 */
	protected void declareSubDiagrams(Point3D point) {
		for (Node parent : nodes) {
			declareDiagram(parent, point);
		}

	}

	/**
	 * サブダイアグラムを宣言をする
	 * @param parent
	 * @param dpoint
	 */
	abstract protected void declareDiagram(Node parent, Point3D point);

	/**
	 * サブダイアグラムを持つノード型である
	 * @param parent ノード
	 */
	abstract protected boolean hasSubDiagram(Node parent);

	/**
	 * 階層構造を持つノードである
	 * @param parent ノード
	 */
	protected boolean hasHierarchy(Node parent) {
		return hasSubDiagram(parent);
	};

	/**
	 * 指定ノードを描く
	 * 
	 * @param node 指定ノード
	 * @throws IOException
	 */
	protected void draw(Node node) throws Exception {
		if (drawSubDiagram(node)) {
			drawLinkSource(node);
		} else {
			super.draw(node);
		}
	}

	/**
	 * サブダイアグラムを返す
	 * 
	 * @param parent
	 * @return サブダイアラムが指定されていない場合はnull
	 */
	abstract protected IDiagram subDiagram(Node parent);

	/**
	 * 宣言されたサブダイアグラムを返す
	 * @param parent
	 * @return サブダイアグラム
	 */
	protected IDiagram callDiagram(Node parent) {
		IDiagram diagram = subDiagram(parent);
		if(children.contains(diagram)) {
			return diagram;
		}else {
			return null;
		}
	}
	
	/**
	 * ノードにダイアグラム階層があるときサブダイアグラムを配置する
	 * 振る舞い呼び出しアクション(CallBehaviorAction)にサブアクティビティがあるとき配置する
	 * @param node
	 * @return 宣言されているサブアクティビティ
	 * @throws IOException
	 */
	protected boolean drawSubDiagram(Node node) throws IOException {
		IDiagram subDiagram = callDiagram(node);
		if(subDiagram != null) {
			scene.write(node.drawWithAction(id(subDiagram), subDiagram.getBoundRect()));
			return true;
		}
		return false;
	}
	
	/**
	 * リンクを円環で描く
	 * @param link
	 * @param source
	 */
	protected String drawLoop(ILinkPresentation link, Node source) {
		if(hasHierarchy(source)){
			return source.drawLoopOnStage() + materialClause(link, true) + CR;		
		}else {
			return super.drawLoop(link, source);
		}
	}
	
	protected boolean hasForkJoinControl() {
		return true;
	}
}
