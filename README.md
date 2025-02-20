# streamlit-cloud-run

Streamlit を Cloud Run 上にデプロイする

## 起動

```
streamlit run app.py
```

## デプロイ

### 1. Artifact Registry にコンテナイメージをプッシュ

```
gcloud artifacts repositories create dev-streamlit-repo \
    --repository-format=docker \
    --location=asia-northeast1 \
    --description="Streamlit Doker images"
```

### 2. コンテナイメージをビルドして Artifact Registry にプッシュ

```
docker build -t asia-northeast1-docker.pkg.dev/<PROJECT_ID>/dev-streamlit-repo/streamlit-app:latest .
docker push asia-northeast1-docker.pkg.dev/<PROJECT_ID>/dev-streamlit-repo/streamlit-app:latest
```

### 3. Cloud Run にデプロイ

```
gcloud run deploy dev-streamlit-app \
  --image=asia-northeast1-docker.pkg.dev/<PROJECT_ID>/dev-streamlit-repo/streamlit-app:latest \
  --region=asia-northeast1 \
```

## ローカル実行

Dockerfile を使用してローカル実行する
※ デプロイがうまくいかないときは、ローカルで正常なコンテナイメージができているか確認する

```
docker build -t streamlit-app:latest .
docker run -p 8080:8080 streamlit-app:latest
```
