# Research: Claude Code 완전 초보 사용법
수집일: 2026-03-25

---

## 1. Claude Code란?

Claude Code는 Anthropic이 만든 **터미널 기반 AI 코딩 어시스턴트**입니다. VS Code 같은 IDE 확장 플러그인이 아니라, 터미널(CLI)에서 직접 실행되는 도구로, 코드베이스에 직접 연결되어 프로젝트 구조를 이해하고 자연어 대화를 통해 실제 코드를 작성합니다.

**주요 특징:**
- 2025년 2월 베타 공개, 2025년 5월 정식 출시
- 파일 읽기/쓰기, 명령어 실행, 코드 수정 등을 자율적으로 수행
- 자연어로 요청하면 Claude가 나머지를 처리
- 프로젝트 전체 맥락을 이해하고 복잡한 멀티파일 작업 가능
- 가장 널리 채택된 AI 개발 도구 중 하나로 성장

**지원 환경:**
- macOS 10.15 이상
- Ubuntu 20.04+ / Debian 10+
- Windows (WSL을 통해 사용)

---

## 2. 설치 및 시작 방법

### 설치

```bash
# Node.js 18 이상 필요
npm install -g @anthropic-ai/claude-code
```

### 시작

```bash
# 프로젝트 디렉토리로 이동
cd your-project

# Claude Code 실행
claude
```

### 초기 설정: CLAUDE.md 생성

CLAUDE.md는 프로젝트 루트에 두는 마크다운 파일로, Claude Code에게 "이 프로젝트가 어떻게 동작하는지"를 알려주는 온보딩 문서입니다. AI 팀원을 위한 설명서라고 생각하면 됩니다.

```bash
# 자동으로 CLAUDE.md 초안 생성
/init
```

CLAUDE.md에 담을 내용:
- 빌드 명령어 (예: `npm run build`, `pytest`)
- 코딩 스타일 규칙
- 아키텍처 결정 사항
- 주요 디렉토리 설명

---

## 3. 핵심 기능 (초보자 필수)

### Plan Mode (계획 모드)
초보자에게 가장 중요한 기능. 코드를 바로 수정하기 전에 Claude가 문제를 분석하고 단계별 계획을 먼저 제시합니다.

- `Shift+Tab`을 두 번 눌러 Plan Mode 활성화
- 또는 `/plan` 명령어 사용
- Claude가 계획을 보여주고 사용자 승인을 기다린 후 실행
- "계획에 더 많은 시간을 쓸수록 Claude가 성공할 확률이 높아진다"

### Auto-Accept Mode (자동 승인 모드)
- `Shift+Tab`으로 순환: 일반 모드 → Auto-accept → Plan Mode
- 파일 수정/명령 실행을 자동으로 승인
- 핵심 기능에는 신중하게 사용 권장

### 컨텍스트 관리
- Claude의 컨텍스트 창(context window)은 빠르게 차오르며, 가득 차면 성능이 저하됨
- `/context` 명령으로 현재 컨텍스트 사용량을 시각적으로 확인 가능
- `/clear`로 대화 기록 초기화, `/compact`로 대화 요약

### 이미지 분석
- 터미널 창에 이미지 파일을 드래그 앤 드롭하면 Claude가 이미지를 분석 가능
- UI 변경 작업 시 스크린샷을 첨부해서 결과 검증 가능

---

## 4. 자주 쓰는 명령어/프롬프트 패턴

### 슬래시 명령어 (Slash Commands)

| 명령어 | 설명 |
|--------|------|
| `/help` | 사용 가능한 모든 명령어 목록 표시 |
| `/init` | CLAUDE.md 초안 자동 생성 |
| `/clear` | 대화 기록 초기화 (새 작업 시작 시 사용) |
| `/compact` | 대화 내용을 요약하여 컨텍스트 절약 |
| `/plan` | Plan Mode 진입 (계획 먼저, 실행 나중) |
| `/memory` | CLAUDE.md 파일 편집 |
| `/doctor` | 설치 상태 진단 |
| `/config` | 설정 패널 열기 |
| `/exit` | Claude Code 종료 |

### 키보드 단축키

| 단축키 | 기능 |
|--------|------|
| `Shift+Tab` | 모드 순환 (일반 → Auto-accept → Plan Mode) |
| `Esc` | 작업 중단 (컨텍스트 유지, 즉시 방향 전환 가능) |
| `Tab` | `/` 입력 후 명령어 자동완성 |
| `!명령어` | 쉘 명령 즉시 실행 (예: `!git status`, `!npm test`) |

### 효과적인 프롬프트 패턴

```
# 나쁜 예: 모호한 요청
"로그인 버튼 고쳐줘"

# 좋은 예: 구체적인 요청
"src/components/LoginButton.tsx 파일에서 로그인 버튼 클릭 시
API 응답이 500 에러를 반환할 때 에러 메시지가 표시되지 않는 버그를 수정해줘.
React 18, TypeScript, axios를 사용 중이야."
```

---

