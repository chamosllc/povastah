package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.model.IAction;
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

	/**
	 * コンストラクタ
	 */
	public ActivityDiagram(String projectName, IDiagram diagram, OutputStreamWriter sceneWriter){
		super(projectName, diagram, sceneWriter);
	}

	/**
	 * ノードが出力対象ではない
	 * @param ノード
	 * @return 除外ノードである
	 */
	protected boolean excludeIPresentation(INodePresentation presentation) {
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
		return super.excludeIPresentation(presentation);
	}
	
	/**
	 * サブダイアグラムがあれば、そのオブジェクトの宣言文を出力する
	 */
	protected void declareDiagram(INodePresentation parent, int hierarchy, Point2D dpoint, double z){
		IActivityDiagram subDiagram;
		if((subDiagram = subDiagram(parent)) != null) {
			try {
				ActivityDiagram nestDiagram = new ActivityDiagram(projectName, subDiagram, sceneWriter);
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
	protected IActivityDiagram subDiagram(INodePresentation parent) {
		if(hasSubDiagram(parent)) {
			return ((IAction) parent.getModel()).getCallingActivity().getActivityDiagram(); // null場合がある
		}else {
			return null;
		}
	}

	/**
	 * サブダイアグラムを持つ性質のノードかどうか
	 */
	protected boolean hasSubDiagram(INodePresentation parent) {
		return parent.getType().equals("CallBehaviorAction");
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
	protected boolean writeSubDiagram(int hierarchy, INodePresentation node) throws IOException {
		IActivityDiagram subDiagram;
		if((subDiagram = subDiagram(node)) != null) {
			Rectangle2D bound = node.getRectangle();
			Rectangle2D subBound = subDiagram.getBoundRect(); 
			double scale = Math.min(bound.getWidth()/(subBound.getWidth() - 36), bound.getHeight()/(subBound.getHeight() - 36));
			double posz = nodePositionZ(node) - 36*scale;
			Point2D point = new Point2D.Double(bound.getCenterX() - (subBound.getCenterX() + 36)*scale, bound.getCenterY() - (subBound.getCenterY() + 36)*scale);
			sceneWriter.write("  object { " + povrayName(subDiagram) + " scale " + scale + translate(point, posz) + "}" +CR);
			writeLabelOnStage(node, bound);
			return true;
		}
		return false;
	}
	
	protected String label(IPresentation presence) {
		String label = super.label(presence);
		if(presence.getModel() instanceof IObjectNode) {
			label = label.replace(" ", "");
		}
		return label;
	}
	
	/**
	 * サブダイアグラム上にノードのラベルを描く
	 * @param node
	 * @param bound
	 * @throws IOException
	 */
	protected void writeLabelOnStage(INodePresentation node, Rectangle2D bound) throws IOException {
		/*
		 * writeLabel
		 */
		String label = label(node);
		if(!label.isEmpty()) {
			sceneWriter.write("    text { ttf LabelFont, \"" + label + "\", 1, 0 scale <16, 16, 2> texture { LabelTecture }"
					+ translate(new Point2D.Double(bound.getMinX() + 28.0, bound.getMaxY() + 32), nodePositionZ(node) + 31) + " }" + CR);
		}
	}
}
