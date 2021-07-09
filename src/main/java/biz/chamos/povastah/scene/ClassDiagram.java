package biz.chamos.povastah.scene;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Arrays;
import java.util.List;

import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IElement;
import com.change_vision.jude.api.inf.presentation.INodePresentation;

/**
 * ClassDiagram Object in POVRay Scene
 *  Enable Class Hierachy Visualization
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/07
 *
 */
public class ClassDiagram extends Diagram {

	public ClassDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer) throws IOException {
		super(projectName, diagram, writer);
	}

	/**
	 * ロバストネス図対応
	 * 特定のステレオタイプについてはそのステレオタイプに対するPOVRayオブジェクトの型をマッピングする
	 * 
	 * @param node
	 * @return
	 */
	protected String object(INodePresentation node) {
		IElement model = node.getModel();
		if(node.getModel() != null) {
			List<String> types = Arrays.asList(model.getStereotypes());
			if(!types.isEmpty()) {
				if(types.contains("actor")) {
					return "Actor";
				}else if(types.contains("boundary")) {
					return "Boundary";
				}else if(types.contains("control")) {
					return "Control";
				}else if(types.contains("entity")) {
					return "Entity";
				}
			}			
		}
		return super.object(node);
	}
}
