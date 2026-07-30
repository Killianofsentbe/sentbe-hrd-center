# Claude Code 완전 초보 가이드

> 🗓️ 작성일: 2026-03-25 | ✍️ 작성자: HRD Agent Team — Notion Producer
> 📌 대상: Claude Code를 처음 사용하는 임직원 | ⏱️ 예상 완독 시간: 20분

---

## 📌 학습 목표

이 가이드를 완독하면 다음을 할 수 있습니다:

- ✅ Claude Code가 무엇인지, 기존 AI 도구와 어떻게 다른지 설명할 수 있다
- ✅ Claude Code를 직접 설치하고 실행할 수 있다
- ✅ CLAUDE.md를 만들어 프로젝트에 맞게 Claude를 셋업할 수 있다
- ✅ 핵심 명령어와 단축키를 활용해 효율적으로 작업할 수 있다
- ✅ 초보자가 자주 저지르는 실수를 사전에 예방할 수 있다

---

## 📖 핵심 내용

### 1. Claude Code란? 🤖

Claude Code는 **Anthropic이 만든 터미널 기반 AI 코딩 어시스턴트**입니다.

> 💡 **한 줄 요약:** VS Code 플러그인이 아닙니다. 터미널에서 직접 실행하는 도구로, 프로젝트 전체를 이해하고 자연어로 대화하면서 실제 코드를 작성해주는 AI 팀원입니다.

**Claude Code vs 일반 ChatGPT 비교**

| 항목 | 일반 AI 챗봇 | Claude Code |
|------|-------------|------------|
| 실행 방식 | 웹 브라우저 | 터미널(CLI) |
| 파일 접근 | ❌ 불가 | ✅ 직접 읽기/쓰기 |
| 코드 수정 | 복사-붙여넣기 필요 | ✅ 자동 수정 |
| 프로젝트 이해 | ❌ 매번 설명 필요 | ✅ 전체 구조 파악 |
| 명령어 실행 | ❌ 불가 | ✅ 터미널 명령 실행 |

**주요 이정표:**
- 📅 2025년 2월: 베타 공개
- 📅 2025년 5월: 정식 출시
- 🏆 가장 널리 채택된 AI 개발 도구 중 하나로 성장

**지원 환경:**
- 🍎 macOS 10.15 이상
- 🐧 Ubuntu 20.04+ / Debian 10+
- 🪟 Windows (WSL을 통해 사용)

---

### 2. 설치하기 🛠️

> ⚠️ **사전 요건:** Node.js 18 이상이 설치되어 있어야 합니다.

**Step 1 — Claude Code 설치**

```bash
npm install -g @anthropic-ai/claude-code
```

**Step 2 — 프로젝트 디렉토리로 이동**

```bash
cd your-project
```

**Step 3 — Claude Code 실행**

```bash
claude
```

**Step 4 — 설치 상태 확인 (선택)**

```bash
/doctor
```

> 🎉 터미널에 Claude Code 프롬프트가 뜨면 준비 완료!

---

### 3. 첫 번째 사용 🚀

#### 3-1. CLAUDE.md 생성하기

CLAUDE.md는 Claude Code에게 "이 프로젝트가 어떻게 동작하는지"를 알려주는 **AI 팀원을 위한 설명서**입니다. 이 파일이 없으면 매 세션마다 Claude가 프로젝트를 처음부터 파악해야 해서 토큰이 낭비됩니다.

```bash
/init
```

> 💡 `/init` 명령 하나로 CLAUDE.md 초안이 자동 생성됩니다!

**CLAUDE.md에 꼭 넣어야 할 내용:**

```markdown
## 빌드 명령어
npm run build / pytest

## 기술 스택
React 18, TypeScript, axios

## 주요 디렉토리
src/components/ — UI 컴포넌트
src/api/        — API 연동 모듈

## 코딩 스타일
ESLint + Prettier 사용, 함수형 컴포넌트 선호
```

#### 3-2. 첫 번째 대화

Claude Code를 실행한 뒤 자연어로 요청하면 됩니다.

