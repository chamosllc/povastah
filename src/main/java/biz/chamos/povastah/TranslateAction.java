package biz.chamos.povastah;

import java.io.File;

import javax.swing.JFileChooser;
import javax.swing.JOptionPane;

import com.change_vision.jude.api.inf.AstahAPI;
import com.change_vision.jude.api.inf.exception.ProjectNotFoundException;
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
	protected AstahAPI api;
	
	public Object run(IWindow window) throws UnExpectedException {
	    try {
	        api = AstahAPI.getAstahAPI();
	        ProjectAccessor projectAccessor = api.getProjectAccessor();
	        File directory = selectScriptOutputDirectory(window, projectAccessor.getProjectPath());
	        if(directory != null) {
		        new SceneProducer(projectAccessor, directory).produceAll();
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
	 * POVRayシーン記述ファイルを出力するディレクトリを指定する
	 * @param window
	 * @param project
	 * @return 出力先ディレクトリパス
	 * @throws ProjectNotFoundException
	 */
	protected File selectScriptOutputDirectory(IWindow window, String projectPath) throws ProjectNotFoundException {
		JFileChooser fileChooser = new JFileChooser((new File(projectPath).getParent()));
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

}
