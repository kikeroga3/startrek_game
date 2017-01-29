# startrek_dish

マスターブランチで作った「startrek.hsp」を元にHSP3Dish版を作る！<br>
<br>
しまくろねこさんの超便利モジュール「mod_smart」を使用させていただく。<br>
https://sites.google.com/site/simakuroneko/<br>
<br>
■ビルド環境<br>
--------------------------------------------<br>
HSP3.5β (HSP3Dish Helper 1.41)<br>
android-ndk r10d<br>
android-sdk platforms(android-10)<br>
apache-ant 1.9.4<br>
jdk1.6.0_35<br>
--------------------------------------------<br>
<br>
2017.01.26<br>
Windowsでは動くようになったが、Androidでは62行目のabs命令で落ちるようだ。<br>
対策検討中。誰ぞ、良い策はないか？<br>
<br>
2017.01.28<br>
最新のhsp3cnv.exeにしたらAndroidで落ちなくなった。<br>
---<br>
あと、Androidで画面がおかしくなるのは、作り方に問題がありました。<br>
Windowsではboxf命令等で画面の一部をクリアした場合、他の部分を残したままredrawを行なうことができますが、<br>
AndroidやiOSだとバッファリングの環境などにより正しく動作しないという仕様の違いがあるので、<br>
必ず、画面上すべてをフレームごとに描画するようにしないといけない。<br>
---<br>
Android画面の上下(320x480の範囲外)におかしな画面コピーがなされる不具合は<br>
setcls 0,0とかsetreq SYSREQ_CLSMODE,0を外したらなおりました。<br>
---<br>

