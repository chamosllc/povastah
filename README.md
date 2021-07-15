# povastah
A Tool of UML Diagram visualization by POVRay Scene Description Laungage

## Requirement
実行環境
- [astah\* professinal, astah\* UML](https://astah.change-vision.com/ja/)
- [The Persistence of Vision Raytracer version 3.7](http://www.povray.org/)

ビルド環境
- [astah-plugin-SDK-1.5](https://astah.change-vision.com/files/plugin/astah-plugin-sdk-latest.zip)
	- [astah*プラグイン開発チュートリアル](https://astah.change-vision.com/ja/tutorial/plugin.html)
	- conf/settings.xmlを修正しないとastah-buildコマンドがエラーになる。
		- [Mavenのcentralリポジトリへのアクセス制限によるastah*プラグインSDKのエラー](https://ja.astahblog.com/2020/03/05/astah%e3%83%97%e3%83%a9%e3%82%b0%e3%82%a4%e3%83%b3sdk%e3%81%ab%e3%81%8a%e3%81%91%e3%82%8b%e3%83%aa%e3%83%9d%e3%82%b8%e3%83%88%e3%83%aa%e3%82%a2%e3%82%af%e3%82%bb%e3%82%b9%e6%99%82%e3%81%ae%e3%82%a8/)
	- astah-generate-projectコマンドでastah*プラグイン開発Mavenプロジェクトを生成した際のpom.xmlに`<systemPath>${astahPath}/astah-api.jar</systemPath>`の行がある。SDKのconf/settings.xmlで`${astahPath}`の値が定義されているが、pom.xmlに反映されていない。`astah-api.jar`をライブラリに追加するために、pom.xmlの`properites`に、`${astahPath}`の定義を加える必要がある。

## Install
- "target/povastah-X.X-SNAPSHOT.jar" をastahツールのインストールディレクトリ配下のpluginsディレクトリに配置する。
- "includes"配下のインクルードファイル"astahuml.inc", "astahTexture.inc", "child.inc", "wheel.inc"をPOVRayのインクルードファイルディレクトリに配置する。

プラグインツール
- [ツール]→[画像出力]→[POVRayスクリプト]で、出力ディレクトリを指定する。

## Usage
1. astah*ツールを起動して、3DCG視覚化するダイアグラムを含むプロジェクトを開く。
2. プラグインツールで、POVRayスクリプトファイル(.pov)を作成する。
3. POVRayツールで。POVRayスクリプトファイル(.pov)を開いて、レンダリングする。

※UTF-8で日本語文字を含めて出力します。POVRayエディタはUTF-8に対応していないため、povastahで出力されたファイルを編集する際は、別途、UTF-8を扱えるテキストエディタを推奨します。