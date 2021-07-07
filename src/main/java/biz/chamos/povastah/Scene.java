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

/**
 * POVRay Scene Launguage Script
 *  astahダイアグラムの3DCG表現を出力する(POVRayシーン言語スクリプトファイルを出力する)
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 *
 * @param <T> ダイアグラムの型
 */
public class Scene {
	protected ProjectAccessor accessor;
	protected File targetDirectory;
	final static protected String FILE_EXT = ".pov";

	public Scene(ProjectAccessor accessor, File targetDirectory) throws IOException, ProjectNotFoundException {
		this.accessor = accessor;
		this.targetDirectory = targetDirectory;
	}

	/**
	 * プロジェクト内のダイアグラムをPOVRayシーン言語スクリプトへ変換する
	 * 
	 * @throws IOException
	 * @throws ProjectNotFoundException
	 */
	public void povrayDiagrams() throws ProjectNotFoundException, IOException {
		String projectName =accessor.getProject().getName();
		/*
		 * プロジェクト中のすべてのユースケース図を出力する
		 */
		for(INamedElement diagram: accessor.findElements(new IUseCaseDiagramPicker())){
			(new UseCaseDiagram(projectName, (IUseCaseDiagram)diagram, createWriter(diagram, targetDirectory))).save();
		}
		/**
		 * プロジェクト中のすべてのクラス図を出力する
		 */
		for(INamedElement diagram: accessor.findElements(new IClassDiagramPicker())){
			(new ClassDiagram(projectName, (IClassDiagram)diagram, createWriter(diagram, targetDirectory))).save();
		}
		/*
		 * プロジェクト中のすべてのステートマシン図を出力する
		 */
		for(INamedElement diagram: accessor.findElements(new IStateMachineDiagramPicker())){
			(new StateMachineDiagram(projectName, (IStateMachineDiagram)diagram, createWriter(diagram, targetDirectory))).save();
		}
		/*
		 * プロジェクト中のすべてのアクティビティ図を出力する
		 */
		for(INamedElement diagram: accessor.findElements(new IActivityDiagramPicker())){
			(new ActivityDiagram(projectName, (IActivityDiagram)diagram, createWriter(diagram, targetDirectory))).save();
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
