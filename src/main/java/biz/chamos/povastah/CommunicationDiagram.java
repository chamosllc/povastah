package biz.chamos.povastah;

import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.model.IDiagram;

import biz.chamos.povastah.scene.ClassDiagram;

public class CommunicationDiagram extends ClassDiagram {

	public CommunicationDiagram(IDiagram diagram, OutputStreamWriter writer) {
		super(diagram, writer);
	}

}
