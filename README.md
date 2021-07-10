# povastah
##### A Tool of UML Diagram visualization by POVRay Scene Description Laungage

実行環境
- [astah\* professinal, astah\* UML](https://astah.change-vision.com/ja/)
- [The Persistence of Vision Raytracer version 3.7](http://www.povray.org/)

ビルド環境
- [astah-plugin-SDK-1.5](https://astah.change-vision.com/files/plugin/astah-plugin-sdk-latest.zip)

インストール
- "target/povastah-X.X-SNAPSHOT.jar" をastahツールのインストールディレクトリ配下のpluginsディレクトリに配置する。
- "includes"配下のインクルードファイル"astahuml.inc", "child.inc", "wheel.inc"をPOVRayのインクルードファイルディレクトリに配置する。

プラグインツール
- [ツール]→[画像出力]→[POVRayスクリプト]で、出力ディレクトリを指定する。

利用方法
1. astah*ツールを起動して、3DCG視覚化するダイアグラムを含むプロジェクトを開く。
2. プラグインツールで、POVRayスクリプトファイル(.pov)を作成する。
3. POVRayツールで。POVRayスクリプトファイル(.pov)を開いて、レンダリングする。

※UTF-8で日本語文字を含めて出力します。POVRayエディタはUTF-8に対応していないため、povastahで出力されたファイルを編集する際は、別途、UTF-8を扱えるテキストエディタを利用します。