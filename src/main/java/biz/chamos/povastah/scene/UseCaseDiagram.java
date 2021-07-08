package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.presentation.INodePresentation;

public class UseCaseDiagram extends ClassDiagram {

	public UseCaseDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer) throws IOException {
		super(projectName, diagram, writer);
	}
	
	protected void writeNode(int hierarchy, INodePresentation node) throws IOException {
		String SCALE = " scale 24 ";

		Point2D point = nodePosition(node);
		sceneWriter.write("object { " + object(node) + " rotate -x*90" + SCALE + translate(point) + " ");
		sceneWriter.write("}" + CR);
		writeLabel(node);
		stage.add(node.getRectangle());
		sceneWriter.flush();
		writeSubDiagram(hierarchy + 1, node);
	}
}
