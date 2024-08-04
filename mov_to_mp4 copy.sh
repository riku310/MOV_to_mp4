#!/bin/bash
#
# mov_to_mp4.sh
#
# author: riku310
# date: 2024.8.4
# memo:
#   Movファイルをmp4ファイルに変換する
#   1) ”inpt"というディレクトリを作成する
#   2) 拡張子がMOVのファイルをinputディレクトリに置く
#   3) ./mov_to_mp4.shを実行する
#

# ディレクトリの指定
dir_input='input'
dir_output='output'

# 出力ディレクトリの作成
mkdir output

# 変換するmovファイルのリストを作成する
cd ${dir_input}; mov_files=$(ls *.MOV); cd ..

# 各MOVファイルをMP4に変換する
for mov_file in ${mov_files}
do
    # 出力ファイル名を定義する（.movを.mp4に変更）
	file_input="${dir_input}/${mov_file}"
	mp4_file="$(echo ${mov_file} | sed 's/.MOV$/.mp4/g')"
	file_output="${dir_output}/${mp4_file}"
	echo "${file_input} -> ${file_output}"

    # 変換コマンドを実行する
    ffmpeg -i "${file_input}" \
		   -c:v libx264 -preset medium -crf 23 -c:a aac -b:a 128k \
		   "${file_output}"
done
