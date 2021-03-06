package biz.chamos.povastah.shape;

import static biz.chamos.povastah.scene.Diagram.*;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.IOException;

import com.change_vision.jude.api.inf.model.IElement;
import com.change_vision.jude.api.inf.model.IMessage;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

/**
 * ノード
 * シーン上のノードオブジェクト
 * INodePresentation Wrapper
 * 
 * @author mashiro
 * @since 2021/08/21
 */
public class Node {
	/*
	 * オブジェクトのz値のオフセット
	 */
	static final public double TEXT_OFFSET_Z = 30.0;

	/*
	 * オブジェクト関連フォーマット
	 */
	static final public String OBJECT_UNIT = " rotate -x*90 scale 24.0";
	static final public String CIRCLE_TEXT = "    object { Circle_Text(LabelFont, \"%s\",  %.3f, 0, 2, %.3f, 1, Align_Center, -90) scale TextScale %s no_shadow }" + CR;
	static final public String TEXT16 = "    text { ttf LabelFont, \"%s\", 1, 0 scale TextScale texture { LabelTecture }%s no_shadow }" + CR;

	/**
	 * ノード中心座標変数名
	 */
	protected String name;
	/**
	 * ノード要素タイプ
	 * ※adhoc因子:サブダイアグラムを持つ性質判定、ここの一般化に適合しない処理判定、etc.
	 */
	protected String type;
	/**
	 * text あるいは CircleText等のテキストオブジェクトで扱われるノードのラベル
	 */
	protected String label;
	/**
	 * ラッピングする写像元のastah*描画要素
	 */
	protected INodePresentation entity;
	/**
	 * ノード中心座標
	 */
	protected Point3D location;
	/**
	 * 並列度
	 */
	protected int raise = 0;
	
	/**
	 * コンストラクタ
	 * @param number
	 * @param id
	 * @param type
	 * @param entity
	 * @param label
	 */
	public Node(int number, int id, String type, INodePresentation entity, String label) {
		this.entity = entity;
		this.label = label;
		this.type = type;
		setLocation();
		setName(number, id);
	}
	
	protected void setLocation() {
		Rectangle2D bound = entity.getRectangle();
		location = new Point3D(bound.getCenterX(), -bound.getCenterY(), 0.0);
	}
	
	/**
	 * シーン記述ファイル内ローカル座標名
	 * 	ノードタイプ+階層深さ_ノード番号
	 * @param id
	 * @param hierarchy
	 */
	protected void setName(int number, int id) {
		name = type + id + "_" + number;
	}

	public String getName() {
		return name;
	}
	
	public String getLabel() {
		return label;
	}

	/**
	 * astah*描画要素のタイプをシンボル整形する
	 * @param presence
	 * @return
	 */
	static public String reviseType(IPresentation presence) {
		return presence.getType().replaceAll("[^\\w\\s]","").replaceAll("[\\h]", "");
	}

	/**
	 * 引数がラッピングしているINodePresentationである
	 * @param presence
	 * @return
	 */
	public boolean sameEntity(INodePresentation presence) {
		return entity == presence;
	}
	
	/**
	 * astah*描画要素のタイプと同じである
	 * @param type astah*要素タイプ
	 * @return
	 */
	public boolean isLiterallyType(String type) {
		return entity.getType().equals(type);
	}
	
	public Point3D getLocation() {
		return location;
	}
	
	public ILinkPresentation[] getLinks() {
		return entity.getLinks();
	}
	
	public IElement getModel() {
		return entity.getModel();
	}
	
	public Rectangle2D getBound() {
		return entity.getRectangle();
	}

	public int getRaise() {
		return raise;
	}

	public void setRaise(int raise) {
		this.raise = raise;
	}
	
	public int minRaise(int min) {
		return Math.min(raise, min);
	}
	
	protected String scaleName() {
		return name+"_SCALE";
	}

	public boolean isSource(ILinkPresentation link) {
		return link.getSource() == entity;
	}
	
