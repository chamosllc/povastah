package biz.chamos.povastah.shape;

import static biz.chamos.povastah.scene.Diagram.*;

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
	static final public double RAIZE_Z = -48;
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
	 * astah*描画要素のタイプをシンボル整形する
	 * @param presence
	 * @return
	 */
	static public String reviseType(IPresentation presence) {
		return presence.getType().replaceAll("[^\\w\\s]","").replaceAll("[\\h]", "");
	}
	
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
	
	public String getType() {
		return type;
	}
	
	public String getLabel() {
		return label;
	}
	
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
	
	protected String scaleName() {
		return name+"_SCALE";
	}

	public void raiseUp() {
		location.setZ(location.getZ() + RAIZE_Z);
	}
	public boolean isSource(ILinkPresentation link) {
		return link.getSource() == entity;
	}

	
	public String declare() {
		return String.format("#local %s = <%.3f, %.3f, %.1f>;" + CR, name, location.getX(), location.getY(), location.getZ());
	}
	
	/**
	 * vertex句を返す
	 * @return
	 */
	public String vertLink() {
		return String.format(" vert(%s, %.1f)", name, LineSort.OFFSET_Z);
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

	public String vertexPoint(Point3D point) {
		return String.format(" vertex(%s, %s)", name, point);
	}
	
	/** 
	 * ノード中心座標kから相対座標分移動する
	 * @param point
	 * @return " vertex(name, point-location)"
	 */
	public String center(Node target) {
		return String.format(" vertexCenter(%s, %s)", name, target.getName());
	}
	/** 
	 * ノード中心座標kから相対座標分移動する
	 * @param point
	 * @return " vertex(name, point-location)"
	 */
	public String center(Node target, double zposition) {
		return String.format(" vertCenter(%s, %s, %.1f)", name, target.getName(), zposition);
	}
	/** 
	 * ノード中心座標からの相対座標とZ値分移動する
	 * @param zposition
	 * @return " vert(vertex(name, point-location), zposition)"
	 */
	public String vertex(Point3D point, double zposition) {
		return String.format(" vert(vertex(%s, %s), %.1f)", name, point.minus(location), zposition);
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
	
	public String draw() {
		return String.format("  object { %s translate %s }" + CR + text(), type + OBJECT_UNIT, name);
	}

	public String drawWithStage() {
		return String.format("  object { %s translate %s }" + CR, type + OBJECT_UNIT, name);
	}
	
	public String draw(double zposition) {
		return String.format("  object { %s translate vert(%s, %.1f) }" + CR, type + OBJECT_UNIT, name, zposition);
	}
	
	public String declareScale(Rectangle2D bound, Rectangle2D subBound) {
		double scale = Math.min(bound.getWidth()/subBound.getWidth(), bound.getHeight()/subBound.getHeight());
		return String.format("  #local %s = %s;" + CR, scaleName(), scale);
	}
	
	public String drawScale(Point3D scale) {
		return String.format("  object { %s scale %s translate %s }" + CR, type, scale, name);
	}
	
	public String drawLoop() {
		return String.format("    torus { LOOPRd, LRd translate vert(%s, -LOOPRd) ", name);
	}

	public String drawLoopOnStage() {
		Rectangle2D bound = getBound();
		return String.format("    torus { LOOPRd, LRd rotate -z*45 translate vertex(%s, <%.3f - LOOPRd, %.3f, 16 - LOOPRd>) ", name, bound.getMaxX() - bound.getCenterX() + 8.0, bound.getCenterY()-bound.getMinY());
	}
	
	public String drawWithState(String diagram, Point3D stageScale, Rectangle2D subBound, Point3D textAlign) {
		Rectangle2D bound = getBound();
		Point3D correction = new Point3D(bound.getCenterX() - subBound.getCenterX(), - (bound.getCenterY() - subBound.getCenterY()), 0.0);
		String description = drawSubDiagram(diagram, getBound(), subBound, correction);
		description += drawScale(stageScale);
		return description + textOnStage(textAlign);
	}
	
	public String drawWithAction(String diagram, Rectangle2D subBound) {
		Rectangle2D bound = getBound();
		double wide = 72.0;
		Rectangle2D nodeBound = new Rectangle2D.Double(bound.getX(), bound.getY(), wide, wide);
		Point3D correction = new Point3D(bound.getCenterX() - subBound.getCenterX(), - (bound.getCenterY() - subBound.getCenterY()), 0.0);
		String description = "// " + wide + " " + nodeBound + " " + subBound + CR + drawSubDiagram(diagram, nodeBound, subBound, correction);
		description += drawWithStage();
		return description + textOfStage();
	}
	
	public String drawSubDiagram(String diagram, Rectangle2D bound, Rectangle2D subBound, Point3D correction) {
		return declareScale(bound, subBound) + String.format("  object { %s scale %s translate vertex(%s*(1-%2$s), <%s*%2$s, %s*%2$s, -6*(1+%2$s)>) }" + CR, diagram, scaleName(), name, correction.getX(), correction.getY());
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
