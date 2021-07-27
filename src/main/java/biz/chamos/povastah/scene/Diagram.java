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
	static final protected double OFFSET_Z = 4.0;
	static final protected String CR = System.lineSeparator(); // 改行
	static final protected String HEADER_COMMENT = "/**" + CR
			+ " * astah* Diagram 3D Visualization\n * %s %s" + CR
			+ " * created at %s" + CR
			+ " * presented by povastah" + CR + " **/" + CR + CR;
	static final protected String GLOBAL_SETTINGS = "#version 3.7" + CR + "#global_settings { assumed_gamma 2.2 }" + CR
			+ "#global_settings { charset utf8 }" + CR + CR + "#include \"astahuml.inc\"" + CR + CR;
	static final String COORDINATE = "<%.2f, %.2f, %.2f>"; // 座標系フォーマット

	protected String projectName;
	protected OutputStreamWriter sceneWriter; // シーン言語スクリプト出力ファイル
	protected IDiagram diagram;
	protected List<INodePresentation> nodes; // ダイアグラム中のノード要素(Frame, Noteを除く)
	protected List<ILinkPresentation> links; // ダイアグラム中のリンク要素
	protected Rectangle2D stage; // nodesの含まれる矩形
	
	/**
	 * 
	 * @param projectName
	 * @param diagram
	 * @param sceneWriter
	 * @throws InvalidUsingException // ダイアグラムに要素がない
	 */
	public Diagram(String projectName, IDiagram diagram, OutputStreamWriter sceneWriter){
		this.projectName = projectName;
		this.sceneWriter = sceneWriter;
		this.diagram = diagram;
	}

	/**
	 * astahダイアグラムの3DCG表現を出力する
	 */
	public void produce(){
		if(existsTragetNodes()) {
			try {
				writeHeader();
				writeDiagram(0, new Point2D.Double(), 0.0);
				writeStage();
			}catch(IOException | InvalidUsingException e) {}
		}
	}
	
	/**
	 * 対象とするダイアグラムのノード要素とリンク要素を抽出し、対象があるかどうかを返す
	 * @return 対象があればtrue、なければfalse
	 * @throws InvalidUsingException 
	 * 
	 */
	protected boolean existsTragetNodes(){
		nodes = new ArrayList<INodePresentation>();
		links = new ArrayList<ILinkPresentation>();
		try {
			for(IPresentation presence: diagram.getPresentations()){ // 除外ノードでないノードを集める
				if(presence instanceof INodePresentation && !excludeIPresentation(presence)) {
					nodes.add((INodePresentation)presence);
				}else if(presence instanceof ILinkPresentation) { // 除外ノードに繫がっていないリンクを集める
					ILinkPresentation link = (ILinkPresentation)presence;
					if(!excludeIPresentation(link.getSource()) && !excludeIPresentation(link.getTarget())){
						links.add(link);
					}
				}
			}
		} catch (InvalidUsingException e) {} // astah* communityでエラーになるとのこと
		return !nodes.isEmpty();
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
	 * POVRayオブジェクト変換対象除外
	 * @param presentation
	 * @return
	 * @throws IOException 
	 */
	protected boolean excludeIPresentation(ILinkPresentation presentation) {
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
	 * スクリプトのヘッダ部を出力する
	 * @throws IOException
	 * @throws ProjectNotFoundException 
	 */
	protected void writeHeader() throws IOException {
		Calendar cl = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		sceneWriter.write(String.format(HEADER_COMMENT, projectName, diagram.getName(), sdf.format(cl.getTime())));
		sceneWriter.write(GLOBAL_SETTINGS);
		sceneWriter.flush();
	}
	
	/**
	 * ダイアグラムオブジェクトを出力する
	 * @throws IOException
	 * @throws InvalidUsingException 
	 */
	protected void writeDiagram(int hierarchy, Point2D dpoint, double z) throws IOException, InvalidUsingException {
		declareSubDiagrams(hierarchy, dpoint, z);
		String name = povrayName();
		sceneWriter.write("#declare " + name + " = union {" + CR);
		writeNodes(hierarchy, dpoint, z);
		writeLinks();
		sceneWriter.write("}" + CR);
		if(hierarchy == 0) { // サブダイアグラムは宣言のみ
			sceneWriter.write("object { " + name + " }" +CR);
		}
		sceneWriter.flush();
	}

	/**
	 * サブダイアグラムを持つノードすべてのサブダイアグラムを宣言する
	 * 
	 * @param hierarchy
	 * @param dpoint
	 * @param z
	 */
	protected void declareSubDiagrams(int hierarchy, Point2D dpoint, double z) {
		for(INodePresentation parent: nodes) {
			declareDiagram(parent, hierarchy+1, dpoint, z);
		}
	}

	/**
	 * 指定されたノードのサブダイアグラムを宣言する
	 * 
	 * @param parent
	 * @param hierarchy
	 * @param dpoint
	 * @param z
	 */
	protected void declareDiagram(INodePresentation parent, int hierarchy, Point2D dpoint, double z) {}

	/**
	 * ノードがサブダイアグラムを持つ
	 * 
	 * @param parent
	 * @return
	 */
	protected boolean hasSubDiagram(INodePresentation parent) {
		return false;
	}
	
	/**
	 * ダイアグラムの宣言名を返す
	 * 
	 * @return 
	 */
	protected String povrayName() {
		return povrayName(this.diagram);
	}
	
	/**
	 * 指定 ダイアグラムの宣言名を返す
	 * ※ユニークな名前が必要なので、IPresentaion.getID()を利用しているが、ハイフォンが入っているためアンダースコアへ置換している
	 * 
	 * @param diagram
	 * @return
	 */
	protected String povrayName(IDiagram diagram) {
		return this.getClass().getSimpleName() + "_" + diagram.getId().replace('-', '_');
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
		double stageZ = cameraDistance(stageY - Math.abs(stageX) - 32.0);
		sceneWriter.write(String.format(DEFVAR, "EYE", stageX, stageY, stageZ));
		sceneWriter.write(String.format(DEFVAR, "FOCUS", stageX, stageY, 0.0));
		sceneWriter.write("camera { location EYE direction 1*z look_at FOCUS }" + CR);
		sceneWriter.write(String.format("light_source { " + COORDINATE + " color White }" + CR, -1000.0, -1000.0, -3000.0));
		sceneWriter.write("plane { z, 32.0 texture { " + stageTexture() + " }}" + CR);
		sceneWriter.flush();
	}

	/**
	 * 焦点からのカメラの距離を算出する
	 * 
	 * @param z
	 * @return
	 */
	protected double cameraDistance(double z) {
		return (z > -256)?-256:z;
	}

	/**
	 * ダイアグラムのステージ(POVRayオブジェクトplaneのテクスチャ宣言名を返す
	 * 
	 * @return
	 */
	protected String stageTexture() {
		return getClass().getSimpleName() + "Texture";
	}

	/**
	 * 対象ノードすべてをPOVRayオブジェクトへマッピングする
	 * @throws IOException
	 */
	protected void writeNodes(int hierarchy, Point2D dpoint, double z) throws IOException {
		for (INodePresentation node : nodes) {
			writeNode(hierarchy, node);
			sceneWriter.flush();
		}
	}

	/**
	 * 指定ノードをPOVRayオブジェクトとして出力する
	 * 
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	protected void writeNode(int hierarchy, INodePresentation node) throws IOException {
		final double scale = 24.0;
		Point2D point = nodePosition(node);	
		sceneWriter.write("  object { " + povrayObjectType(node) + " rotate -x*90 scale " + scale + translate(point, nodePositionZ(node)) + " }" + CR);
		writeLabel(node);
		writeSubDiagram(hierarchy + 1, node);
	}

	protected double nodePositionZ(INodePresentation node) {
		return 0.0;
	}
	
	/**
	 * ノードオブジェクトの中心座標を取得する
	 * @param node
	 * @return Point2D 中心座標
	 */
	protected Point2D nodePosition(INodePresentation node) {
		return new Point2D.Double(node.getRectangle().getCenterX(), node.getRectangle().getCenterY());
	}

	/**
	 * リンクオブジェクトの中心座標を取得する
	 * @param node
	 * @return Point2D 中心座標
	 */
	protected Point2D nodePosition(ILinkPresentation link) {
		Rectangle2D bound = link.getSource().getRectangle();
		bound.add(link.getTarget().getRectangle());
		return new Point2D.Double(bound.getCenterX(), bound.getCenterY());
	}
	
	/**
	 * 指定ノードのPOVRayオブジェクト型をマッピングする
	 * ※IPresentation.getType()を宣言名とするノード
	 * @param node
	 * @return
	 */
	protected String povrayObjectType(INodePresentation node) {
		return node.getType();
	}

	/**
	 * 振る舞い呼び出しアクション、サブマシン状態にサブダイアグラムを配置する
	 * 
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	protected void writeSubDiagram(int hierarchy, INodePresentation node) throws IOException {	}

	/**
	 * ノードのラベルを出力する
	 * @param node
	 * @throws IOException
	 */
	protected void writeLabel(INodePresentation node) throws IOException {
		final double scale = 16.0;
		final String SCALE = " scale <" + scale + ", " +  scale + ", 2> ";
		double labelShift = 36.0;
		String label = "";
		if(!(label = label(node)).isEmpty()) { // 名前が表示されない。デフォルトでついた名前を空にできない。
			Point2D point = nodePosition(node);
			point.setLocation(node.getLocation().getX() + 48 - label.getBytes().length*4 , point.getY() + labelShift );
			sceneWriter.write("  text { ttf LabelFont, \"" + label + "\", 1, 0" + SCALE + "texture { LabelTecture }"
				+ translate(point, 30.0) + " }" + CR);
		}
	}
	
	protected String label(IPresentation presence) {
		String type = presence.getType();
		if(type.contains("Initial") || type.contains("Final") || type.contains("Choice") || type.equals("ForkNode") || type.equals("JoinNode")) {
			return "";
		}
		return presence.getLabel();
	}
	
	/**
	 * ノードのラベルを出力する
	 * @param link
	 * @throws IOException
	 */
	protected void writeLabel(ILinkPresentation link) throws IOException {
		final double scale = 16.0;
		final String SCALE = " scale <" + scale + ", " +  scale + ", 2> ";
		double labelShift = 36.0;
		String linkLabel = "";
		if(!(linkLabel = label(link)).isEmpty()) { // 名前が表示されない。デフォルトでついた名前を空にできない。
			double labelY = 0.0;
			int merginX = 0;
			for(String label: linkLabel.split("\n")) {
				Point2D point = (Point2D)nodePosition(link).clone();
				if(merginX == 0) {
					merginX = label.getBytes().length*3;
				}
				point.setLocation(point.getX() - merginX, point.getY() + labelY + labelShift );
				sceneWriter.write("    text { ttf LabelFont, \"" + label + "\", 1, 0" + SCALE + "texture { LinkLabelTecture }"
					+ translate(point, 32.0 - 2.0) + " }" + CR);
				labelY+= scale;
			}
		}
	}
	
	/**
	 * リンクをPOVRayで記述する
	 * 
	 * astahダイアグラムのLinkのNodeへの端点は使わない 
	 * @throws IOException
	 */
	protected void writeLinks() throws IOException {
		for (ILinkPresentation link : links) {
				writeLink(link);
		}
	}

	/**
	 * リンクオブジェクトを出力する 
	 * @param link
	 * @throws IOException
	 */
	protected void writeLink(ILinkPresentation link) throws IOException {
		writeSpline(link, OFFSET_Z, OFFSET_Z);	
	}

	/**
	 * sphere_sweep{ linear_spline | cubic_spline }を出力する 
	 * @param link
	 * @param sourcez ソースノードの高さ
	 * @param targetz ターゲットノードの高さ
	 * @throws IOException
	 */
	protected void writeSpline(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		Point2D sourcep = nodePosition(link.getSource());
		Point2D targetp = nodePosition(link.getTarget());
		double lineRadius = 3.0;
		if(sourcep.equals(targetp)) { // 始点と終点が同じであればリレーションは真円にする
			double torusRadius = 36.0;
			sourcep.setLocation(sourcep.getX(), sourcep.getY());
			sceneWriter.write("  torus { " + torusRadius + ", " + lineRadius + translate(sourcep, -torusRadius + sourcez));
		}else {
			Point2D[] points = link.getPoints();
			if(points.length <= 2) { // 直線
				sceneWriter.write("    sphere_sweep { linear_spline, " + 2 + ", "); // 始点、終点の2点
				sceneWriter.write(coordinate(sourcep, sourcez) + ", " + lineRadius + " "); // 始点
				sceneWriter.write(coordinate(targetp, targetz) + ", " + lineRadius + " "); // 終点
			}else { // 曲線(折れ線も)
				double deltaz = (targetz - sourcez)/(points.length + 1);
				sceneWriter.write("    sphere_sweep { cubic_spline, " + (points.length + 2) + ", "); // 始点、終点の2点とpointsの数の合計
				sceneWriter.write(coordinate(sourcep, sourcez) + ", " + lineRadius + " "); // 始点
				for(int i=0; i < points.length; i++) { // pointsの最初と最後の値を使わない(ノードの端点)
					sceneWriter.write(coordinate(points[i], sourcez+deltaz) + ", " + lineRadius + " ");
					deltaz += deltaz;
				}
				sceneWriter.write(coordinate(targetp, targetz) + ", " + lineRadius + " "); // 終点
			}
		}
		sceneWriter.write(linkTextureName(link));	
	}

	protected String linkTextureName(ILinkPresentation link) {
		return "texture { " + link.getType().replace('/', '_').replace(' ', '_').replace('&', '_').replace('-', '_')	+ "Texture }}" + CR;
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
