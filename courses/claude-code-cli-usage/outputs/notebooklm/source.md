# Claude Code 완전 초보 사용법 — NotebookLM 소스 요약본

**수집일:** 2026-03-25
**대상:** 사내 임직원 (코딩 경험 무관)
**학습 목표:** Claude Code를 설치하고, 기본 기능을 활용하여 실제 업무에 적용할 수 있다.

---

## 1. Claude Code란 무엇인가

- **정의:** Anthropic이 개발한 터미널 기반 AI 코딩 어시스턴트 (IDE 플러그인이 아닌 CLI 도구)
- **출시:** 2025년 2월 베타 공개, 2025년 5월 정식 출시
- **핵심 능력:** 파일 읽기/쓰기, 명령어 실행, 코드 수정을 자율적으로 수행
- **차별점:** 프로젝트 전체 맥락을 이해하고 멀티파일 작업 처리 가능
- **위상:** 가장 널리 채택된 AI 개발 도구 중 하나

**지원 환경:**
- macOS 10.15 이상
- Ubuntu 20.04+ / Debian 10+
- Windows (WSL 경유)

**출처:** https://code.claude.com/docs/ko/overview

---

## 2. 설치 및 시작 방법

### 설치 (Node.js 18 이상 필요)

```
npm install -g @anthropic-ai/claude-code
```

### 실행

```
cd your-project
claude
```

### CLAUDE.md 초기 설정

- **역할:** 프로젝트 루트에 두는 마크다운 파일로, Claude Code에게 프로젝트를 설명하는 온보딩 문서
- **자동 생성 명령어:** `/init`
- **포함 내용:** 빌드 명령어, 코딩 스타일 규칙, 아키텍처 결정 사항, 주요 디렉토리 설명

**출처:** https://code.claude.com/docs/en/quickstart

---

## 3. 핵심 기능 3가지

### 기능 1: Plan Mode (계획 모드)
- **활성화:** `Shift+Tab` 두 번 누르기 또는 `/plan` 명령어
- **동작:** Claude가 코드 수정 전에 단계별 계획을 먼저 제시, 사용자 승인 후 실행
- **초보자 추천:** "계획에 더 많은 시간을 쓸수록 Claude가 성공할 확률이 높아진다"

### 기능 2: Auto-Accept Mode (자동 승인 모드)
- **활성화:** `Shift+Tab`으로 모드 순환 (일반 → Auto-accept → Plan Mode)
- **주의:** 핵심 기능에는 신중하게 사용 권장

### 기능 3: 컨텍스트 관리
- `/context` — 현재 컨텍스트 사용량 시각적 확인
- `/clear` — 대화 기록 초기화 (새 작업 시작 시 필수)
- `/compact` — 대화 요약 (긴 세션에서 토큰 절약)

**출처:** https://code.claude.com/docs/en/best-practices

---

## 4. 슬래시 명령어 전체 목록

| 명령어 | 설명 |
|--------|------|
| `/help` | 사용 가능한 모든 명령어 목록 표시 |
| `/init` | CLAUDE.md 초안 자동 생성 |
| `/clear` | 대화 기록 초기화 |
| `/compact` | 대화 내용 요약 (컨텍스트 절약) |
| `/plan` | Plan Mode 진입 |
| `/memory` | CLAUDE.md 파일 편집 |
| `/doctor` | 설치 상태 진단 |
| `/config` | 설정 패널 열기 |
| `/exit` | Claude Code 종료 |

---

## 5. 핵심 키보드 단축키

| 단축키 | 기능 |
|--------|------|
| `Shift+Tab` | 모드 순환 (일반 → Auto-accept → Plan Mode) |
| `Esc` | 작업 중단 (컨텍스트 유지) |
| `Tab` | 명령어 자동완성 (/ 입력 후) |
| `!명령어` | 쉘 명령 즉시 실행 (예: `!git status`) |

---

## 6. 효과적인 프롬프트 작성법

**나쁜 예 (모호한 요청):**
> "로그인 버튼 고쳐줘"

