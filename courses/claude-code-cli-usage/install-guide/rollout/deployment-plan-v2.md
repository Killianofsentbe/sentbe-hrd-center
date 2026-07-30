# Claude Code CLI 온보딩 배포계획 v2

## 결론

바로 전사 배포하지 않고, **파일럿 관리형 배포**로 진행합니다.

핵심 전략:
1. 설치 가이드는 OS별로 분리
2. Windows는 Native Windows를 기본 경로로 안내
3. WSL은 개발자/자동화 고급 사용자용으로 분리
4. 원클릭 설치 스크립트는 IT/보안 검토 전까지 파일럿 초안으로만 사용
5. 첫 교육 목표는 “기능 숙지”가 아니라 “설치 성공 + 첫 로컬 파일 생성 경험”으로 정의

---

## 1. 배포 패키지 구조

현재 위치:

```text
~/sentbe-hrd-center/courses/claude-code-cli-usage/install-guide/
```

권장 배포 폴더:

```text
Claude-Code-CLI-Onboarding/
├── START_HERE.md
├── Claude-Code-CLI-OS별-설치-가이드.md
├── FAQ-문제해결-지원동선.md
├── UX-온보딩-패키지-개선안.md
├── macos-install-claude-code.command
├── windows-install-claude-code.ps1
├── sample-files/
├── screenshots/
│   └── README.md
└── rollout/
    ├── slack-announcement-template.md
    ├── notion-wiki-template.md
    ├── pilot-checklist.md
    └── 배포계획-v2.md
```

---

## 2. 배포 채널

### 1순위: Google Drive

목적: 공식 배포 파일 보관.

권장 경로:

```text
HR Gdrive/01. HR_Public (S1)/HRD/Claude Code CLI Onboarding/
```

운영 원칙:
- 읽기 전용 공유
- 버전명/배포일 표시
- 설치 스크립트에는 “IT 검토 필요” 라벨 유지
- 최신 링크는 Notion/위키에서만 안내

### 2순위: Notion 또는 killian-wiki

목적: 사용자가 “내 OS에서는 뭘 누르면 되는지” 바로 알게 하는 랜딩 페이지.

필수 구성:
- macOS 사용자 시작 버튼
- Windows 사용자 시작 버튼
- Windows WSL은 고급 사용자용으로 분리
- FAQ 링크
- 지원 요청 템플릿
- 파일럿 대상/기간/문의처

### 3순위: Slack 공지

목적: 긴 설명이 아니라 CTA 제공.

권장 CTA:
> “10분 안에 내 컴퓨터에서 Claude가 README.md 파일을 직접 만들게 해보세요.”

---

## 3. 파일럿 설계

### 대상

1차 파일럿: 8~12명

구성 권장:
- macOS 사용자 4~6명
- Windows 사용자 4~6명
- CLI 비숙련자 최소 30%
- HRD/HR/GA/기획/개발/데이터 직군 혼합

### 방식

- 60분 라이브 세션
- 30분 자율 실습
- Windows 사용자는 별도 지원자 배치
- 설치 중 화면 공유 허용

### 관찰 항목

- 설치 성공까지 걸린 시간
- `claude --version` 성공 여부
- 첫 `claude` 실행/로그인 성공 여부
- PowerShell/CMD 혼동 여부
- PATH 오류 여부
- 보안 프로그램 차단 여부
- 첫 체험 미션 완료 여부
- 사용자가 “웹/앱보다 CLI가 좋은 이유”를 설명할 수 있는지

---

## 4. Go / No-Go 기준

전사 확산 조건:

- 전체 설치 성공률 85% 이상
- Windows 설치 성공률 75% 이상
- 첫 체험 미션 완료율 80% 이상
- 평균 설치 소요시간 20분 이하
- 중대 보안/권한 이슈 0건
- FAQ에 주요 오류 대응 반영 완료

기준 미달 시:
- 전사 배포 보류
- Windows 가이드/FAQ 보강
- IT 배포 방식 재검토
- 추가 파일럿 1회 진행

---

## 5. IT/보안 체크리스트

전사 배포 전 필수:

- [ ] 공식 설치 스크립트 원문 검토
- [ ] SHA256 해시 기록
- [ ] `curl | bash`, `irm | iex` 허용 여부 결정
- [ ] 가능하면 Jamf/Intune/MDM 배포 검토
- [ ] 관리자 권한 없이 설치되는지 확인
- [ ] PowerShell 실행 정책 충돌 확인
- [ ] `ExecutionPolicy Unrestricted` 금지 문구 반영
- [ ] `--dangerously-skip-permissions` 금지 문구 반영
- [ ] 개인 계정/API Key 사용 정책 확정
- [ ] 개인정보/고객정보/인증키 입력 금지 문구 반영
- [ ] 전용 실습 폴더에서만 실행하도록 안내

---

## 6. 교육 성공 기준

사용자가 교육 후 할 수 있어야 하는 것:

1. 본인 OS에 맞는 설치 경로를 고를 수 있다.
2. Claude Code CLI를 설치하고 `claude --version`으로 확인할 수 있다.
3. 작업 폴더에서 `claude`를 실행할 수 있다.
4. 샘플 파일을 읽게 하고 `README.md`를 생성하게 할 수 있다.
5. 웹/앱 Claude와 Claude Code CLI의 차이를 한 문장으로 설명할 수 있다.
6. 민감정보가 있는 폴더에서 실행하면 안 된다는 것을 이해한다.

---

## 7. 첫 체험 미션 개선 방향

현재 샘플 파일 기반 실습은 유지합니다.

다만 실습 마지막에 아래 질문을 추가합니다.

- 웹 Claude였다면 이 작업을 하려면 어떤 수동 단계가 필요했나요?
- Claude Code CLI가 직접 처리한 일은 무엇인가요?
- 내 업무에서 비슷하게 자동화할 수 있는 파일 작업은 무엇인가요?

실습 완료 기준:

- `README.md` 생성
- `todo.csv` 담당자별 정리
- 다음 액션 3개 제안
- 사용자가 결과 파일을 직접 열어 확인

---

## 8. 다음 액션

1. IT/보안 검토 요청
2. 실제 macOS/Windows 스크린샷 촬영
3. Google Drive 배포 폴더 생성
4. Notion/위키 랜딩 페이지 작성
5. 파일럿 대상자 8~12명 선정
6. 파일럿 진행 후 FAQ 업데이트
7. Go/No-Go 기준 충족 시 전사/희망자 대상 확산
