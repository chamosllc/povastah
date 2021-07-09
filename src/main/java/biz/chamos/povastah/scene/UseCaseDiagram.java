package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.presentation.INodePresentation;

/**
 * UseCaseDiagram Object in POVRay Scene
 *  Enable Actor, Boundary and UseCase Hierachy Visualization
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/07
 *
 */
public class UseCaseDiagram extends ClassDiagram {

	public UseCaseDiagram(String projectName, IDiagram diagram, OutputStreamWriter writer) throws IOException {
		super(projectName, diagram, writer);
	}
	
	protected void writeNode(int hierarchy, INodePresentation node) throws IOException {
		if(node.getType().equals("UseCase")){
			String[] labels = node.getLabel().split("\n");
			int max = 0;
			double height = labels.length * 0.2 + 0.4;
			for(String label: labels) {
				max = Integer.max(label.getBytes().length, max);
			}
			Point2D point = nodePosition(node);
			sceneWriter.write("cylinder {-z, z 1 texture { T_Wood10 } scale <" + (max*0.1+0.4) + ", " + height
					+ ", 0.05> \n texture { pigment { object { union { " + CR);
			for(int i=0; i < labels.length;  i++) {
				sceneWriter.write("  text { ttf LabelFont \"" + labels[i] + "\", 1, 0 translate <-1, -" + i + ", 0> }" + CR);
			}
			sceneWriter.write(" scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}" +CR
					+ " finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-" + (max*2.0/30) +", -0.5, -2>" + CR 
					+ " } scale 64 " + translate(point));
			sceneWriter.write("}" + CR);
			stage.add(node.getRectangle());
			sceneWriter.flush();
			
		}else {
			super.writeNode(hierarchy, node);
		}
	}
}
