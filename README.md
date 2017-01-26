# startrek_game

TinyBASICのオリジナル版スタートレック<br>
STARTREK.BAS<br>
STARTREK.TXT<br>

上記を多少読みやすく編集したテキスト(実行不可)<br>
STARTREK.BAS_Clarity.txt<br>

まずは移植し易いhsp3cl版を作る予定。<br>
STARTREK_hsp3cl　・・・移植中テキスト(basic→hsp命令の置き換えをする)<br>
startrek.hsp　・・・動作確認用ソース(実行しながらデバッグする)<br>
startrek.exe　・・・実行ファイル(Windows用)<br>
<br>
★TinyBasicとHSPの違いで注意するところ<br>
----------------------------------------<br>
①変数<br>
TinyBasicで使える変数はA～Z、配列変数は@(200)のみ。<br>
<br>
HSPでは変数、配列変数とも半角英字で任意の名称を付けられる。<br>
----------------------------------------<br>
②input命令<br>
<br>
TinyBasic<br>
　例)INPUT "文字" A<br>
<br>
※数値でなく英字を入力すると、その英字の変数値が代入される。<br>
　例) Y=999;INPUT "(Y/N)?"A　…　ここでYと入力すると変数AにはYの内容である999が入る。<br>
<br>
HSPCLではinput命令で文字表示できない。<br>
　例)input a,2,2<br>
----------------------------------------<br>
③マルチステートメントの区切り<br>
<br>
TinyBasicは";"　…　セミコロン<br>
<br>
HSPは":"　…　コロン<br>
----------------------------------------<br>
④goto, gosub命令<br>
<br>
TinyBasicの飛び先は行番号(変数可)。<br>
<br>
HSPはラベル。<br>
----------------------------------------<br>
⑤print命令<br>
<br>
TinyBasic<br>
　例)PRINT "文字",A,#3,B　…　変数Bの値は3桁で表示<br>
<br>
HSPCLでは書式指定できない。<br>
　例)mes "文字"+a<br>
<br>
またTinyBasicでは下記のように末尾にカンマを付けると改行しないが<br>
<br>
　PRINT "文字",<br>
<br>
HSPでは上記のようなことはできない。<br>
----------------------------------------<br>
⑥rnd命令<br>
<br>
TinyBasicでは発生値は1～32767らしい。<br>
　例)RND(8)だと1～8<br>
<br>
HSPでは発生値は0～2147483647と、0から始まる。<br>
　例)rnd(8)だと0～7になる。<br>
----------------------------------------<br>

