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
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

import biz.chamos.povastah.shape.LineSort;
import biz.chamos.povastah.shape.Node;
import biz.chamos.povastah.shape.Point3D;

/**
 * Diagram Object in POVRay Scene
 * 
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 */
abstract public class Diagram {
	/*
	 * 改行文字列
	 */
	static final public String CR = System.lineSeparator();
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
			+ "#local LRd = 3.2;" + CR							// リンクsphere_sweepオブジェクトの半径
			+ "#local LOOPRd = 36.0;" + CR					// 自己遷移リンクtorusオブジェクトの半径
			+ "#local TextScale = <16, 16, 2>;" + CR  + CR;	// Circle_Text, textオブジェクトのスケーリング
	/*
	 * 撮影環境記述
	 */
	static final protected String CAMERA = "camera { location EYE direction 1*z look_at FOCUS }" + CR;
	static final protected String LIGHT = "light_source { <-1000, -1000, -3000>   color White }" + CR;
	static final protected String PLANE = "plane { z, 32 texture { %s }}" + CR;

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
	protected List<Node> nodes;

	public Diagram(IDiagram diagram, OutputStreamWriter scene){
		this.diagram = diagram;
		this.scene = scene;
	}
	
	/**
	 * ダイアグラムの矩形領域
	 */
	protected Rectangle2D stageBounds;

	/**
	 * ダイアグラムをシーンとして記述する
	 * @throws Exception 
	 */
	public void produce() {
		if(existsScene()) {
			try {
				header();
				drawDiagram();
				stage();
			}catch(Exception e) {}
		}
	}
	
	/**
	 * 描画ノードを抽出し、対象の有無を返す
	 * @return 対象の有無
	 */
	protected boolean existsScene(){
		nodes = new ArrayList<Node>();
		try {
			int number = 0;
			for(IPresentation presence: diagram.getPresentations()){ // 除外ノードでないノードを集める
				if(presence instanceof INodePresentation) {
					INodePresentation inode = (INodePresentation)presence;
					if(!isExcludes(inode)) {
						nodes.add(new Node(number++, diagramId(), type(inode), inode, label(inode)));
					}
				}
			}
		} catch (InvalidUsingException e) {} // astah* communityでエラーになるとのこと
		return !nodes.isEmpty();
	}

	/**
	 * ダイアグラム番号
	 * @return ダイアグラムが1つだけなので、ルートダイアグラム番号0を返す
	 */
	protected int diagramId() {
		return 0;
	}
	
