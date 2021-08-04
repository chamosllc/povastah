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
	/**
	 * POVRayオブジェクトのz値のオフセット
	 */
	static final protected double OFFSET_Z = 4.0;
	/**
	 * 改行文字列
	 */
	static final protected String CR = System.lineSeparator();
	/**
	 * POVRayシーン記述のヘッダーコメント部
	 */
	static final protected String HEADER_COMMENT = "/**" + CR
			+ " * astah* Diagram 3D Visualization\n * %s %s" + CR
			+ " * created at %s" + CR
			+ " * presented by povastah" + CR + " **/" + CR + CR;
	/**
	 * POVRayシーン記述のglobal_settings部
	 */
	static final protected String GLOBAL_SETTINGS = "#version 3.7" + CR + "#global_settings { assumed_gamma 2.2 }" + CR
			+ "#global_settings { charset utf8 }" + CR + CR + "#include \"povastah.inc\"" + CR + CR;
	/**
	 * 3D座標系フォーマット
	 */
	static final String COORDINATE = "<%.2f, %.2f, %.2f>"; // 座標系フォーマット

	/**
	 * astahプロジェクト名
	 */
	protected String projectName;
	/**
	 * POVRayシーン記述出力ファイル
	 */
	protected OutputStreamWriter sceneWriter;
	/**
	 * 出力対象astahダイアグラム
	 */
	protected IDiagram diagram;
	/**
	 * ダイアグラム内の対象ノード要素
	 */
	protected List<INodePresentation> nodes;
	/**
	 * ダイアグラム内の対象リンク要素
	 */
	protected List<ILinkPresentation> links;
	/**
	 * ダイアグラム全体の表示領域
	 */
	protected Rectangle2D stage;
	
	/**
	 * コンストラクタ
	 */
	public Diagram(String projectName, IDiagram diagram, OutputStreamWriter sceneWriter){
		this.projectName = projectName;
		this.sceneWriter = sceneWriter;
		this.diagram = diagram;
	}

	/**
	 * UMLダイアグラムのPOVRayシーン記述を出力する
	 */
	public void produce(){
		if(existsTragetPresence()) {
			try {
				writeHeader();
				writeDiagram(new Point2D.Double(), 0.0);
				writeStage();
			}catch(IOException | InvalidUsingException e) {}
		}
	}
	
	/**
	 * POVRay出力対象のノードとリンクを抽出し、対象の有無を返す
	 * @return 対象の有無
	 */
	protected boolean existsTragetPresence(){
		nodes = new ArrayList<INodePresentation>();
		links = new ArrayList<ILinkPresentation>();
		try {
			for(IPresentation presence: diagram.getPresentations()){ // 除外ノードでないノードを集める
				if(presence instanceof INodePresentation) {
					INodePresentation node = (INodePresentation)presence;
					if(!excludeIPresentation(node)) {
						nodes.add(node);
					}
				}else if(presence instanceof ILinkPresentation) {
					ILinkPresentation link = (ILinkPresentation)presence;
					if(!excludeIPresentation(link)){
						links.add(link);
					}
				}
			}
		} catch (InvalidUsingException e) {} // astah* communityでエラーになるとのこと
		return !nodes.isEmpty();
	}

	/**
	 * ノードが出力対象ではない
	 * @param ノード
	 * @return 除外ノードである
	 */
	protected boolean excludeIPresentation(INodePresentation presentation) {
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
	 * リンクが出力対象ではない
	 * @param リンク
	 * @return 除外リンクである
	 */
	protected boolean excludeIPresentation(ILinkPresentation presentation) {
		return excludeIPresentation(presentation.getSource()) || excludeIPresentation(presentation.getTarget());
	}
	
	/**
	 * シーン記述のヘッダ部を出力する
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
	 * ダイアグラムオブジェクトを宣言し、ダイアグラムを描く
	 * @throws IOException
	 * @throws InvalidUsingException 
	 */
	protected void writeDiagram(Point2D dpoint, double z) throws IOException, InvalidUsingException {
		sceneWriter.write("object { " + declareDiagram(0, dpoint, z) + " }" +CR);
		sceneWriter.flush();
	}

	protected String declareDiagram(int hierarchy, Point2D dpoint, double z) throws IOException {
		declareSubDiagrams(hierarchy, dpoint, z);
		String name = povrayName();
		sceneWriter.write("#declare " + name + " = union {" + CR);
		writeNodes(hierarchy, dpoint, z);
		writeLinks();
		sceneWriter.write("}" + CR);
		return name;
	}

	/**
	 * すべてのサブダイアグラムを宣言する
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
	 * ※ユニークな名前が必要なので、IPresentaion.getID()文字列を利用する。ただし、ハイフォンを除去する
	 * 
	 * @param diagram
	 * @return
	 */
	protected String povrayName(IDiagram diagram) {
		return this.getClass().getSimpleName() + "_" + diagram.getId().replaceAll("-", "");
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
		sceneWriter.write(String.format(DEFVAR, "EYE", stageX, stageY - 240, stageZ + 80));
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
		}
	}

	/**
	 * 指定ノードのPOVRayオブジェクトを描く
	 * 
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	protected void writeNode(int hierarchy, INodePresentation node) throws IOException {
		final double scale = 24.0;
		Point2D point = nodePosition(node);	
		sceneWriter.write("  object { " + povrayObjectType(node) + " rotate -x*90 scale " + scale + translate(point, nodePositionZ(node)) + " }" + CR);
		if(!writeSubDiagram(hierarchy + 1, node)) {
			writeLabel(node);
		}
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
	 * ※IPresentation.getType()文字列を宣言名とする。ただし、この文字列中の記号や空白文字を除去する。
	 * @param node
	 * @return
	 */
	protected String povrayObjectType(INodePresentation node) {
		return node.getType().replaceAll("[^\\w\\s]","").replaceAll("[\\h]", "");
	}

	/**
	 * 振る舞い呼び出しアクション、サブマシン状態にサブダイアグラムを配置する
	 * 
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	protected boolean writeSubDiagram(int hierarchy, INodePresentation node) throws IOException {
		return false;
	}

	/**
	 * ノードのラベルを描く
	 * @param node
	 * @throws IOException
	 */
	protected void writeLabel(INodePresentation node) throws IOException {
		String nodeLabel = "";
		if(!(nodeLabel = label(node)).isEmpty()) { // 名前が表示されない。デフォルトでついた名前を空にできない。
			double step = 0.8;
			Point2D point = (Point2D)nodePosition(node);
			for(String label: nodeLabel.split("\n")) {
				double radius = 1.6;
				double scale = 1.0;
				if(label.getBytes().length >= 20) { // 文字列が1週を越えるとエラーになる。20文字を目安に、サイズの縮小と半径の拡大を補正してエラーを避ける。
					scale -= (label.getBytes().length - 20)/30.0;
					radius += (label.getBytes().length - 20)/30.0;
				}
				sceneWriter.write("    object { Circle_Text( LabelFont, \"" + label + "\", " + scale + ", 0, 2, " + radius + ", 1, Align_Center, -90) scale <16, 16, 2> texture { LabelTecture }"
					+ translate(point, 30.0) + " }" + CR);
				radius += step;
			}
		}
	}

	/**
	 * サブダイアグラム上にノードのラベルを描く
	 * @param node
	 * @param bound
	 * @throws IOException
	 */
	protected void writeLabelOnStage(INodePresentation node, Rectangle2D bound) throws IOException {
		/*
		 * writeLabel
		 */
		String label = label(node);
		if(!label.isEmpty()) {
			sceneWriter.write("    text { ttf LabelFont, \"" + label + "\", 1, 0 scale <16, 16, 2> texture { LabelTecture }"
					+ translate(new Point2D.Double(bound.getMinX() + 12.0, bound.getMinY() + 16.0), nodePositionZ(node) - 0.01) + " }" + CR);
		}
	}
	
	protected String label(IPresentation presence) {
		return presence.getLabel();
	}
	
	/**
	 * ノードのラベルを描く
	 * @param link
	 * @throws IOException
	 */
	protected void writeLabel(ILinkPresentation link) throws IOException {
		final double scale = 16.0;
		final String SCALE = " scale" + String.format(COORDINATE, scale , scale, 2);
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
	 * リンクオブジェクトを描く
	 * @param link
	 * @throws IOException
	 */
	protected void writeLink(ILinkPresentation link) throws IOException {
		writeSpline(link, OFFSET_Z, OFFSET_Z);	
	}

	/**
	 * torus | sphere_sweep{ linear_spline | cubic_spline }を描く
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
			/*
			 * 折れ線 sphere_sweep { linear_spline, points.length, ... } 始点・経由点N・終点のN+2点
			 * 曲線   sphere_sweep { cubic_spline,  points.length+2, ... } 始点・始点・経由点・終点・終点の5点
			 * 曲線   sphere_sweep { b_spline,  points.length+2, ... } 始点・始点・経由点N・終点・終点のN+4点
			 * 
			 * 経由点があるときは曲線(cubic_spline, N+4)、ないときは直線(linear_spline, 2)
			 */
			int length = points.length; // 2 or 5以上
			if(length == 2) { // 直線
				sceneWriter.write("    sphere_sweep { linear_spline, 2, ");
			}else if(length == 3) { // 1点経由 曲線
				sceneWriter.write("    sphere_sweep { cubic_spline, 5, ");
			}else{ // 2点以上経由 曲線
				sceneWriter.write("    sphere_sweep { b_spline, " + (length + 2) + ", ");
			}
			sceneWriter.write(coordinate(sourcep, sourcez) + ", " + lineRadius + " "); // 始点
			if(length > 2) { // 経由点を曲線で結ぶ
				double deltaz = (targetz - sourcez)/(length + 1);
				for(int i=0; i < length; i++) { // pointsの最初と最後の値を使わない(ノードの端点)
					sceneWriter.write(coordinate(points[i], sourcez+deltaz) + ", " + lineRadius + " "); // 始点→経由点→終点
					deltaz += deltaz;
				}
			}
			sceneWriter.write(coordinate(targetp, targetz) + ", " + lineRadius + " "); // 終点
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
