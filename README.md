# 実行手順
## 0. 事前準備
### 0.1. ログイン確認
gitpod起動時、プロンプトの先頭にvenv名が表示されることを確認する  

(表示例)
```bash
(venvERC20) gitpod /workspace/erc20-brownie (main) $
```

### 0.2. 自動インストールされたパッケージの確認
- pythonの確認  
```python
python -V
```
(表示例)

```
Python 3.8.13
```
pythonのバージョンはなんでもok  

- pythonの実行元ファイルパス確認  
```bash
which python
```
(実行例)
```
/home/gitpod/venvERC20/bin/python
```

venvERC20配下のbinから実行されていることを確認  

- brownieの確認  
```python
pip list installed | grep -i brownie
```

## 1. テスト環境のデプロイ
### 1.1. プライベートチェーンネットワークの構築
```bash
ganache-cli
```
### 1.2. サンプルトークンの実装
- gitpodのターミナルウィンドウの[Split Terminal]アイコンをクリックする  

- 新しく開いたウィンドウで下記コマンド実行してサンプルトークンをデプロイする
```bash
brownie run ./scripts/2_deploy_easy_token.py
```

