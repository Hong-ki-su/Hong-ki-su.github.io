---
layout: default
---
# [웹 모의해킹] 인프라 보안 수업 - Burp Suite 기반 HTTP 취약점 분석 및 인젝션 실무

**날짜:** 2026년 6월 25일  
**주제:** Kali Linux, bWAPP, Burp Suite (Proxy, Intruder), SQL/HTML/Mail Header Injection, CVE-2014-3704

---

## 📝 오늘 배운 내용 상세 요약

### 1. Burp Suite를 활용한 HTTP 프로토콜 기반 웹 취약점 분석 (bWAPP 환경)
* **HTTP 헤더(User-Agent) 기반 Stored SQL Injection:** URL 파라미터가 아닌 클라이언트의 HTTP Request 헤더 값인 `User-Agent`를 Burp Suite로 Intercept하여 악의적인 SQL 쿼리로 변조했습니다. 웹 서버가 사용자의 접속 이력(IP 주소: 192.168.55.150, Date, User-Agent)을 DB에 로깅(Logging)할 때 입력값 검증 로직이 누락된 취약점을 타겟팅했습니다. 변조된 페이로드가 DB에 안전하게 Stored된 후, 관리자가 접속 이력 페이지를 열람할 때 스크립트나 쿼리가 실행되어 DB 정보가 노출되는 과정을 시각적으로 확인했습니다.
* **자동화 도구(Intruder)를 이용한 Brute-Force 공격:** 취약한 인증 체계(`ba_weak_pwd.php`)를 대상으로 Burp Suite Intruder를 활용해 무작위 대입 공격을 수행했습니다. POST 요청 패킷에서 `login`과 `password` 파라미터를 Payload 위치로 지정하고 사전 파일(Dictionary)을 삽입했습니다. 공격 실행 후 HTTP 200 응답 코드 중 패킷의 길이(Length) 변화를 분석하여 유효한 계정 증명(Credentials)을 성공적으로 크래킹 및 탈취했습니다.
* **세션(Session) 관리 및 안전한 쿠키(Cookie) 속성 분석:** 애플리케이션 로그인 시 발급되는 `PHPSESSID` 쿠키의 구조와 세션 유지 원리를 분석했습니다. 해커가 XSS 공격을 통해 클라이언트 측 자바스크립트(`document.cookie`)로 세션 ID를 탈취(Hijacking)하는 것을 원천 차단하기 위한 필수 보안 속성인 `HttpOnly` 플래그의 중요성과 적용 방식을 점검했습니다.
* **알려진 취약점(CVE) 기반 실습 (Drupalgeddon):** Exploit-DB를 활용하여 Drupal 7.x 버전대에서 발생한 치명적인 SQL Injection 취약점(CVE-2014-3704)의 원리를 분석하고, 실제 구성된 환경(`/drupal/`)에서 패치되지 않은 구버전 CMS가 어떻게 위험에 노출되는지 구조를 파악했습니다.

### 2. 웹 애플리케이션 폼(Form) 기반의 인젝션(Injection) 기법 분석
* **HTML 및 iFrame Injection:** 게시판 입력창에 악의적인 HTML 태그를 삽입해 DB에 영구적으로 저장(Stored)시키거나, 외부 웹페이지를 프레임 형태로 강제 호출하여 클라이언트의 화면을 변조하는 취약점을 실습했습니다.
* **Mail Header Injection (SMTP):** 이메일 발송 폼의 헤더(Header) 값을 비정상적으로 조작하여, 공격자가 원하는 임의의 주소로 메일을 보내는 스팸 메일 릴레이(Relay) 공격의 원리를 점검했습니다.
* **디렉토리 서비스(LDAP) 이해:** 인증 및 중앙 사용자 권한 관리에 널리 사용되는 LDAP 프로토콜의 구조를 도서관 색인 시스템에 비유하여 아키텍처 관점에서 이론적으로 학습했습니다.

---

## 💭 오늘의 회고 및 실무 다짐

### 📌 배운 점
* 단순히 눈에 보이는 웹 폼(Form) 입력창뿐만 아니라, `User-Agent`, `Cookie` 등 HTTP 헤더의 모든 영역이 강력한 공격 벡터가 될 수 있다는 점을 패킷 조작을 통해 깊이 체감했습니다.
* 사용자의 접속 이력이 시스템에 로깅되는 일련의 과정 속에서, **'모든 클라이언트의 입력 데이터는 신뢰할 수 없다'**는 제로 트러스트(Zero Trust) 관점의 입력값 검증이 얼마나 중요한지 인프라 보안 관점에서 확실하게 이해할 수 있었습니다.

### 🚨 트러블슈팅 (어려운 점 및 개선할 점)
* **Intruder 세션 충돌 이슈:** Burp Suite Intruder를 활용한 자동화 공격 실습 중, 내 실습 환경(192.168.55.150)에서 일시적인 세션 설정 충돌로 인해 페이로드가 정상적으로 반환되지 않는 문제가 발생했습니다.
* **응답 패킷 분석을 통한 디버깅:** 에러에 당황하지 않고, 강사님의 정상 트래픽 환경(192.168.56.x 대역)에서 캡처된 Request/Response 패킷 구조를 내 로그와 비교 대조하는 방식으로 차분하게 트러블슈팅을 진행했습니다. 이를 통해 툴의 단순 조작법을 넘어, 공격 성공 시 서버가 반환하는 응답 길이(Length)의 미세한 차이를 캐치하는 **데이터 분석 역량**의 중요성을 뼈저리게 배웠습니다.

### 💡 실무를 위한 액션 플랜
* 포트폴리오의 전문성을 높이기 위해, 오늘 실습한 `조작된 User-Agent 패킷 전송 -> 웹 서버 로깅 -> DB 저장 -> 관리자 페이지 출력 시 쿼리 실행`으로 이어지는 데이터 플로우를 시퀀스 다이어그램으로 시각화해 두겠습니다.
* Burp Suite Intruder가 제공하는 4가지 공격 타입(Sniper, Battering ram, Pitchfork, Cluster bomb)의 작동 방식 차이를 별도로 복습하고 문서화하여 완벽히 숙지하겠습니다.

### 🤝 함께 나누고 싶은 점
> **"보안의 기본 원칙: Trust No One!"**

보안의 기본인 '모든 클라이언트 입력값은 신뢰하지 않는다'는 원칙은 URL 파라미터뿐만 아니라 HTTP 헤더 전반에 적용되어야 함을 다시 한번 되새기는 하루였습니다. 팀원들과 패킷을 뜯어보며 숨겨진 공격 벡터를 찾아보는 연습을 함께하면 좋을 것 같습니다.

---
**📚 참고자료**
* bWAPP (buggy web application): OWASP Top 10 기반 웹 취약점 실습 환경 (Target IP: 192.168.55.150)
* Exploit Database: CVE-2014-3704 (Drupal 7.0 < 7.31 - 'Drupalgeddon' SQL Injection)
* PortSwigger: Burp Suite Community Edition 매뉴얼 (Proxy, Intruder 활용법)