**나쁜 예 ❌**
```
로그인 버튼 고쳐줘
```

**좋은 예 ✅**
```
src/components/LoginButton.tsx 파일에서 로그인 버튼 클릭 시
API 응답이 500 에러를 반환할 때 에러 메시지가 표시되지 않는 버그를 수정해줘.
React 18, TypeScript, axios를 사용 중이야.
```

> 📝 **핵심 공식:** 대상 파일 + 기술 스택 + 구체적인 문제 = 좋은 프롬프트

---

### 4. 꼭 알아야 할 기능 TOP 5 ⭐

#### 🥇 1위 — Plan Mode (계획 모드)

> "팁을 하나만 기억한다면 이것입니다." — Claude Code 공식 베스트 프랙티스

코드를 바로 수정하기 전에 Claude가 **단계별 계획을 먼저 보여주는** 모드입니다. 계획을 확인하고 승인한 뒤에야 실행됩니다.

**활성화 방법:**
- `Shift+Tab` 두 번 누르기
- 또는 `/plan` 명령어 입력

```
일반 모드 → (Shift+Tab) → Auto-accept 모드 → (Shift+Tab) → Plan Mode
```

#### 🥈 2위 — 슬래시 명령어 치트시트

| 명령어 | 설명 | 언제 쓰나? |
|--------|------|-----------|
| `/init` | CLAUDE.md 자동 생성 | 프로젝트 처음 시작 시 |
| `/clear` | 대화 기록 초기화 | 새 작업 시작할 때 |
| `/compact` | 대화 요약 (토큰 절약) | 세션이 30분 이상 길어질 때 |
| `/plan` | Plan Mode 진입 | 큰 작업 시작 전 |
| `/memory` | CLAUDE.md 편집 | 프로젝트 정보 업데이트 시 |
| `/context` | 컨텍스트 사용량 확인 | 느려진다 싶을 때 |
| `/doctor` | 설치 상태 진단 | 오류 발생 시 |
| `/help` | 전체 명령어 보기 | 언제든지 |
| `/exit` | 종료 | 작업 완료 후 |

#### 🥉 3위 — 키보드 단축키

| 단축키 | 기능 |
|--------|------|
| `Shift+Tab` | 모드 순환 (일반 → Auto-accept → Plan) |
| `Esc` | 작업 중단 (컨텍스트 유지) |
| `Tab` | `/` 이후 명령어 자동완성 |
| `!명령어` | 쉘 명령 즉시 실행 (예: `!git status`) |

#### 4위 — 컨텍스트 관리

Claude의 컨텍스트 창(기억 공간)은 제한이 있습니다. 가득 차면 성능이 떨어집니다.

- `/context` — 현재 사용량 시각적 확인
- `/clear` — 대화 기록 초기화 (새 작업 시작 시 습관화)
- `/compact` — 대화 요약으로 공간 확보

#### 5위 — 이미지 드래그 앤 드롭

터미널 창에 스크린샷을 드래그 앤 드롭하면 Claude가 이미지를 분석합니다. UI 변경 작업 결과를 바로 검증할 수 있어 매우 편리합니다.

---

### 5. 초보자 체크리스트 📋

아래 항목을 순서대로 확인하며 Claude Code를 안전하게 사용하세요.

**시작 전 체크리스트**
- [ ] 🔧 Node.js 18+ 설치 확인 (`node --version`)
- [ ] 📦 Claude Code 설치 (`npm install -g @anthropic-ai/claude-code`)
- [ ] 📄 CLAUDE.md 생성 (`/init` 실행 후 내용 채우기)
- [ ] 🔍 프로젝트 스캔 결과 확인 (첫 실행 시 자동 분석)

**매 작업 전 체크리스트**
- [ ] 🧹 이전 작업과 무관하다면 `/clear`로 초기화
- [ ] 📝 요청에 파일명, 기술 스택, 구체적 문제 포함
- [ ] 🗺️ 큰 작업이라면 Plan Mode 먼저 활성화
- [ ] 🔪 큰 작업은 작은 단계로 쪼개서 순서대로 진행

