# Pythonの公式イメージを使用
FROM python:3.10-slim

# 作業ディレクトリを設定
WORKDIR /app

# 依存パッケージをインストール
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# アプリケーションのソースコードをコピー
COPY . .

# ポート8080を公開（Cloud Runの推奨ポート）
EXPOSE 8080

# アプリケーションの起動
CMD streamlit run --server.port 8080 --server.address 0.0.0.0 app.py 