	/**
	 * ダイアグラム上のノード座標を変数として宣言する
	 */
	protected void declareNodes() {
		try {
			for (Node node : nodes) {
				scene.write(node.declare());
			}
			scene.write(CR);
		} catch (IOException e) {}
	};

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
		scene.write(String.format(HEADER_COMMENT, diagram.getFullName("/"), sdf.format(cl.getTime())));
		scene.write(GLOBAL_SETTINGS);
		scene.flush();
	}
	
	/**
	 * カメラ、光源、平面等のベースシーン環境を記述する
	 * @throws IOException
	 */
	protected void stage() throws IOException {
		final String DEFVAR = "#declare %s = <%d, %d, %d>;" + CR;
		// フレームの矩形の中心をカメラ焦点にする
		int stageX = (int)stageBounds.getCenterX();
		int stageY = (int)-stageBounds.getCenterY();
		int stageZ = stageY - Math.abs(stageX) - 32;
		scene.write(String.format(DEFVAR, "EYE", stageX, stageY - 240, stageZ + 120));
		scene.write(String.format(DEFVAR, "FOCUS", stageX, stageY, 0));
		scene.write(CAMERA + LIGHT);
		scene.write(String.format(PLANE, stageTexture()));
		scene.flush();
	}

	/**
	 * ダイアグラムを宣言し、描画する
	 * @throws IOException
	 */
	protected void drawDiagram() throws Exception {
		drawDiagram(new Point3D());
		scene.write("object { " + id(diagram) + " }" +CR);
	}
	/**
	 * ダイアグラムを宣言する
	 * @param dpoint
	 * @throws IOException
	 */
	protected void drawDiagram(Point3D point) throws Exception {
		scene.write("#declare " + id(diagram) + " = union {" + CR);
		declareNodes();
		drawNodes();
		scene.write("}" + CR);
	}

	/**
	 * 指定ダイアグラムの宣言名を返す
	 * ※ユニークな名前が必要なので、IPresentaion.getID()文字列を利用する。ただし、ハイフォンを除去する
	 * @param diagram 指定ダイアグラム
	 * @return　ダイアグラム宣言名
	 */
	protected String id(IDiagram diagram) {
		return this.getClass().getSimpleName() + "_" + diagram.getId().replaceAll("-", "");
	}

	/**
	 * ダイアグラムのステージ(plane)のテクスチャ宣言名を返す
	 * @return ダイアグラム型Texture
	 */
	protected String stageTexture() {
		return getClass().getSimpleName() + "Texture";
	}

	/**
	 * 対象ノードすべてを描く
	 * @throws IOException
	 */
	protected void drawNodes() throws Exception {
		for (Node node : nodes) {
			draw(node);
		}
	}

	/**
	 * 指定ノードを描く
	 * 
	 * @param node
	 * @throws IOException
	 */
	protected void draw(Node node) throws Exception {
		scene.write(node.draw());
		drawLinkSource(node);
	}

	/**
	 * ノードがソースとなっているリンクを描く
	 * @param node
	 * @throws IOException
	 */
	protected void drawLinkSource(Node node) throws Exception {
		for(ILinkPresentation link: node.getLinks()) {
			if(node.isSource(link)) {
				draw(link);
			}
		}
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
	 * ノード、リンクのラベル名を返す
	 * @param presence
	 * @return ラベル名
	 */
	protected String label(IPresentation presence) {
		String label = presence.getLabel();
		if(label.replace(" ", "").isEmpty()) {
			return "";
		}else {
			return label;
		}
	}

	/**
	 * リンクを描く
	 * @param link
	 * @throws Exception 
	 */
	protected void draw(ILinkPresentation link) throws Exception {
		draw(link, findNode(link.getSource()), findNode(link.getTarget()));
	}

	/**
	 * リンクを描く
	 * @param link
	 * @param lineRadius 
	 * @param source ソースの高さ
	 * @param target ターゲットの高さ
	 * @throws IOException
	 */
	protected void draw(ILinkPresentation link, Node source, Node target) throws Exception {
		String description = "";
		LineSort sort = lineSort(link);
		if(sort.equals(LineSort.Loop)) {
			description = drawLoop(link, source);
		}else{
			description = drawArrow(link, source, target, sort);
		}
		scene.write(description);
	}

	protected String drawArrow(ILinkPresentation link, Node source, Node target, LineSort sort) {
		String description;
		List<String> linePoints = sort.stringVertexes(link, source, target);
		description = "    union{" + CR;
		description += draw(link, linePoints, true) + materialClause(link, true) + CR;
		description += draw(link, linePoints, false) + materialClause(link, false) + CR;
		description += "    }" + CR;
		return description;
	}

	/**
	 * 指定のプレゼンテーションを持つ描画対象ノードを返す
	 * @param presence
	 * @return 描画対象ノード
	 * @throws Exception 
	 */
	protected Node findNode(INodePresentation presence) throws Exception{
		for(Node node: nodes) {
			if(node.sameEntity(presence)) {
				return node;
			}
		}
		throw new Exception();
	}
	
	/**
	 * リンク種別を返す
	 * @param link
	 * @return リンク種別
	 * @throws Exception 
	 */
	protected LineSort lineSort(ILinkPresentation link) throws Exception {
		Node source = findNode(link.getSource());
		Node target = findNode(link.getTarget());
		if(source == target) {
			return LineSort.Loop;
		}
		if(isSourceUp(source) || isTargetUp(target)) {
				return LineSort.Both;
		}
		return LineSort.Origin;
	}

	/**
	 * ノードがリンク元のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isSourceUp(Node node) {
		return false; 
	}

	/**
	 * ノードがリンク先のとき山なりのリンクである
	 * @param node
	 * @return 山なり
	 */
	protected boolean isTargetUp(Node node) {
		return false; 
	}

	/**
	 * リンクを円環で描く
	 * @param link
	 * @param sourcep
	 * @param sourcez
	 */
	protected String drawLoop(ILinkPresentation link, Node source) {
		return "    torus { LOOPRd, LRd translate vert(" + source.getLocation() + ", - LOOPRd) " + materialClause(link, true) + CR;
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
	protected String draw(ILinkPresentation link, List<String> vertexes, boolean isShape) {
		int length = vertexes.size();
		boolean isCurve = link.getProperty("line.shape").equals("curve");
		String description = "    sphere_sweep { ";
		if(length == 2 || (!isCurve && link.getAllPoints().length == length)) {
			description += "linear_spline, ";
		}else {
			description += "cubic_spline, ";
		}
		description +=  length + ", ";
		if(isShape) {
			for(String point: vertexes) {
				description += point + ", LRd ";
			}
		}else {
			int count = 0;
			for(String point: vertexes) {
				description += point;
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

	protected String type(IPresentation presence) {
		return Node.reviseType(presence);
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
}
