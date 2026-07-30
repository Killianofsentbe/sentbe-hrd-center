# Claude Code CLI 온보딩 패키지 UX 개선안

> 대상: Claude Code CLI를 처음 쓰는 사내 임직원, 특히 터미널 경험이 적은 비개발자
> 목표: 설치 실패를 줄이고, 첫 10분 안에 “웹/앱 Claude와 다른 로컬 작업자”라는 가치를 체감하게 한다.

---

## 1. 현재 패키지에서 좋은 점

- OS별 설치 명령이 macOS / Windows PowerShell / Windows CMD / WSL / Linux로 나뉘어 있다.
- Windows Native 설치를 우선 경로로 둔 점은 비개발자 UX에 맞다.
- 첫 체험 미션이 로컬 파일 읽기·생성 중심이라 CLI의 차별점을 보여준다.
- 원클릭 설치 스크립트 초안이 있어 IT/보안 검토 후 배포 자동화로 확장 가능하다.

---

## 2. UX 관점 핵심 문제

- `START_HERE.md`가 “무엇을 먼저 클릭해야 하는지”는 말하지만, 사용자의 불안 요소인 “내 OS는 무엇을 고르면 되는지 / 막히면 어디로 가는지”가 약하다.
- 설치 가이드 하나에 설치, 첫 실행, 오류, 운영안이 모두 들어 있어 비개발자가 길게 느낄 수 있다.
- 첫 10분 경험이 설치 후 뒤쪽에 있어, 사용자가 설치 성공 직후 무엇을 해야 하는지 놓칠 수 있다.
- FAQ와 지원 동선이 별도 파일로 분리되어 있지 않아 Slack 공지나 Notion에서 바로 링크하기 어렵다.
- 스크린샷 폴더는 제안만 있고, 어떤 장면을 어떤 파일명으로 캡처해야 하는지 촬영 체크리스트가 없다.

---

## 3. 권장 폴더 구조

```text
Claude-Code-CLI-Onboarding/
├── 00_START_HERE.md                         # 사용자가 가장 먼저 여는 문서
├── 01_내_OS에_맞는_설치_선택.md              # OS/상황별 분기표
├── 02_macOS_설치_가이드.md
├── 03_Windows_설치_가이드.md                 # Native Windows 우선, PowerShell/CMD 구분 강조
├── 04_Windows_WSL_설치_가이드_고급.md         # 개발자/고급 사용자용으로 분리
├── 05_첫_10분_체험.md                        # 설치 직후 바로 실행
├── 06_FAQ_문제해결.md                         # 오류 메시지별 해결
├── 07_지원요청_방법.md                        # 실패 시 Slack/IT 문의 템플릿
├── scripts/
│   ├── macos-install-claude-code.command
│   └── windows-install-claude-code.ps1
├── sample-files/
│   ├── memo1.md
│   ├── memo2.md
│   └── todo.csv
├── screenshots/
│   ├── README.md                             # 촬영/목업 체크리스트
│   ├── macos/
│   ├── windows/
│   └── common/
└── rollout/
    ├── slack-announcement-template.md
    ├── notion-wiki-template.md
    └── pilot-checklist.md
```

### 문서명 원칙

- 번호를 붙여 “순서”를 보이게 한다.
- 비개발자에게 낯선 영어보다 행동 중심 한국어를 쓴다.
- Windows는 별도 문서로 승격한다. 사내 비개발자 설치 실패의 대부분은 PowerShell/CMD/권한/PATH 혼동에서 발생할 가능성이 높다.
- WSL은 “고급”으로 분리한다. 첫 사용자에게 Native Windows와 WSL을 같은 레벨로 보여주면 선택 피로가 커진다.

---

## 4. 첫 화면(`00_START_HERE.md`) 개선안

첫 문서는 설명보다 “길 안내”여야 한다.

필수 구성:

1. **3줄 요약**
   - Claude Code CLI는 내 컴퓨터 폴더를 읽고 파일을 만들 수 있는 Claude입니다.
   - 먼저 내 OS에 맞는 설치 문서를 고르세요.
   - 설치가 끝나면 `05_첫_10분_체험.md`만 따라 하면 됩니다.

