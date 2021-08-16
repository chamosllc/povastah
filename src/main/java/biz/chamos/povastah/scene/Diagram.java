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
public abstract class Diagram {
	/**
	 * オブジェクトのz値のオフセット
	 */
	static final protected double OFFSET_Z = 4.0;
	static final protected double TEXT_OFFSET_Z = 30.0;
	/**
	 * 改行文字列
	 */
	static final protected String CR = System.lineSeparator();
	/**
	 * シーン記述のヘッダーコメント部
	 */
	static final protected String HEADER_COMMENT = "/**" + CR
			+ " * astah* Diagram 3D Visualization\n * %s" + CR
			+ " * created at %s" + CR
			+ " * presented by povastah" + CR + " **/" + CR + CR;
	/**
	 * シーン記述のglobal_settings部
	 */
	static final protected String GLOBAL_SETTINGS = "#version 3.7" + CR + "#global_settings { assumed_gamma 2.2 }" + CR
			+ "#global_settings { charset utf8 }" + CR + CR
			+ "#declare ShadowType = 0;" + CR
			+ "#include \"povastah.inc\"" + CR + CR
			+ "#declare LRd = 3.2;" + CR							// リンクsphere_sweepオブジェクトの半径
			+ "#declare LOOPRd = 36.0;" + CR					// 自己遷移リンクtorusオブジェクトの半径
			+ "#declare TextScale = <16, 16, 2>;" + CR  + CR;	// Circle_Text, textオブジェクトのスケーリング

	
	/**
	 * 撮影環境記述
	 */
	static final protected String CAMERA = "camera { location EYE direction 1*z look_at FOCUS }" + CR;
	static final protected String LIGHT = "light_source { <-1000, -1000, -3000>   color White }" + CR;
	/**
	 * 3D座標系フォーマット
	 */
	static final String COORDINATE = "<%.3f, %.3f, %.2f>";
	static final String ICOORDINATE = "<%d, %d, %d>";
	/**
	 * オブジェクト関連フォーマット
	 */
	static final String OBJECT_UNIT = " rotate -x*90 scale 24.0";
	static final String CIRCLE_TEXT = "    object { Circle_Text( LabelFont, \"%s\",  %.3f, 0, 2, %.3f, 1, Align_Center, -90) scale TextScale %s }";
	static final String TEXT = "    text { ttf LabelFont, \"%s\", 1, 0 texture { LabelTecture }%s }";
	static final String TEXT16 = "    text { ttf LabelFont, \"%s\", 1, 0 scale TextScale texture { LabelTecture }%s }";

	/**
	 * シーン記述ファイル
	 */
	protected OutputStreamWriter sceneWriter;
	/**
	 * 描画ダイアグラム
	 */
	protected IDiagram diagram;
	/**
	 * ダイアグラム内の描画対象ノード
	 */
	protected List<INodePresentation> nodes;

	/**
	 * ダイアグラムの矩形領域
	 */
	protected Rectangle2D stageBounds;
	
	public Diagram(IDiagram diagram, OutputStreamWriter sceneWriter){
		this.sceneWriter = sceneWriter;
		this.diagram = diagram;
	}

	/**
	 * ダイアグラムをシーンとして記述する
	 */
	public void produce(){
		if(existsScene()) {
			try {
				header();
				drawDiagram(new Point2D.Double(), 0.0);
				stage();
			}catch(IOException | InvalidUsingException e) {}
		}
	}
	
	/**
	 * 描画ノードを抽出し、対象の有無を返す
	 * @return 対象の有無
	 */
	protected boolean existsScene(){
		nodes = new ArrayList<INodePresentation>();
		try {
			for(IPresentation presence: diagram.getPresentations()){ // 除外ノードでないノードを集める
				if(presence instanceof INodePresentation) {
					INodePresentation node = (INodePresentation)presence;
					if(!isExcludes(node)) {
						nodes.add(node);
					}
				}
			}
		} catch (InvalidUsingException e) {} // astah* communityでエラーになるとのこと
		return !nodes.isEmpty();
	}

