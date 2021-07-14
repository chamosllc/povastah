package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.change_vision.jude.api.inf.exception.InvalidUsingException;
import com.change_vision.jude.api.inf.exception.ProjectNotFoundException;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

/**
 * Diagram Object in POVRay Scene
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 *
 */
public class Diagram {
	static protected String CR = System.lineSeparator(); // 改行
	static protected String HEADER_COMMENT = "/**" + CR
			+ " * astah* Diagram 3D Visualization\n * %s %s" + CR
			+ " * created at %s" + CR
			+ " * presented by povastah" + CR + " **/" + CR + CR;
	static final String COORDINATE = "<%.2f, %.2f, %.2f>"; // 座標系フォーマット

	protected String projectName;
	protected OutputStreamWriter sceneWriter; // シーン言語スクリプト出力ファイル
	protected IDiagram diagram;
	protected List<INodePresentation> nodes; // ダイアグラム中のノード要素(Frame, Noteを除く)
	protected List<ILinkPresentation> links; // ダイアグラム中のリンク要素
	protected Rectangle2D stage; // nodesの含まれる矩形
	
	public Diagram(String projectName, IDiagram diagram, OutputStreamWriter sceneWriter) throws IOException {
		this.projectName = projectName;
		this.sceneWriter = sceneWriter;
		this.diagram = diagram;
	}
	
