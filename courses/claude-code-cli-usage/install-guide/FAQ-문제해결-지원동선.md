# Claude Code CLI FAQ / 문제해결 / 지원 동선

## 먼저 확인할 것

1. 설치 성공 확인

```bash
claude --version
```

2. 상태 진단

```bash
claude doctor
```

3. 오류가 나면 화면 캡처 후 아래 템플릿으로 지원 요청

```text
[Claude Code CLI 설치 지원 요청]
1. OS: Windows 11 / macOS / 기타
2. 실행한 터미널: PowerShell / CMD / macOS Terminal / WSL Ubuntu
3. 실행한 명령어:
4. 오류 메시지 또는 캡처:
5. claude --version 결과:
6. claude doctor 결과:
7. 회사 VPN/프록시 사용 여부:
```

---

## Windows FAQ

### 1. PowerShell에서 `&&` 오류가 납니다

- 증상: `The token '&&' is not a valid statement separator`
- 원인: CMD용 명령을 PowerShell에 붙여넣었습니다.
- 해결: PowerShell에서는 아래 명령을 사용하세요.

```powershell
irm https://claude.ai/install.ps1 | iex
```

### 2. CMD에서 `irm` 오류가 납니다

- 증상: `'irm' is not recognized as an internal or external command`
- 원인: PowerShell용 명령을 CMD에 붙여넣었습니다.
- 해결: CMD에서는 아래 명령을 사용하세요.

```cmd
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd
```

### 3. `'claude' is not recognized`가 나옵니다

- 원인: 설치 경로가 PATH에 반영되지 않았거나 새 터미널을 열지 않았습니다.
- 해결:
  1. PowerShell/CMD를 완전히 닫고 다시 엽니다.
  2. `claude --version`을 다시 실행합니다.
  3. 계속 실패하면 `claude doctor` 결과와 함께 지원 요청하세요.

### 4. `.ps1` 스크립트 실행이 차단됩니다

- 원인: 회사 보안 정책 또는 PowerShell 실행 정책 때문일 수 있습니다.
- 해결:
  1. 직접 정책을 우회하려고 하지 마세요.
  2. 오류 캡처와 함께 IT/지원 채널에 요청하세요.
- 지원 요청 문구:

```text
Windows PowerShell에서 Claude Code 설치 중 스크립트 실행 정책으로 차단됩니다. 사내 보안정책상 허용 가능한 설치 경로 확인 부탁드립니다.
```

### 5. Windows Native와 WSL 중 무엇을 써야 하나요?

- 비개발자/일반 업무 사용자: **Windows Native** 권장
- 개발자/데이터/자동화/리눅스 기반 프로젝트 사용자: Native를 먼저 시도하고 필요 시 WSL 고려
- Native 설치가 회사 보안정책/PATH 문제로 계속 실패: WSL 또는 IT 배포 방식 검토

---

## macOS FAQ

### 1. `command not found: claude`가 나옵니다

- 해결:
  1. 터미널을 완전히 닫고 다시 엽니다.
  2. `claude --version`을 다시 실행합니다.
  3. 계속 실패하면 `echo $SHELL` 결과와 `claude doctor` 결과를 지원 채널에 공유하세요.

### 2. `permission denied`가 나옵니다

- 원인: 사용자 홈 디렉토리 권한 또는 설치 경로 권한 문제일 수 있습니다.
- 해결: 관리자 명령을 임의로 실행하지 말고 IT에 문의하세요.

### 3. `curl: command not found`가 나옵니다

- 드문 케이스입니다. macOS 개발자 도구 문제일 수 있습니다.
- 가능하면 IT 지원을 받으세요. 안내받은 경우에만 아래를 실행합니다.

```bash
xcode-select --install
```

---

## 로그인 FAQ

### 1. 브라우저 로그인 창이 열리지 않습니다

- 터미널에 표시된 URL을 복사해 브라우저에 직접 붙여넣습니다.
- 회사 VPN/프록시 사용 중이면 끄고 재시도하거나 IT 정책을 확인합니다.

### 2. 로그인은 했는데 터미널이 계속 대기합니다

- 브라우저 승인 완료 후 터미널로 돌아옵니다.
- 터미널에 추가 승인 문구가 있는지 확인합니다.
- 계속 대기하면 `Ctrl+C`로 종료 후 `claude`를 다시 실행합니다.

### 3. 계정/조직 권한 오류가 납니다

- 설치 문제가 아니라 계정 권한 문제일 수 있습니다.
- HRD/IT/계정 관리자에게 오류 화면을 전달하세요.

---

## 네트워크 / 보안 FAQ

### 1. 다운로드가 실패합니다

- 원인 후보: 회사 VPN, 프록시, 방화벽, 일시적 네트워크 오류
- 해결:
  1. 인터넷 연결 확인
  2. VPN/프록시 정책 확인
  3. 같은 명령 재시도
  4. 계속 실패하면 오류 캡처와 함께 IT에 문의

### 2. 회사 보안 프로그램이 차단합니다

- 사용자가 임의로 우회하지 않습니다.
- IT/보안 검토가 완료된 설치 스크립트 또는 배포 패키지를 요청합니다.

---

## 지원 동선

1. 이 FAQ에서 오류 메시지를 검색합니다.
2. 해결되지 않으면 Slack `#claude-code-onboarding-help`에 지원 요청 템플릿으로 공유합니다.
3. 계정/권한/보안정책 문제는 HRD/IT 담당자가 계정 관리자 또는 보안 담당자에게 에스컬레이션합니다.
