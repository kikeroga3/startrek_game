# tinyhsp tiny版
<pre>
dolphilia版TinyHSPから input、mes命令、オプション機能などを削りシェイプアップしたものです。
使い方や導入方法など、もしこのページで不足のものがあったら下記ページも確認してみてください。

https://github.com/dolphilia/tinyhsp

[命令]

wait
stop
title
pset
line
boxf
redraw
pos
color
stick
end
return
goto
gosub
repeat
loop
continue
break
if
else
dim
ddim
sdim
randomize

[関数]

int
double
str
rnd
abs

[システム変数]

stat	命令や関数実行後のステータス(整数値)が格納される
refdval	実数型の戻り値はstatではなくrefdvalに格納される
refstr	文字列方の戻り値が格納される
cnt	repeat-loopのカウンタ値
mousex	マウスのx座標
mousey	マウスのy座標
mousel	マウスの左ボタンが押されていれば1、押されていなければ0
mouser	マウスの右ボタンが押されていれば1、押されていなければ0

命令、関数、システム変数の使い方は本家のHSPとほぼ同じですが、
全部あわせても40個に満たない、まさにタイニーなプログラム言語となっています。
こんなんで一体何ができるんでしょう？　マ、色々やってみましょう(ﾟーﾟ)σビシッ

[ソースのコンパイル方法のメモ]
MinGW(gcc)とGLFW3で開発環境をつくって以下コマンドでコンパイルします。

(コンソールアプリケーション生成)
g++ tinyhsp.cpp -o tinyhsp -std=gnu++11 -lglfw3dll -lopengl32

(Windowsアプリケーション生成)
g++ tinyhsp.cpp -o tinyhsp -std=gnu++11 -lglfw3dll -lopengl32 -mwindows

[MIT license]
https://github.com/YukinobuKurata/YouTubeMagicBuyButton/blob/master/MIT-LICENSE.txt
</pre>
