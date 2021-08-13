# povastah
A Tool of UML Diagram visualization by POVRay Scene Description Laungage
- クラス図
-- クラス継承階層を立体表現する
-- ロバストネス図表現対応(インスタンス仕様も含む)
- ステートマシン図
-- サブマシン状態をそのステートマシン図によって入れ子構造表現する
- アクティビティ図
-- 振る舞い呼び出しアクションをそのアクティビティ図によって入れ子構造表現する

## Demo

デモ用astahプロジェクト [examples/povastah.asta](https://github.com/chamosllc/povastah/tree/master/examples/povastah.asta)

##### クラス図
<table>
<thead><tr><th></th><th>astah</th><th>POVRay</th></tr></thead>
<tbody>
<tr><td>クラスとインタフェース</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%AF%E3%83%A9%E3%82%B9%E5%9B%B3/%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%A8%E3%82%A4%E3%83%B3%E3%82%BF%E3%83%95%E3%82%A7%E3%83%BC%E3%82%B9.jpg" width="96"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%82%AF%E3%83%A9%E3%82%B9%E3%81%A8%E3%82%A4%E3%83%B3%E3%82%BF%E3%83%95%E3%82%A7%E3%83%BC%E3%82%B9.png" width="240"></td></tr>

<tr><td>関連クラス</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%AF%E3%83%A9%E3%82%B9%E5%9B%B3/%E9%96%A2%E9%80%A3%E3%82%AF%E3%83%A9%E3%82%B9.jpg" width="240"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E9%96%A2%E9%80%A3%E3%82%AF%E3%83%A9%E3%82%B9.png" width="320"></td></tr>

<tr><td>ロバストネス図<br>with インスタンス仕様</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%AF%E3%83%A9%E3%82%B9%E5%9B%B3/%E3%83%AD%E3%83%90%E3%82%B9%E3%83%88%E3%83%8D%E3%82%B9%E5%9B%B3_%E3%82%A4%E3%83%B3%E3%82%B9%E3%82%BF%E3%83%B3%E3%82%B9.jpg" width="240"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%83%AD%E3%83%90%E3%82%B9%E3%83%88%E3%83%8D%E3%82%B9%E5%9B%B3_%E3%82%A4%E3%83%B3%E3%82%B9%E3%82%BF%E3%83%B3%E3%82%B9.png" width="320"></td></tr>

<tr><td>クラス継承階層</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%AF%E3%83%A9%E3%82%B9%E5%9B%B3/%E3%82%AF%E3%83%A9%E3%82%B9%E7%B6%99%E6%89%BF%E9%9A%8E%E5%B1%A4.jpg" width="240"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%82%AF%E3%83%A9%E3%82%B9%E7%B6%99%E6%89%BF%E9%9A%8E%E5%B1%A4.png" width="320"></td></tr>

<tr><td>クラス継承リンクグループ<br>→直接繋げてみた</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%AF%E3%83%A9%E3%82%B9%E5%9B%B3/%E3%82%AF%E3%83%A9%E3%82%B9%E7%B6%99%E6%89%BF%E3%82%B0%E3%83%AB%E3%83%BC%E3%83%97%E3%83%AA%E3%83%B3%E3%82%AF.jpg" width="240"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%82%AF%E3%83%A9%E3%82%B9%E7%B6%99%E6%89%BF%E3%82%B0%E3%83%AB%E3%83%BC%E3%83%97%E3%83%AA%E3%83%B3%E3%82%AF.png" width="320"></td></tr>
</tbody>
</table>

##### ユースケース図
<table>
<thead><tr><th></th><th>astah</th><th>POVRay</th></tr></thead>
<tbody>
<tr><td>ユースケース</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%83%A6%E3%83%BC%E3%82%B9%E3%82%B1%E3%83%BC%E3%82%B9%E5%9B%B3/%E3%83%A6%E3%83%BC%E3%82%B9%E3%82%B1%E3%83%BC%E3%82%B9.jpg" width="320"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%83%A6%E3%83%BC%E3%82%B9%E3%82%B1%E3%83%BC%E3%82%B9.png" width="320"></td></tr>
</tbody>
</table>

##### アクティビティ図
<table>
<thead><tr><th></th><th>astah</th><th>POVRay</th></tr></thead>
<tbody>
<tr><td>ライフサイクル</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%A2%E3%82%AF%E3%83%86%E3%82%A3%E3%83%93%E3%83%86%E3%82%A3%E5%9B%B3/%E3%83%A9%E3%82%A4%E3%83%95%E3%82%B5%E3%82%A4%E3%82%AF%E3%83%AB.jpg" width="320"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%83%A9%E3%82%A4%E3%83%95%E3%82%B5%E3%82%A4%E3%82%AF%E3%83%AB.png" width="320"></td></tr>
<tr><td>ムーブメント</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%A2%E3%82%AF%E3%83%86%E3%82%A3%E3%83%93%E3%83%86%E3%82%A3%E5%9B%B3/%E3%83%A0%E3%83%BC%E3%83%96%E3%83%A1%E3%83%B3%E3%83%88.jpg" width="320"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%83%A0%E3%83%BC%E3%83%96%E3%83%A1%E3%83%B3%E3%83%88.png" width="320"></td></tr>
<tr><td>ライフ<br>「ムーブメント」呼び出し</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%A2%E3%82%AF%E3%83%86%E3%82%A3%E3%83%93%E3%83%86%E3%82%A3%E5%9B%B3/%E3%83%A9%E3%82%A4%E3%83%95.jpg" width="120"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%83%A9%E3%82%A4%E3%83%95.png" width="320"></td></tr>
</tbody>
</table>

##### ステートマシン図
<table>
<thead><tr><th></th><th>astah</th><th>POVRay</th></tr></thead>
<tbody>
<tr><td>リスト画面<br>内部状態-横2</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%B9%E3%83%86%E3%83%BC%E3%83%88%E3%83%9E%E3%82%B7%E3%83%B3%E5%9B%B3/%E3%83%AA%E3%82%B9%E3%83%88%E7%94%BB%E9%9D%A2.jpg" width="320"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%83%AA%E3%82%B9%E3%83%88%E7%94%BB%E9%9D%A2.png" width="320"></td></tr>
<tr><td>エンティティ画面</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%B9%E3%83%86%E3%83%BC%E3%83%88%E3%83%9E%E3%82%B7%E3%83%B3%E5%9B%B3/%E3%82%A8%E3%83%B3%E3%83%86%E3%82%A3%E3%83%86%E3%82%A3%E7%94%BB%E9%9D%A2.jpg" width="320"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%82%A8%E3%83%B3%E3%83%86%E3%82%A3%E3%83%86%E3%82%A3%E7%94%BB%E9%9D%A2.png" width="320"></td></tr>
<tr><td>トップページ<br>(「エンティティ画面」呼び出し)</td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/povastah/%E3%82%B9%E3%83%86%E3%83%BC%E3%83%88%E3%83%9E%E3%82%B7%E3%83%B3%E5%9B%B3/%E3%83%88%E3%83%83%E3%83%97%E3%83%9A%E3%83%BC%E3%82%B8.jpg" width="320"></td>
<td><img src="https://raw.githubusercontent.com/chamosllc/povastah/master/examples/%E3%83%88%E3%83%83%E3%83%97%E3%83%9A%E3%83%BC%E3%82%B8.png" width="320"></td></tr>
</tbody>
</table>

## Requirement
実行環境
- [astah\* professinal, astah\* UML](https://astah.change-vision.com/ja/)
- [The Persistence of Vision Raytracer version 3.7](http://www.povray.org/)
- [AdaptOpenJDK jdk-8.0.292](https://adoptopenjdk.net/index.html)

ビルド環境
- [astah-plugin-SDK-1.5](https://astah.change-vision.com/files/plugin/astah-plugin-sdk-latest.zip)
	- [astah*プラグイン開発チュートリアル](https://astah.change-vision.com/ja/tutorial/plugin.html)
	- conf/settings.xmlを修正しないとastah-buildコマンドがエラーになる。
		- [Mavenのcentralリポジトリへのアクセス制限によるastah*プラグインSDKのエラー](https://ja.astahblog.com/2020/03/05/astah%e3%83%97%e3%83%a9%e3%82%b0%e3%82%a4%e3%83%b3sdk%e3%81%ab%e3%81%8a%e3%81%91%e3%82%8b%e3%83%aa%e3%83%9d%e3%82%b8%e3%83%88%e3%83%aa%e3%82%a2%e3%82%af%e3%82%bb%e3%82%b9%e6%99%82%e3%81%ae%e3%82%a8/)
	- astah-generate-projectコマンドでastah*プラグイン開発Mavenプロジェクトを生成した際のpom.xmlに`<systemPath>${astahPath}/astah-api.jar</systemPath>`の行がある。SDKのconf/settings.xmlで`${astahPath}`の値が定義されているが、pom.xmlに反映されていない。`astah-api.jar`をライブラリに追加するために、pom.xmlの`properites`に、`${astahPath}`の定義を加える必要がある。
	- Java環境がOracle JDK1.8の場合、astah* 8.4以降astah-launchコマンド実行で、Javaバージョンが合わず、-nojvchkオプションを加えろとダイアログが出て終了します。
	  - Oracle JDK1.8は、1.8.0_291が最終ですが、astah* 8.4はAdaptOpenJDK jdk-8.0.292以降を要求します。
	    1. AdaptOpenJDK jdk-8.0.292をインストールする。
	    2. 環境変数JAVA_HOMEをAdaptOpenJDKのインストールディレクトリに設定する。
	    3. 環境変数PATHに、"%JAVA_HOME%\bin"を設定する。

## Install
- [target/povastah-X.X-SNAPSHOT.jar](https://github.com/chamosllc/povastah/tree/master/target/povastah-1.1-SNAPSHOT.jar) をastahツールのインストールディレクトリ配下のpluginsディレクトリに配置する。
- [includes](https://github.com/chamosllc/povastah/tree/master/includes)配下のインクルードファイル"povastah.inc", "umlTexture.inc", "povastahParts.inc"をPOVRayのインクルードファイルディレクトリに配置する。

プラグインツール
- [ツール]→[画像出力]→[POVRayスクリプト]で、出力ディレクトリを指定する。

## Usage

1. astah*ツールを起動して、3DCG視覚化するダイアグラムを含むプロジェクトを開く。
2. プラグインツールで、POVRayスクリプトファイル(.pov)を作成する。
3. POVRayツールで。POVRayスクリプトファイル(.pov)を開いて、レンダリングする。


※UTF-8で日本語文字を含めて出力します。POVRayエディタはUTF-8に対応していないため、povastahで出力されたファイルを編集する際は、別途、UTF-8を扱えるテキストエディタを推奨します。