**작업 후 체크리스트**
- [ ] ✔️ Claude가 수정한 코드 직접 검토 (Auto-accept 맹신 금지)
- [ ] 🧪 테스트 실행으로 결과 검증
- [ ] 📚 수정 이유 이해 (모르면 Claude에게 설명 요청)

**피해야 할 실수 TOP 3**
- ⛔ CLAUDE.md 없이 시작 → 매 세션마다 컨텍스트 낭비
- ⛔ 한 번에 너무 많은 변경 요청 → 불완전한 구현
- ⛔ Auto-accept를 핵심 기능에 무분별 사용 → 원치 않는 코드 변경

---

## 🔗 참고 링크

### 공식 문서

- 📘 [Claude Code 공식 문서 (한국어)](https://code.claude.com/docs/ko/overview)
- 📗 [Claude Code 빠른 시작 가이드 (영문)](https://code.claude.com/docs/en/quickstart)
- 📙 [Claude Code 공식 베스트 프랙티스](https://code.claude.com/docs/en/best-practices)

### 초보자 가이드

- 🇰🇷 [Claude Code 초보자 튜토리얼: 2026 완벽 시작 가이드](https://www.nxcode.io/resources/news/claude-code-tutorial-beginners-guide-2026)
- 🌐 [Claude Code Tutorial for Beginners — Complete 2026 Guide](https://codewithmukesh.com/blog/claude-code-for-beginners/)
- 📖 [Claude Code Learning Path: a practical guide (Medium)](https://medium.com/@dan.avila7/claude-code-learning-path-a-practical-guide-to-getting-started-fcc601550476)
- 🚀 [How to Use Claude Code (Beginner Guide) — Builder.io](https://www.builder.io/blog/how-to-use-claude-code)

### 실전 팁 & 베스트 프랙티스

- ⚡ [50 Claude Code Tips and Best Practices — Builder.io](https://www.builder.io/blog/claude-code-tips-best-practices)
- 🏆 [7 Claude Code best practices for 2026 (from real projects)](https://www.eesel.ai/blog/claude-code-best-practices)
- 🧩 [32 Claude Code Tips: From Basics to Advanced — YK (Substack)](https://agenticcoding.substack.com/p/32-claude-code-tips-from-basics-to)

### 명령어 치트시트

- 📋 [Claude Code Developer Cheatsheet — AwesomeClaude](https://awesomeclaude.ai/code-cheatsheet)
- 📋 [Claude Code CLI Cheatsheet — Shipyard](https://shipyard.build/blog/claude-code-cheat-sheet/)
- 📋 [Claude Code Cheat Sheet 2026 — computingforgeeks](https://computingforgeeks.com/claude-code-cheat-sheet/)

### 실수 방지

- ⚠️ [Why Most People Fail With Claude Code (and How to Avoid It)](https://generativeai.pub/why-most-people-fail-with-claude-code-and-how-to-avoid-it-673da0164f91)
- ⚠️ [10 Claude Code Mistakes Beginners Make (And How to Fix Them)](https://www.heyuan110.com/posts/ai/2026-02-25-claude-code-mistakes/)

### GitHub 레포지토리

- 🐙 [claude-code-guide (한국어, revfactory)](https://github.com/revfactory/claude-code-guide)
- 🐙 [claude-code-tips — 45가지 팁 (ykdojo)](https://github.com/ykdojo/claude-code-tips)
- 🐙 [claude-code-cheat-sheet (Njengah)](https://github.com/Njengah/claude-code-cheat-sheet)

---

## 🧠 퀴즈 (3문제)

> 직접 사용해봤는지 확인하는 퀴즈입니다. 풀어보고 정답 토글을 열어보세요!

---

**Q1. 당신은 새 프로젝트에서 Claude Code를 처음 실행했습니다.**
**Claude가 프로젝트 구조를 이해할 수 있도록 가장 먼저 해야 할 일은 무엇인가요?**

A) `/clear` 명령어로 대화를 초기화한다
B) `/init` 명령어로 CLAUDE.md를 생성하고 프로젝트 정보를 채운다
C) Auto-accept 모드를 켜고 코드 수정을 시작한다
D) `/compact` 명령어로 대화를 요약한다

> **정답 보기**
>
> **정답: B) `/init` 명령어로 CLAUDE.md를 생성하고 프로젝트 정보를 채운다**
>
> CLAUDE.md가 없으면 Claude는 매 세션마다 프로젝트 기술 스택과 구조를 처음부터 파악해야 합니다. 이는 잘못된 가정, 불필요한 질문, 토큰 낭비로 이어집니다. 가장 먼저 `/init`으로 CLAUDE.md를 생성하고 빌드 명령어, 기술 스택, 주요 디렉토리 정보를 채워두세요.

---

**Q2. Claude Code로 작업하던 중 갑자기 응답 품질이 떨어지고 엉뚱한 코드를 생성하기 시작했습니다.**
**가장 적절한 대처 방법은 무엇인가요?**

A) Claude Code를 재설치한다
B) 같은 질문을 다시 반복해서 물어본다
C) `/context`로 사용량을 확인하고, `/compact` 또는 `/clear`로 컨텍스트를 정리한다
D) Auto-accept 모드를 끈다

> **정답 보기**
>
> **정답: C) `/context`로 사용량을 확인하고, `/compact` 또는 `/clear`로 컨텍스트를 정리한다**
>
> Claude의 컨텍스트 창(기억 공간)이 가득 차면 성능이 급격히 저하됩니다. `/context` 명령으로 현재 사용량을 시각적으로 확인하고, 세션을 이어가려면 `/compact`로 대화를 요약하거나, 새 작업을 시작하려면 `/clear`로 초기화하세요. 30분 이상의 긴 세션에서는 `/compact`를 습관적으로 사용하는 것이 좋습니다.

---

**Q3. 복잡한 기능을 Claude Code에 요청하려고 합니다.**
**가장 효과적인 접근 방식은 무엇인가요?**

A) 모든 요구사항을 한 번에 나열해서 요청한다
B) Plan Mode(`/plan` 또는 `Shift+Tab` 두 번)를 먼저 활성화해서 계획을 확인한 뒤, 작업을 작은 단계로 나눠 순서대로 진행한다
C) Auto-accept 모드를 켜고 Claude에게 모든 것을 맡긴다
D) 요청을 최대한 짧고 간단하게 작성한다

> **정답 보기**
>
> **정답: B) Plan Mode를 먼저 활성화해서 계획을 확인한 뒤, 작업을 작은 단계로 나눠 순서대로 진행한다**
>
> "계획에 더 많은 시간을 쓸수록 Claude가 성공할 확률이 높아진다"는 것이 공식 베스트 프랙티스의 핵심 메시지입니다. 한 번에 너무 많은 변경을 요청하면 불완전한 구현, 일관성 없는 변경, 도구 호출 한도 초과로 이어집니다. Plan Mode로 접근 방식을 먼저 검토하고, 큰 작업은 반드시 작은 단계로 분리해서 각 단계를 검증하며 진행하세요.

---

## 💬 피드백 남기기

이 가이드가 도움이 되셨나요? 아래 항목 중 해당하는 것을 체크해 주세요.

**만족도**
- [ ] 😍 매우 유익했어요
- [ ] 😊 도움이 됐어요
- [ ] 😐 보통이에요
- [ ] 😕 아쉬운 점이 있어요

**추가로 알고 싶은 내용이 있다면 댓글로 남겨주세요!**

> 예: "실제 업무에서 활용하는 프롬프트 예시가 더 있으면 좋겠어요", "MCP 서버 연동 방법도 알고 싶어요" 등

**문의:** HRD 팀 Slack `#hrd-education` 채널

---

> 📝 이 문서는 HRD Agent Team이 제작했습니다. 내용 오류나 개선 제안은 언제든지 환영합니다.
> 마지막 업데이트: 2026-03-25
