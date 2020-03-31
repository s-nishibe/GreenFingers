# GreenFingers

## サイト概要
植物が好きな人が集まって、育て方に関する情報交換をしたり、観察日記を共有したりできるサービスです。
1000文字程度までのミニブログ・写真投稿機能、それに対するコメント機能、フォロー機能を実装予定。
いいねにあたる機能を、色々なアイコンを選べるスタンプ機能のようなものにしたいと思っています。
コメント・スタンプはそれぞれAjaxで非同期通信を行いたいと考えています。
投稿に「低木」「高木」「野菜」「一年草」といったタグ付けを行い、ジャンル検索できるようにする予定です。後ほどこの機能はAIで自動化できるかと思います。
記事のタイトル・文中に含まれる単語でのキーワード検索、ユーザー検索機能も付けたいですが、進捗次第でカットするかも知れません。
画像を判別して何の植物か当てる機能をAIで搭載してみたいと考えていますが、1ヶ月で作りきれるか調査が必要です。

### サイトテーマ
植物を育てる人のための情報共有サイト

### テーマを選んだ理由
趣味で花を育てて20年以上になるものの、同じ趣味の人がネット上でつながれるサービスがないなと感じていたため。
個々でブログを持っている人は散見されますが、ブログは参入のハードルが高いと感じる人も多いかと思います。
決して数は多くないと思われますが、「園芸が好きだけれど、趣味について語り合える仲間はいない」若年層を日本全国から集めたら、それなりのコミュニティができるのではないか。
かつての私がそうであったように、花々と毎日を暮らす素晴らしい趣味を持っているのに、周囲に仲間がいないことで趣味に引け目を感じたり、孤独を抱えたりしている人達が楽しめる場所を提供したい。
そのような思いから、このサービスを始めることを決めました。ちなみに今も私には園芸仲間が一人もいません。


### ターゲットユーザ
花が好きで育てている20～30代の人（恐らく少数派です）。農家として専門的に植物に携わっている人、その他の年代の人ももちろん歓迎。

### 主な利用シーン
花の育て方に関して、誰かに意見を聞いてみたいと思った時。
同じく園芸を趣味にする仲間と、花について語りたい時。

## 設計書

### 機能一覧
https://docs.google.com/spreadsheets/d/1P-rThENpArI9mimByuh7o2GfnGNTTIZGmUM6Ge0fQ5U/edit#gid=0

