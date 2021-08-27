package biz.chamos.povastah.scene;

import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.model.IAction;
import com.change_vision.jude.api.inf.model.IActivity;
import com.change_vision.jude.api.inf.model.IActivityDiagram;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IObjectNode;
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
public class ActivityDiagram extends Diagram {

	public ActivityDiagram(IDiagram diagram, OutputStreamWriter scene){
		super(diagram, scene);
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
	protected void declareDiagram(Node parent, int hierarchy, Point3D point){
		IActivityDiagram subDiagram;
		if((subDiagram = subDiagram(parent)) != null) {
			try {
				ActivityDiagram hierarchyDiagram = new ActivityDiagram(subDiagram, scene);
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
	protected boolean hasSubDiagram(Node parent) {
		return parent.isType("CallBehaviorAction");
	}
	
	/**
	 * ノードにダイアグラム階層があるときサブダイアグラムを配置する
	 * 振る舞い呼び出しアクション(CallBehaviorAction)にサブアクティビティがあるとき配置する
	 * 
	 * @param hierarchy
	 * @param node
	 * @return サブアクティビティがある
	 * @throws IOException
	 */
	protected boolean drawSubDiagram(Node node, int hierarchy) throws IOException {
		IActivityDiagram subDiagram = subDiagram(node);
		if(subDiagram != null) {
			double delta = 36.0;
			scene.write(node.drawWithStage(id(subDiagram), subDiagram.getBoundRect(), delta));
			
//			textOnStage(node, new Point2D.Double(node.getBound().getMinX() + 28.0, node.getBound().getMaxY() + 32.0), 31.0);
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
	protected boolean isSourceUp(INodePresentation node) {
		return node.getType().equals("ForkNode");
	}
	
	/**
	 * JoinNodeがリンク先のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isTargetUp(INodePresentation node) {
		return node.getType().equals("JoinNode");
	}
}
