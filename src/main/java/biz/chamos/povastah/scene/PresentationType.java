package biz.chamos.povastah.scene;

public enum PresentationType {
	// Diagram
	Frame("フレーム", Diagram.class, true, false),
	Note("ノート", Diagram.class, true, false),
	Text("テキスト", Diagram.class, true, false),
	Rectangle("長方形", Diagram.class, true, false),
	Oval("楕円", Diagram.class, true, false),
	Image("画像", Diagram.class, true, false),
	Line("直線", Diagram.class, false, false),
	FreeHand("フリーハンド", Diagram.class, false, false),
	
	// ClassDiagram
	Class("クラス", ClassDiagram.class, true, true),
	Containment("ネスト", ClassDiagram.class, true, false),
	
	AssociationClass("関連クラス", ClassDiagram.class, true, false),
	Package("パッケージ ", ClassDiagram.class, true, false),
	Subsystem("サブシステム", ClassDiagram.class, true, false),
	StructuredClass("構造化クラス", ClassDiagram.class, true, false);
	
	private String label;
	private Class diagram;
	private boolean type; // Node: true, Link: false
	private boolean include;
	
	private PresentationType(String label, Class diagram, boolean type, boolean include) {
		this.label = label;
		this.diagram = diagram;
		this.type = type;
		this.include = include;
	}

	public String getLabel() {
		return label;
	}

	public Class getDiagram() {
		return diagram;
	}

	public boolean isNode() {
		return type;
	}
	
	public boolean isInclude() {
		return include;
	}
}
