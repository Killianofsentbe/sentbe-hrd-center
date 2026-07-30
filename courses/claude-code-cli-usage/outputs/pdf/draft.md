# Claude Code 완전 초보 사용법
**대상:** 코딩 경험이 없는 임직원 전체
**소요 시간:** 약 20분 (A4 기준 9페이지)
**작성일:** 2026-03-25
**작성:** HRD팀 / Doc/Slide Producer

---

## 학습 목표 (Learning Objectives)

이 문서를 끝까지 읽고 나면 다음 다섯 가지를 스스로 할 수 있습니다.

1. Claude Code가 무엇인지 동료에게 한 문장으로 설명할 수 있다.
2. 터미널에서 Claude Code를 설치하고 실행할 수 있다.
3. CLAUDE.md 파일을 만들어 Claude에게 프로젝트 정보를 전달할 수 있다.
4. Plan Mode를 활용해 안전하게 첫 번째 작업을 요청할 수 있다.
5. 초보자가 자주 하는 실수 8가지를 인지하고 예방할 수 있다.

> **읽는 방법:** 개념 섹션을 읽고 → 실습 스텝을 따라하세요. 코드 블록(`회색 배경`)은 그대로 복사해서 터미널에 붙여넣기하면 됩니다.

---

## 1장. Claude Code란 무엇인가?

### Claude Code, 한 문장으로 설명하면

> **"자연어(한국어)로 말하면 파일을 직접 열고 코드를 써주는 AI 어시스턴트"**

Claude Code는 Anthropic이 2025년 5월 정식 출시한 터미널 기반 AI 도구입니다. VS Code 같은 편집기 플러그인이 아니라 터미널(명령줄)에서 실행되며, 프로젝트 폴더 전체를 이해한 뒤 자연어 지시에 따라 파일 읽기·쓰기·수정을 자율적으로 수행합니다.

### 무엇이 다른가?

| 기존 방식 | Claude Code |
|-----------|-------------|
| 구글에서 코드 검색 → 복사 → 수정 시도 | 무엇을 원하는지 말하면 Claude가 직접 작성 |
| 에러 메시지를 해석하지 못해 막힘 | 에러 메시지를 Claude에게 붙여넣으면 원인·해결책 제시 |
| 반복적인 파일 수정이 번거로움 | 여러 파일을 한 번에 수정 가능 |

### 지원 환경 확인

- **macOS:** 10.15 (Catalina) 이상 — 회사 지급 맥북은 대부분 해당
- **Ubuntu/Debian:** Ubuntu 20.04+, Debian 10+
- **Windows:** WSL(Windows Subsystem for Linux) 설치 후 사용 가능 (IT팀 문의)
- **공통 필수:** Node.js 18 이상

---

## 2장. 설치 및 초기 설정

### 실습 스텝 1: Node.js 버전 확인

터미널을 열고 아래 명령어를 입력하세요.

```bash
node --version
```

**기대 결과:** `v18.0.0` 이상의 버전 번호가 출력되면 통과입니다.

```
v22.14.0   ← 이런 식으로 나오면 OK
```

