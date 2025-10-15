# dotfilesの構成

---

- home
    - `$HOME`にあるファイルを置いておく
    - 管理のためドットを取り除いて保持する

- config
    - `$XDG_CONFIG_HOME`にあるファイルを置いておく
    - `$XDG_CONFIG_HOME`内の階層を維持する

- homebrew
    - `brew dump`で得られたインストールパッケージ情報を置いておく

- bin|script
    - 構築スクリプトを置いておく
        - シンボリックリンクを作成する
        - 必要なパッケージをインストールする

---

## パッケージ管理されていないもの

    - rustup
        - cargo-edit
        - cargo-make
        - cargo-llvm-cov
        - cargo-update
        - cargo-watch
        - create-tauri-app
        - evcxr_jupyter
        - hyperfine
        - rustlings
        - tauri-cli
        - workshop-runner
    - homebrew
        - xcode command line tool (xcode-select install)
        - アンインストール
            - % /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
        - インストール
            - % /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    - vscode
    - macvim *
    - iterm2
    - fontforge *
    - google ime
    - alfred
    - presbutan
    - scroll reverser *
    - geek tools
    - sportify
    - vlc
    - IINA
    - feedly
    - evernote

    - ブラウザ
        - Opera
        - Chrome
        - Firefox
            - ブックマーク
            - 拡張機能
            - パスワード関連



