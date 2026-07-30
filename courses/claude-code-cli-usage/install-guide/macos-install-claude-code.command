#!/bin/bash
set -euo pipefail

echo "========================================"
echo " Claude Code CLI macOS 설치 스크립트"
echo "========================================"
echo ""
echo "이 스크립트는 Claude 공식 설치 스크립트를 실행합니다."
echo "실행 명령: curl -fsSL https://claude.ai/install.sh | bash"
echo ""
read -r -p "계속 진행할까요? (y/N): " answer
case "$answer" in
  y|Y|yes|YES)
    ;;
  *)
    echo "설치를 취소했습니다."
    exit 0
    ;;
esac

echo ""
echo "[1/3] Claude Code 설치 중..."
curl -fsSL https://claude.ai/install.sh | bash

echo ""
echo "[2/3] 설치 확인 중..."
if command -v claude >/dev/null 2>&1; then
  claude --version
else
  echo "claude 명령을 아직 찾지 못했습니다. 터미널을 닫았다가 다시 열고 아래를 실행하세요:"
  echo "  claude --version"
fi

echo ""
echo "[3/3] 실습 폴더 생성"
mkdir -p "$HOME/Desktop/claude-code-practice"
echo "실습 폴더: $HOME/Desktop/claude-code-practice"
echo ""
echo "다음 단계:"
echo "  cd ~/Desktop/claude-code-practice"
echo "  claude"