	public String declare() {
		String zpara;
		if(raise == 0) {
			zpara = String.format("%.1f",  location.getZ());
		}else if (raise == 1) {
			zpara = String.format("%.1f + RAISE",  location.getZ());
		}else {
			zpara = String.format("%.1f + RAISE*%d",  location.getZ(), raise);
		}
		return String.format("#local %s = <%.3f, %.3f, %s>;" + CR, name, location.getX(), location.getY(), zpara);
	}

	/**
	 * ノード中心座標からZ座標だけ引数分移動する
	 * @param zposition
	 * @return " vert(name, zpositon)",
	 */
	public String vert(double zposition) {
		return String.format(" vert(%s, %.1f)", name, zposition);
	}
	/** 
	 * ノード中心座標kから相対座標分移動する
	 * @param point
	 * @return " vertex(name, point-location)"
	 */
	public String vertex(Point3D point) {
		return String.format(" vertex(%s, %s)", name, point.minus(location));
	}

	/** 
	 * ノード中心座標からの相対座標とZ値分移動する
	 * @param zposition
	 * @return " vert(vertex(name, point-location), zposition)"
	 */
	public String vertex(Point3D point, double zposition) {
		return String.format(" vert(vertex(%s, %s), %.1f)", name, point.minus(location), zposition);
	}
	
	public String vertexPoint(Point3D point) {
		return String.format(" vertex(%s, %s)", name, point);
	}

	public String vertexRaisePoint(Point2D point) {
		return String.format(" vert(vertex(%s, %s), RAISE + %s)", name, point, LineSort.OFFSET_Z);
	}
	
	/** 
	 * ノード中心座標kから相対座標分移動する
	 * @param point
	 * @return " vertex(name, point-location)"
	 */
	public String center(Node target) {
		return String.format(" vertexCenter(%s, %s)", name, target.getName());
	}

	public String centerRaise(Node target) {
		return String.format(" vert(vertexCenter(%s, %s), RAISE/4 + %s)", name, target.getName(), LineSort.OFFSET_Z);
	}
	
	/** 
	 * ノード中心座標kから相対座標分移動する
	 * @param point
	 * @return " vertex(name, point-location)"
	 */
	public String center(Node target, double zposition) {
		return String.format(" vertCenter(%s, %s, %.1f)", name, target.getName(), zposition);
	}
	
	public String translate(double zposition) {
		return String.format(" translate%s ", vert(zposition));
	}
	
	public String translate(Point3D point) {
		return String.format(" translate%s", vertex(point));
	}
	
	public String translatePoint(Point3D point) {
		return String.format(" translate%s", vertexPoint(point));
	}

	/**
	 * ノードを描く
	 * @return 記述
	 */
	public String draw() {
		return String.format("  object { %s translate %s }" + CR, type + OBJECT_UNIT, name);
	}

	/**
	 * Z値を加えてノードを描く
	 * @param zposition Z値
	 * @return 記述
	 */
	public String draw(double zposition) {
		return String.format("  object { %s translate vert(%s, %.1f) }" + CR, type + OBJECT_UNIT, name, zposition);
	}

	/**
	 * ノードを拡大縮小して描く
	 * @param scale 縮小率
	 * @return 記述
	 */
	public String drawWithScale(Point3D scale) {
		return String.format("  object { %s scale %s translate %s }" + CR, type, scale, name);
	}
	
	/**
	 * ノードとノード名を描く
	 * @return 記述
	 */
	public String drawWithName() {
		return draw() + text();
	}

	/**
	 * 親ノードに子ダイアグラムを乗せる際の縮小率
	 * 子ダイアグラムの座標
	 * @param bound 親ノードの矩形領域
	 * @param subBound 子ダイアグラムの矩形領域
	 * @return 記述
	 */
	public String declareScale(Rectangle2D bound, Rectangle2D subBound) {
		String declare = String.format("  #local %s = %.5f;" + CR, scaleName(), Math.min(bound.getWidth()/subBound.getWidth(), bound.getHeight()/subBound.getHeight()));
		return declare + String.format("  #local %s_sub = %1$s + <%.3f, %.3f, -32>*%s;" + CR, name, -subBound.getCenterX(), subBound.getCenterY(), scaleName());
	}
	
