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

	public UseCaseDiagram(IDiagram diagram, OutputStreamWriter scene){
		super(diagram, scene);
	}

	/**
	 * 指定ノードを描く
	 * UseCaseの場合はユースケース名を書いた楕円柱オブジェクトを出力する
	 * 
	 * @param node
	 * @param hierarchy ユースケースには階層がないので意味の無い値
	 * @throws IOException
	 */
	@Override
	protected void draw(INodePresentation node, int hierarchy) throws IOException {
		if(node.getType().equals("UseCase")){
			String[] labels = node.getLabel().split("\n");
			int max = 0;
			double height = labels.length * 0.2 + 0.4;
			for(String label: labels) {
				max = Integer.max(label.getBytes().length, max);
			}
			Point2D point = center(node);
			scene.write("  cylinder {-z, z 1 texture { UseCaseTexture } scale <" + (max*0.1+0.2) + ", " + height
					+ ", 0.05> texture { pigment { object { union { " + CR);
			for(int i=0; i < labels.length;  i++) {
				scene.write(String.format(TEXT, labels[i], " translate<-" + (max*0.175 - 1.3) + ", -" + i + ", 0>") + CR);
			}
			scene.write("     scale <0.5, 0.5, 1> translate <-0.5, 1, -0.5> } color<1,1,1,1> color<0,0,0,1> }}" +CR
					+ "    finish { phong 1 ambient 0.2 } scale <.7, .5, 10> translate <-" + (max/32.0) +", -0.5, -2>" + CR 
					+ "  } scale 64 " + translate(point) + "}" +CR);
			drawSource(node);
		}else {
			super.draw(node, hierarchy);
		}
	}
}
