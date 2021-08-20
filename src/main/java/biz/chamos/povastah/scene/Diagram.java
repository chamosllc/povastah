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
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.INamedElement;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

/**
 * Diagram Object in POVRay Scene
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 */
abstract public class Diagram {
	/*
	 * オブジェクトのz値のオフセット
	 */
	static final protected double OFFSET_Z = 4.0;
	static final protected double TEXT_OFFSET_Z = 30.0;
	/*
	 * 改行文字列
	 */
	static final protected String CR = System.lineSeparator();
	/*
	 * シーン記述のヘッダーコメント部
	 */
	static final protected String HEADER_COMMENT = "/**" + CR
			+ " * astah* Diagram 3D Visualization\n * %s" + CR
			+ " * created at %s" + CR
			+ " * presented by povastah" + CR + " **/" + CR + CR;
	/*
	 * シーン記述のglobal_settings部
	 */
	static final protected String GLOBAL_SETTINGS = "#version 3.7" + CR + "#global_settings { assumed_gamma 2.2 }" + CR
			+ "#global_settings { charset utf8 }" + CR + CR
			+ "#declare ShadowType = 0;" + CR
			+ "#include \"povastah.inc\"" + CR + CR
			+ "#declare LRd = 3.2;" + CR							// リンクsphere_sweepオブジェクトの半径
			+ "#declare LOOPRd = 36.0;" + CR					// 自己遷移リンクtorusオブジェクトの半径
			+ "#declare TextScale = <16, 16, 2>;" + CR  + CR;	// Circle_Text, textオブジェクトのスケーリング
	
	/*
	 * 撮影環境記述
	 */
	static final protected String CAMERA = "camera { location EYE direction 1*z look_at FOCUS }" + CR;
	static final protected String LIGHT = "light_source { <-1000, -1000, -3000>   color White }" + CR;
	/*
	 * 3D座標系フォーマット
	 */
	static final String COORDINATE = "<%.3f, %.3f, %.2f>";
	static final String ICOORDINATE = "<%d, %d, %d>";
	/*
	 * オブジェクト関連フォーマット
	 */
	static final String OBJECT_UNIT = " rotate -x*90 scale 24.0";
	static final String CIRCLE_TEXT = "    object { Circle_Text( LabelFont, \"%s\",  %.3f, 0, 2, %.3f, 1, Align_Center, -90) scale TextScale %s }";
	static final String TEXT = "    text { ttf LabelFont, \"%s\", 1, 0 texture { LabelTecture }%s }";
	static final String TEXT16 = "    text { ttf LabelFont, \"%s\", 1, 0 scale TextScale texture { LabelTecture }%s }";

	/**
	 * シーン記述ファイル
	 */
	protected OutputStreamWriter scene;
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
	
