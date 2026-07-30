# Claude Code CLI OS별 설치 가이드

> 목적: 비개발자도 Claude Code CLI를 설치하고, 첫 실행까지 도달하게 만드는 사내 가이드입니다.  
> 핵심: “사용법 설명”보다 **설치·환경설정 허들을 낮추는 것**에 집중합니다.

---

## 0. 먼저 알아야 할 것

Claude Code CLI는 웹 Claude나 Claude 앱과 다릅니다.

| 구분 | Claude 웹/앱 | Claude Code CLI |
|---|---|---|
| 실행 위치 | 브라우저/앱 | 내 컴퓨터 터미널 |
| 로컬 파일 읽기 | 직접 불가 | 가능 |
| 여러 파일 수정 | 직접 불가 | 가능 |
| 명령어 실행 | 불가 | 가능 |
| 테스트/검증 실행 | 불가 | 가능 |
| 적합한 작업 | 질문, 초안, 요약 | 로컬 파일 정리, 코드 수정, 자동화, 리포트 생성 |

한 줄 요약:
> Claude Code CLI는 “채팅창”이 아니라 **내 컴퓨터에서 파일을 읽고, 고치고, 실행하는 AI 작업자**입니다.

---

## 1. 권장 설치 방식 요약

2026년 기준 공식 문서상 Claude Code는 Native Install을 권장합니다.

| OS | 추천 방식 | 설치 명령 |
|---|---|---|
| macOS | Native Install | 아래 macOS 섹션의 `curl ... | bash` 명령 사용 |
| Windows PowerShell | Native Install | 아래 PowerShell 섹션의 `irm ... | iex` 명령 사용 |
| Windows CMD | Native Install | 아래 CMD 섹션의 `curl ... && install.cmd ...` 명령 사용 |
| Windows WSL | Linux 방식 | 아래 WSL 섹션의 `curl ... | bash` 명령 사용 |
| Linux | Native Install | 아래 Linux 섹션의 `curl ... | bash` 명령 사용 |

주의: Markdown 표 안에서는 파이프 문자(`|`)가 깨질 수 있으므로, 실제 설치 명령은 반드시 각 OS별 섹션의 코드블록을 복사하세요.

---

# Part A. macOS 설치 가이드

## A-1. 준비물

- macOS 10.15 이상
- 인터넷 연결
- Claude 계정 또는 회사에서 제공한 Claude 계정
- 터미널 앱

## A-2. 터미널 열기

방법 1:
1. `Cmd + Space` 누르기
2. `Terminal` 또는 `터미널` 입력
3. Enter

방법 2:
1. Finder 열기
2. `응용 프로그램` → `유틸리티` → `터미널`

목업 화면:

```text
┌──────────────────────────────┐
│ Spotlight Search             │
├──────────────────────────────┤
│ Terminal                     │
│ 터미널                       │
└──────────────────────────────┘
```

## A-3. Claude Code 설치

터미널에 아래 명령어를 그대로 붙여넣고 Enter를 누릅니다.

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

예상 화면:

```text
Downloading Claude Code...
Installing...
Claude Code installed successfully
```

## A-4. 설치 확인

```bash
claude --version
```

예상 결과:

```text
claude-code x.x.x
```

만약 `command not found: claude`가 나오면:

1. 터미널을 완전히 닫았다가 다시 엽니다.
2. 다시 실행합니다.

```bash
claude --version
```

그래도 안 되면 아래를 실행합니다.

```bash
echo $SHELL
```

- 결과가 `/bin/zsh`면 `~/.zshrc` PATH 문제일 수 있습니다.
- IT 담당자에게 “Claude Code 설치 후 claude 명령 PATH 인식이 안 됩니다”라고 전달하세요.

## A-5. 첫 실행

작업용 폴더를 하나 만들고 들어갑니다.

```bash
mkdir -p ~/Desktop/claude-code-practice
cd ~/Desktop/claude-code-practice
claude
```

처음 실행하면 로그인 안내가 나옵니다.

예상 흐름:

1. Claude 로그인 URL 또는 브라우저 로그인 창 표시
2. Claude 계정으로 로그인
3. 터미널로 돌아와 승인
4. Claude Code 프롬프트 표시

목업 화면:

```text
Welcome to Claude Code

? Please log in to continue
Opening browser...

> Try asking Claude to edit files in this folder.
```

## A-6. macOS 자주 나는 오류

### 오류 1. `curl: command not found`

거의 드물지만 macOS 개발자 도구가 꼬인 경우입니다.

해결:
```bash
xcode-select --install
```

설치 후 터미널을 다시 열고 설치 명령을 재실행합니다.

### 오류 2. `permission denied`

권한 문제입니다. 우선 관리자 권한 명령을 무작정 쓰지 말고 IT팀에 문의하세요.

