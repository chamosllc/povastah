package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.model.IAction;
import com.change_vision.jude.api.inf.model.IActivity;
import com.change_vision.jude.api.inf.model.IActivityDiagram;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IObjectNode;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

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
	protected void declareDiagram(INodePresentation parent, int hierarchy, Point2D dpoint, double z){
		IActivityDiagram subDiagram;
		if((subDiagram = subDiagram(parent)) != null) {
			try {
				ActivityDiagram hierarchyDiagram = new ActivityDiagram(subDiagram, scene);
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
	protected IActivityDiagram subDiagram(INodePresentation parent) {
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
	protected boolean hasSubDiagram(INodePresentation parent) {
		return parent.getType().equals("CallBehaviorAction");
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
	protected boolean drawSubDiagram(INodePresentation node, int hierarchy) throws IOException {
		IActivityDiagram subDiagram;
		if((subDiagram = subDiagram(node)) != null) {
			double deltaZ = 36.0;
			Rectangle2D bound = node.getRectangle();
			Rectangle2D subBound = subDiagram.getBoundRect(); 
			double scale = Math.min(bound.getWidth()/(subBound.getWidth() + deltaZ), bound.getHeight()/(subBound.getHeight() + deltaZ));
			double posz = zposition(node) - deltaZ*scale;
			Point2D point = new Point2D.Double(bound.getCenterX() - (subBound.getCenterX() + (deltaZ/2))*scale, bound.getCenterY() - (subBound.getCenterY() + (deltaZ/2))*scale);
			scene.write("  object { " + id(subDiagram) + " scale " + scale + translate(point, posz) + "}" +CR);
			scene.write("  object { " + type(node) + OBJECT_UNIT + translate(center(node), zposition(node)) + " }" + CR);
			
			textOnStage(node, new Point2D.Double(bound.getMinX() + 28.0, bound.getMaxY() + 32.0), 31.0);
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
}