	/**
	 * astahダイアグラムの3DCG表現を出力する
	 */
	public void produce(){
		try {
			extractElement();
			writeHeader();
			writeDiagram(0, new Point2D.Double(), 0.0);
			writeStage();
			sceneWriter.close();
		} catch (InvalidUsingException e) {
			try {
				sceneWriter.write(CR + e.getMessage());
				sceneWriter.close();
			} catch (IOException e1) {}
		} catch (IOException e1) {}			
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
			if(presence instanceof INodePresentation && !excludeIPresentation(presence)) {
				nodes.add((INodePresentation)presence);
			}else if(presence instanceof ILinkPresentation) {
				links.add((ILinkPresentation)presence);
			}
		}
	}
	
	/**
	 * スクリプトのヘッダ部を出力する
	 * @throws IOException
	 * @throws ProjectNotFoundException 
	 */
	protected void writeHeader() throws IOException {
		Calendar cl = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		sceneWriter.write(String.format(HEADER_COMMENT, projectName, diagram.getName(), sdf.format(cl.getTime())));
		sceneWriter.write("#version 3.7" + CR + "#global_settings { assumed_gamma 2.2 }" + CR
				+ "#global_settings { charset utf8 }" + CR + CR);	
		sceneWriter.write("#include \"astahuml.inc\"" + CR + CR);
		sceneWriter.flush();
	}
	
	/**
	 * ダイアグラムオブジェクトを出力する
	 * @throws IOException
	 */
	protected void writeDiagram(int hierarchy, Point2D dpoint, double z) throws IOException {
		String objectName = this.getClass().getSimpleName() + hierarchy;
		sceneWriter.write("#declare " + objectName + " = union {" + CR);
		writeNodes(hierarchy, dpoint, z);
		writeLinks();
		sceneWriter.write("}" + CR);
		sceneWriter.write("object { " + objectName + " ");
		if(hierarchy > 0) {
			sceneWriter.write(String.format(" scale %f translate %s ", hierarchy*0.1, translate(dpoint, z)));
		}
		sceneWriter.write(" }" + CR);
		sceneWriter.flush();
	}

	/**
	 * カメラ、光源、平面等のベースシーン環境を出力する
	 * @throws IOException
	 */
	protected void writeStage() throws IOException {
		final String DEFVAR = "#declare %s = " + COORDINATE + ";" + CR;
		// フレームの矩形の中心をカメラ焦点にする
		double stageX = stage.getCenterX();
		double stageY = -stage.getCenterY();
		double stageZ = stageY - Math.abs(stageX) - 32.0;
		if(stageZ > -256) {
			stageZ = -256;
		}
		sceneWriter.write(String.format(DEFVAR, "EYE", stageX, stageY, stageZ));
		sceneWriter.write(String.format(DEFVAR, "FOCUS", stageX, stageY, 0.0));
		sceneWriter.write("camera { location EYE direction 1*z look_at FOCUS }" + CR);
		sceneWriter.write(String.format("light_source { " + COORDINATE + " color White }" + CR, -1000.0, -1000.0, -3000.0));
		sceneWriter.write("plane { z, 32.0 texture { " + stageTexture() + " }}" + CR);
		sceneWriter.flush();
	}

	protected String stageTexture() {
		return getClass().getSimpleName() + "Texture";
	}

	/**
	 * Node要素をマッピングする
	 * @throws IOException
	 */
	protected void writeNodes(int hierarchy, Point2D dpoint, double z) throws IOException {
		for (INodePresentation node : nodes) {
			writeNode(hierarchy, node);
			sceneWriter.flush();
		}
	}

	/**
	 * ノードオブジェクトを出力する
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	protected void writeNode(int hierarchy, INodePresentation node) throws IOException {
		String SCALE = " scale 24 ";
		Point2D point = nodePosition(node);	
		sceneWriter.write("object { " + object(node) + " rotate -x*90" + SCALE + translate(point) + " ");
		sceneWriter.write("}" + CR);

		writeLabel(node);
		writeSubDiagram(hierarchy + 1, node);
	}

	/**
	 * POVRayオブジェクト変換対象除外
	 * @param presentation
	 * @return
	 * @throws IOException 
	 */
	protected boolean excludeIPresentation(IPresentation presentation) {
		/**
		 * 除外対象要素
		 * フレーム : "Frame" | ノート : "Note" | テキスト : "Text" | 長方形 : "Rectangle" | 楕円 : "Oval"
		 *  | 画像 : "Image" | 直線 : "Line" | フリーハンド : "FreeHand" | 
		 */	
		final String[] excludes = {"Frame", "Note", "Text", "Rectangle", "Oval", "Image", "Line", "FreeHand", "Highlighter"};
		String type = presentation.getType();
		for(String exclude: excludes) {
			if(type.equals(exclude)) {
				if(exclude.equals("Frame")) { // フレームの矩形を保持する
					 stage = presentation.getDiagram().getBoundRect();
				}
				return true;
			}
		}	 
		return false;
	}
	
	/**
	 * ノードオブジェクトの中心座標を決める
	 * @param node
	 * @return Point2D 中心座標
	 */
	protected Point2D nodePosition(INodePresentation node) {
		return new Point2D.Double(node.getRectangle().getCenterX(), node.getRectangle().getCenterY());
	}

	/**
	 * リンクオブジェクトの中心座標を決める
	 * @param node
	 * @return Point2D 中心座標
	 */
	protected Point2D nodePosition(ILinkPresentation link) {
		Rectangle2D bound = link.getSource().getRectangle();
		bound.add(link.getTarget().getRectangle());
		return new Point2D.Double(bound.getCenterX(), bound.getCenterY());
	}
	
	/**
	 * 振る舞い呼び出しアクション、サブマシン状態にサブダイアグラムを配置する
	 * ※pending : とりあえず、サブダイアグラムのPOVRayオブジェクトを呼び出すテンプレートをコメント出力する
	 * 				エディタで編集する
	 * 
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	protected void writeSubDiagram(int hierarchy, INodePresentation node) throws IOException {	}

	/**
	 * Nodeのラベルオブジェクトを出力する
	 * @param node
	 * @throws IOException
	 */
	protected void writeLabel(INodePresentation node) throws IOException {
		final double scale = 16.0;
		final String SCALE = " scale <" + scale + ", " +  scale + ", 2> ";
		double labelShift = 36.0;
		if(!noLabel(node.getType())) { // 名前が表示されない。デフォルトでついた名前を空にできない。
			double labelY = 0.0;
			int merginX = 0;
			for(String label: node.getLabel().split("\n")) {
				Point2D point = (Point2D)nodePosition(node).clone();
				if(merginX == 0) {
					merginX = label.getBytes().length*3;
				}
				point.setLocation(point.getX() - merginX, point.getY() + labelY + labelShift );
				sceneWriter.write(" text { ttf LabelFont, \"" + label + "\", 1, 0" + SCALE + "texture { LabelTecture }"
					+ CR + translate(point, 32.0 - 2.0) + " }" + CR);
				labelY+= scale;
			}
		}
	}

	protected boolean noLabel(String type) {
		return type.contains("Initial") || type.contains("Final") || type.contains("Choice");
	}
	/**
	 * Nodeのラベルオブジェクトを出力する
	 * @param link
	 * @throws IOException
	 */
	protected void writeLabel(ILinkPresentation link) throws IOException {
		final double scale = 16.0;
		final String SCALE = " scale <" + scale + ", " +  scale + ", 2> ";
		double labelShift = 36.0;
		if(!link.getType().contains("Initial") && !link.getType().contains("Final") && !link.getType().contains("Choice")) { // 名前が表示されない。デフォルトでついた名前を空にできない。
			double labelY = 0.0;
			int merginX = 0;
			for(String label: link.getLabel().split("\n")) {
				Point2D point = (Point2D)nodePosition(link).clone();
				if(merginX == 0) {
					merginX = label.getBytes().length*3;
				}
				point.setLocation(point.getX() - merginX, point.getY() + labelY + labelShift );
				sceneWriter.write(" text { ttf LabelFont, \"" + label + "\", 1, 0" + SCALE + "texture { LinkLabelTecture }"
					+ CR + translate(point, 32.0 - 2.0) + " }" + CR);
				labelY+= scale;
			}
		}
	}
	
	/**
	 * Node要素の特定の型に対するPOVRayオブジェクト型をマッピングする
	 * 
	 * @param node
	 * @return
	 */
	protected String object(INodePresentation node) {
		return node.getType();
	}

	/**
	 * Link要素をマッピングする
	 * astahダイアグラムのLinkのNodeへの端点は使わない 
	 * @throws IOException
	 */
	protected void writeLinks() throws IOException {
		double lineRadius = 3.0;
		double offsetZ = 4;
		for (ILinkPresentation link : links) {
			if(!(excludeIPresentation(link.getSource()) || excludeIPresentation(link.getTarget()))) {
				writeLink(link, lineRadius, offsetZ);
				sceneWriter.flush();
			}
		}
	}

	/**
	 * リンクオブジェクトを出力する 
	 * @param link
	 * @param lineRadius
	 * @param offsetZ
	 * @throws IOException
	 */
	protected void writeLink(ILinkPresentation link, double lineRadius, double offsetZ) throws IOException {
		INodePresentation source = link.getSource();
		INodePresentation target = link.getTarget();
		Point2D sourcep = nodePosition(source);
		Point2D targetp = nodePosition(target);
		sceneWriter.write("// link " + link.getType() + ":" + link.getLabel() + CR);
		if(sourcep.equals(targetp)) { // 始点と終点が同じであればリレーションは真円にする
			double torusRadius = 32.0;
			sourcep.setLocation(sourcep.getX(), sourcep.getY());
			sceneWriter.write("torus { " + torusRadius + ", " + lineRadius + translate(sourcep, -torusRadius + offsetZ));
		}else {
			Point2D[] points = link.getPoints();
			sceneWriter.write("sphere_sweep { linear_spline, " + points.length + ", " + CR); // 始点、終点の2点とpointsから最初と最後の2点を抜いた数の合計
			sceneWriter.write(coordinate(sourcep, offsetZ) + ", " + lineRadius + CR); // 始点
			for(int i=1; i < points.length - 1; i++) { // pointsの最初と最後の値を使わない(ノードの端点)
				sceneWriter.write(coordinate(points[i], offsetZ) + ", " + lineRadius + CR);
			}
			sceneWriter.write(coordinate(targetp, offsetZ) + ", " + lineRadius + CR); // 終点
		}
		sceneWriter.write(linkTextureName(link));		
	}

	protected String linkTextureName(ILinkPresentation link) {
		return "  texture { " + link.getType().replace('/', '_').replace(' ', '_').replace('&', '_').replace('-', '_')	+ "Texture }" + CR + "}" + CR;
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
		return String.format(COORDINATE, point.getX(), -point.getY(), z);
	}
}