2. **OS 선택 버튼형 표**

| 나는 이런 사용자 | 열 파일 |
|---|---|
| Mac 사용자 | `02_macOS_설치_가이드.md` |
| Windows 사용자, 터미널 거의 모름 | `03_Windows_설치_가이드.md`의 PowerShell 설치 |
| Windows 사용자, 개발/자동화 작업 많음 | 먼저 `03_Windows_설치_가이드.md`, 필요 시 `04_Windows_WSL_설치_가이드_고급.md` |
| Linux 사용자 | 기존 OS별 가이드의 Linux 섹션 또는 별도 Linux 문서 |
| 설치 중 막힘 | `06_FAQ_문제해결.md` → 안 되면 `07_지원요청_방법.md` |

3. **총 소요시간 기대치**
   - 설치: 5~15분
   - 로그인: 2~5분
   - 첫 체험: 10분

4. **실패해도 괜찮다는 문구**
   - “설치가 막히는 것은 정상적인 온보딩 이슈입니다. 오류 화면을 캡처해 지원 채널에 올리면 됩니다.”

---

## 5. 첫 10분 경험 개선안

현재 미션은 좋지만, 더 짧고 성공감 있게 쪼개야 한다.

### 0~2분: 폴더 열기와 Claude 실행

- 샘플 파일은 사용자가 직접 만들게 하기보다 zip 안에 포함된 `sample-files`를 복사하게 한다.
- 비개발자는 `cat > file <<EOF` 같은 명령 자체가 부담이다.

권장 흐름:

1. `sample-files` 폴더를 바탕화면에 복사
2. 터미널/PowerShell에서 해당 폴더로 이동
3. `claude` 실행

### 2~5분: 읽기 체험

Claude Code 안에서 입력:

```text
이 폴더에 어떤 파일이 있는지 확인하고, 각 파일이 무엇을 담고 있는지 한 줄씩 설명해줘.
```

체감 포인트:
- 웹 Claude는 내 폴더를 모른다.
- CLI Claude는 현재 폴더를 직접 확인한다.

### 5~8분: 만들기 체험

```text
memo1.md, memo2.md, todo.csv를 읽고 README.md를 만들어줘. README에는 1) 핵심 요약 2) 담당자별 할 일 3) 다음 액션을 넣어줘.
```

체감 포인트:
- 답변만 하는 것이 아니라 로컬 파일을 만든다.

### 8~10분: 확인 체험

```text
방금 만든 README.md를 다시 읽고, 빠진 내용이나 오타가 있는지 점검해줘.
```

체감 포인트:
- 생성 → 검토 → 수정 루프가 한 자리에서 된다.

---

## 6. 스크린샷/동영상 보강안

### 최소 스크린샷 8장

| 파일명 | 장면 | 용도 |
|---|---|---|
| `screenshots/macos/01-open-terminal.png` | Spotlight에서 Terminal 검색 | 터미널 여는 법 |
| `screenshots/macos/02-install-command.png` | 설치 명령 붙여넣기 | 설치 시작 확인 |
| `screenshots/windows/01-open-powershell.png` | 시작 메뉴에서 PowerShell 검색 | PowerShell/CMD 혼동 방지 |
| `screenshots/windows/02-powershell-prompt.png` | `PS C:\Users\...>` 프롬프트 | 올바른 쉘 식별 |
| `screenshots/windows/03-install-command.png` | `irm ... | iex` 입력 | 설치 시작 확인 |
| `screenshots/common/01-login-browser.png` | 브라우저 로그인 화면 | 로그인 흐름 안내 |
| `screenshots/common/02-claude-first-prompt.png` | Claude Code 첫 프롬프트 | 성공 상태 확인 |
| `screenshots/common/03-first-task-result.png` | README.md 생성 결과 | CLI 가치 체감 |

### 60~90초 동영상 3개

- macOS 설치: 터미널 열기 → 설치 명령 → `claude --version`
- Windows 설치: PowerShell 열기 → 설치 명령 → `claude --version`
- 첫 체험: 샘플 폴더에서 `claude` 실행 → README 생성

동영상은 무음이어도 된다. 화면 상단에 “지금 해야 할 행동” 자막만 넣는 편이 비개발자에게 더 효과적이다.

