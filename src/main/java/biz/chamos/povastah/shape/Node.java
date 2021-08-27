package biz.chamos.povastah.shape;

import static biz.chamos.povastah.scene.Diagram.*;

import java.awt.geom.Rectangle2D;
import java.io.IOException;

import com.change_vision.jude.api.inf.model.IElement;
import com.change_vision.jude.api.inf.model.IMessage;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;

/**
 * ノード
 * シーン上のノードオブジェクト
 * INodePresentation Wrapper
 * 
 * @author mashiro
 * @since 2021/08/21
 */
public class Node {
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

	public Node(INodePresentation entity) {
		this.entity = entity;
		setLocation();
	}
	public Node(String type, INodePresentation entity, String label) {
		this(entity);
		this.type = type;
		this.label = label;
	}
	
	public Node(int id, int hierarchy, String type, INodePresentation entity, String label) {
		this(type, entity, label);
		setName(id, hierarchy);
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
	protected void setName(int id, int hierarchy) {
		name = type + hierarchy + "_" + id;
	}

	public String getName() {
		return name;
	}
	
	public String getLabel() {
		return label;
	}
	
	public boolean sameEntity(INodePresentation presence) {
		return entity == presence;
	}
	
	public boolean isType(String type) {
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
	
	public String declare() {
		return String.format("#local %s = <%.3f, %.3f, %.1f>;" + CR, name, location.getX(), location.getY(), location.getZ());
	}
	
	public boolean isSource(ILinkPresentation link) {
		return link.getSource() == entity;
	}
	/**
	 * vertex句を返す
	 * @return
	 */
	public String vertLink() {
		return String.format(" vert(%s, %.1f)", name, location.getZ() + LineSort.OFFSET_Z);
	}

	public String vert(double zposition) {
		return String.format(" vert(%s, %.1f)", name, zposition);
	}
	
	public String vertex(Point3D point, double zposition) {
		return String.format(" vert(vertex(%s, %s), %.1f)", name, point.minus(location), zposition);
	}
	
	public String vertex(Point3D point) {
		return String.format(" vertex(%s, %s)", name, point.minus(location));
	}
	
	public String translate(double zposition) {
		return String.format(" translate%s ", vert(zposition));
	}
	
	public String translate(Point3D point) {
		return String.format(" translate%s", vertex(point));
	}
	
	public String draw() {
		return String.format("  object { %s translate %s }" + CR + text(), type + OBJECT_UNIT, name);
	}
	
	public String draw(double zposition) {
		return String.format("  object { %s translate vert(%s, %.1f) }" + CR, type + OBJECT_UNIT, name, zposition);
	}
	
	public String drawScale(Point3D scale) {
		return String.format("  object { %s scale %s translate %s }" + CR, type, scale, name);
	}
	
	public String drawLoop() {
		return String.format("    torus { LOOPRd, LRd translate<%.3f - LOOPRd, %.3f, %.1f - LOOPRd> ", getBound().getMaxX(), -getBound().getMinY(), location.getZ());
	}

	public String drawWithStage(String diagram, Point3D stage, Rectangle2D subBound, double delta) {
		String description = drawSubDiagram(diagram, subBound, delta);
		description += drawScale(stage);
		return description + textOnStage(10.0);
	}
	
	public String drawWithStage(String diagram, Rectangle2D subBound, double delta) {
		String description = drawSubDiagram(diagram, subBound, delta);
		description += draw();
		return description + textOfStage();
	}
	
	public String drawSubDiagram(String diagram, Rectangle2D subBound, double delta) {
		double scale = Math.min(entity.getWidth()/(subBound.getWidth() + delta), entity.getHeight()/(subBound.getHeight() + delta));
		Point3D point = new Point3D((subBound.getCenterX() + (delta/2))*scale, -(subBound.getCenterY() - (delta/2))*scale, (TEXT_OFFSET_Z+1.0)*scale);
		return String.format("  object { %s scale %s %s }" + CR, diagram, scale,  translate(location.minus(point)));
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
			Point3D point = new Point3D((bound.getWidth())/2.0 - 24.0, bound.getHeight()/2.0 + 24.0, -TEXT_OFFSET_Z);
			return String.format(TEXT16, label, translate(location.minus(point))) + CR;
		}
		return "";
	}
	
	/**
	 * サブダイアグラム上にノードのラベルを描く
	 * @param node
	 * @param bound
	 * @throws IOException
	 */
	public String textOnStage(double correction) {
		if(!label.isEmpty()) {
			Rectangle2D bound = getBound();
			Point3D point = new Point3D(bound.getMinX() + correction, -bound.getMinY() - correction, 0.0);
			return String.format(TEXT16, label, translate(point)) + CR;
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
