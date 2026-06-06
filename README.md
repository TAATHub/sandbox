# Sandbox 🧪

SwiftUI でいろいろな面白実装を試すための、最小構成のサンプルアプリ。

サンプル画面を 1 つずつ足しながら、アニメーションや描画を気軽に試せる土台です。

## 動作環境

- iOS 18.0+（iPhone・縦向き専用）
- Xcode 16 以降

## ビルド

```bash
open Sandbox.xcodeproj
# または
xcodebuild -project Sandbox.xcodeproj -scheme Sandbox \
  -destination 'platform=iOS Simulator,name=iPhone 17' \
  CODE_SIGNING_ALLOWED=NO build
```

## 構成

```
Sandbox/
  SandboxApp.swift      # @main → RootScreen
  AppScreen.swift       # 全画面を一元管理する enum
  RootScreen.swift      # 一覧：NavigationStack + List + NavigationLink + zoom遷移
  RootCell.swift        # 一覧の1行（サムネ + matchedTransitionSource）
  DetailScreen.swift    # 詳細：選択された画面の本体を表示
  Screens/
    CounterScreen.swift
    GradientScreen.swift
    WaveTextScreen.swift
```

## 画面遷移フロー

```
SandboxApp
  └─ RootScreen
       └─ NavigationStack
            └─ List(AppScreen.allCases)
                 └─ NavigationLink {
                        DetailScreen(screen:)
                          .navigationTransition(.zoom(sourceID:in:))
                    } label: {
                        RootCell  ← .matchedTransitionSource(id:in:)
                    }
```

一覧の行をタップ → サムネイルが拡大しながら `DetailScreen` が全画面プッシュ → 戻ると縮小、という 1 カラムのドリルダウン型遷移です。

## 画面の追加手順

1. `Screens/` に `FooScreen.swift` を追加（`struct FooScreen: View`）
2. `AppScreen` に `case foo` を追加
3. `title` / `subtitle` / `thumbnail` / `destination` の各 `switch` に `foo` の分岐を足す
