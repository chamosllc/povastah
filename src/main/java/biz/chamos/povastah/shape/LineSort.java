package biz.chamos.povastah.shape;

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
	public Point3D topVertex(Point2D sourcep, Point2D nextp, double z) {
		return new Point3D((sourcep.getX() + nextp.getX()) * 0.5, (sourcep.getY() + nextp.getY()) * 0.5, z);
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

	public Point3D vertex(Point2D sourcep, Point2D targetp, double z) {
		double x = sourcep.getX() - (sourcep.getX() - targetp.getX())*ratio;
		double y = sourcep.getY() - (sourcep.getY() - targetp.getY())*ratio;
		return new Point3D(x, y, z);
	}
	
	/**
	 * リンク種別に応じて、リンクの描画軌跡点列を作る
	 * 
	 * astah*
	 * 始点=ソースノードの中心あるいは端点
	 * 終点=ターゲットノードの中心あるいは端点
	 * リンク軌跡点列=[始点, …, 終点]
	 * 
	 * POVRay
	 * astah*の端点は中心に置き換える
	 * 
	 * 始点'=ソースノードの中心
	 * 終点'=ターゲットノードの中心
	 * 描画軌跡点列 直線=[始点', …, 終点'] 曲線=[始点', 始点', …, 終点', 終点']
	 * 
	 * リンク軌跡点列=[始点, 終点]の場合
	 * 	Both:   [始点', 始点', 中間点↑, 終点', 終点']			
	 *  Source: [始点', 始点', 始点と中間点の中間点↑, 中間点, 終点', 終点']
	 *  Target: [始点', 始点', 中間点, 始点と中間点の中間点↑, 終点', 終点']
	 * リンク軌跡点列=[始点, …, 終点]の場合
	 * 	Both:   [始点', 始点', Pn↑, 終点', 終点']			
	 *  Source: [始点', 始点', P(n<length/2)↑, P(n>=length/2), 終点', 終点']
	 *  Target: [始点', 始点', P(n<length/2), P(n>=length/2)↑, 終点', 終点']
	 *  
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
		Point2D[] points = link.getAllPoints();
		int length = points.length;
		boolean isCurve = link.getProperty("line.shape").equals("curve");
		
		vertexes.add(start); // 始点
		if(this.equals(Origin)) {
			if(length > 2) {
				if(isCurve) {
					vertexes.add(start); // 曲線 2点目 始点と同じ点
				}
				double deltaz = (targetz - sourcez)/(length - 1);
				for(int i=1; i < length - 1; i++) {
					vertexes.add(new Point3D(points[i], sourcez + deltaz));
					deltaz += deltaz;
				}
				if(isCurve) {
					vertexes.add(end); // 曲線 終点の一つ前の点 終点と同じ点
				}
			}
		}else { // 山なりな線にする
			Point3D center = topVertex(start.getXY(), end.getXY(), sourcez + TOP); // 始点と終点の間に種別の距離率を加味して点を作る
			vertexes.add(start); // 曲線 2点目 始点と同じ点
			if(length == 2) { // 元は始点と終点の2点を結ぶ直線 
				Point3D addPoint;
				if(this.equals(Both)) {
					vertexes.add(center);
				}else {
					center.setZ(0.0);
					if(this.equals(Source)) {
						vertexes.add(topVertex(start.getXY(), center.getXY(), sourcez + TOP));	
					}				
					vertexes.add(center);
					if(this.equals(Target)) {
						vertexes.add(topVertex(center.getXY(), end.getXY(), targetz + TOP));			
					}				
				}
			}else {
				double deltaz;
				if(this.equals(Both)) {
					for(int i=2; i < length - 2; i++) {
						vertexes.add(new Point3D(points[i].getX(), points[i].getY(), sourcez + TOP));
					}
				}else if(length == 3) {
					if(this.equals(Source)) {
						vertexes.add(topVertex(start.getXY(), points[1], sourcez + TOP));
						vertexes.add(new Point3D(points[1].getX(), points[1].getY(), targetz));
					}else if(this.equals(Target)) {						
						vertexes.add(new Point3D(points[1].getX(), points[1].getY(), sourcez));
						vertexes.add(topVertex(points[1], end.getXY(), targetz + TOP));
					}
				}else {
					int turn = (int)((length - 2)/2);
					if(this.equals(Source)) {
						for(int i=1; i <= turn; i++) {
							vertexes.add(new Point3D(points[i].getX(), points[i].getY(), sourcez + TOP));
						}
						for(int i=turn + 1; i < length - 1; i++) {
							vertexes.add(new Point3D(points[i].getX(), points[i].getY(), targetz));
						}
					}else if(this.equals(Target)) {
						for(int i=1; i <= turn; i++) {
							vertexes.add(new Point3D(points[i].getX(), points[i].getY(), sourcez));
						}
						for(int i=turn + 1; i < length - 1; i++) {
							vertexes.add(new Point3D(points[i].getX(), points[i].getY(), targetz + TOP));
						}
					}
				}
			}
			vertexes.add(end); // 曲線 終点の一つ前の点 終点と同じ点
		}
		vertexes.add(end); // 終点
		return vertexes;
	}
}
