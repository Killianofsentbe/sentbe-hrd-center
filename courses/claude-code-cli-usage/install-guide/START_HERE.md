# Claude Code CLI 온보딩 — 여기서 시작하세요

> 설치가 제일 큰 허들입니다. 막히면 정상입니다. 오류 화면을 캡처해서 지원 채널에 올리면 됩니다.

## 3줄 요약

- Claude Code CLI는 **내 컴퓨터 폴더를 읽고 파일을 만들 수 있는 Claude**입니다.
- 먼저 아래 표에서 내 OS에 맞는 설치 경로를 고르세요.
- 설치가 끝나면 이 폴더의 `sample-files/`로 **첫 10분 체험**을 진행하세요.

## 1. 나는 어떤 문서를 보면 되나요?

| 나는 이런 사용자 | 먼저 볼 내용 |
|---|---|
| Mac 사용자 | `Claude-Code-CLI-OS별-설치-가이드.md`의 **Part A. macOS 설치 가이드** |
| Windows 사용자, 터미널이 익숙하지 않음 | `Claude-Code-CLI-OS별-설치-가이드.md`의 **Part B. Windows 설치 가이드 — 추천: Native Windows** |
| Windows에서 PowerShell/CMD가 헷갈림 | Part B의 **PowerShell/CMD 혼동 주의** 섹션 |
| Windows 개발자/자동화 작업 많음 | Native Windows 먼저 시도 후 필요하면 **Part C. WSL 방식** |
| Linux 사용자 | **Part D. Linux 설치 가이드** |
| 설치는 됐고 바로 써보고 싶음 | **Part E. 설치 후 첫 체험 미션** |
| 설치 중 막힘 | 이 파일 아래의 **지원 요청 템플릿** 또는 `FAQ-문제해결-지원동선.md` |

## 2. 예상 소요시간

- 설치: 5~15분
- 로그인: 2~5분
- 첫 체험: 10분

## 3. 성공 기준

아래 명령을 실행했을 때 버전이 보이면 설치 성공입니다.

```bash
claude --version
```

예상 결과:

```text
claude-code x.x.x
```

## 4. 설치 후 반드시 해볼 첫 10분 체험

웹/앱 Claude와 CLI의 차이를 가장 빨리 느끼는 미션입니다.

1. 이 폴더의 `sample-files/`를 바탕화면에 복사합니다.
2. 터미널/PowerShell에서 복사한 폴더로 이동합니다.
3. `claude`를 실행합니다.
4. Claude Code 안에서 아래를 입력합니다.

```text
이 폴더에 어떤 파일이 있는지 확인하고, 각 파일이 무엇을 담고 있는지 한 줄씩 설명해줘.
```

그다음 아래를 입력합니다.

```text
memo1.md, memo2.md, todo.csv를 읽고 README.md를 만들어줘. README에는 1) 핵심 요약 2) 담당자별 할 일 3) 다음 액션을 넣어줘.
```

체감 포인트:

- 웹/앱 Claude: 내가 파일을 직접 올리거나 붙여넣어야 함
- Claude Code CLI: 현재 폴더 파일을 직접 읽고, 결과 파일을 직접 생성함

## 5. 설치 중 막혔을 때

먼저 `FAQ-문제해결-지원동선.md`에서 오류 메시지를 찾아보세요.

그래도 해결되지 않으면 Slack 지원 채널에 아래 템플릿으로 요청하세요.

```text
[Claude Code CLI 설치 지원 요청]
1. OS: Windows 11 / macOS / 기타
2. 사용한 문서: 예) Part B Windows 설치 가이드
3. 실행한 명령어: 예) irm https://claude.ai/install.ps1 | iex
4. 오류 메시지 또는 캡처: 첨부
5. claude --version 결과: 성공/실패
6. claude doctor 결과: 가능하면 첨부
7. 회사 VPN/프록시 사용 여부: 예/아니오
```

## 6. 배포 담당자용 참고

- UX/비개발자 관점 개선안: `UX-온보딩-패키지-개선안.md`
- FAQ/지원 동선 초안: `FAQ-문제해결-지원동선.md`
- 스크린샷 촬영 체크리스트: `screenshots/README.md`
- Slack/Notion/파일럿 배포 템플릿: `rollout/`
