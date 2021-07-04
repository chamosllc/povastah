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

import com.change_vision.jude.api.inf.exception.InvalidUsingException;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IElement;
import com.change_vision.jude.api.inf.model.INamedElement;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

/**
 * POVRay Scene Launguage Script
 *  astahダイアグラムの3DCG表現を出力する(POVRayシーン言語スクリプトファイルを出力する)
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 *
 * @param <T> ダイアグラムの型
 */
public class Scene<T extends IDiagram> {
	static protected String CR = System.lineSeparator(); // 改行
	static protected String HEADER_COMMENT = "/**" + CR
			+ " * astah* Diagram 3D Visualization\n * %s %s" + CR
			+ " * created at %s" + CR
			+ " * presented by povastah" + CR + " **/" + CR + CR;
	static final String COORDINATE = "<%.2f, %.2f, %.2f>"; // 座標系フォーマット
	
	protected String projectName; // 未使用
	protected OutputStreamWriter sceneFile; // シーン言語スクリプト出力ファイル
	protected T diagram; // 対象ダイアグラム
	protected List<INodePresentation> nodes; // ダイアグラム中のノード要素(Frame, Noteを除く)
	protected List<ILinkPresentation> links; // ダイアグラム中のリンク要素
	protected Rectangle2D stage; // nodesの含まれる矩形
	protected double depth; // 3D表現時の奥行

	@SuppressWarnings("unchecked")
	public Scene(String projectName, INamedElement diagram, File directory) throws IOException {
		this.projectName =projectName;
		this.sceneFile = new OutputStreamWriter(new FileOutputStream(directory + File.separator + diagram.getName() + ".pov"), "UTF-8");
		this.diagram = (T)diagram;
		this.stage = new Rectangle2D.Double();
	}

	/**
	 * astahダイアグラムの3DCG表現を出力する
	 */
	public void save(){
		try {
			extractElement();
			writeHeader();
			writeDiagram();
			writeStage();
			sceneFile.close();
		} catch (IOException | InvalidUsingException e) {}
	}

	/**
	 * ダイアグラムを出力する
	 * @throws IOException
	 */
	protected void writeDiagram() throws IOException {
		sceneFile.write("union {" + CR);
		writeNodes();
		writeLinks();
		sceneFile.write("}" + CR);
	}
	
	/**
	 * スクリプトのヘッダ部を定義する
	 * @throws IOException
	 */
	protected void writeHeader() throws IOException {
		Calendar cl = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		sceneFile.write(String.format(HEADER_COMMENT, projectName, diagram.getName(), sdf.format(cl.getTime())));
		sceneFile.write("#version 3.7" + CR + "#global_settings { assumed_gamma 2.2 }" + CR
				+ "#global_settings { charset utf8 }" + CR + CR);	
		sceneFile.write("#include \"astahuml.inc\"" + CR + CR);
		sceneFile.flush();
	}

	/**
	 * カメラ、光源、ダイアグラムのステージを定義する
	 * @throws IOException
	 */
	protected void writeStage() throws IOException {
		final String DEFVAR = "#declare %s = " + COORDINATE + ";" + CR;
		depth = -(stage.getCenterX() + stage.getCenterY()) * 2;
		sceneFile.write(String.format(DEFVAR, "EYE", stage.getCenterX(), -stage.getCenterY(), depth/2));
		sceneFile.write(String.format(DEFVAR, "FOCUS", stage.getCenterX(), -stage.getCenterY(), 0.0));
		sceneFile.write("camera { location EYE direction 1*z look_at FOCUS }" + CR
				+ "light_source { EYE color White }" + CR
				+ "plane { z, 32.0 texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 } }" + CR);
		sceneFile.flush();
	}

	/**
	 * ノード要素をマッピングする
	 * @throws IOException
	 */
	protected void writeNodes() throws IOException {		
		for (INodePresentation node : nodes) {
			if(node.getType() != "Frame" && node.getType() != "Note" ) {
				Point2D point = node.getLocation();
				sceneFile.write("object { " + povrayObject(node) + " rotate -x*90 scale 16 " + translate(point) + " ");
				sceneFile.write("}" + CR);
				writeLabel(node);
				stage.add(node.getRectangle());
			}
		}
		sceneFile.flush();
	}

