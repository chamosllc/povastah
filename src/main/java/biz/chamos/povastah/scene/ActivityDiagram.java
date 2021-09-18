package biz.chamos.povastah.scene;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

import com.change_vision.jude.api.inf.model.IAction;
import com.change_vision.jude.api.inf.model.IActivity;
import com.change_vision.jude.api.inf.model.IActivityDiagram;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IObjectNode;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

import biz.chamos.povastah.shape.Node;
import biz.chamos.povastah.shape.Point3D;

/**
 * ActivityDiagram Object in POVRay Scene
 *  Enable Hierachy Diagram visualization
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/07
 *
 */
public class ActivityDiagram extends HierarchyDiagram {

	public ActivityDiagram(IDiagram diagram, OutputStreamWriter scene){
		super(diagram, scene);
	}

	public ActivityDiagram(IDiagram diagram, List<IDiagram> child, OutputStreamWriter scene){
		super(diagram, child, scene);
	}

	/**
	 * ノードが描画対象でない
	 * @param ノード
	 */
	protected boolean isExcludes(INodePresentation presentation) {
		/**
		 * 除外対象要素
		 * 入力ピン : "InputPin" | 出力ピン : "OutputPin" | アクティビティパラメタノード : "ActivityParameterNode" | パーティション : "Partition" | レーン : "Lane"
		 */	
		final String[] common = {"InputPin", "OutputPin", "ActivityParameterNode", "Partition", "Lane"};
		String type = presentation.getType();
		for(String exclude: common) {
			if(type.equals(exclude)) {
				return true;
			}
		}
		return super.isExcludes(presentation);
	}

	/**
	 * サブダイアグラムを宣言をする
	 */
	protected void declareDiagram(Node parent, Point3D point){
		IActivityDiagram subDiagram;
		if((subDiagram = subDiagram(parent)) != null) {
			if(!children.contains(subDiagram)) {
				try {
					ActivityDiagram hierarchyDiagram = new ActivityDiagram(subDiagram, children, scene);
					if(hierarchyDiagram.existsScene()) {
						children.add(subDiagram);
						hierarchyDiagram.drawDiagram(point);
					}
				}catch(Exception e) {}
			}
		}
	}
	
	/**
	 * サブダイアグラムを返す
	 * @param parent
	 * @return サブダイアラムが指定されていない、あるいは、既に定義されたダイアグラムの場合は、nullを返す
	 */
	protected IActivityDiagram subDiagram(Node parent) {
		if(hasSubDiagram(parent)) {
			IActivity activity = ((IAction) parent.getModel()).getCallingActivity(); // nullの場合がある
			if(activity != null) {
				return activity.getActivityDiagram();
			}
		}
		return null;
	}

	/**
	 * サブダイアグラムを持つノード型である
	 */
	@Override
	protected boolean hasSubDiagram(Node parent) {
		return parent.isLiterallyType("CallBehaviorAction");
	}
	
	/**
	 * ノードにダイアグラム階層があるときサブダイアグラムを配置する
	 * 振る舞い呼び出しアクション(CallBehaviorAction)にサブアクティビティがあるとき配置する
	 * @param node
	 * @return サブアクティビティがある
	 * @throws IOException
	 */
	protected boolean drawSubDiagram(Node node) throws IOException {
		IActivityDiagram subDiagram = subDiagram(node);
		if(subDiagram != null) {
			scene.write(node.drawWithAction(id(subDiagram), subDiagram.getBoundRect()));
			return true;
		}
		return false;
	}

	/**
	 * ノード、リンクのラベル名を返す
	 * @param presence
	 * @return ラベル名
	 */
	protected String label(IPresentation presence) {
	String label = super.label(presence);
		if(presence.getModel() instanceof IObjectNode) {
			label = label.replace(" : ", ":"); // "インスタンス名 : クラス名"を空白文字を抜いて"インスタンス名:クラス名"にする
		}
		return label;
	}
	
	/**
	 * ForkNodeがリンク元のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isFork(Node node) {
		return node.isLiterallyType("ForkNode");
	}
	
	/**
	 * JoinNodeがリンク先のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isJoin(Node node) {
		return node.isLiterallyType("JoinNode");
	}

	protected boolean isForkJoinLinkType(ILinkPresentation link) {
		return link.getType().equals("ControlFlow/ObjectFlow");
	}
}
