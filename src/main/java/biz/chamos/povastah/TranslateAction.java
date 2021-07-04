package biz.chamos.povastah;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JFileChooser;
import javax.swing.JOptionPane;

import com.change_vision.jude.api.inf.AstahAPI;
import com.change_vision.jude.api.inf.exception.ProjectNotFoundException;
import com.change_vision.jude.api.inf.model.IActivityDiagram;
import com.change_vision.jude.api.inf.model.IClassDiagram;
import com.change_vision.jude.api.inf.model.IDiagram;
import com.change_vision.jude.api.inf.model.IModel;
import com.change_vision.jude.api.inf.model.INamedElement;
import com.change_vision.jude.api.inf.model.IStateMachineDiagram;
import com.change_vision.jude.api.inf.model.IUseCaseDiagram;
import com.change_vision.jude.api.inf.project.ModelFinder;
import com.change_vision.jude.api.inf.project.ProjectAccessor;
import com.change_vision.jude.api.inf.ui.IPluginActionDelegate;
import com.change_vision.jude.api.inf.ui.IWindow;

/**
 * POVRayシーン言語スクリプトファイルを出力するアクション
 * @author mashiro@chamos.biz
 * @since 2021/07/01
 *
 */
public class TranslateAction implements IPluginActionDelegate {
	final static protected String FILE_EXT = "pov";
	protected AstahAPI api;
	protected ProjectAccessor projectAccessor;
	protected List<IDiagram> diagrams;
	
	public Object run(IWindow window) throws UnExpectedException {
		diagrams = new ArrayList<IDiagram>();
	    try {
	        api = AstahAPI.getAstahAPI();
	        projectAccessor = api.getProjectAccessor();
	        IModel project = projectAccessor.getProject();

	        File directory = selectScriptOutputDirectory(window, project);
	        if(directory != null) {
		        povrayDiagram(projectAccessor, directory);
	        }
	    } catch (ProjectNotFoundException e) {
	    	/*
	    	 *  プロジェクトがないときメニューを選択できないようにするにはどうすればよいか
	    	 */
	        String message = "プロジェクトがありません";
			JOptionPane.showMessageDialog(window.getParent(), message, "Warning", JOptionPane.WARNING_MESSAGE); 
	    } catch (Exception e) {
	    	JOptionPane.showMessageDialog(window.getParent(), "Unexpected error has occurred.", "Alert", JOptionPane.ERROR_MESSAGE); 
	        throw new UnExpectedException();
	    }
	    return null;
	}

	/**
	 * プロジェクト内のダイアグラムをPOVRayシーン言語スクリプトへ変換する
	 * 
	 * @param accessor
	 * @param directory
	 * @throws IOException
	 * @throws ProjectNotFoundException
	 */
	protected void povrayDiagram(ProjectAccessor accessor, File directory) throws IOException, ProjectNotFoundException {
		String projectName = projectAccessor.getProject().getName();
		/*
		 * プロジェクト中のすべてのユースケース図を出力する
		 */
//		for(INamedElement diagram: accessor.findElements(new IUseCaseDiagramPicker())){
//			(new Scene<IUseCaseDiagram>(projectName, (IUseCaseDiagram)diagram, directory)).save();
//		}
		/**
		 * プロジェクト中のすべてのクラス図を出力する
		 */
		for(INamedElement diagram: accessor.findElements(new IClassDiagramPicker())){
			(new Scene<IClassDiagram>(projectName, (IClassDiagram)diagram, directory)).save();
		}
		/*
		 * プロジェクト中のすべてのステートマシン図を出力する
		 */
		for(INamedElement diagram: accessor.findElements(new IStateMachineDiagramPicker())){
			(new Scene<IStateMachineDiagram>(projectName, (IStateMachineDiagram)diagram, directory)).save();
		}
		/*
		 * プロジェクト中のすべてのアクティビティ図を出力する
		 */
		for(INamedElement diagram: accessor.findElements(new IActivityDiagramPicker())){
			(new Scene<IActivityDiagram>(projectName, (IActivityDiagram)diagram, directory)).save();
		}
	}

	/**
	 * 
	 * @param window
	 * @param project
	 * @return
	 * @throws ProjectNotFoundException
	 */
	protected File selectScriptOutputDirectory(IWindow window, IModel project) throws ProjectNotFoundException {
		JFileChooser fileChooser = new JFileChooser((new File(projectAccessor.getProjectPath()).getParent()));
		fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		fileChooser.setDialogTitle("POVRay出力");
		int state = fileChooser.showSaveDialog(window.getParent());
		if(state == JFileChooser.CANCEL_OPTION){
			JOptionPane.showMessageDialog(window.getParent(), "出力を取り消します");
		}else if(state == JFileChooser.ERROR_OPTION){
			JOptionPane.showMessageDialog(window.getParent(), "エラーが発生");
		}else {
			return fileChooser.getSelectedFile();
		}
		return null;
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
