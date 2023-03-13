# 実行手順
## 0. 事前準備
### 0.1. ログイン確認

下記URLにアクセス(対象のgithubリモートリポジトリの先頭に```gitpod.io/#```を付ける)  

```
gitpod.io/#https://github.com/TIwase/erc20-brownie
```
gitpod起動時、プロンプトの先頭にvenv名が表示されることを確認する  

(表示例)
```bash
(venvERC20) gitpod /workspace/erc20-brownie (main) $
```
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/TIwase/erc20-brownie)  

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

## 1. Ganacheへのデプロイ
### 1.1. プライベートチェーンネットワークの構築
```bash
ganache-cli
```
(表示例)

> Ganache CLI v6.12.2 (ganache-core: 2.13.2)
> 
> Available Accounts  
> \==================  
> (0) 0x95f71908A1f46BFaD161E67b1c1F6842f16272eD (100 ETH)  
> (1) 0xB74833844ffF7710375aa268455378b5A8b48bf1 (100 ETH)  
> (2) 0x72AEf1Aa99c1ce2c9F3DE60BeFEe65d13aa69880 (100 ETH)  
> (3) 0x5d82242732DA8e8c5f52773579EA7d150495Ea23 (100 ETH)  
> (4) 0xc30b168A3b787be83126C7C90fb0F807F61757d7 (100 ETH)  
> (5) 0x47855448A8D2F893aB3E20DD4924578d522bF016 (100 ETH)  
> (6) 0xBb8A0Ee62453d3a271189549f7B0C27B66c15F97 (100 ETH)  
> (7) 0xEcca43f5343D330119b8e6cA6e076dF5E4CAC9f8 (100 ETH)  
> (8) 0xc2BdCBBF532e560f8457F147374d07C8D57a0174 (100 ETH)  
> (9) 0x12b0ec3AF185315B977ce7Fdd9583b255D2F3Dc2 (100 ETH)  
> 
> Private Keys  
> \==================  
> (0) 0x7adda0827d7d3e93a43f90d5720cb8bb3988f9219f1f95f9fcdca00d54154078  
> (1) 0xf7489a2aee6328a70766a9e4292ee45403349705bea677658488bc9f68cb9918  
> (2) 0xf929db7ed9ca4e288567883a4d518e084890ff232257c32e558fc72b0cc4c7e0  
> (3) 0xd61d4c63259e41cd304be5e5bedb18bca476feb85cf71e1721f5e330cad49779  
> (4) 0xef43d08238e2446ff1e4d568eaa58c5e1b1718399e706ee028c4485216340002  
> (5) 0x86560414603afd8fd38c1267896381e70cbe32cf9cf3eda859195fb93ad5220b  
> (6) 0xe520689a9060f3df3f0f1613d5e5e58851f47399e73724e27bbac6d0893e806e  
> (7) 0x43e1fe8404b08fa10085eabc645712a700ca0c32025a48c78ad84c00abe2b1aa  
> (8) 0x7240a9d25dd2796a764c0f4950552fde55ef7eefbcec81bfc94fb1bc3f13efc1  
> (9) 0xb762a74d3efc03c27e9a316b0425011bed98195a97ceeadabe58543e8cde8ea7  
> 
> HD Wallet  
> \==================  
> Mnemonic:      cross bubble state method bullet drop swap april design  
> roast   > cancel panic  
> Base HD Path:  m/44'/60'/0'/0/{account_index}  
> 
> Gas Price  
> \==================  
> 20000000000  
> 
> Gas Limit  
> \==================  
> 6721975  
> 
> Call Gas Limit  
> \==================  
> 9007199254740991  
>
> Listening on 127.0.0.1:8545


### 1.2. サンプルトークンのデプロイ
- gitpodのターミナルウィンドウの[Split Terminal]アイコンをクリックする  

- 新しく開いたウィンドウで下記コマンド実行してサンプルトークンをデプロイする
```bash
brownie run ./scripts/2_deploy_easy_token.py
```
(実行例)
> 中略...  
> Erc20BrownieProject is the active project.  
> Attached to local RPC client listening at '127.0.0.1:8545'...  
>   
> Running 'scripts/2_deploy_easy_token.py::main'...  
> Transaction sent: >   0x6d3dfb820060d448cd89de73fc6bbef7106915357c8a9d1fe9e29c02de613104  
>   Gas price: 0.0 gwei   Gas limit: 6721975   Nonce: 0  
>   EasyToken.constructor confirmed   Block: 1   Gas used: 633481 (9.42%)  
>   EasyToken deployed at: 0x4866F7f17fe1C6CaB813a52e1717Db8780106B0d  

## 2. Goerliへのトークンのデプロイ
### 2.0. 事前準備
下記URLにアクセスしてGoerli ETHをmintして貰う
```
https://goerlifaucet.com/
```

以下、手順2.1あるいは2.2どちらかを実行する

### 2.1a. ディレクトリ移動
```bash
cd <your project path>
```
### 2.1b. コンソールの起動
```bash
brownie console --network goerli
```
### 2.1c. 秘密鍵の設定
```bash
accounts.add('YOUR_PRIVATE_KEY')
```
※YOUR_PRIVATE_KEYに値を代入

### 2.1d. サンプルトークンのデプロイ
```bash
erc20 = EasyToken.deploy({"from": accounts[0]})
```

### 2.2. サンプルトークンのデプロイ
※上記手順2.1を実施済なら本手順はスキップ
```bash
brownie run ./scripts/2_deploy_easy_token.py --network goerli
```
