#!/usr/bin/env bash
# Roami をローカルで起動するスクリプト
# 初回: ./start.sh --setup で依存インストール＋.env作成込みで起動
# 2回目以降: ./start.sh だけでOK
set -e
cd "$(dirname "$0")"

if [ "$1" = "--setup" ]; then
  [ -f .env ] || cp .env.example .env
  [ -f backend/.env ] || cp backend/.env.example backend/.env
  echo "→ .env / backend/.env を作成しました。API キー等を編集してから再実行してください。"
  (cd backend && bundle install)
  (cd frontend && npm install)
fi

docker-compose up -d

(
  cd backend
  bundle exec rails db:create db:migrate db:seed 2>/dev/null || true
  bundle exec rails s -p 8080
) &

(
  cd frontend
  npm run dev
) &

echo ""
echo "起動しました: http://localhost:3000"
echo "(バックエンド API: http://localhost:8080)"
wait