전달 문구:
> Claude Code Native Install 중 permission denied가 발생했습니다. 사용자 홈 디렉토리 설치 권한 또는 PATH 설정 확인 부탁드립니다.

### 오류 3. 설치는 됐는데 `claude`가 안 됨

터미널 재시작 후 확인:

```bash
claude doctor
```

---

# Part B. Windows 설치 가이드 — 추천: Native Windows

Windows는 과거에는 WSL이 사실상 필수였지만, 현재 공식 문서상 Native Windows 설치도 지원합니다. 비개발자에게는 우선 Native Windows 설치를 권장합니다.

## B-1. 준비물

- Windows 10/11
- PowerShell 또는 CMD
- Claude 계정
- 가능하면 Git for Windows 설치 권장

Git for Windows 권장 이유:
- Claude Code가 Bash 도구를 더 안정적으로 사용할 수 있습니다.
- Git이 없으면 PowerShell 기반으로 동작할 수 있으나, 일부 개발 작업에서 불편할 수 있습니다.

Git for Windows 다운로드:
- https://git-scm.com/downloads/win

## B-2. PowerShell로 설치하기 — 추천

1. 시작 메뉴 클릭
2. `PowerShell` 검색
3. `Windows PowerShell` 실행
4. 아래 명령어 붙여넣기

```powershell
irm https://claude.ai/install.ps1 | iex
```

예상 화면:

```text
Downloading Claude Code...
Installing Claude Code...
Installation complete
```

## B-3. 설치 확인

PowerShell에서 실행:

```powershell
claude --version
```

예상 결과:

```text
claude-code x.x.x
```

## B-4. 첫 실행

```powershell
mkdir $HOME\Desktop\claude-code-practice
cd $HOME\Desktop\claude-code-practice
claude
```

처음 실행하면 Claude 로그인 절차가 뜹니다.

## B-5. Windows PowerShell/CMD 혼동 주의

프롬프트가 이렇게 보이면 PowerShell입니다.

```text
PS C:\Users\killian>
```

프롬프트가 이렇게 보이면 CMD입니다.

```text
C:\Users\killian>
```

오류 예시:

### `The token '&&' is not a valid statement separator`

원인: CMD용 명령을 PowerShell에 붙여넣었습니다.

해결: PowerShell에서는 이 명령을 쓰세요.

```powershell
irm https://claude.ai/install.ps1 | iex
```

### `'irm' is not recognized as an internal or external command`

원인: PowerShell용 명령을 CMD에 붙여넣었습니다.

해결: CMD에서는 이 명령을 쓰세요.

```cmd
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

## B-6. Windows CMD로 설치하기

CMD를 쓰는 경우:

```cmd
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

설치 확인:

```cmd
claude --version
```

---

# Part C. Windows 설치 가이드 — WSL 방식

## C-1. 언제 WSL을 쓰나?

아래에 해당하면 WSL을 고려합니다.

- 개발자 또는 데이터/자동화 작업을 많이 하는 사용자
- Linux 명령어 기반 프로젝트를 다루는 사용자
- Node.js, Python, Git 등을 Linux 환경에서 관리하고 싶은 사용자
- Native Windows 설치가 조직 보안정책 또는 PATH 문제로 잘 안 되는 경우

비개발자에게는 Native Windows 방식이 더 쉽습니다.

## C-2. WSL 설치

PowerShell을 관리자 권한으로 열고 실행합니다.

```powershell
wsl --install
```

설치 후 PC를 재부팅합니다.

재부팅 후 Ubuntu 초기 설정 화면이 나오면:
1. Linux 사용자 이름 입력
2. 비밀번호 입력
3. 비밀번호 한 번 더 입력

주의:
- 비밀번호 입력 시 화면에 글자가 표시되지 않는 것이 정상입니다.

## C-3. Ubuntu 업데이트

Ubuntu 터미널에서 실행:

```bash
sudo apt update
sudo apt upgrade -y
```

## C-4. Claude Code 설치

Ubuntu 터미널에서 실행:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

설치 확인:

```bash
claude --version
```

첫 실행:

```bash
mkdir -p ~/claude-code-practice
cd ~/claude-code-practice
claude
```

## C-5. WSL 사용 시 중요한 주의점

가능하면 프로젝트 파일은 Windows 경로(`/mnt/c/...`)가 아니라 Linux 홈 폴더(`/home/사용자명/...`)에 둡니다.

권장:

```text
/home/killian/my-project
```

비권장:

```text
/mnt/c/Users/killian/Desktop/my-project
```

이유:
- WSL에서 Windows 파일시스템을 직접 읽으면 검색/파일 탐색이 느리거나 일부 검색 결과가 누락될 수 있습니다.

---

# Part D. Linux 설치 가이드

## D-1. 설치

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

## D-2. 설치 확인

```bash
claude --version
```

## D-3. 첫 실행

```bash
mkdir -p ~/claude-code-practice
cd ~/claude-code-practice
claude
```

