package biz.chamos.povastah.scene;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.util.ArrayList;
import java.util.List;

import com.change_vision.jude.api.inf.presentation.ILinkPresentation;


/**
 * リンク種別
 * 
 * @author mashiro
 * @since 2021/08/19
 *
 */
public enum LineSort {
	Origin(false, false, 1.0), // リンク先も元も昇るタイプではない
	Loop(false, false, 1.0), // リンク先と元が同じ:円環
	Source(true, false, 0.3), // リンク先だけ昇るタイプである
	Target(false, true, 0.7), // リンク元だけ昇るタイプである
	Both(true, true, 0.5); // リンク先も元も昇るタイプである

	/**
	 * 上昇分
	 */
	static final double TOP = -32.0;
	/**
	 * リンク元が昇るタイプである
	 */
	boolean sourceUp;
	/**
	 * リンク先が昇るタイプである
	 */
	boolean targetUp;
	/**
	 * ノード間に配置する軌跡点の距離率
	 */
	double ratio;
	
	LineSort(boolean sourceUp, boolean targetUp, double ratio) {
		this.sourceUp = sourceUp;
		this.targetUp = targetUp;
		this.ratio = ratio;
	}

	/**
	 * リンクの軌跡点を指定ノード側に半分の距離寄せる
	 * 
	 * @param sourceb
	 * @param nextp
	 * @param z
	 * @return 軌跡点
	 */
	public Point3D topVertex(Rectangle2D sourceb, Point2D nextp, double z) {
		return new Point3D((sourceb.getCenterX() + nextp.getX()) * 0.5, (sourceb.getCenterY() + nextp.getY()) * 0.5, z);
	}
	
	/**
	 * リンク元とリンク先の直線間に距離率に応じた軌跡点を返す
	 * @param sourceb
	 * @param targetb
	 * @return 軌跡点
	 */
	public Point3D vertex(Rectangle2D sourceb, Rectangle2D targetb, double z) {
		double x = sourceb.getCenterX() - (sourceb.getCenterX() - targetb.getCenterX())*ratio;
		double y = sourceb.getCenterY() - (sourceb.getCenterY() - targetb.getCenterY())*ratio;
		return new Point3D(x, y, z);
	}
	
	/**
	 * リンク種別に応じて、リンクの描画軌跡点列を作る
	 * @param link
	 * @param sourcez
	 * @param targetz
	 * @return リンク描画軌跡点列
	 */
	public List<Point3D> vertexes(ILinkPresentation link, double sourcez, double targetz) {
		List<Point3D> vertexes = new ArrayList<>();
		Rectangle2D sourceb = link.getSource().getRectangle();
		Rectangle2D targetb = link.getTarget().getRectangle();
		Point3D start = new Point3D(sourceb.getCenterX(), sourceb.getCenterY(), sourcez);
		Point3D end = new Point3D(targetb.getCenterX(), targetb.getCenterY(), targetz);
		vertexes.add(start);
		Point2D[] points = link.getAllPoints();
		int length = points.length;
		if(this.equals(Origin)) {
			if(length > 2) {
				boolean isCurve = link.getProperty("line.shape").equals("curve");
				if(isCurve) {
					vertexes.add(start);
				}
				double deltaz = (targetz - sourcez)/(length - 1);
				for(int i=1; i < length - 1; i++) {
					vertexes.add(new Point3D(points[i].getX(), points[i].getY(), sourcez + deltaz));
					deltaz += deltaz;
				}
				if(isCurve) {
					vertexes.add(end);
				}
			}
		}else {
			vertexes.add(start);
			if(length == 2) {
				vertexes.add(vertex(sourceb, targetb, sourcez + TOP));
			}else {
				double deltaz;
				double overz = sourcez;
				vertexes.add(new Point3D(sourceb.getCenterX(), sourceb.getCenterY(), sourcez));
				if(this.equals(Source)) {
					overz += TOP;				
					vertexes.add(topVertex(sourceb, points[2], overz));					
				}else {
					overz -= TOP;
				}
				deltaz = (targetz - overz)/(length - 1);
				for(int i=2; i < length - 2; i++) {
					vertexes.add(new Point3D(points[i].getX(), points[i].getY(), targetz + deltaz));
					deltaz += deltaz;
				}
				if(this.equals(Target)) {
					vertexes.add(topVertex(targetb, points[length - 2], targetz + TOP));					
				}
				vertexes.add(new Point3D(targetb.getCenterX(), targetb.getCenterY(), targetz));				
			}
			vertexes.add(end);
		}
		vertexes.add(end);
		return vertexes;
	}
}
