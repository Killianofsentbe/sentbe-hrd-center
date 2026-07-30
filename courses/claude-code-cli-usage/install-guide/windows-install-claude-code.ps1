Write-Host "========================================"
Write-Host " Claude Code CLI Windows 설치 스크립트"
Write-Host "========================================"
Write-Host ""
Write-Host "이 스크립트는 Claude 공식 PowerShell 설치 명령을 실행합니다."
Write-Host "실행 명령: irm https://claude.ai/install.ps1 | iex"
Write-Host ""
$answer = Read-Host "계속 진행할까요? (y/N)"
if ($answer -notin @("y", "Y", "yes", "YES")) {
  Write-Host "설치를 취소했습니다."
  exit 0
}

Write-Host ""
Write-Host "[1/3] Claude Code 설치 중..."
irm https://claude.ai/install.ps1 | iex

Write-Host ""
Write-Host "[2/3] 설치 확인 중..."
$claude = Get-Command claude -ErrorAction SilentlyContinue
if ($claude) {
  claude --version
} else {
  Write-Host "claude 명령을 아직 찾지 못했습니다. PowerShell을 닫았다가 다시 열고 아래를 실행하세요:"
  Write-Host "  claude --version"
}

Write-Host ""
Write-Host "[3/3] 실습 폴더 생성"
$practice = Join-Path $HOME "Desktop\claude-code-practice"
New-Item -ItemType Directory -Force -Path $practice | Out-Null
Write-Host "실습 폴더: $practice"
Write-Host ""
Write-Host "다음 단계:"
Write-Host "  cd `$HOME\Desktop\claude-code-practice"
Write-Host "  claude"
