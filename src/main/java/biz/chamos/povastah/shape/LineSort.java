package biz.chamos.povastah.shape;

import java.awt.geom.Point2D;
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
	 * リンクのデフォルトz座標値
	 */
	static final public double OFFSET_Z = 4.0;
	/**
	 * 上昇分
	 */
	static final public double TOP = -32.0;
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
	 * @param source
	 * @param target
	 * @return リンク描画軌跡点列
	 */
	public List<String> stringVertexes(ILinkPresentation link, Node source, Node target) {
		List<String> vertexes = new ArrayList<>();
		Point3D start = source.getLocation();
		start = start.settleZ(start.getZ() + OFFSET_Z);
		Point3D end = target.getLocation();
		end = end.settleZ(end.getZ() + OFFSET_Z);
		Point2D[] points = link.getAllPoints();
		int length = points.length;
		boolean isCurve = link.getProperty("line.shape").equals("curve");
		
		vertexes.add(source.vertLink()); // 始点
		if(this.equals(Origin)) {
			if(length > 2) {
				if(isCurve) {
					vertexes.add(source.vertLink()); // 曲線 2点目 始点と同じ点
				}
				double deltaz = (end.getZ() - start.getZ())/(length - 1);
				for(int i=1; i < length - 1; i++) {
					vertexes.add(source.vertex(new Point3D(inversion(points[i]), start.getZ() + deltaz)));
					deltaz += deltaz;
				}
				if(isCurve) {
					vertexes.add(target.vertLink()); // 曲線 終点の一つ前の点 終点と同じ点
				}
			}
		}else { // 山なりな線にする
			Point3D addPoint;
			Point3D center = start.center(end); // 始点と終点の間に種別の距離率を加味して点を作る
			double topZ = center.getZ() + TOP;
			vertexes.add(source.vertLink()); // 曲線 2点目 始点と同じ点
			if(length == 2) { // 元は始点と終点の2点を結ぶ直線 				
				if(this.equals(Both)) {
					vertexes.add(source.center(target, topZ));
				}else {
					if(this.equals(Source)) {
						vertexes.add(target.center(source, topZ));	
					}else if(this.equals(Target)) {
						vertexes.add(source.center(target, topZ));
					}				
				}
			}else {
				if(this.equals(Both)) {
					for(int i=2; i < length - 2; i++) {
						vertexes.add(source.vertex(new Point3D(inversion(points[i]), topZ)));
					}
				}else if(length == 3) {					
					if(this.equals(Source)) {
						addPoint = new Point3D(inversion(points[1]), start.getZ());
						vertexes.add(source.vertex(start.center(addPoint), topZ));
						vertexes.add(target.vertex(addPoint));
					}else if(this.equals(Target)) {
						addPoint = new Point3D(inversion(points[1]), start.getZ());
						vertexes.add(source.vertex(addPoint));
						vertexes.add(target.vertex(addPoint.center(end), topZ));
					}
				}else {
					int turn = (int)((length - 2)/2);
					if(this.equals(Source)) {
						for(int i=1; i <= turn; i++) {
							vertexes.add(source.vertex(new Point3D(inversion(points[i]), topZ)));
						}
						for(int i=turn + 1; i < length - 1; i++) {
							vertexes.add(target.vertex(new Point3D(inversion(points[i]), end.getZ())));
						}
					}else if(this.equals(Target)) {
						for(int i=1; i <= turn; i++) {
							vertexes.add(source.vertex(new Point3D(inversion(points[i]),  start.getZ())));
						}
						for(int i=turn + 1; i < length - 1; i++) {
							vertexes.add(target.vertex(new Point3D(inversion(points[i]), topZ)));
						}
					}
				}
			}
			vertexes.add(target.vertLink()); // 曲線 終点の一つ前の点 終点と同じ点
		}
		vertexes.add(target.vertLink()); // 終点
		return vertexes;
	}

	/**
	 * astah*座標系のY座標反転し、POVRay座標系のY座標に写像する。
	 * @param point
	 * @return POVRay XY座標点
	 */
	protected Point2D inversion(Point2D point) {
		return new Point2D.Double(point.getX(), -point.getY());
	}
}