버전이 18 미만이거나 `command not found` 오류가 뜨면 [Node.js 공식 사이트](https://nodejs.org)에서 LTS 버전을 설치하세요.

---

### 실습 스텝 2: Claude Code 설치

```bash
npm install -g @anthropic-ai/claude-code
```

설치에는 약 1~2분 걸립니다. 완료 메시지가 뜨면 다음 단계로 넘어가세요.

**설치 확인:**

```bash
claude --version
```

버전 번호가 출력되면 설치 완료입니다.

---

### 실습 스텝 3: Claude Code 실행

작업하고 싶은 폴더로 이동한 뒤 `claude`를 입력합니다.

```bash
# 예시: 바탕화면의 my-project 폴더로 이동
cd ~/Desktop/my-project

# Claude Code 실행
claude
```

최초 실행 시 Anthropic 계정 로그인이 필요합니다. 화면의 안내에 따라 계정을 연결하세요.

실행 화면 예시:
```
Claude Code v1.x.x
> 안녕하세요! 무엇을 도와드릴까요?
```

이 프롬프트가 뜨면 Claude Code가 정상 작동 중입니다.

**문제가 생겼다면:**

```bash
/doctor
```

`/doctor`를 입력하면 설치 상태를 자동으로 진단하고 해결 방법을 알려줍니다.

---

### 실습 스텝 4: CLAUDE.md 파일 만들기

CLAUDE.md는 Claude에게 "이 프로젝트는 이런 프로젝트야"라고 알려주는 안내서입니다. 한 번만 만들어두면 매 세션마다 반복 설명을 하지 않아도 됩니다.

```bash
/init
```

`/init`을 입력하면 Claude가 현재 폴더를 분석해 CLAUDE.md 초안을 자동으로 생성합니다.

**CLAUDE.md 작성 예시:**

```markdown
# 프로젝트 안내

## 기술 스택
- Node.js 18, JavaScript (ES Modules)
- 패키지 관리: npm

## 주요 명령어
- 실행: node index.js
- 테스트: npm test

## 폴더 구조
- src/ — 소스 코드
- data/ — 데이터 파일
- docs/ — 문서

## 주의사항
- data/ 폴더의 파일은 절대 삭제하지 않기
- 들여쓰기는 스페이스 2칸 사용
```

> **팁:** CLAUDE.md가 너무 길면 Claude가 중요한 규칙을 놓칩니다. 핵심 내용만 간결하게 작성하세요.

---

## 3장. 핵심 기능: Plan Mode와 명령어

### Plan Mode — 초보자의 가장 강력한 도구

Plan Mode는 Claude가 작업을 실행하기 **전에** 단계별 계획을 먼저 보여주는 기능입니다. 계획을 확인하고 승인해야만 실제로 파일이 변경됩니다.

**Plan Mode 켜는 방법:**

| 방법 | 입력 |
|------|------|
| 슬래시 명령어 | `/plan` 입력 후 Enter |
| 키보드 단축키 | `Shift+Tab`을 두 번 누르기 |

**Plan Mode 사용 예시:**

```
> /plan

[Plan Mode 활성화됨]

> 현재 폴더에 있는 텍스트 파일들의 목록을 출력하는 스크립트를 만들어줘

Claude: 계획을 세워볼게요.

1. 현재 폴더 구조를 파악합니다.
2. Node.js로 폴더의 .txt 파일을 읽는 스크립트(list-files.js)를 생성합니다.
3. 파일 목록을 콘솔에 출력하는 코드를 작성합니다.

이 계획대로 진행할까요? (y/n)
```

`y`를 입력하면 실행되고, `n`을 입력하거나 방향을 바꿀 수 있습니다.

---

### 슬래시 명령어 빠른 참조표

| 명령어 | 언제 쓰나? |
|--------|------------|
| `/init` | 프로젝트를 처음 시작할 때, CLAUDE.md 자동 생성 |
| `/plan` | 중요한 작업 전, 계획 먼저 확인하고 싶을 때 |
| `/clear` | 새로운 작업을 시작할 때, 대화 기록 초기화 |
| `/compact` | 30분 이상 긴 세션에서 컨텍스트 절약 |
| `/context` | 컨텍스트 사용량이 얼마나 남았는지 확인 |
| `/memory` | CLAUDE.md 내용을 수정하고 싶을 때 |
| `/doctor` | 설치 오류나 이상 증상이 생겼을 때 |
| `/help` | 모든 명령어 목록을 보고 싶을 때 |
| `/exit` | Claude Code 종료 |

> **팁:** `/`를 입력하면 자동완성 목록이 뜨고, `Tab`으로 선택할 수 있습니다.

---

### 키보드 단축키

| 단축키 | 기능 |
|--------|------|
| `Shift+Tab` | 모드 순환: 일반 → Auto-accept → Plan Mode |
| `Esc` | 작업 즉시 중단 (컨텍스트는 유지) |
| `Tab` | `/` 입력 후 명령어 자동완성 |
| `!명령어` | 쉘 명령 즉시 실행 (예: `!ls`, `!git status`) |

**`!명령어` 활용 예시:**

```
> !ls -la
(파일 목록이 Claude의 컨텍스트에 포함됨)

Claude: 폴더에 다음 파일들이 있군요. README.md가 없네요. 생성해드릴까요?
```

---

## 4장. 실습: 첫 번째 Claude Code 작업

### 실습 시나리오

현재 폴더에 있는 파일 목록을 읽어서 `README.md`를 자동 생성해보겠습니다. 코딩 경험이 전혀 없어도 따라할 수 있습니다.

---

### 실습 스텝 5: Plan Mode로 첫 작업 요청하기

**1단계: Plan Mode 활성화**

```
/plan
```

**2단계: 작업 요청**

```
현재 폴더에 있는 파일들을 파악하고, 이 폴더가 무슨 프로젝트인지 README.md 파일을 한국어로 만들어줘. 파일 목록, 사용 방법, 주의사항을 포함해줘.
```

**3단계: 계획 확인 후 승인**

Claude가 계획을 보여주면 검토한 뒤 `y`를 입력합니다.

**4단계: 결과 확인**

```bash
# Claude가 완료한 뒤, 쉘 명령으로 파일 생성 확인
!ls -la README.md
```

---

### 실습 스텝 6: 컨텍스트 관리

작업을 여러 개 하다 보면 Claude의 컨텍스트(대화 기억)가 가득 차서 성능이 떨어질 수 있습니다.

**컨텍스트 확인:**

```
/context
```

사용량 바가 80% 이상이면 관리가 필요합니다.

**새 작업 시작 시 — 항상 초기화:**

```
/clear
```

**긴 세션에서 요약:**

```
/compact
```

> **기억하세요:** 새로운 작업을 시작할 때마다 `/clear`를 입력하는 것이 습관이 되어야 합니다.

---

## 5장. 초보자가 자주 하는 실수 8가지

자주 하는 실수를 미리 알면 헤매는 시간을 크게 줄일 수 있습니다.

---

### 실수 1: 모호한 프롬프트 사용

신규 사용자의 85%가 이 실수를 합니다.

```
# 나쁜 예
"로그인 버튼 고쳐줘"

# 좋은 예
"src/components/LoginButton.tsx 파일에서 로그인 버튼 클릭 시
API 응답이 500 에러를 반환할 때 에러 메시지가 표시되지 않는 버그를 수정해줘.
React 18, TypeScript, axios를 사용 중이야."
```

**공식:** [파일 경로] + [문제 상황] + [기술 스택] + [비즈니스 제약]

---

### 실수 2: CLAUDE.md 없이 시작

매 세션마다 Claude가 프로젝트를 처음부터 파악해야 합니다 → 시간 낭비, 토큰 낭비.

**해결:** `/init`으로 CLAUDE.md 생성 후 프로젝트 정보 추가.

---

### 실수 3: 한 번에 너무 많은 변경 요청

```
# 나쁜 예
"전체 로그인 시스템을 OAuth로 바꾸고, UI도 리디자인하고, 테스트도 다 작성해줘"

# 좋은 예
1단계: "현재 로그인 로직이 어디 있는지 파악해줘"
2단계: "OAuth 연동을 위한 설계 계획을 보여줘"
3단계: "계획대로 auth.js 파일부터 수정해줘"
```

**해결:** 큰 작업을 작은 단계로 쪼개고 각 단계마다 확인 후 진행.

---

### 실수 4: 반복 교정 없이 계속 수정

같은 방식으로 두 번 이상 교정에 실패하면 컨텍스트가 오염됩니다.

**해결:** 두 번 실패 시 → `/clear` → 학습한 내용을 반영한 더 나은 프롬프트로 새로 시작.

---

### 실수 5: "Kitchen Sink" 세션 (잡탕 세션)

하나의 세션에서 전혀 다른 작업들을 섞어서 진행하면 컨텍스트가 오염됩니다.

```
# 잘못된 예
"파일 목록 정리해줘" → "아, 참고로 Slack 봇도 만들고 싶어" → "다시 파일로 돌아가서..."
```

**해결:** 관련 없는 작업 사이에는 반드시 `/clear`.

---

### 실수 6: Auto-Accept 무분별 사용

`Shift+Tab`으로 Auto-accept 모드를 켜면 모든 파일 수정이 자동으로 승인됩니다. 중요한 파일에서 사용하면 의도치 않은 변경이 생길 수 있습니다.

**해결:** 간단한 반복 작업에만 사용. 핵심 기능은 수동 검토 후 승인.

---

### 실수 7: 결과물 검증 스킵

Claude가 작성한 코드를 테스트 없이 그냥 사용하면 예상치 못한 오류가 발생할 수 있습니다.

**해결:** 작업 요청 시 "완료 후 `!node index.js`로 실행해서 오류가 없는지 확인해줘"처럼 검증 조건을 포함.

---

### 실수 8: 수정 이유를 파악하지 않음

Claude가 무언가를 고쳤는데 왜 고쳤는지 모른 채 넘어가면 같은 실수를 반복합니다.

**해결:** "왜 이렇게 수정했는지 설명해줘"를 습관적으로 요청.

---

## 6장. 실전 팁 TOP 5

### 팁 1: 피드백 루프 구축 (가장 레버리지가 높은 팁)

테스트 조건, 스크린샷, 예상 출력을 함께 제공하면 Claude가 스스로 검증합니다.

```
"로그인 버튼 수정 후 !npm test를 실행해서 모든 테스트가 통과하는지 확인해줘.
예상 결과: 'Tests: 12 passed, 0 failed'"
```

### 팁 2: 항상 Plan Mode 먼저

하나만 기억한다면 이것입니다. 모든 중요한 작업은 `/plan`으로 시작하세요.

### 팁 3: `/clear`를 새 작업마다 실행

오래된 대화 기록이 남아있으면 관련 없는 정보로 컨텍스트가 가득 찹니다. 새 작업 = `/clear`를 공식처럼 외워두세요.

### 팁 4: `/compact`로 긴 세션 관리

30분 이상 이어진 세션은 `/compact`로 요약하세요. 오래된 내용을 압축해서 컨텍스트 여유를 확보합니다.

### 팁 5: `!` 명령어로 실시간 컨텍스트 제공

```
!git status
```

입력하면 현재 git 상태가 Claude의 컨텍스트에 포함되어 Claude가 상황을 보고 즉시 판단합니다.

---

## 7장. 요약

| 단계 | 핵심 행동 |
|------|-----------|
| 설치 | `npm install -g @anthropic-ai/claude-code` |
| 실행 | 작업 폴더에서 `claude` 입력 |
| 준비 | `/init`으로 CLAUDE.md 생성 |
| 작업 | `/plan`으로 계획 먼저 확인 |
| 관리 | 새 작업마다 `/clear`, 긴 세션엔 `/compact` |
| 습관 | 구체적 프롬프트 + 결과 검증 + 이유 파악 |

**가장 중요한 3가지만 기억하세요:**

1. `/plan` — 항상 계획 먼저
2. `/clear` — 새 작업마다 초기화
3. 구체적 프롬프트 — 파일명 + 기술 스택 + 요구사항

---

## 8장. 참고 링크

### 공식 문서
- [Claude Code 공식 문서 (한국어)](https://code.claude.com/docs/ko/overview)
- [Claude Code 빠른 시작 가이드 (영문)](https://code.claude.com/docs/en/quickstart)
- [Claude Code 공식 베스트 프랙티스](https://code.claude.com/docs/en/best-practices)

### 초보자 튜토리얼
- [Claude Code 초보자 튜토리얼: 2026 완벽 시작 가이드 (한국어)](https://www.nxcode.io/resources/news/claude-code-tutorial-beginners-guide-2026)
- [Claude Code 빠른 시작 가이드 — 클라우드 네이티브 (한국어)](https://claudecode.blueshirtmap.com/ko/guide)
- [Claude Code Tutorial for Beginners — Complete 2026 Guide (영문)](https://codewithmukesh.com/blog/claude-code-for-beginners/)
- [How to Use Claude Code (Beginner Guide) — Builder.io](https://www.builder.io/blog/how-to-use-claude-code)

### 실전 팁 & 베스트 프랙티스
- [50 Claude Code Tips and Best Practices — Builder.io](https://www.builder.io/blog/claude-code-tips-best-practices)
- [7 Claude Code best practices for 2026 (from real projects)](https://www.eesel.ai/blog/claude-code-best-practices)
- [20 Tips to Master Claude Code in 35 Minutes](https://creatoreconomy.so/p/20-tips-to-master-claude-code-in-35-min-build-an-app)

### 실수 방지
- [Why Most People Fail With Claude Code (and How to Avoid It)](https://generativeai.pub/why-most-people-fail-with-claude-code-and-how-to-avoid-it-673da0164f91)
- [10 Claude Code Mistakes Beginners Make (And How to Fix Them)](https://www.heyuan110.com/posts/ai/2026-02-25-claude-code-mistakes/)

### 명령어 치트시트
- [Claude Code Developer Cheatsheet — AwesomeClaude](https://awesomeclaude.ai/code-cheatsheet)
- [Claude Code CLI Cheatsheet — Shipyard](https://shipyard.build/blog/claude-code-cheat-sheet/)
- [claude-code-guide (한국어, GitHub)](https://github.com/revfactory/claude-code-guide)

---

*이 문서에 대한 피드백은 Slack #onboarding 채널로 보내주세요.*
*HRD팀은 여러분의 의견을 반영해 자료를 지속적으로 개선합니다.*
