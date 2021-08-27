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
import com.change_vision.jude.api.inf.presentation.IPresentation;

import biz.chamos.povastah.shape.LineSort;
import biz.chamos.povastah.shape.Node;

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
	protected void draw(Node node, int hierarchy) throws IOException {
		if(node.getModel() instanceof IMessage) {
			IMessage message = (IMessage)(node.getModel());
			Node source, target;
			for(ILinkPresentation link: node.getLinks()) {	
				LineSort sort = lineSort(link);
				source = findNode(link.getSource());
				target = findNode(link.getTarget());
				List<String> linePoints = sort.stringVertexes(link, source, target);
				if(source.getModel() == message.getSource() && target.getModel() == message.getTarget()){
					scene.write(draw(link, linePoints, false) + materialClause(link, false) + CR);
					break;
				}else if(source.getModel() == message.getTarget() && target.getModel() == message.getSource()) {	
					Collections.reverse(linePoints);
					scene.write(draw(link, linePoints, false) + materialClause(link, false) + CR);
					break;
				}
			}
			scene.write(node.text());
		}else {
			super.draw(node, hierarchy);
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
	 * @param source ソースの高さ
	 * @param target ターゲットの高さ
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, Node source, Node target) throws IOException {
		if(link.getType().equals("LifelineLink")) {
			LineSort sort = lineSort(link);
			List<String> linePoints = sort.stringVertexes(link, source, target);
			scene.write(draw(link, linePoints, true) + materialClause(link, true) + CR);
		}else{
			super.draw(link, source, target);
		}	
	}
}
