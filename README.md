# tinyhsp tiny版
<pre>
MIT license
https://github.com/YukinobuKurata/YouTubeMagicBuyButton/blob/master/MIT-LICENSE.txt

dolphilia版TinyHSPから input、mes命令、オプション機能などを削りシェイプアップしたものです。

https://github.com/dolphilia/tinyhsp

[コンパイル方法]

(コンソールアプリケーション)
g++ tinyhsp.cpp -o tinyhsp -std=gnu++11 -lglfw3dll -lopengl32

(Windowsアプリケーション)
g++ tinyhsp.cpp -o tinyhsp -std=gnu++11 -lglfw3dll -lopengl32 -mwindows

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

stat
cnt
refval
refstr
mousex	マウスのx座標
mousey	マウスのy座標
mousel	マウスの左ボタンが押されていれば1、押されていなければ0
mouser	マウスの右ボタンが押されていれば1、押されていなければ0

命令、関数、システム変数をあわせて40個に満たない、まさにタイニーなプログラム言語となっています。
こんなんで一体何が作れるんでしょう？　マ、色々やってみましょう(ﾟーﾟ)σビシッ
</pre>
