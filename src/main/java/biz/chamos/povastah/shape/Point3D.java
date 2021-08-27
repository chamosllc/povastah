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
	
	public Point3D() {
		this.point = new Point2D.Double();
		this.z = 0.0;
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
	
	public Point3D settleZ(double z) {
		return new Point3D(point, z);
	}
	
	public Point3D minus(Point3D other) {
		return new Point3D(new Point2D.Double(point.getX() - other.getX(), point.getY() - other.getY()), z - other.getZ());
	}
	
	/**
	 * 与えられた点との中間点を返す
	 * @param 他の点
	 * @return 中間点
	 */
	public Point3D center(Point3D other) {
		return new Point3D(new Point2D.Double((point.getX() + other.getX())/2.0, (point.getY() + other.getY())/2.0), (z + other.getZ())/2.0);
	}
	
	public String toString() {
		return String.format("<%.3f, %.3f, %.3f>", point.getX(), point.getY(), z);
	}
}