**좋은 예 (구체적인 요청):**
> "src/components/LoginButton.tsx 파일에서 로그인 버튼 클릭 시 API 응답이 500 에러를 반환할 때 에러 메시지가 표시되지 않는 버그를 수정해줘. React 18, TypeScript, axios를 사용 중이야."

**핵심 원칙:** 대상 파일명 + 기술 스택 + 구체적 요구사항을 명시

---

## 7. 초보자가 자주 하는 8가지 실수

1. **모호한 프롬프트 사용** — 신규 사용자의 85%가 경험. 파일명·기술스택·요구사항 명시로 해결
2. **CLAUDE.md 없이 시작** — 매 세션마다 기술 스택 재파악 → `/init`으로 사전 설정
3. **한 번에 너무 많은 변경 요청** — 큰 작업을 작은 단계로 분리 후 각 단계 검증
4. **반복 수정 없이 계속 교정** — 두 번 교정 실패 시 `/clear` 후 더 나은 초기 프롬프트 작성
5. **"잡탕 세션" (Kitchen Sink)** — 관련 없는 작업 사이에 `/clear` 사용
6. **Auto-Accept 무분별 사용** — 중요한 작업은 수동 검토 후 승인
7. **결과물 검증 스킵** — 테스트·스크린샷·예상 출력을 제공해 Claude가 스스로 검증하도록 유도
8. **수정 이유 파악 안 함** — Claude에게 수정 이유를 설명하도록 요청

**출처:** https://generativeai.pub/why-most-people-fail-with-claude-code-and-how-to-avoid-it-673da0164f91

---

## 8. 실전 활용 Top 5 팁

1. **피드백 루프 구축** — 테스트·스크린샷·예상 출력 포함 시 성공률 극적 향상 (가장 레버리지 높은 팁)
2. **먼저 계획, 그 다음 실행** — Plan Mode로 접근 방식 먼저 확인
3. **/clear를 자주 사용** — 새 작업 시작마다 채팅 기록 초기화
4. **쉘 명령을 컨텍스트에 활용** — `!git status`, `!npm test`로 결과를 컨텍스트에 포함
5. **/compact로 긴 세션 관리** — 30분 이상 세션에서 토큰 절약 (파워 유저 생산성 최대 40% 향상)

**출처:** https://www.builder.io/blog/claude-code-tips-best-practices

---

## 9. 참고 출처 URL 모음

### 공식 문서
- Claude Code 공식 문서 (한국어): https://code.claude.com/docs/ko/overview
- 빠른 시작 가이드 (영문): https://code.claude.com/docs/en/quickstart
- 공식 베스트 프랙티스: https://code.claude.com/docs/en/best-practices

### 초보자 튜토리얼
- 초보자 완벽 시작 가이드 (한국어): https://www.nxcode.io/resources/news/claude-code-tutorial-beginners-guide-2026
- Claude Code Tutorial for Beginners (영문): https://codewithmukesh.com/blog/claude-code-for-beginners/
- How to Use Claude Code - Builder.io: https://www.builder.io/blog/how-to-use-claude-code

### 실전 팁 & 베스트 프랙티스
- 50 Claude Code Tips - Builder.io: https://www.builder.io/blog/claude-code-tips-best-practices
- 7 Claude Code best practices 2026: https://www.eesel.ai/blog/claude-code-best-practices
- 20 Tips to Master Claude Code: https://creatoreconomy.so/p/20-tips-to-master-claude-code-in-35-min-build-an-app

### 초보자 실수 방지
- Why Most People Fail With Claude Code: https://generativeai.pub/why-most-people-fail-with-claude-code-and-how-to-avoid-it-673da0164f91
- Claude Code Mistakes Beginners Make: https://www.heyuan110.com/posts/ai/2026-02-25-claude-code-mistakes/

### 명령어 치트시트
- Claude Code Developer Cheatsheet: https://awesomeclaude.ai/code-cheatsheet
- Claude Code CLI Cheatsheet - Shipyard: https://shipyard.build/blog/claude-code-cheat-sheet/

### GitHub 레포지토리
- claude-code-guide (한국어): https://github.com/revfactory/claude-code-guide
- claude-code-tips (45가지 팁): https://github.com/ykdojo/claude-code-tips
