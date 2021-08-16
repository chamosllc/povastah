package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Arrays;
import java.util.List;

import com.change_vision.jude.api.inf.model.IClass;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IElement;
import com.change_vision.jude.api.inf.model.ILifeline;
import com.change_vision.jude.api.inf.model.IMessage;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

public class CommunicationDiagram extends ClassDiagram {

	public CommunicationDiagram(IDiagram diagram, OutputStreamWriter writer) {
		super(diagram, writer);
	}

	/**
	 * 指定ノードのPOVRayオブジェクトを描く
	 * 内部状態のある状態
	 * 
	 * @param node
	 * @param hierarchy
	 * @throws IOException
	 */
	@Override
	protected void draw(INodePresentation node, int hierarchy) throws IOException {
		if(node.getModel() instanceof IMessage) {
			IMessage message = (IMessage)(node.getModel());
			for(ILinkPresentation link: node.getLinks()) {	
				if((link.getSource().getModel() == message.getSource()) && link.getTarget().getModel() == message.getTarget()){
					Point2D sourcep = center(link.getSource());
					Point2D targetp = center(link.getTarget());
					sceneWriter.write(draw(link, sourcep, targetp, OFFSET_Z, OFFSET_Z, false) + shadowMaterial(link) + "no_image }" + CR);
					break;
				}else if((link.getSource().getModel() == message.getTarget()) && link.getTarget().getModel() == message.getSource()) {					
					Point2D targetp = center(link.getSource());
					Point2D sourcep = center(link.getTarget());
					sceneWriter.write(drawReverse(link, sourcep, targetp, OFFSET_Z, OFFSET_Z) + shadowMaterial(link) + "no_image }" + CR);
					break;
				}
			}
			text(node);
		}else {
			super.draw(node, hierarchy);
		}
	}

	/**
	 * ノードのラベルのテクスチャを返す
	 * @param node
	 * @return
	 */
	protected String labelTexture(INodePresentation node) {
		if(node.getModel() instanceof IMessage) {
			return "texture { MessageLabelTecture }";
		}else {
			return super.labelTexture(node);
		}
	}
	
	/**
	 * リンクの矢印を描く
	 * @param points
	 * @return
	 */
	protected String drawReverse(ILinkPresentation link, Point2D sourcep, Point2D targetp, double sourcez, double targetz) {
		String description;
		Point2D[] points = link.getPoints();
		String start = coordinate(sourcep, sourcez) + ", LRd ";
		String end = coordinate(targetp, targetz) + ", 0.0 ";
		int length = points.length; // 2 or 5以上
		boolean isCurve = link.getProperty("line.shape").equals("curve");
		if(!isCurve || length == 2) {
			description = "    sphere_sweep { linear_spline, " + length + ", ";
		}else {
			if(length == 3) { // 1点経由 曲線
				description = "    sphere_sweep { cubic_spline, 5, " + start;
			}else{ // 2点以上経由 曲線
				description = "    sphere_sweep { b_spline, " + (length + 2) + ", " + start;
			}
		}
		description += start; // 始点			
		if(length > 2) { // 経由点を曲線で結ぶ
			double deltaz = (targetz - sourcez)/(length - 1);
			for(int i=length - 2; i == 0; i--) { // pointsの最初と最後の値を使わない(ノードの端点)
				description += coordinate(points[i], sourcez+deltaz) + ", LRd"
						+ ("/" + (Math.pow(2.0, (double)i))) + " "; // 始点→経由点→終点
				deltaz += deltaz;
			}
			if(isCurve) {
				description += end; // 終点
			}
		}
		description += end; // 終点
		return description;
	}
	
	/**
	 * ロバストネス図対応
	 * 特定のステレオタイプについてはそのステレオタイプに対するPOVRayオブジェクトの型をマッピングする
	 * 
	 * @param presence
	 * @return
	 */
	protected String type(IPresentation presence) {
		IElement model = presence.getModel();
		if(model != null) {
			List<String> types = Arrays.asList(model.getStereotypes());
			if(presence.getType().equals("Lifeline")){
				IClass objectNodeClass = ((ILifeline)(presence.getModel())).getBase();
				if(objectNodeClass != null) {
					types = Arrays.asList(objectNodeClass.getStereotypes());
					if(!types.isEmpty()) {
						 if(types.contains("actor")) {
							return "Actor";
						}else if(types.contains("boundary")) {
							return "BoundaryInstance";
						}else if(types.contains("control")) {
							return "ControlInstance";
						}else if(types.contains("entity")) {
							return "EntityInstance";
						}else if(types.contains("interface")) {
							return "Interface";
						}
					}
					return "Lifeline";
				}
			}
		}
		return super.type(presence);
	}
	
	/**
	 * sphere_sweep{ linear_spline | cubic_spline }を出力する 
	 * @param link
	 * @param lineRadius 
	 * @param sourcez ソースの高さ
	 * @param targetz ターゲットの高さ
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		String type = link.getType();
		if(type.equals("LifelineLink")) {
			Point2D sourcep = center(link.getSource());
			Point2D targetp = center(link.getTarget());
			sceneWriter.write(draw(link, sourcep, targetp, sourcez, targetz, true) + material(link) + "no_shadow }" + CR);
		}else{
			super.draw(link, sourcez, targetz);
		}	
	}
}