	/**
	 * ノードが描画対象でない
	 * @param ノード
	 */
	protected boolean isExcludes(INodePresentation presentation) {
		/**
		 * 除外対象要素
		 * フレーム : "Frame" | ノート : "Note" | テキスト : "Text" | 長方形 : "Rectangle" | 楕円 : "Oval" | 画像 : "Image"
		 */	
		final String[] excludes = {"Frame", "Note", "Text", "Rectangle", "Oval", "Image"};
		String type = presentation.getType();
		for(String exclude: excludes) {
			if(type.equals(exclude)) {
				if(exclude.equals("Frame")) { // フレームの矩形を保持する
					 stageBounds = presentation.getDiagram().getBoundRect();
				}
				return true;
			}
		}	 
		return false;
	}
	
	/**
	 * シーン記述のヘッダ部を出力する
	 * @throws IOException
	 * @throws ProjectNotFoundException 
	 */
	protected void header() throws IOException {
		Calendar cl = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		sceneWriter.write(String.format(HEADER_COMMENT, diagram.getName(), sdf.format(cl.getTime())));
		sceneWriter.write(GLOBAL_SETTINGS);
		sceneWriter.flush();
	}
	
	/**
	 * カメラ、光源、平面等のベースシーン環境を出力する
	 * @throws IOException
	 */
	protected void stage() throws IOException {
		final String DEFVAR = "#declare %s = " + ICOORDINATE + ";" + CR;
		// フレームの矩形の中心をカメラ焦点にする
		int stageX = (int)stageBounds.getCenterX();
		int stageY = (int)-stageBounds.getCenterY();
		int stageZ = stageY - Math.abs(stageX) - 32;
		sceneWriter.write(String.format(DEFVAR, "EYE", stageX, stageY - 240, stageZ + 120));
		sceneWriter.write(String.format(DEFVAR, "FOCUS", stageX, stageY, 0));
		sceneWriter.write(CAMERA);
		sceneWriter.write(LIGHT);
		sceneWriter.write("plane { z, 32 texture { " + stageTexture() + " }}" + CR);
		sceneWriter.flush();
	}

	/**
	 * ダイアグラムを描く
	 * @throws IOException
	 * @throws InvalidUsingException 
	 */
	protected void drawDiagram(Point2D dpoint, double z) throws IOException, InvalidUsingException {
		sceneWriter.write("object { " + declareDiagram(0, dpoint, z) + " }" +CR);
	}

