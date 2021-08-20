package biz.chamos.povastah.scene;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import com.change_vision.jude.api.inf.model.IClass;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IElement;
import com.change_vision.jude.api.inf.model.ILifeline;
import com.change_vision.jude.api.inf.model.IMessage;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

/**
 * CommunicationDiagram Object in POVRay Scene
 * 
 * @author mashiro@chamos.biz
 * @since 2021/08/07
 *
 */
public class CommunicationDiagram extends ClassDiagram {

	public CommunicationDiagram(IDiagram diagram, OutputStreamWriter scene) {
		super(diagram, scene);
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
		if(node.getModel() instanceof IMessage) {
			IMessage message = (IMessage)(node.getModel());
			for(ILinkPresentation link: node.getLinks()) {	
				LineSort sort = lineSort(link);
				List<Point3D> linePoints = sort.vertexes(link, OFFSET_Z, OFFSET_Z);
				if((link.getSource().getModel() == message.getSource()) && link.getTarget().getModel() == message.getTarget()){
					scene.write(draw(link, linePoints, false) + materialClause(link, false) + CR);
					break;
				}else if((link.getSource().getModel() == message.getTarget()) && link.getTarget().getModel() == message.getSource()) {	
					Collections.reverse(linePoints);
					scene.write(draw(link, linePoints, false) + materialClause(link, false) + CR);
					break;
				}
			}
			text(node);
		}else {
			super.draw(node, hierarchy);
		}
	}

	/**
	 * ラベルのテクスチャを返す
	 * メッセージのラベルのときは"MessageLabelTecture"を返す。
	 * @param node
	 * @return テクスチャを返す
	 */
	protected String labelTexture(INodePresentation node) {
		if(node.getModel() instanceof IMessage) {
			return "texture { MessageLabelTecture }";
		}else {
			return super.labelTexture(node);
		}
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
	 * sphere_sweep{ linear_spline | cubic_spline }を記述する 
	 * @param link
	 * @param lineRadius 
	 * @param sourcez ソースの高さ
	 * @param targetz ターゲットの高さ
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		String type = link.getType();
		if(type.equals("LifelineLink")) {
			scene.write(draw(link, lineSort(link).vertexes(link, sourcez, targetz), true) + materialClause(link, true) + CR);
		}else{
			super.draw(link, sourcez, targetz);
		}	
	}
}