	/**
	 * ノード自己再帰リンクを描く
	 * @return 記述
	 */
	public String drawLoop() {
		return String.format("    torus { LOOPRd, LRd translate vert(%s, -LOOPRd) ", name);
	}

	/**
	 * ステージノード自己再帰リンクを描く
	 * @return 記述
	 */
	public String drawLoopOnStage() {
		Rectangle2D bound = getBound();
		return String.format("    torus { LOOPRd, LRd rotate -z*45 translate vertex(%s, <%.3f - LOOPRd, %.3f, 16 - LOOPRd>) ", name, bound.getMaxX() - bound.getCenterX() + 8.0, bound.getCenterY()-bound.getMinY());
	}

	/**
	 * 状態親ノードと子ダイアグラムを描く
	 * @return 記述
	 */
	public String drawWithState(String diagram, Point3D stageScale, Rectangle2D subBound, Point3D textAlign) {
		return drawSubDiagram(diagram, subBound) + drawWithScale(stageScale) + textOnStage(textAlign);
	}

	/**
	 * 振る舞い呼び出しアクションとサブダイアグラムを描く
	 * @return 記述
	 */
	public String drawWithAction(String diagram, Rectangle2D subBound) {
		return drawSubDiagram(diagram, subBound) + draw() + textOfStage();
	}

	/**
	 * サブダイアグラムを描く
	 * @return 記述
	 */
	public String drawSubDiagram(String diagram, Rectangle2D subBound) {
		Rectangle2D bound = getBound();
		return declareScale(bound, subBound) + String.format("  object { %s scale %s translate %s_sub }" + CR, diagram, scaleName(), name);
	}
	
	/**
	 * ノードのラベルを描く
	 * @param node
	 * @throws IOException
	 */
	public String text(){
		String description = "";
		if(!label.isEmpty()) { // 名前がないか空白だけの名前は表示しない
			double step = 0.8;
			for(String label: label.split("\n")) {
				double radius = 1.6;
				double scale = 1.0;
				if(label.getBytes().length >= 20) { // 文字列が1週を越えるとエラーになる。20文字を目安に、サイズの縮小と半径の拡大を補正してエラーを避ける。
					scale -= (label.getBytes().length - 20)/30.0;
					radius += (label.getBytes().length - 20)/30.0;
				}
				description += String.format(CIRCLE_TEXT, label, scale, radius,  labelTexture() + translate(TEXT_OFFSET_Z - location.getZ()));
				radius += step;
			}
		}
		return description;
	}
	
	/**
	 * サブダイアグラムを持つノードのラベルを描く
	 * @return
	 */
	protected String textOfStage() {
		if(!label.isEmpty()) {
			Rectangle2D bound = getBound();
			Point3D point = new Point3D(bound.getX() + 24.0, -bound.getCenterY()-48.0, TEXT_OFFSET_Z);
			return String.format(TEXT16, label, translate(point)) + CR;
		}
		return "";
	}
	
	/**
	 * サブダイアグラム上にノードのラベルを描く
	 * @param node
	 * @param bound
	 * @throws IOException
	 */
	public String textOnStage(Point3D correction) {
		if(!label.isEmpty()) {
			Rectangle2D bound = getBound();
			Point3D point = new Point3D((-bound.getWidth())/2.0, bound.getHeight()/2.0, 0.0).plus(correction);
			return String.format(TEXT16, label, translatePoint(point)) + CR;
		}
		return "";
	}

	/**
	 * ラベルのテクスチャを返す
	 * @param node
	 * @return テクスチャを返す
	 */
	public String labelTexture() { 
		if(getModel() instanceof IMessage) {// CommunicationDiagram要素
			return "texture { MessageLabelTecture }";
		}
		return "texture { LabelTecture }";
	}
}
