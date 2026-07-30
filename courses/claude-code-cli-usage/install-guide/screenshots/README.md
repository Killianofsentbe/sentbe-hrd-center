# 스크린샷 / 목업 / 동영상 체크리스트

목표: 터미널이 낯선 사용자도 “내 화면이 가이드와 같은 상태인지” 확인할 수 있게 한다.

## 필수 스크린샷

| 파일명 | 장면 | 체크포인트 |
|---|---|---|
| `macos/01-open-terminal.png` | Spotlight에서 Terminal 검색 | `Cmd + Space` 후 Terminal 입력 화면 |
| `macos/02-install-command.png` | 설치 명령 붙여넣기 | `curl -fsSL https://claude.ai/install.sh \| bash` 입력 직전/직후 |
| `macos/03-version-check.png` | 설치 확인 | `claude --version` 결과 |
| `windows/01-open-powershell.png` | 시작 메뉴에서 PowerShell 검색 | Windows PowerShell 선택 화면 |
| `windows/02-powershell-prompt.png` | PowerShell 프롬프트 | `PS C:\Users\...>` 표시 강조 |
| `windows/03-install-command.png` | 설치 명령 붙여넣기 | `irm https://claude.ai/install.ps1 \| iex` 입력 화면 |
| `windows/04-version-check.png` | 설치 확인 | `claude --version` 결과 |
| `common/01-login-browser.png` | 브라우저 로그인 | 계정 로그인/승인 흐름 |
| `common/02-claude-first-prompt.png` | Claude Code 첫 프롬프트 | 설치 성공 상태 |
| `common/03-first-task-read-files.png` | 첫 미션: 파일 목록 설명 | CLI가 로컬 파일을 읽는 장면 |
| `common/04-first-task-readme-created.png` | 첫 미션: README 생성 | 웹/앱 대비 차별점 장면 |

## 목업 제작 원칙

- 실제 사내 계정명, 이메일, 경로, 토큰은 절대 노출하지 않는다.
- 사용자 이름은 `sentbe-user` 또는 `홍길동` 같은 더미로 대체한다.
- 오류 화면 목업은 실제 오류 메시지를 보존하되 개인정보 영역은 마스킹한다.
- 한 이미지에 한 행동만 보여준다. 예: “PowerShell 열기”, “명령 붙여넣기”, “버전 확인”을 분리.

## 추천 동영상

1. `macos-install-60s.mp4`: 터미널 열기 → 설치 → 버전 확인
2. `windows-install-90s.mp4`: PowerShell 열기 → 설치 → 버전 확인
3. `first-10min-demo-90s.mp4`: 샘플 폴더 이동 → Claude 실행 → README 생성

## 촬영 후 확인

- [ ] 개인정보 마스킹 완료
- [ ] 파일명이 체크리스트와 일치
- [ ] START_HERE와 OS별 가이드에서 이미지 경로가 연결됨
- [ ] Windows PowerShell과 CMD 화면이 혼동되지 않게 라벨 처리
