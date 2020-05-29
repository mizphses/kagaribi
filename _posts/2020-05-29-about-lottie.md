---
layout: post
title:  "Lottieで簡単WEBアニメーション"
tag:
    - blog
    - web-design
    - movie
    - tech
author: Fumi Ogawa
---

この記事ではLottieについて軽く紹介した後、使い方などもご紹介します。

# Lottieってなんだ

**[Lottie]('https://airbnb.design/lottie/')**という、AirBnB（大手民泊サイト）のアニメーション技術があります。jsonで書き出したものをlottie.js経由でユーザ側でレンダリングを行います。

僕はこういうのはAeとかで基本構想ムービーを作ってYouTubeから流したりゴリゴリCSS書いたりしてたのですが、Lottiは何がいいって、Aeからの直接書き出しに対応しています！！

トップページのこれ↓もLottieを使っているので、GitHubに上げてるjsonファイルを読みだして自動でレンダリングしています。
<div id="Lottie"></div>

これを表示するのに要したコードは次のJSコードだけです。

```js
  let lottieObj = lottie.loadAnimation({
    container: document.getElementById('Lottie'), 
    renderer: 'svg',
    loop: false,
    autoplay: true,
    path: 'path_to_top.json'
  });
```
（注）```path_to_top.json```はjsonファイルへのリンクです。urlでOK。

# どうやるん？
##### ① まずはAfterEffectsで適当なアニメーションを作ります。難しかったらLottieで調べたらいっぱいアニメーションが出てくるのでそれのjsonを持ってきてもいいと思います。

今回はシンプルなこういうアニメーションを作りました↓
<blockquote class="imgur-embed-pub" lang="en" data-id="BWpaND2"><a href="https://imgur.com/BWpaND2">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
（中身はテキストとシェイプレイヤー（長方形）のみ。）

※画像は使えないそうです。イラレはシェイプレイヤー化してください。僕の写真はベジェ化したものもあるのでそれを使う時もあります。

##### ② 次にBodymovinプラグインを入れます。

[ZXP Installer](https://aescripts.com/learn/zxp-installer/)をインストールします。

そして、プラグイン[Bodymovin](https://github.com/airbnb/lottie-web/blob/master/build/extension/bodymovin.zxp)をインストールします。ページの真ん中辺にDownloadとありますのでそれを押してダウンロードし、インストールしたZXP Installerを開いてドラッグ＆ドロップします。

画面に従ってインストールし、Aeの[ウィンドウ]＞[エクステンション]＞[Bodymovin]を開きます。

<img src="{{ '/assets/img/blog/lottie1/lottie1.png' | relative_url }}">

##### ③ 書き出しコンポを選んで設定をいじる

書き出すコンポジション（ここでは「コンポ1」）の横にある⚙Selectedを押します。そしてコンポ名の右にある緑の...を押して書き出し先を選びます。

そして上のRenderを押しま...

<p class="h1 serif">せん！！</p>

<div class="space"></div>

Aeからプラグインに書き出しを許可していないので、[編集]→[環境設定]→[スクリプトとエクスプレッション]で、**スクリプトによるファイルの書き込みとネットワークへのアクセスを許可**に✅を入れます。

<img src="{{ '/assets/img/blog/lottie1/lottie2.png' | relative_url }}">

そしたら、今度こそ

##### ④Renderを押してレンダリングします

したら、選んだフォルダーにdata.jsonなるファイルができているはずです。

あとはこれを任意の場所にアップロードして（[Lottie Files](https://lottiefiles.com/preview)がおすすめ）jsonのリンクを作ったら

サイトのjsに
```js
  let lottieObj = lottie.loadAnimation({
    container: document.getElementById('lottie'), 
    renderer: 'svg',
    loop: false,
    autoplay: true,
    path: 'path_to_data.json' //ここの"path_to_data.json"に取得したリンクを張る
  });
```
を仕込んで

```
<div class="lottie"></div>
```
をhtmlに書いたら完成です！

<div id="welcome" class="lottie-inpage"></div>
<small>３０秒くらいで一周します</small>

## まとめ
この記事ではLottieの使いかたをご紹介しました。どうやらLottieをつかってローディングアニメーションを作ったりもできるみたいです。決済のチェックマークなんかこれを使って実装するとかっこいいですよね。聞くところによると[約束のネバーランド](http://sp.shonenjump.com/j/sp_neverland/#/)もLottieを盛大に使って実装されてるようで。見た感じ「確かに」って思いました。

皆さんもLottieをつかってかっこいいアニメーションを導入しましょう！
