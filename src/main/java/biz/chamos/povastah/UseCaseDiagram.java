package biz.chamos.povastah;

import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.model.IDiagram;

public class UseCaseDiagram extends ClassDiagram {

	public UseCaseDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer) throws IOException {
		super(projectName, diagram, writer);
	}
}
