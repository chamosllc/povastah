package biz.chamos.povastah;

import java.awt.geom.Point2D;
import java.awt.geom.Rectangle2D;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import com.change_vision.jude.api.inf.exception.InvalidUsingException;
import com.change_vision.jude.api.inf.model.IAction;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IElement;
import com.change_vision.jude.api.inf.model.INamedElement;
import com.change_vision.jude.api.inf.model.IState;
import com.change_vision.jude.api.inf.presentation.ILinkPresentation;
import com.change_vision.jude.api.inf.presentation.INodePresentation;
import com.change_vision.jude.api.inf.presentation.IPresentation;

/**
 * POVRay Scene Launguage Script
 *  astahダイアグラムの3DCG表現を出力する(POVRayシーン言語スクリプトファイルを出力する)
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 *
 * @param <T> ダイアグラムの型
 */
public class Scene<T extends IDiagram> {
	static protected String CR = System.lineSeparator(); // 改行
	static protected String HEADER_COMMENT = "/**" + CR
			+ " * astah* Diagram 3D Visualization\n * %s %s" + CR
			+ " * created at %s" + CR
			+ " * presented by povastah" + CR + " **/" + CR + CR;
	static final String COORDINATE = "<%.2f, %.2f, %.2f>"; // 座標系フォーマット
	
	protected String projectName; // 未使用
	protected OutputStreamWriter sceneFile; // シーン言語スクリプト出力ファイル
	protected T diagram; // 対象ダイアグラム
	protected List<INodePresentation> nodes; // ダイアグラム中のノード要素(Frame, Noteを除く)
	protected List<ILinkPresentation> links; // ダイアグラム中のリンク要素
	protected Rectangle2D stage; // nodesの含まれる矩形

	@SuppressWarnings("unchecked")
	public Scene(String projectName, INamedElement diagram, File directory) throws IOException {
		this.projectName =projectName;
		this.sceneFile = new OutputStreamWriter(new FileOutputStream(directory + File.separator + diagram.getName() + ".pov"), "UTF-8");
		this.diagram = (T)diagram;
		this.stage = new Rectangle2D.Double();
	}

	@SuppressWarnings("unchecked")
	protected Scene(INamedElement diagram, OutputStreamWriter sceneFile) throws IOException {
		this.sceneFile = sceneFile;
		this.diagram = (T)diagram;
	}
	
	/**
	 * astahダイアグラムの3DCG表現を出力する
	 */
	public void save(){
		try {
			extractElement();
			writeHeader();
			writeDiagram(0, new Point2D.Double(), 0.0);
			writeStage();
			sceneFile.close();
		} catch (IOException | InvalidUsingException e) {}
	}

	/**
	 * ダイアグラムを出力する
	 * @throws IOException
	 */
	protected void writeDiagram(int hierarchy, Point2D dpoint, double z) throws IOException {
		sceneFile.write("#declare Diagram = union {" + CR);
		writeNodes(hierarchy, dpoint, z);
		sceneFile.flush();
		writeLinks();
		sceneFile.write("}" + CR);
		sceneFile.write("object { Diagram");
		if(hierarchy > 0) {
			sceneFile.write(String.format(" scale %f translate %s ", hierarchy*0.1, translate(dpoint, z)));
		}
		sceneFile.write(" }" + CR);
		sceneFile.flush();
	}
	
	/**
	 * スクリプトのヘッダ部を定義する
	 * @throws IOException
	 */
	protected void writeHeader() throws IOException {
		Calendar cl = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		sceneFile.write(String.format(HEADER_COMMENT, projectName, diagram.getName(), sdf.format(cl.getTime())));
		sceneFile.write("#version 3.7" + CR + "#global_settings { assumed_gamma 2.2 }" + CR
				+ "#global_settings { charset utf8 }" + CR + CR);	
		sceneFile.write("#include \"astahuml.inc\"" + CR + CR);
		sceneFile.write("#declare PlaneTexture = texture { pigment { hexagon color Pink color White color SkyBlue } rotate -x*90 scale 64 }" + CR);
		sceneFile.write("#declare LabelTecture = texture { T_Grnt15 }" + CR);
		sceneFile.write("#declare LinkTecture = texture { Yellow_Glass }" + CR + CR);
		sceneFile.flush();
	}

