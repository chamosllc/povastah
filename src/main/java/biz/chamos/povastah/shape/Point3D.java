package biz.chamos.povastah.shape;

import java.awt.geom.Point2D;

public class Point3D {
	protected Point2D point;
	protected double z;

	public Point3D(Point2D point, double z) {
		this.point = point;
		this.z = z;
	}
	
	public Point3D(double x, double y, double z) {
		this(new Point2D.Double(x, y), z);
	}
	
	public double getX() {
		return point.getX();
	}
	
	public double getY() {
		return point.getY();
	}
	
	public double getZ() {
		return z;
	}
	
	public Point2D getXY() {
		return point;
	}
	
	public void setZ(double z) {
		this.z = z;
	}
}
