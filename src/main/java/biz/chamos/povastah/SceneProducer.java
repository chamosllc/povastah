package biz.chamos.povastah;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

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
 * POVRay Scene Launguage Script
 *  astahダイアグラムの3DCG表現を出力する(POVRayシーン言語スクリプトファイルを出力する)
 *  
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 *
 * @param <T> ダイアグラムの型
 */
public class SceneProducer {
	protected ProjectAccessor accessor;
	protected File targetDirectory;
	final static protected String FILE_EXT = ".pov";

	public SceneProducer(ProjectAccessor accessor, File targetDirectory) throws IOException, ProjectNotFoundException {
		this.accessor = accessor;
		this.targetDirectory = targetDirectory;
	}

	/**
	 * プロジェクト内のダイアグラムをPOVRayシーン言語スクリプトへ変換する
	 * 
	 * @throws IOException
	 * @throws ProjectNotFoundException
	 */
	public void produceAll() throws ProjectNotFoundException, IOException {
		String projectName = accessor.getProject().getName();

		/*
		 * プロジェクト中のすべてのユースケース図を出力する
		 * IUseCaseDiagram
		 */
		for(INamedElement diagram: accessor.findElements(IUseCaseDiagram.class)){
			try(OutputStreamWriter writer = createWriter(diagram)) {
				(new UseCaseDiagram((IUseCaseDiagram)diagram, writer)).produce();
			}
		}
		/**
		 * プロジェクト中のすべてのクラス図を出力する
		 * IClassDiagram
		 */
		for(INamedElement diagram: accessor.findElements(IClassDiagram.class)){
			try(OutputStreamWriter writer = createWriter(diagram)) {
				(new ClassDiagram((IClassDiagram)diagram, writer)).produce();
			}
		}
		/*
		 * プロジェクト中のすべてのコミュニケーション図を出力する
		 * ICommunicationDiagram
		 */
		for(INamedElement diagram: accessor.findElements(ICommunicationDiagram.class)){
			try(OutputStreamWriter writer = createWriter(diagram)) {
				(new CommunicationDiagram((ICommunicationDiagram)diagram, writer)).produce();
			}
		}
		/*
		 * プロジェクト中のすべてのステートマシン図を出力する
		 * IStateMachineDiagram
		 */
		for(INamedElement diagram: accessor.findElements(IStateMachineDiagram.class)){
			try(OutputStreamWriter writer = createWriter(diagram)) {
				(new StateMachineDiagram((IStateMachineDiagram)diagram, writer)).produce();
			}
		}
		/*
		 * プロジェクト中のすべてのアクティビティ図を出力する
		 * IActivityDiagram
		 */
		for(INamedElement diagram: accessor.findElements(IActivityDiagram.class)){
			try(OutputStreamWriter writer = createWriter(diagram)) {
				(new ActivityDiagram((IActivityDiagram)diagram, writer)).produce();
			}
		}
	}

	/**
	 * POVRayシーン記述ファイルを作成する
	 * @param diagram
	 * @param directory
	 * @return POVRayシーン記述ファイル(.pov)
	 * @throws IOException
	 */
	protected OutputStreamWriter createWriter(INamedElement diagram)
			throws IOException {
		return new OutputStreamWriter(new FileOutputStream(targetDirectory + File.separator + diagram.getName() + FILE_EXT), "UTF-8");
	}
}