	/**
	 * カメラ、光源、ダイアグラムのステージを定義する
	 * @throws IOException
	 */
	protected void writeStage() throws IOException {
		final String DEFVAR = "#declare %s = " + COORDINATE + ";" + CR;
		double stageX = stage.getCenterX() + 64;
		double stageY = stage.getCenterY()/2 - stage.getMaxY() + 64;
		sceneFile.write(String.format(DEFVAR, "EYE", stageX, stageY, stageY - stageX));
		sceneFile.write(String.format(DEFVAR, "FOCUS", stageX, stageY, 0.0));
		sceneFile.write("camera { location EYE direction 1*z look_at FOCUS }" + CR);
		sceneFile.write(String.format("light_source { " + COORDINATE + " color White }" + CR, -1000.0, -1000.0, -3000.0));
		sceneFile.write("plane { z, 32.0 texture { PlaneTexture }}" + CR);
		sceneFile.flush();
	}

	/**
	 * ノード要素をマッピングする
	 * @throws IOException
	 */
	protected void writeNodes(int hierarchy, Point2D dpoint, double z) throws IOException {
		final String SCALE = " scale 24 ";
		for (INodePresentation node : nodes) {
			if(node.getType() != "Frame" && node.getType() != "Note" ) {
				Point2D point = nodePosition(node);
				sceneFile.write("object { " + povrayObject(node) + " rotate -x*90" + SCALE + translate(point) + " ");
				sceneFile.write("}" + CR);
				writeLabel(node);
				stage.add(node.getRectangle());
				sceneFile.flush();
				writeSubDiagram(++hierarchy, node);
			}
		}
	}

	protected Point2D nodePosition(INodePresentation node) {
		return new Point2D.Double(node.getRectangle().getCenterX(), node.getRectangle().getCenterY());
	}
	
	/**
	 * 振る舞い呼び出しアクション、サブマシン状態にサブダイアグラムを配置する
	 * ※pending : とりあえず、サブダイアグラムのPOVRayオブジェクトを呼び出すテンプレートをコメント出力する
	 * 				エディタで編集する
	 * 
	 * @param hierarchy
	 * @param node
	 * @throws IOException
	 */
	protected void writeSubDiagram(int hierarchy, INodePresentation node) throws IOException {
		Scene<T> subScene;
		IDiagram subdiagram = null;
		if(node.getType()=="CallBehaviorAction") {
			subdiagram = ((IAction) node.getModel()).getCallingActivity().getActivityDiagram();
		}else if(node.getType()=="SubmachineState") {
			subdiagram = ((IState) node.getModel()).getSubmachine().getStateMachineDiagram();
		}
		if(subdiagram != null) {
				sceneFile.write("// object { " + subdiagram.getName() + " scale 0.15 " + translate(node.getLocation(), -28.7 ) + " }" + CR);
				/*
				 * pending
				 */
//				subScene = new Scene<T>(subdiagram, sceneFile);
//				double hz = (hierarchy==0)?30.0:30-Math.pow(1.25, hierarchy);
//				subScene.writeDiagram(++hierarchy, node.getLocation(), hz);				
		}
		sceneFile.flush();
	}

	/**
	 * ノードのラベルを加工する
	 * @param node
	 * @throws IOException
	 */
	protected void writeLabel(INodePresentation node) throws IOException {
		final double scale = 16.0;
		final String SCALE = " scale <" + scale + ", " +  scale + ", 2> ";
		double labelShift = 36.0;
		if(!node.getType().contains("Initial") && !node.getType().contains("Final") && !node.getType().contains("Choice")) { // 名前が表示されない。デフォルトでついた名前を空にできない。
			double labelY = 0.0;
			int merginX = 0;
			for(String label: node.getLabel().split("\n")) {
				Point2D point = (Point2D)nodePosition(node).clone();
				if(merginX == 0) {
					merginX = label.getBytes().length*3;
				}
				point.setLocation(point.getX() - merginX, point.getY() + labelY + labelShift );
				sceneFile.write(" text { ttf \"msgothic.ttc\", \"" + label + "\", 1, 0" + SCALE + "texture { LabelTecture }"
					+ CR + translate(point, 32.0 - 2.0) + " }" + CR);
				labelY+= scale;
			}
		}
	}

