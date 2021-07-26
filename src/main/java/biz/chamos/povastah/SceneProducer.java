package biz.chamos.povastah;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

import com.change_vision.jude.api.inf.exception.ProjectNotFoundException;
import com.change_vision.jude.api.inf.model.IActivityDiagram;
import com.change_vision.jude.api.inf.model.IClassDiagram;
import com.change_vision.jude.api.inf.model.INamedElement;
import com.change_vision.jude.api.inf.model.IStateMachineDiagram;
import com.change_vision.jude.api.inf.model.IUseCaseDiagram;
import com.change_vision.jude.api.inf.project.ModelFinder;
import com.change_vision.jude.api.inf.project.ProjectAccessor;

import biz.chamos.povastah.scene.ActivityDiagram;
import biz.chamos.povastah.scene.ClassDiagram;
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
		 */
		for(INamedElement diagram: accessor.findElements(new IUseCaseDiagramPicker())){
			try(OutputStreamWriter writer = createWriter(diagram, targetDirectory)) {
				(new UseCaseDiagram(projectName, (IUseCaseDiagram)diagram, writer)).produce();
			}
		}
		/**
		 * プロジェクト中のすべてのクラス図を出力する
		 */
		for(INamedElement diagram: accessor.findElements(new IClassDiagramPicker())){
			try(OutputStreamWriter writer = createWriter(diagram, targetDirectory)) {
				(new ClassDiagram(projectName, (IClassDiagram)diagram, writer)).produce();
			}
		}
		/*
		 * プロジェクト中のすべてのステートマシン図を出力する
		 */
		for(INamedElement diagram: accessor.findElements(new IStateMachineDiagramPicker())){
			try(OutputStreamWriter writer = createWriter(diagram, targetDirectory)) {
				(new StateMachineDiagram(projectName, (IStateMachineDiagram)diagram, writer)).produce();
			}
		}
		/*
		 * プロジェクト中のすべてのアクティビティ図を出力する
		 */
		for(INamedElement diagram: accessor.findElements(new IActivityDiagramPicker())){
			try(OutputStreamWriter writer = createWriter(diagram, targetDirectory)) {
				(new ActivityDiagram(projectName, (IActivityDiagram)diagram, writer)).produce();
			}
		}
	}

	protected OutputStreamWriter createWriter(INamedElement diagram, File directory)
			throws IOException {
		return new OutputStreamWriter(new FileOutputStream(directory + File.separator + diagram.getName() + FILE_EXT), "UTF-8");
	}
	
	/**
	 * ユースケース図検索条件
	 */
	protected class IUseCaseDiagramPicker implements ModelFinder {
	    public boolean isTarget(INamedElement namedElement) {
	        return namedElement instanceof IUseCaseDiagram;
	    }
	}

	/**
	 * クラス図検索条件
	 */
	protected class IClassDiagramPicker implements ModelFinder {
	    public boolean isTarget(INamedElement namedElement) {
	        return namedElement instanceof IClassDiagram;
	    }
	}

	/**
	 * ステートマシン図検索条件
	 */
	protected class IStateMachineDiagramPicker implements ModelFinder {
	    public boolean isTarget(INamedElement namedElement) {
	        return namedElement instanceof IStateMachineDiagram;
	    }
	}

	/**
	 * アクティビティ図検索条件
	 */
	protected class IActivityDiagramPicker implements ModelFinder {
	    public boolean isTarget(INamedElement namedElement) {
	        return namedElement instanceof IActivityDiagram;
	    }
	}
}
