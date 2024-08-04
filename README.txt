MOVをmp4にまとめて変換しよう

iPhoneで動画を撮るとMOV拡張子で動画が保存されるが，これではデータ量が大きくて大変なのでmp4拡張子に変換したい．
ただし，動画の本数が多くてQuikTimerみたいなやつで一本ずつ変換してると時間がかかって仕方がない．
そこで動画をまとめて変換する手法を簡単に実装してみた．
コードは
・MacbookAirのターミナル上
・テキストエディタはemacs
・brewも使う
・コードはChatGPT3.5産
を用いて作成した．
なお，参考にしたウェブサイトはhttps://qiita.com/hosota9/items/29f845854db2e4eeebc0とhttps://qiita.com/macintoshi/items/c29cba16367bd0b5346bである．

1．ffmpegを導入する
拡張子を変換するソフトを導入する．
brew install ffmpeg
を実行する．

2．コードを作成する
ChatGPTに「ffmpegを使って複数のMOVファイルをそれぞれmp4ファイルに変換し，新たなフォルダに保存するサンプルコードを書いてください」と指示を出す．

結果例
#!/bin/bash

# 変換元のMOVファイルが存在するディレクトリへ移動する
cd /path/to/your/MOV/files

# 出力先のディレクトリを指定する
output_dir="/path/to/your/output/directory"

# 変換するMOVファイルのリストを作成する
mov_files=$(ls *.mov)

# 各MOVファイルをMP4に変換して出力先ディレクトリに保存する
for file in $mov_files
do
    # 出力ファイル名を定義する（.movを.mp4に変更）
    output_file="$output_dir/$(echo $file | sed 's/.mov$/.mp4/g')"

    # 変換コマンドを実行する
    ffmpeg -i "$file" -c:v libx264 -preset medium -crf 23 -c:a aac -b:a 128k "$output_file"
done

3．実行する
./Convertと入力する

以上，大雑把な手順でした！
by riku.sato@cps.akita-pu.ac.jp
