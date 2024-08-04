AOA#!/bin/bash

# 変換元のMOVファイルが存在するディレクトリへ移動する
cd /Users/riku/else/MOV_to_mp4/input

# 出力先のディレクトリを指定する
output_dir="/Users/riku/else/MOV_to_mp4/output"

# 変換するMOVファイルのリストを作成する
mov_files=$(ls *.MOV)

# 各MOVファイルをMP4に変換する
for file in $mov_files
do
    # 出力ファイル名を定義する（.movを.mp4に変更）
	output_file="$output_dir/$(echo $file | sed 's/.MOV$/.mp4/g')"


    # 変換コマンドを実行する
    ffmpeg -i "$file" -c:v libx264 -preset medium -crf 23 -c:a aac -b:a 128k "$output_file"
done