	/**
	 * ノード要素の特定の型に対するPOVRayオブジェクトの型をマッピングする
	 * 特定のステレオタイプについてはそのステレオタイプに対するPOVRayオブジェクトの型をマッピングする
	 * 
	 * @param node
	 * @return
	 */
	protected String povrayObject(INodePresentation node) {
		IElement model = node.getModel();
		if(model != null) {
			List<String> types = Arrays.asList(model.getStereotypes());
			if(!types.isEmpty()) {
				if(types.contains("actor")) {
					return "Actor";
				}else if(types.contains("boundary")) {
					return "Boundary";
				}else if(types.contains("control")) {
					return "Control";
				}else if(types.contains("entity")) {
					return "Entity";
				}
			}			
		}
		return node.getType();
	}

	/**
	 * リンク要素をマッピングする
	 * astahダイアグラムのリンクのノードへの端点は使わない
	 * 
	 * @throws IOException
	 */
	protected void writeLinks() throws IOException {
		double lineRadius = 3.0;
		double z = 4;
		for (ILinkPresentation link : links) {
			INodePresentation source = link.getSource();
			INodePresentation target = link.getTarget();
			if(source.getType() != "Note" && target.getType() != "Note") {
				Point2D sourcep = nodePosition(source);
				Point2D targetp = nodePosition(target);
				sceneFile.write("// " + link.getType() + ":" + link.getLabel() + CR);
				if(sourcep.equals(targetp)) { // 始点と終点が同じであればリレーションは真円にする
					double torusRadius = 32.0;
					sourcep.setLocation(sourcep.getX(), sourcep.getY());
					sceneFile.write("torus { " + torusRadius + ", " + lineRadius + translate(sourcep, -torusRadius + z));
				}else {
					Point2D[] points = link.getPoints();
					sceneFile.write("sphere_sweep { linear_spline, " + points.length + ", " + CR); // 始点、終点の2点とpointsから最初と最後の2点を抜いた数の合計
					sceneFile.write(coordinate(sourcep, z) + ", " + lineRadius + CR); // 始点
					for(int i=1; i < points.length - 1; i++) { // pointsの最初と最後の値を使わない(ノードの端点)
						sceneFile.write(coordinate(points[i], z) + ", " + lineRadius + CR);
					}
					sceneFile.write(coordinate(targetp, z) + ", " + lineRadius + CR); // 終点
				}
				sceneFile.write("  texture { LinkTecture }" + CR);
				sceneFile.write("}" + CR);				
			}
		}

	}

	/**
	 * ダイアグラムのノード要素とリンク要素を抽出する
	 * 
	 * @throws InvalidUsingException
	 */
	protected void extractElement() throws InvalidUsingException {
		nodes = new ArrayList<INodePresentation>();
		links = new ArrayList<ILinkPresentation>();
		for(IPresentation presence: diagram.getPresentations()){
			if(presence instanceof INodePresentation) {
				nodes.add((INodePresentation)presence);
			}else if(presence instanceof ILinkPresentation) {
				links.add((ILinkPresentation)presence);
			}
		}
	}

	/**
	 * POVRayスクリプトのtranslate句を返す
	 * @param point
	 * @return
	 */
	protected String translate(Point2D point) {
		return translate(point, 0.0);
	}

	/**
	 * POVRayスクリプトのtranslate句を返す
	 * @param point
	 * @param z
	 * @return
	 */
	protected String translate(Point2D point, double z) {
		return " translate " + coordinate(point, z);
	}

	/**
	 * POVRayスクリプトのベクトル表記を返す
	 * @param point
	 * @return
	 */
	protected String coordinate(Point2D point) {
		return coordinate(point, 0.0);
	}
	
	/**
	 * POVRayスクリプトのベクトル表記を返す
	 * @param point
	 * @param z
	 * @return
	 */
	protected String coordinate(Point2D point, double z) {
		return String.format(COORDINATE, point.getX(), -point.getY(), z);
	}
}