	/**
	 * ダイアグラムを宣言し、ダイアグラム宣言名を返す
	 * @param hierarchy
	 * @param dpoint
	 * @param z
	 * @return ダイアグラム名
	 * @throws IOException
	 */
	protected String declareDiagram(int hierarchy, Point2D dpoint, double z) throws IOException {
		declareSubDiagrams(hierarchy, dpoint, z);
		String name = diagramID();
		sceneWriter.write("#declare " + name + " = union {" + CR);
		drawNodes(hierarchy, dpoint, z);
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
	 * サブダイアグラムを宣言をする
	 * 
	 * @param parent
	 * @param hierarchy
	 * @param dpoint
	 * @param z
	 */
	protected void declareDiagram(INodePresentation parent, int hierarchy, Point2D dpoint, double z) {}

	/**
	 * サブダイアグラムを持つノード型である
	 * 
	 * @param parent
	 */
	protected boolean hasSubDiagram(INodePresentation parent) {
		return false;
	}
	
	/**
	 * ダイアグラム宣言名を返す
	 * 
	 * @return ダイアグラム宣言名
	 */
	protected String diagramID() {
		return id(this.diagram);
	}
	
	/**
	 * 指定ダイアグラムの宣言名を返す
	 * ※ユニークな名前が必要なので、IPresentaion.getID()文字列を利用する。ただし、ハイフォンを除去する
	 * 
	 * @param diagram 指定ダイアグラム
	 * @return　ダイアグラム宣言名
	 */
	protected String id(IDiagram diagram) {
		return this.getClass().getSimpleName() + "_" + diagram.getId().replaceAll("-", "");
	}

	/**
	 * ダイアグラムのステージ(plane)のテクスチャ宣言名を返す
	 * 
	 * @return ダイアグラム型Texture
	 */
	protected String stageTexture() {
		return getClass().getSimpleName() + "Texture";
	}

	/**
	 * 対象ノードすべてをPOVRayオブジェクトへマッピングする
	 * @throws IOException
	 */
	protected void drawNodes(int hierarchy, Point2D dpoint, double z) throws IOException {
		for (INodePresentation node : nodes) {
			draw(node, hierarchy);
		}
	}

	/**
	 * 指定ノードのPOVRayオブジェクトを描く
	 * 
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	protected void draw(INodePresentation node, int hierarchy) throws IOException {
		if(!drawSubDiagram(node, hierarchy + 1)) {
			Point2D point = center(node);	
			sceneWriter.write("  object { " + type(node) + OBJECT_UNIT + translate(point, zposition(node)) + " }" + CR);
			text(node);
		}
		drawSource(node);
	}

	/**
	 * ノードがソースとなっているリンクを描く
	 * @param node
	 * @throws IOException
	 */
	protected void drawSource(INodePresentation node) throws IOException {
		for(ILinkPresentation link: node.getLinks()) {
			if(link.getSource() == node) {
				draw(link);
			}
		}
	}

	/**
	 * ノードのz座標値
	 * @param node
	 * @return
	 */
	protected double zposition(INodePresentation node) {
		return 0.0;
	}
	
	/**
	 * ノードオブジェクトの中心座標を取得する
	 * @param node
	 * @return Point2D 中心座標
	 */
	protected Point2D center(INodePresentation node) {
		return new Point2D.Double(node.getRectangle().getCenterX(), node.getRectangle().getCenterY());
	}

	/**
	 * リンクオブジェクトの中心座標を取得する
	 * @param node
	 * @return Point2D 中心座標
	 */
	protected Point2D center(ILinkPresentation link) {
		Rectangle2D bound = link.getSource().getRectangle();
		bound.add(link.getTarget().getRectangle());
		return new Point2D.Double(bound.getCenterX(), bound.getCenterY());
	}
	
	/**
	 * 指定ノードのPOVRayオブジェクト型をマッピングする
	 * ※IPresentation.getType()文字列を宣言名とする。ただし、この文字列中の記号や空白文字を除去する。
	 * @param presence
	 * @return
	 */
	protected String type(IPresentation presence) {
		return presence.getType().replaceAll("[^\\w\\s]","").replaceAll("[\\h]", "");
	}

	/**
	 * ノードにダイアグラム階層があるときサブダイアグラムを配置する
	 * 
	 * @param hierarchy
	 * @param node
	 * @return ダイアグラム階層がある
	 * @throws IOException
	 */
	protected boolean drawSubDiagram(INodePresentation node, int hierarchy) throws IOException {
		return false;
	}

	/**
	 * ノードのラベルを描く
	 * @param node
	 * @throws IOException
	 */
	protected void text(INodePresentation node) throws IOException {
		String nodeLabel = label(node);
		if(!nodeLabel.replace(" ", "").isEmpty()) { // 名前がないか空白だけの名前は表示しない
			double step = 0.8;
			Point2D point = (Point2D)center(node);
			for(String label: nodeLabel.split("\n")) {
				double radius = 1.6;
				double scale = 1.0;
				if(label.getBytes().length >= 20) { // 文字列が1週を越えるとエラーになる。20文字を目安に、サイズの縮小と半径の拡大を補正してエラーを避ける。
					scale -= (label.getBytes().length - 20)/30.0;
					radius += (label.getBytes().length - 20)/30.0;
				}
				sceneWriter.write(String.format(CIRCLE_TEXT, label, scale, radius,  labelTexture(node) + translate(point, TEXT_OFFSET_Z)) + CR);
				radius += step;
			}
		}
	}
	
	/**
	 * ノードのラベルのテクスチャを返す
	 * @param node
	 * @return
	 */
	protected String labelTexture(INodePresentation node) {
		return "texture { LabelTecture }";
	}

	/**
	 * サブダイアグラム上にノードのラベルを描く
	 * @param node
	 * @param bound
	 * @throws IOException
	 */
	protected void textOnStage(INodePresentation node, Rectangle2D bound, double offsetz) throws IOException {
		String label = label(node);
		if(!label.isEmpty()) {
			double shift = 10.0;
			sceneWriter.write(String.format(TEXT16, label, translate(new Point2D.Double(bound.getMinX() + shift, bound.getMinY() + shift), zposition(node) + offsetz)) + CR);
		}
	}
	
	/**
	 * ノード、リンクのラベル名を返す
	 * @param presence
	 * @return ラベル名
	 */
	protected String label(IPresentation presence) {
		return presence.getLabel();
	}

	/**
	 * リンクを描く
	 * @param link
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link) throws IOException {
		draw(link, OFFSET_Z, OFFSET_Z);
	}

	/**
	 * sphere_sweep{ linear_spline | cubic_spline }を出力する 
	 * @param link
	 * @param lineRadius 
	 * @param sourcez ソースの高さ
	 * @param targetz ターゲットの高さ
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		Point2D sourcep = center(link.getSource());
		Point2D targetp = center(link.getTarget());
		if(sourcep.equals(targetp)) { // 始点と終点が同じであればリレーションは円環を描く
			sourcep.setLocation(sourcep.getX(), sourcep.getY());
			sceneWriter.write("    torus { LOOPRd, LRd translate<" + sourcep.getX() + ", " + (-sourcep.getY()) + ", " + sourcez + " - LOOPRd> " + material(link) + " }" + CR);
		}else {
			sceneWriter.write("    union{" + CR);
			sceneWriter.write(draw(link, sourcep, targetp, sourcez, targetz, true) + material(link) + "no_shadow }" + CR);
			sceneWriter.write(draw(link, sourcep, targetp, sourcez, targetz, false) + shadowMaterial(link) + "no_image }" + CR);
			sceneWriter.write("    }" + CR);
		}
	}

	/**
	 * 影の無い線と矢印を描く
	 * @param points
	 * @return
	 */
	protected String draw(ILinkPresentation link, Point2D sourcep, Point2D targetp, double sourcez, double targetz, boolean isShape) {
		String description;
		Point2D[] points = link.getPoints();
		String start = coordinate(sourcep, sourcez) + ", LRd ";
		String end = coordinate(targetp, targetz) + ((isShape)?", LRd ":", 0.0 ");
		int length = points.length; // 2 or 5以上
		boolean isCurve = link.getProperty("line.shape").equals("curve");
		if(!isCurve || length == 2) {
			description = "    sphere_sweep { linear_spline, " + length + ", ";
		}else {
			if(length == 3) { // 1点経由 曲線
				description = "    sphere_sweep { cubic_spline, 5, " + start;
			}else{ // 2点以上経由 曲線
				description = "    sphere_sweep { b_spline, " + (length + 2) + ", " + start;
			}
		}
		description += start; // 始点			
		if(length > 2) { // 経由点を曲線で結ぶ
			double deltaz = (targetz - sourcez)/(length - 1);
			for(int i=1; i < length - 1; i++) { // pointsの最初と最後の値を使わない(ノードの端点)
				description += coordinate(points[i], sourcez+deltaz) + ", LRd"
						+ ((isShape)?"":("/" + (Math.pow(2.0, (double)i)))) + " "; // 始点→経由点→終点
				deltaz += deltaz;
			}
			if(isCurve) {
				description += end; // 終点
			}
		}
		description += end; // 終点
		return description;
	}

	/**
	 * sphere_sweep{ linear_spline | cubic_spline }を出力する 
	 * @param link
	 * @param lineRadius 
	 * @param sourcez ソースの高さ
	 * @param targetz ターゲットの高さ
	 * @throws IOException
	 */
	protected void drawNoShadow(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		Point2D sourcep = center(link.getSource());
		Point2D targetp = center(link.getTarget());
		if(sourcep.equals(targetp)) { // 始点と終点が同じであればリレーションは円環を描く
			sourcep.setLocation(sourcep.getX(), sourcep.getY());
			sceneWriter.write("    torus { LOOPRd, LRd translate<" + sourcep.getX() + ", " + (-sourcep.getY()) + ", " + sourcez + " - LOOPRd> " + material(link) + "no_shadow }" + CR);
		}else {
			sceneWriter.write(draw(link, sourcep, targetp, sourcez, targetz, true) + material(link) + "no_shadow }" + CR);
		}
	}
	
	/**
	 * リンクに関係するmaterialを返す
	 * @param link
	 * @param prefix
	 * @return
	 */
	protected String material(ILinkPresentation link) {
		return "material { " + type(link) + "Material } ";
	}
	
	/**
	 * リンクに関係するmaterialを返す
	 * @param link
	 * @param prefix
	 * @return
	 */
	protected String shadowMaterial(ILinkPresentation link) {
		return "material { Shadow" + type(link) + "Material } ";
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