## 5. 초보자가 자주 하는 실수

### 실수 1: 모호한 프롬프트 사용
- 문제: 구체적인 파일명, 기술 스택, 비즈니스 제약 없이 막연하게 요청
- 결과: 프로젝트에 맞지 않는 범용 코드 생성 (신규 사용자의 85%가 겪는 문제)
- 해결: 대상 파일, 기술 스택, 요구사항을 명확히 명시

### 실수 2: CLAUDE.md 없이 시작
- 문제: 매 세션마다 Claude가 기술 스택과 프로젝트 구조를 다시 파악해야 함
- 결과: 잘못된 가정, 더 많은 질문, 토큰 낭비
- 해결: `/init`으로 CLAUDE.md 생성 후 프로젝트 정보 추가

### 실수 3: 한 번에 너무 많은 변경 요청
- 문제: 거대한 작업을 한꺼번에 요청
- 결과: 불완전한 구현, 일관성 없는 변경, 도구 호출 한도 초과
- 해결: 큰 작업을 작은 단계로 분리하고 각 단계를 검증 후 진행

### 실수 4: 반복 수정 없이 계속 교정
- 문제: Claude가 잘못했을 때 같은 맥락에서 계속 교정
- 결과: 실패한 접근법들로 컨텍스트가 오염됨
- 해결: 두 번 교정 실패 시 `/clear` 후 학습한 내용을 반영한 더 나은 초기 프롬프트 작성

### 실수 5: "Kitchen Sink" 세션 (잡탕 세션)
- 문제: 하나의 작업 시작 → 무관한 질문 → 첫 작업으로 복귀
- 결과: 관련 없는 정보로 컨텍스트가 가득 참
- 해결: 관련 없는 작업 사이에 `/clear` 사용

### 실수 6: Auto-Accept 무분별 사용
- 문제: 핵심 기능에도 자동 승인 모드 사용
- 결과: 원하지 않는 코드 변경이 발생할 수 있음
- 해결: 중요한 작업은 수동으로 검토 후 승인

### 실수 7: 결과물 검증 스킵
- 문제: Claude가 작성한 코드를 테스트 없이 그냥 사용
- 결과: 런타임 오류나 예상치 못한 버그 발생
- 해결: 테스트, 스크린샷, 예상 출력을 제공해서 Claude가 스스로 검증하도록 유도

### 실수 8: 수정 이유를 파악하지 않음
- 문제: 왜 수정이 필요했는지 이해하지 않고 넘어감
- 결과: 동일한 실수 반복
- 해결: Claude에게 수정 이유를 설명하도록 요청

---

## 6. 실전 활용 팁

### 팁 1: 피드백 루프 구축
테스트, 스크린샷, 예상 출력 결과를 포함하면 Claude가 스스로 확인할 수 있어 성공률이 극적으로 향상됩니다. 이것이 가장 레버리지가 높은 단일 팁입니다.

### 팁 2: 먼저 계획, 그 다음 실행
Plan Mode를 활용해서 코드 작성 전에 Claude의 접근 방식을 먼저 확인하세요. 팁을 하나만 기억한다면 이것입니다.

### 팁 3: /clear를 자주 사용
새로운 작업을 시작할 때마다 `/clear`로 채팅 기록을 초기화하세요. 오래된 기록에 토큰을 낭비하지 않아야 합니다.

### 팁 4: 쉘 명령을 컨텍스트에 활용
`!git status`나 `!npm test`를 입력하면 명령이 즉시 실행되고 결과가 컨텍스트에 포함되어 Claude가 결과를 보고 바로 행동할 수 있습니다.

### 팁 5: Esc로 즉시 방향 전환
Claude가 작업 중일 때 `Esc`를 누르면 컨텍스트를 유지한 채 작업을 중단하고 즉시 방향을 바꿀 수 있습니다.

### 팁 6: Skills 파일 활용
CLAUDE.md에 모든 내용을 넣으면 매 세션마다 로드됩니다. 특정 작업에만 필요한 내용은 별도 Skills 마크다운 파일로 분리하면 컨텍스트를 절약할 수 있습니다.

### 팁 7: CLAUDE.md를 과하게 길게 쓰지 않기
CLAUDE.md가 너무 길면 Claude가 중요한 규칙을 놓칩니다. 핵심 내용만 간결하게 작성하세요.

### 팁 8: 프로젝트 스캔부터 시작
새 프로젝트에서 Claude Code를 처음 실행하면 파일을 스캔하고 프레임워크, 진입점, 주요 모듈을 포함한 구조 분석을 제공합니다. 이 분석 결과를 확인하고 시작하세요.

### 팁 9: Playwright MCP로 UI 검증
Playwright MCP 서버를 설정하면 Claude가 브라우저를 열어 UI가 올바르게 동작하는지 확인할 수 있어 단위 테스트가 놓치는 문제를 잡을 수 있습니다.