---

## 7. FAQ/문제해결 문서 분리안

FAQ는 오류 메시지 중심으로 구성한다.

필수 항목:

- `claude: command not found` / `'claude' is not recognized`
- PowerShell에서 `&&` 오류가 나는 경우
- CMD에서 `irm` 오류가 나는 경우
- 회사 보안 정책으로 스크립트 실행이 차단되는 경우
- 로그인 브라우저가 열리지 않는 경우
- 로그인은 했는데 터미널로 돌아오지 않는 경우
- Windows에서 실행 정책 때문에 `.ps1`이 막히는 경우
- `permission denied` / `EACCES`
- 네트워크/VPN/프록시 환경에서 다운로드 실패
- `claude doctor` 실행 결과를 지원팀에 보내는 방법

각 FAQ 형식:

```text
증상: 사용자가 보는 오류 메시지
원인: 왜 생기는지 한 문장
해결: 사용자가 직접 해볼 1~3단계
지원 요청 시 첨부: 캡처, OS, 실행한 명령, claude doctor 결과
```

---

## 8. 실패 시 지원 동선

지원 동선은 문서 하단이 아니라 모든 문서 상단/하단에 반복 노출한다.

### 권장 지원 단계

1. `06_FAQ_문제해결.md`에서 오류 메시지 검색
2. 그래도 안 되면 Slack `#claude-code-onboarding-help`에 요청
3. 계정/권한 문제는 HRD/IT 담당자가 Anthropic/사내 계정 관리자에게 에스컬레이션

### 지원 요청 템플릿

```text
[Claude Code CLI 설치 지원 요청]
1. OS: Windows 11 / macOS / 기타
2. 사용한 문서: 예) 03_Windows_설치_가이드.md
3. 실행한 명령어: 예) irm https://claude.ai/install.ps1 | iex
4. 오류 메시지 또는 캡처: 첨부
5. claude --version 결과: 성공/실패
6. claude doctor 결과: 가능하면 첨부
7. 회사 VPN/프록시 사용 여부: 예/아니오
```

---

## 9. 배포 계획 개선안

### Drive 폴더 + zip

- Drive 최상단에는 zip만 두지 말고 `00_START_HERE.md`를 Google Docs/Notion에도 복사해 “미리보기” 가능하게 한다.
- zip 이름에 날짜/버전을 넣는다: `Claude-Code-CLI-Onboarding-v1.0-2026-08.zip`
- zip 안 최상단에 `00_START_HERE.md`가 바로 보여야 한다.

### Notion/위키

- Notion은 전체 문서를 복붙하기보다 “랜딩 페이지” 역할로 둔다.
- OS별 문서, FAQ, 지원 요청 템플릿, 최신 zip 링크만 둔다.
- 문서 버전과 마지막 업데이트 날짜를 상단에 표시한다.

### Slack 공지

공지에는 기능 설명보다 행동을 넣는다.

- “Windows 사용자는 여기부터” 링크
- “Mac 사용자는 여기부터” 링크
- “설치가 막히면 이 템플릿으로 요청” 링크
- 파일럿 기간과 지원 가능 시간 명시

### 파일럿 후 전사 확산

파일럿에서 반드시 측정할 것:

- 설치 성공률
- 설치 완료까지 걸린 시간
- Windows 실패 유형 TOP 5
- 첫 체험 미션 완료율
- 지원 요청 1건당 해결 시간
- “웹/앱 Claude와 차이를 이해했다” 설문 점수

---

## 10. 우선순위 액션

1. `START_HERE.md`를 `00_START_HERE.md` 스타일의 길 안내 문서로 개편
2. Windows 가이드를 별도 문서로 분리하고 PowerShell/CMD 혼동 방지 스크린샷 추가
3. 첫 체험 미션을 `05_첫_10분_체험.md`로 분리하고 샘플 파일 직접 생성 단계를 제거
4. `06_FAQ_문제해결.md`와 `07_지원요청_방법.md`를 별도 파일로 추가
5. `screenshots/README.md`에 촬영 체크리스트 추가
6. Slack/Notion 배포 템플릿을 `rollout/`에 추가