	public Diagram(IDiagram diagram, OutputStreamWriter scene){
		this.scene = scene;
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
	 * シーン記述のヘッダ部を記述する
	 * @throws IOException
	 */
	protected void header() throws IOException {
		Calendar cl = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		INamedElement parent = (INamedElement)diagram.getOwner();
		scene.write(String.format(HEADER_COMMENT, diagram.getFullName("/"), sdf.format(cl.getTime())));
		scene.write(GLOBAL_SETTINGS);
		scene.flush();
	}
	
	/**
	 * カメラ、光源、平面等のベースシーン環境を記述する
	 * @throws IOException
	 */
	protected void stage() throws IOException {
		final String DEFVAR = "#declare %s = " + ICOORDINATE + ";" + CR;
		// フレームの矩形の中心をカメラ焦点にする
		int stageX = (int)stageBounds.getCenterX();
		int stageY = (int)-stageBounds.getCenterY();
		int stageZ = stageY - Math.abs(stageX) - 32;
		scene.write(String.format(DEFVAR, "EYE", stageX, stageY - 240, stageZ + 120));
		scene.write(String.format(DEFVAR, "FOCUS", stageX, stageY, 0));
		scene.write(CAMERA);
		scene.write(LIGHT);
		scene.write("plane { z, 32 texture { " + stageTexture() + " }}" + CR);
		scene.flush();
	}

	/**
	 * ダイアグラムを描く
	 * @throws IOException
	 * @throws InvalidUsingException 
	 */
	protected void drawDiagram(Point2D dpoint, double z) throws IOException, InvalidUsingException {
		scene.write("object { " + declareDiagram(0, dpoint, z) + " }" +CR);
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
		scene.write("#declare " + name + " = union {" + CR);
		drawNodes(hierarchy, dpoint, z);
		scene.write("}" + CR);
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
	 * このダイアグラム宣言名を返す
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
	 * 対象ノードすべてを描く
	 * @throws IOException
	 */
	protected void drawNodes(int hierarchy, Point2D dpoint, double z) throws IOException {
		for (INodePresentation node : nodes) {
			draw(node, hierarchy);
		}
	}

	/**
	 * 指定ノードを描く
	 * 
	 * @param node
	 * @param hierarchy
	 * @throws IOException
	 */
	protected void draw(INodePresentation node, int hierarchy) throws IOException {
		if(!drawSubDiagram(node, hierarchy + 1)) {
			Point2D point = center(node);	
			scene.write("  object { " + type(node) + OBJECT_UNIT + translate(point, zposition(node)) + " }" + CR);
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
	 * ラベルを描く
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
				scene.write(String.format(CIRCLE_TEXT, label, scale, radius,  labelTexture(node) + translate(point, TEXT_OFFSET_Z)) + CR);
				radius += step;
			}
		}
	}
	
	/**
	 * ラベルのテクスチャを返す
	 * @param node
	 * @return テクスチャを返す
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
	protected void textOnStage(INodePresentation node, Point2D point, double offsetz) throws IOException {
		String label = label(node);
		if(!label.isEmpty()) {
			scene.write(String.format(TEXT16, label, translate(point, zposition(node) + offsetz)) + CR);
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
	 * リンクを描く
	 * @param link
	 * @param lineRadius 
	 * @param sourcez ソースの高さ
	 * @param targetz ターゲットの高さ
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, double sourcez, double targetz) throws IOException {
		String description = "";
		LineSort sort = lineSort(link);
		if(sort.equals(LineSort.Loop)) {
			description = drawLoop(link, center(link.getSource()), sourcez);
		}else{
			List<Point3D> linePoints = sort.vertexes(link, sourcez, targetz);
			description = "    union{" + CR;
			description += draw(link, linePoints, true) + materialClause(link, true) + CR;
			description += draw(link, linePoints, false) + materialClause(link, false) + CR;
			description += "    }" + CR;
		}
		scene.write(description);
	}

	/**
	 * リンク種別を返す
	 * 
	 * @param link
	 * @return リンク種別
	 */
	protected LineSort lineSort(ILinkPresentation link) {
		INodePresentation source = link.getSource();
		INodePresentation target = link.getTarget();
		if(source == target) {
			return LineSort.Loop;
		}
		if(isSourceUp(source)) {
			if(isTargetUp(target)) {
				return LineSort.Both;
			}else {
				return LineSort.Source;
			}
		}else if(isTargetUp(target)) {
				return LineSort.Target;
		}
		return LineSort.Origin;
	}

	/**
	 * ノードがリンク元のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isSourceUp(INodePresentation node) {
		return false; 
	}

	/**
	 * ノードがリンク先のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isTargetUp(INodePresentation node) {
		return false; 
	}

	/**
	 * リンクを円環で描く
	 * @param link
	 * @param sourcep
	 * @param sourcez
	 */
	protected String drawLoop(ILinkPresentation link, Point2D sourcep, double sourcez) {
		sourcep.setLocation(sourcep.getX(), sourcep.getY());
		return "    torus { LOOPRd, LRd translate<" + sourcep.getX() + ", " + (-sourcep.getY()) + ", " + sourcez + " - LOOPRd> " + materialClause(link, true) + CR;
	}

	/**
	 * リンク(影なし)、あるいは、その矢印(影)の記述を返す
	 * @param リンク
	 * @param リンク元ノードの位置
	 * @param リンク先ノードの位置
	 * @param リンク元ノードの高さ
	 * @param リンク先ノードの高さ
	 * @param リンク記述(true)か矢印記述(false)か
	 * @return リンク記述あるいは矢印記述
	 */
	protected String draw(ILinkPresentation link, List<Point3D> linePoints, boolean isShape) {
		int length = linePoints.size();
		boolean isCurve = link.getProperty("line.shape").equals("curve");
		String description = "    sphere_sweep { ";
		if(length == 2 || (!isCurve && link.getAllPoints().length == length)) {
			description += "linear_spline, ";
		}else {
			if(length > 6){
				description += "b_spline, ";
			}else {
				description += "cubic_spline, ";
			}
		}
		description +=  length + ", ";
		if(isShape) {
			for(Point3D point: linePoints) {
				description += coordinate(point) + ", LRd ";
			}
		}else {
			int count = 0;
			for(Point3D point: linePoints) {
				description += coordinate(point);
				if(count == 0) {
					description += ", LRd ";
				}else if(count < length - 1) {
					description += ", LRd/" + (Math.pow(2.0, (double)(count-1))) + " ";
				}else {
					description += ", 0.0 ";
				}
				count++;
			}
		}
		return description;
	}
	
	/**
	 * リンクか矢印のmaterial句と視認性(影なし,影のみ)記述を返す
	 * @param link
	 * @return マテリアル記述を返す
	 */
	protected String materialClause(IPresentation presence, boolean isShape) {
		return material(presence, isShape) + (isShape?"no_shadow":"no_image") + " }";
	}

	/**
	 * リンクか矢印のmaterial句を返す
	 * @param link
	 * @return マテリアル句を返す
	 */
	protected String material(IPresentation presence, boolean isShape) {
		return "material { " + (isShape?"":"Shadow") + type(presence) + "Material } ";
	}
	
	/**
	 * translate句を返す
	 * @param point
	 * @return 移動句
	 */
	protected String translate(Point2D point) {
		return translate(point, 0.0);
	}

	/**
	 * translate句を返す
	 * @param point
	 * @param z
	 * @return 移動句
	 */
	protected String translate(Point2D point, double z) {
		return " translate " + coordinate(point, z);
	}

	/**
	 * ベクトル表記を返す
	 * @param point
	 * @return <x,y,z>
	 */
	protected String coordinate(Point2D point) {
		return coordinate(point, 0.0);
	}

	
	protected String coordinate(Point3D point) {
		return String.format(COORDINATE, point.getX(), -point.getY(), point.getZ());
	}
	/**
	 * ベクトル表記を返す
	 * @param point
	 * @param z
	 * @return <x,y,z>
	 */
	protected String coordinate(Point2D point, double z) {
		return String.format(COORDINATE, point.getX(), -point.getY(), z);
	}
}
