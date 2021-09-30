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
	Origin, // リンク先も元も昇るタイプではない
	Loop, // リンク先と元が同じ:円環
	Fork, // リンク元がForkである
	Join, // リンク先がJoinである
	JumpIn, // リンク先だけ昇るタイプである for internal Statemachine
	JumpOut, // リンク元だけ昇るタイプである for internal Statemachine
	Both; // リンク先も元も昇るタイプである

	/**
	 * リンクのデフォルトz座標値
	 */
	static final public double OFFSET_Z = 4.0;
	/**
	 * 上昇分
	 */
	static final public double TOP = -32.0;
	
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
		
		vertexes.add(vertLink(source)); // 始点
		if(equals(Origin)) {
			if(length > 2) {
				if(isCurve) {
					vertexes.add(vertLink(source)); // 曲線 2点目 始点と同じ点
				}
				double deltaz = (end.getZ() - start.getZ())/(length - 1);
				for(int i=1; i < length - 1; i++) {
					vertexes.add(source.vertex(new Point3D(inversion(points[i]), start.getZ() + deltaz)));
					deltaz += deltaz;
				}
				if(isCurve) {
					vertexes.add(vertLink(target)); // 曲線 終点の一つ前の点 終点と同じ点
				}
			}
		}else { // 山なりな線にする
			Point3D addPoint;
			vertexes.add(vertLink(source)); // 曲線 2点目 始点と同じ点
			if(length == 2) { // 元は始点と終点の2点を結ぶ直線 				
				if(equals(Both)) {
					vertexes.add(source.center(target, TOP));
				}else if(equals(JumpIn)) {
					vertexes.add(target.center(source, TOP));	
				}else if(equals(JumpOut)) {
					vertexes.add(source.center(target, TOP));
				}else if(equals(Fork) || equals(Join)) {
					vertexes.add(source.centerRaise(target));
				}
			}else {
				if(equals(Both)) {
					for(int i=2; i < length - 2; i++) {
						vertexes.add(source.vertex(new Point3D(inversion(points[i]), TOP)));
					}
				}else if(equals(Fork) || equals(Join)) {
					for(int i=2; i < length - 2; i++) {
						vertexes.add(source.vertexRaisePoint(inversion(points[i])));
					}		
				}else if(length == 3) {		
					if(equals(JumpOut)) {
						addPoint = new Point3D(inversion(points[1]), start.getZ());
						vertexes.add(source.vertex(start.center(addPoint), TOP));
						vertexes.add(target.vertex(addPoint));
					}else if(equals(JumpIn)) {
						addPoint = new Point3D(inversion(points[1]), start.getZ());
						vertexes.add(source.vertex(addPoint));
						vertexes.add(target.vertex(addPoint.center(end), TOP));
					}
				}else {
					int turn = (int)((length - 2)/2);
					if(equals(JumpOut)) {
						for(int i=1; i <= turn; i++) {
							vertexes.add(source.vertex(new Point3D(inversion(points[i]), TOP)));
						}
						for(int i=turn + 1; i < length - 1; i++) {
							vertexes.add(target.vertex(new Point3D(inversion(points[i]), end.getZ())));
						}
					}else if(equals(JumpIn)) {
						for(int i=1; i <= turn; i++) {
							vertexes.add(source.vertex(new Point3D(inversion(points[i]),  start.getZ())));
						}
						for(int i=turn + 1; i < length - 1; i++) {
							vertexes.add(target.vertex(new Point3D(inversion(points[i]), TOP)));
						}
					}
				}
			}
			vertexes.add(vertLink(target)); // 曲線 終点の一つ前の点 終点と同じ点
		}
		vertexes.add(vertLink(target)); // 終点
		return vertexes;
	}

	
	/**
	 * リンク座標vertex句を返す
	 * @return
	 */
	public String vertLink(Node node) {
		return String.format(" vert(%s, %.1f)", node.getName(), OFFSET_Z);
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
