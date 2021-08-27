package biz.chamos.povastah;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.file.Files;
import java.nio.file.Paths;

import com.change_vision.jude.api.inf.exception.ProjectNotFoundException;
import com.change_vision.jude.api.inf.model.IActivityDiagram;
import com.change_vision.jude.api.inf.model.IClassDiagram;
import com.change_vision.jude.api.inf.model.ICommunicationDiagram;
import com.change_vision.jude.api.inf.model.INamedElement;
import com.change_vision.jude.api.inf.model.IStateMachineDiagram;
import com.change_vision.jude.api.inf.model.IUseCaseDiagram;
import com.change_vision.jude.api.inf.project.ProjectAccessor;

import biz.chamos.povastah.scene.ActivityDiagram;
import biz.chamos.povastah.scene.ClassDiagram;
import biz.chamos.povastah.scene.CommunicationDiagram;
import biz.chamos.povastah.scene.StateMachineDiagram;
import biz.chamos.povastah.scene.UseCaseDiagram;

/**
 * astah*ダイアグラムをPOVRayシーンに変換するプラグインツール
 *  
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 */
public class SceneProducer {
	final static protected String FILE_EXT = ".pov";
	protected ProjectAccessor accessor;
	protected File targetDirectory;
	protected String projectName;
	
	public SceneProducer(ProjectAccessor accessor, File targetDirectory) throws IOException, ProjectNotFoundException {
		this.accessor = accessor;
		this.projectName = accessor.getProject().getName();
		this.targetDirectory = targetDirectory;
	}

	/**
	 * ダイアグラムをPOVRayシーンとして描く
	 * 
	 * @throws IOException
	 * @throws ProjectNotFoundException
	 */
	public void produceAll() throws ProjectNotFoundException, IOException {
		/*
		 * すべてのクラス図を描く
		 * IClassDiagram
		 */
		for(INamedElement diagram: accessor.findElements(IClassDiagram.class)){
			try(OutputStreamWriter scene = createScene(diagram)) {
				(new ClassDiagram((IClassDiagram)diagram, scene)).produce();
			}
		}
		/*
		 * すべてのコミュニケーション図を描く
		 * ICommunicationDiagram
		 */
		for(INamedElement diagram: accessor.findElements(ICommunicationDiagram.class)){
			try(OutputStreamWriter scene = createScene(diagram)) {
				(new CommunicationDiagram((ICommunicationDiagram)diagram, scene)).produce();
			}
		}
		/*
		 * すべてのステートマシン図を描く
		 * IStateMachineDiagram
		 */
		for(INamedElement diagram: accessor.findElements(IStateMachineDiagram.class)){
			try(OutputStreamWriter scene = createScene(diagram)) {
				(new StateMachineDiagram((IStateMachineDiagram)diagram, scene)).produce();
			}
		}
		/*
		 * すべてのアクティビティ図を描く
		 * IActivityDiagram
		 */
		for(INamedElement diagram: accessor.findElements(IActivityDiagram.class)){
			try(OutputStreamWriter scene = createScene(diagram)) {
				(new ActivityDiagram((IActivityDiagram)diagram, scene)).produce();
			}
		}
		/*
		 * すべてのユースケース図を描く
		 * IUseCaseDiagram
		 */
		for(INamedElement diagram: accessor.findElements(IUseCaseDiagram.class)){
			try(OutputStreamWriter scene = createScene(diagram)) {
				(new UseCaseDiagram((IUseCaseDiagram)diagram, scene)).produce();
			}
		}
	}

	/**
	 * POVRayシーン記述ファイルを作成する
	 * @param diagram
	 * @param directory
	 * @return POVRayシーン記述ファイル(.pov)
	 */
	protected OutputStreamWriter createScene(INamedElement diagram) throws IOException {
		String filename = targetDirectory + File.separator + projectName + File.separator + diagram.getFullNamespace(File.separator);
		Files.createDirectories(Paths.get(filename));
		filename += File.separator + diagram.getName() + FILE_EXT;
		return new OutputStreamWriter(new FileOutputStream(filename), "UTF-8");
	}
}