## D-4. 검색 문제가 있으면 ripgrep 설치

Ubuntu/Debian:

```bash
sudo apt install ripgrep
```

---

# Part E. 설치 후 첫 체험 미션

설치가 끝났으면 바로 기능 설명을 길게 하지 말고, 웹 Claude와의 차이를 체감하게 합니다.

## E-1. 실습 폴더 만들기

macOS/Linux/WSL:

```bash
mkdir -p ~/Desktop/claude-code-practice
cd ~/Desktop/claude-code-practice
```

Windows PowerShell:

```powershell
mkdir $HOME\Desktop\claude-code-practice
cd $HOME\Desktop\claude-code-practice
```

## E-2. 샘플 파일 만들기

macOS/Linux/WSL:

```bash
cat > memo1.md <<'EOF'
오늘 Claude Code CLI 교육자료를 검토했다. 설치 파트가 부족하고 Windows 사용자 가이드가 필요하다.
EOF

cat > memo2.md <<'EOF'
교육의 핵심은 사용법 나열이 아니라 웹 Claude와 CLI의 차이를 체감시키는 것이다.
EOF

cat > todo.csv <<'EOF'
owner,task,due
Killian,Windows 설치 가이드 보강,2026-08-01
HRD,목업 스크린샷 추가,2026-08-03
IT,원클릭 설치 스크립트 검토,2026-08-05
EOF
```

Windows PowerShell:

```powershell
@"
오늘 Claude Code CLI 교육자료를 검토했다. 설치 파트가 부족하고 Windows 사용자 가이드가 필요하다.
"@ | Out-File -Encoding utf8 memo1.md

@"
교육의 핵심은 사용법 나열이 아니라 웹 Claude와 CLI의 차이를 체감시키는 것이다.
"@ | Out-File -Encoding utf8 memo2.md

@"
owner,task,due
Killian,Windows 설치 가이드 보강,2026-08-01
HRD,목업 스크린샷 추가,2026-08-03
IT,원클릭 설치 스크립트 검토,2026-08-05
"@ | Out-File -Encoding utf8 todo.csv
```

## E-3. Claude Code 실행

```bash
claude
```

## E-4. Claude에게 요청하기

Claude Code 안에서 아래처럼 입력합니다.

```text
이 폴더의 memo1.md, memo2.md, todo.csv를 읽고 다음을 해줘.
1. 핵심 요약을 README.md로 작성
2. todo.csv를 읽어 담당자별 할 일을 표로 정리
3. 다음 액션 3개를 제안
4. 파일을 만든 뒤 어떤 파일을 만들었는지 알려줘
```

## E-5. 체감 포인트

이 실습에서 Claude Code는 웹 Claude와 달리:

- 내 컴퓨터 폴더 안의 파일을 직접 읽습니다.
- README.md 파일을 직접 생성합니다.
- CSV와 Markdown을 함께 이해합니다.
- 결과물을 로컬 파일로 남깁니다.

즉, 사용자는 “아, 이건 질문 답변 도구가 아니라 내 컴퓨터에서 일하는 도구구나”를 경험하게 됩니다.

---

# Part F. 원클릭 설치 스크립트 초안

이 폴더에 아래 파일을 함께 제공합니다.

- `macos-install-claude-code.command`
- `windows-install-claude-code.ps1`

주의:
- 사내 배포 전 IT/보안 검토가 필요합니다.
- 스크립트는 Claude 공식 Native Install 명령을 감싸는 수준입니다.
- 관리자 권한 강제 실행은 하지 않습니다.

---

# Part G. 운영 권장안

## 교육자료 구조 권장

1. 5분: Claude 웹/앱 vs CLI 차이
2. 20분: OS별 설치
3. 10분: 첫 체험 미션
4. 5분: 자주 나는 오류
5. 10분: Q&A

## 사내 배포 패키지 권장

```text
Claude-Code-CLI-Onboarding/
├── START_HERE.md
├── Claude-Code-CLI-OS별-설치-가이드.md
├── macos-install-claude-code.command
├── windows-install-claude-code.ps1
├── sample-files/
│   ├── memo1.md
│   ├── memo2.md
│   └── todo.csv
└── screenshots/
    ├── mac-terminal-open.png
    ├── windows-powershell-open.png
    ├── claude-login.png
    └── first-task-result.png
```

## 다음 보강 필요

- 실제 macOS 설치 화면 캡처
- 실제 Windows PowerShell 설치 화면 캡처
- Claude 로그인 화면 캡처
- 첫 체험 미션 전/후 화면 캡처
- 사내 보안정책에 맞춘 설치 스크립트 검토

---

# 참고 출처

- Claude Code Overview: https://code.claude.com/docs/en/overview
- Claude Code Troubleshooting: https://code.claude.com/docs/en/troubleshooting
- Git for Windows: https://git-scm.com/downloads/win