### 팁 10: /compact로 긴 세션 관리
30분 이상 긴 세션에서는 `/compact`로 대화를 요약해서 오래된 컨텍스트 토큰 낭비를 줄이세요. 파워 유저들은 환경과 권한, 명령어를 최적화해서 생산성을 최대 40% 향상시킨다고 합니다.

---

## 7. 참고 출처 (URL 포함)

### 공식 문서
- [Claude Code 공식 문서 (한국어)](https://code.claude.com/docs/ko/overview)
- [Claude Code 빠른 시작 가이드 (영문)](https://code.claude.com/docs/en/quickstart)
- [Claude Code 공식 베스트 프랙티스](https://code.claude.com/docs/en/best-practices)

### 초보자 튜토리얼
- [Claude Code 초보자 튜토리얼: 2026 완벽 시작 가이드 (한국어)](https://www.nxcode.io/resources/news/claude-code-tutorial-beginners-guide-2026)
- [Claude Code 빠른 시작 가이드 - 클라우드 네이티브 (한국어)](https://claudecode.blueshirtmap.com/ko/guide)
- [Claude Code Tutorial for Beginners - Complete 2026 Guide (영문)](https://codewithmukesh.com/blog/claude-code-for-beginners/)
- [Claude Code Learning Path: a practical guide (Medium)](https://medium.com/@dan.avila7/claude-code-learning-path-a-practical-guide-to-getting-started-fcc601550476)
- [Getting Started with Claude Code: A No-BS Quick Guide](https://fuszti.com/claude-code-setup-guide-2025/)
- [Claude Code for Beginners (claude101.every.to)](https://claude101.every.to/)
- [How to Use Claude Code (Beginner Guide) - Builder.io](https://www.builder.io/blog/how-to-use-claude-code)

### 실전 팁 & 베스트 프랙티스
- [50 Claude Code Tips and Best Practices - Builder.io](https://www.builder.io/blog/claude-code-tips-best-practices)
- [How I use Claude Code (+ my best tips) - Builder.io](https://www.builder.io/blog/claude-code)
- [7 Claude Code best practices for 2026 (from real projects)](https://www.eesel.ai/blog/claude-code-best-practices)
- [Claude Code: Best Practices and Pro Tips - htdocs.dev](https://htdocs.dev/posts/claude-code-best-practices-and-pro-tips/)
- [32 Claude Code Tips: From Basics to Advanced - YK (Substack)](https://agenticcoding.substack.com/p/32-claude-code-tips-from-basics-to)
- [20 Tips to Master Claude Code in 35 Minutes](https://creatoreconomy.so/p/20-tips-to-master-claude-code-in-35-min-build-an-app)
- [Claude Code Best Practices: Tips from Power Users](https://www.sidetool.co/post/claude-code-best-practices-tips-power-users-2025)

### 초보자 실수 방지
- [Why Most People Fail With Claude Code (and How to Avoid It)](https://generativeai.pub/why-most-people-fail-with-claude-code-and-how-to-avoid-it-673da0164f91)
- [10 Claude Code Mistakes Beginners Make (And How to Fix Them)](https://www.heyuan110.com/posts/ai/2026-02-25-claude-code-mistakes/)
- [You're Using Claude Code Wrong (And Wasting Hours Every Day)](https://diamantai.substack.com/p/youre-using-claude-code-wrong-and)
- [The Complete Claude Code Cheat Sheet: 25 Commands for Beginners](https://www.adventureppc.com/blog/the-complete-claude-code-cheat-sheet-25-commands-and-prompts-every-beginner-should-know)
- [Claude Code for Beginners: Step-by-Step Guide](https://www.adventureppc.com/blog/claude-code-for-beginners-a-step-by-step-guide-to-your-first-ai-powered-project)

### 명령어 치트시트
- [Claude Code Developer Cheatsheet - AwesomeClaude](https://awesomeclaude.ai/code-cheatsheet)
- [Claude Code CLI Cheatsheet: config, commands, prompts - Shipyard](https://shipyard.build/blog/claude-code-cheat-sheet/)
- [Claude Code Cheat Sheet 2026 - computingforgeeks](https://computingforgeeks.com/claude-code-cheat-sheet/)
- [Claude Code Commands Cheat Sheet - devgent.org](https://devgent.org/en/claude-code-commands-cheatsheet-en/)
- [Essential Slash Commands Cheatsheet - SFEIR Institute](https://institute.sfeir.com/en/claude-code/claude-code-essential-slash-commands/cheatsheet/)

### GitHub 레포지토리
- [claude-code-guide (한국어, revfactory)](https://github.com/revfactory/claude-code-guide)
- [claude-code-ultimate-guide (FlorianBruniaux)](https://github.com/FlorianBruniaux/claude-code-ultimate-guide)
- [claude-code-tips (ykdojo) - 45가지 팁](https://github.com/ykdojo/claude-code-tips)
- [claude-code-cheat-sheet (Njengah)](https://github.com/Njengah/claude-code-cheat-sheet)
- [claude-code-best-practice (shanraisshan)](https://github.com/shanraisshan/claude-code-best-practice)