	/**
	 * ノードのラベルを加工する
	 * @param node
	 * @throws IOException
	 */
	protected void writeLabel(INodePresentation node) throws IOException {
		Point2D point = node.getLocation();
		if(!node.getType().contains("Initial") && !node.getType().contains("Final") && !node.getType().contains("Choice")) { // 名前が表示されない。デフォルトでついた名前を空にできない。
			String label = node.getLabel();
			point.setLocation(point.getX() - label.length()*5, point.getY() + 24 );
			sceneFile.write(" text { ttf \"msgothic.ttc\", \"" + label + "\", 1, 0 scale 12 texture { T_Stone8 }"
					+ CR + translate(point, -32.0) + " }" + CR);
		}
	}

	/**
	 * ノード要素の特定の型に対するPOVRayオブジェクトの型をマッピングする
	 * 特定のステレオタイプについてはそのステレオタイプに対するPOVRayオブジェクトの型をマッピングする
	 * 
	 * @param node
	 * @return
	 */
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
				}else if(types.contains("entity")) {
					return "Entity";
				}
			}			
		}
		return node.getType();
	}

	/**
	 * リンク要素をマッピングする
	 * astahダイアグラムのリンクのノードへの端点は使わない
	 * 
	 * @throws IOException
	 */
	protected void writeLinks() throws IOException {
		double z = 4;
		for (ILinkPresentation link : links) {
			INodePresentation source = link.getSource();
			INodePresentation target = link.getTarget();
			if(source.getType() != "Note" && target.getType() != "Note") {
				Point2D sourcep = source.getLocation();
				Point2D targetp = target.getLocation();
				sceneFile.write("// " + link.getType() + ":" + link.getLabel() + CR);
				if(sourcep.equals(targetp)) { // 始点と終点が同じであればリレーションは真円にする
					sourcep.setLocation(sourcep.getX(), sourcep.getY() - 36.0);
					sceneFile.write("torus { 36, 3.0 rotate x*90 " + translate(sourcep, z));
				}else {
					Point2D[] points = link.getPoints();
					sceneFile.write("sphere_sweep { linear_spline, " + points.length + ", " + CR); // 始点、終点の2点とpointsから最初と最後の2点を抜いた数の合計
					sceneFile.write(coordinate(sourcep, z) + ", 3.0"+ CR); // 始点
					for(int i=1; i < points.length - 1; i++) { // pointsの最初と最後の値を使わない(ノードの端点)
						sceneFile.write(coordinate(points[i], z) + ", 3.0" + CR);
					}
					sceneFile.write(coordinate(targetp, z) + ", 3.0" + CR); // 終点
				}
				sceneFile.write("  texture { T_Yellow_Glass }" + CR);
				sceneFile.write("}" + CR);				
			}
		}

	}

	/**
	 * ダイアグラムのノード要素とリンク要素を抽出する
	 * 
	 * @throws InvalidUsingException
	 */
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

	/**
	 * POVRayスクリプトのtranslate句を返す
	 * @param point
	 * @return
	 */
	protected String translate(Point2D point) {
		return translate(point, 0.0);
	}

	/**
	 * POVRayスクリプトのtranslate句を返す
	 * @param point
	 * @param z
	 * @return
	 */
	protected String translate(Point2D point, double z) {
		return " translate " + coordinate(point, z);
	}

	/**
	 * POVRayスクリプトのベクトル表記を返す
	 * @param point
	 * @return
	 */
	protected String coordinate(Point2D point) {
		return coordinate(point, 0.0);
	}
	
	/**
	 * POVRayスクリプトのベクトル表記を返す
	 * @param point
	 * @param z
	 * @return
	 */
	protected String coordinate(Point2D point, double z) {
		return String.format(COORDINATE, point.getX(), -depth/2 - point.getY(), z);
	}
}
