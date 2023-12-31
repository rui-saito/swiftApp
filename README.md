# DIG4期生 顔当てゲームアプリ

このアプリは、顔と苗字を表示し、名前を4択でユーザーに当ててもらうゲームです。
顔と苗字から名前を正確に当てることが目標です。

## 使用技術

このアプリは、以下の技術を使用して開発されています。

- Swift: プログラミング言語として使用されました。
- Storyboard: UIデザインや画面遷移のために使用されました。

## 機能

### 1. 顔と苗字の表示
アプリは、ランダムに選ばれた顔と苗字の組み合わせを表示します。ユーザーは顔と苗字を見て名前を推測することが求められます。

### 2. 問題の生成
アプリは、27問の中からランダムに10問の問題を生成します。毎回異なる顔と苗字の組み合わせが出題されるため、飽きることなく楽しむことができます。問題はCSVファイルで管理しています。追加はお好みで可能です。

### 3. バックグラウンドでの音楽再生
アプリでは、バックグラウンドで音楽を再生することができます。プレイ中に音楽を楽しんだり、集中力を高めるために音楽を流すことができます。また、必要に応じて音楽の再生を停止することもできます。

### 4. スコアと結果画面
ユーザーが全ての問題に回答し終わると、スコア画面が表示されます。スコア画面では、以下の情報が表示されます。

- 正解数: ユーザーが正しく回答した問題の数が表示されます。
- 結果メッセージ: 正解数に応じて、結果画面で表示されるメッセージが変動します。正解数が高いほど、より良い結果メッセージが表示されます。
- 効果音: 結果画面では、正解数に応じて特定の効果音が流れます。正解数が多い場合には喜びの効果音が流れ、正解数が少ない場合には悲しい効果音が流れます。

ユーザーはスコア画面で自分の成績を確認することができます。正解数に応じて効果音やメッセージが変化することで、ゲームの結果を楽しく共有することができます。

## インストールと実行方法

以下の手順に従って、アプリをインストールして実行してください。

1. リポジトリをクローンするか、ZIPファイルをダウンロードして解凍します。
2. Xcodeを開き、プロジェクトを選択します。
3. プロジェクトをビルドします。
4. シミュレータまたは実機を選択し、アプリを実行します。

以上で、顔当てゲームアプリが正常にインストールされ、実行されます。ゲームをお楽しみください！

## 注意事項

- このアプリはSwiftとStoryboardを使用して開発されています。開発環境としてXcodeが必要です。
- バックグラウンドで音楽を再生するためには、デバイスの音量設定を適切に調整してください。


---
