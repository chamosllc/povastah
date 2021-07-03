package biz.chamos.povastah;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import com.change_vision.jude.api.inf.exception.InvalidUsingException;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IElement;
import com.change_vision.jude.api.inf.model.INamedElement;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

public class Scene<T extends IDiagram> {
	static protected String CR = System.lineSeparator();
	static protected String HEADER_COMMENT = "/**" + CR
			+ " * astah* Diagram 3D Visualization\n * %s %s" + CR
			+ " * created at %s" + CR
			+ " * presented by povastah" + CR + " **/" + CR + CR;
	static final String COORDINATE = "<%.2f, %.2f, %.2f>";
	
	protected String projectName;
	protected OutputStreamWriter sceneFile;
	protected T diagram;
	protected List<INodePresentation> nodes;
	protected List<ILinkPresentation> links;
	protected double depth;
	
	@SuppressWarnings("unchecked")
	public Scene(String projectName, INamedElement diagram, File directory) throws IOException {
		this.projectName =projectName;
		this.sceneFile = new OutputStreamWriter(new FileOutputStream(directory + File.separator + diagram.getName() + ".pov"), "UTF-8");
		this.diagram = (T)diagram;	
	}
	
	public void save(){
		try {
			extractElement();
			writeHeader();
			writeDeclare();
			writeDiagram();
			sceneFile.close();
		} catch (IOException | InvalidUsingException e) {}
	}

	protected void writeDiagram() throws IOException {
		sceneFile.write("union {" + CR);
		writeNodes();
		writeLinks();
		sceneFile.write("}" + CR);
	}
	protected void writeHeader() throws IOException {
		Calendar cl = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		sceneFile.write(String.format(HEADER_COMMENT, projectName, diagram.getName(), sdf.format(cl.getTime())));
		sceneFile.write("#version 3.7" + CR + "#global_settings { assumed_gamma 2.2 }" + CR
				+ "#global_settings { charset utf8 }" + CR + CR);	
		sceneFile.write("#include \"uml.inc\"" + CR + CR);
		sceneFile.flush();
	}
	
	protected void writeDeclare() throws IOException {
		final String DEFVAR = "#declare %s = " + COORDINATE + ";" + CR;
		Rectangle2D rect = diagram.getBoundRect();
		depth = -(rect.getCenterX() + rect.getCenterY()) * 2;
		sceneFile.write(String.format(DEFVAR, "EYE", rect.getCenterX(), rect.getCenterY(), depth/2));
		sceneFile.write(String.format(DEFVAR, "FOCUS", rect.getCenterX(), rect.getCenterY(), 0.0));
		sceneFile.write("camera { location EYE direction 1*z look_at FOCUS }" + CR
				+ "light_source { <0, 128, -512> color White }" + CR
				+ "plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }" + CR);
		sceneFile.flush();
	}
	
	protected void writeNodes() throws IOException {
		for (INodePresentation node : nodes) {
			if(node.getType() != "Frame" && node.getType() != "Note" ) {
				Point2D point = node.getLocation();
				sceneFile.write("object { " + povrayObject(node) + " rotate -x*90 scale 16 " + translate(point) + " ");
				writeProperties(node);
				sceneFile.write("}" + CR);
				if(!node.getType().contains("Initial") && !node.getType().contains("Final")) {
					String label = node.getLabel();
					point.setLocation(point.getX() - label.length()*5, point.getY() + 28 );
					sceneFile.write(" text { ttf \"msgothic.ttc\", \"" + label + "\", 1, 0 scale 12 texture { T_Stone8 }"
							+ CR + translate(point, -32.0) + " }" + CR);
				}
			}
		}
		sceneFile.flush();
	}

	protected String povrayObject(INodePresentation node) {
		IElement model = node.getModel();
		if(model != null) {
			List<String> types = Arrays.asList(model.getStereotypes());
			if(!types.isEmpty()) {
				if(types.contains("actor")) {
					return "Actor";
				}else if(types.contains("boundary")) {
					return "Boundary";
				}else if(types.contains("control")) {
					return "Control";
				} if(types.contains("entity")) {
					return "Entity";
				}
			}			
		}
		return node.getType();
	}

	protected void writeLinks() throws IOException {
		for (ILinkPresentation link : links) {
			INodePresentation source = link.getSource();
			INodePresentation target = link.getTarget();
			if(source.getType() != "Note" && target.getType() != "Note") {
				Point2D sourcep = source.getLocation();
				Point2D targetp = target.getLocation();
				if(sourcep.equals(targetp)) {
					sourcep.setLocation(sourcep.getX(), sourcep.getY() - 48.0);
					sceneFile.write("torus { 48, 3.0 rotate x*90 " + translate(sourcep));
				}else {
					sceneFile.write("union {" + CR);
					Point2D[] points = link.getPoints();
					sceneFile.write("  cylinder { " + coordinate(sourcep));			
					for(int i=0; i < points.length - 1; i++) {
						sceneFile.write(", " + coordinate(points[i]) + ", 3.0 }" + CR
								+ "  cylinder { " + coordinate(points[i]));
					}
					sceneFile.write(", " + coordinate(targetp) + ", 3.0 }" + CR);
				}
//				writeProperties(link);
				sceneFile.write("  texture { T_Yellow_Glass }" + CR);
				sceneFile.write("}" + CR);				
			}
		}

	}
	
	protected void extractElement() throws InvalidUsingException {
		nodes = new ArrayList<INodePresentation>();
		links = new ArrayList<ILinkPresentation>();
		for(IPresentation presence: diagram.getPresentations()){
			if(presence instanceof INodePresentation) {
				nodes.add((INodePresentation)presence);
			}else if(presence instanceof ILinkPresentation) {
				links.add((ILinkPresentation)presence);
			}
		}
	}

	protected void writeProperties(INodePresentation presence) throws IOException {
		Map<String, String> map = presence.getProperties();
		for (String key : map.keySet()) {
			if(key.endsWith(".color") || key.endsWith(".type")){
				String value = map.get(key);
				if (value != null && !value.isEmpty() && value != "null" && value != "normal") {
					if(key.equals("fill.color")) {
//						Color color = new Color(Integer.decode(value));
//						sceneFile.write(String.format(" pigment { color rgb " + COORDINATE + "}", color.getRed()/256.0, color.getGreen()/256.0, color.getBlue()/256.0));
					}
//					sceneFile.write(key + "=" + value + " ");
				}
			}
		}
	}

	protected void writeProperties(ILinkPresentation presence) throws IOException {
		Map<String, String> map = presence.getProperties();
		for (String key : map.keySet()) {
			if(key.endsWith(".color") || key.endsWith(".type")){
				String value = map.get(key);
				if (value != null && !value.isEmpty() && value != "null" && value != "normal") {
//					Color color = new Color(Integer.decode(value));
//					sceneFile.write(String.format(" pigment { color rgb " + COORDINATE + "}", color.getRed()/256.0, color.getGreen()/256.0, color.getBlue()/256.0));
				}
			}
		}
	}
	
	protected String translate(Point2D point) {
		return translate(point, 0.0);
	}

	protected String translate(Point2D point, double z) {
		return " translate " + coordinate(point, z);
	}
	
	protected String coordinate(Point2D point) {
		return coordinate(point, 0.0);
	}
	
	protected String coordinate(Point2D point, double z) {
		return String.format(COORDINATE, point.getX(), -depth/2 - point.getY(), z);
	}
}
