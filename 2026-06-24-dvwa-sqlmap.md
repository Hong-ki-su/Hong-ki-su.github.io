---
layout: default
---
# [인프라/모의해킹] 인프라 보안 수업 - Ubuntu APM 환경 구축 및 sqlmap 자동화 공격 실무

**날짜:** 2026년 6월 24일  
**주제:** Ubuntu, APM, DVWA, SQL Injection, sqlmap, OWASP ZAP

---

## 📝 오늘 배운 내용 상세 요약

### 1. Ubuntu 환경 기반 DVWA(웹 취약점 진단 환경) 서버 구축
* **APM 패키지 및 필요 도구 설치:** `sudo apt install -y apache2 mariadb-server php php-mysqli php-gd libapache2-mod-php git` 명령어를 통해 웹 서버 운영에 필요한 Apache, MariaDB, PHP 및 소스코드 관리를 위한 Git을 일괄 설치했습니다.
* **데이터베이스(MariaDB) 구성:** `sudo systemctl start mariadb`로 DB 구동 후, `create database dvwa;`, `create user 'dvwa'@'localhost' identified by 'dvwa123';`, `grant all privileges...` 구문을 사용하여 DVWA 전용 데이터베이스와 사용자 권한을 안전하게 분리 및 할당했습니다.
* **웹 서비스 연동 및 설정:** GitHub에서 DVWA 소스코드를 `/var/www/html/DVWA` 경로에 클론(`git clone`)한 뒤, `config.inc.php.dist` 파일을 복사 및 수정하여 DB 연동 설정을 완료했습니다.

### 2. Kali Linux 기반 웹 애플리케이션 모의해킹 실습
* **Weak Session IDs 취약점 분석:** 칼리 리눅스 브라우저 개발자 도구(F12)의 스토리지/쿠키 탭을 활용해 애플리케이션에서 발행하는 dvwaSession 값을 분석하고, 세션 ID의 생성 패턴과 보안 속성(Secure, HttpOnly) 누락 여부를 점검했습니다.
* **HTTP 트래픽 패킷 분석:** OWASP ZAP (Zed Attack Proxy) 도구를 활용하여 클라이언트와 서버 간의 HTTP Request/Response를 Intercept 하고, Cache-Control, Pragma 등의 응답 헤더 구조를 분석했습니다.
* **추가 진단 환경 확보:** 또 다른 모의해킹 실습 환경인 bWAPP(buggy web app) 다운로드를 진행했습니다.

### 3. SQL Injection 취약점 분석 및 자동화 툴(sqlmap) 실습
* **인증 우회 및 파라미터 추적:** 타겟 서버(192.168.55.91)의 웹 프록시 세션 쿠키 값(PHPSESSID)과 보안 레벨(security=low) 옵션을 명시하여 인증을 우회하고, 데이터베이스 대상을 지정하는 타겟 옵션 `-u URL` 플래그 규칙을 올바르게 적용하여 공격 대상 파라미터(`id=1&Submit=Submit`)를 추적했습니다.
* **데이터베이스 덤프(Dump) 및 탈취:** 성공적으로 취약점이 맵핑되어 배후 데이터베이스(`dvwa.users`)의 데이터 정보(User ID, Avatar, Password 해시값 등)를 CSV 파일 포맷으로 성공적으로 덤프(`--dump`) 및 탈취했습니다.

---

## 💭 오늘의 회고 및 실무 다짐

### 📌 배운 점
* 가디언즈 인프라보안 과정에서 이론으로만 배우던 웹 취약점 진단 환경(APM 기반)을 A to Z로 직접 리눅스 상에 구축해 보며, 인프라의 전반적인 아키텍처와 흐름을 명확하게 이해할 수 있었습니다.
* sqlmap을 통한 SQL 인젝션 실습을 통해, 웹 애플리케이션의 파라미터 검증 부재가 실제 DB 탈취로 어떻게 직결되는지 그 위험성을 시각적으로 체감했습니다.
* 단순히 구성된 환경을 해킹하는 공격자의 관점뿐만 아니라, 리눅스 서버(Ubuntu) 단에서 Apache 웹 서버를 올리고 MariaDB 유저 생성 및 Privileges 권한을 제어하며 웹 서비스를 연동하는 **인프라 엔지니어/보안 아키텍트 관점의 빌드업 과정**을 밀도 있게 이해할 수 있었습니다.

### 🚨 트러블슈팅 (어려운 점 및 개선할 점)
* **옵션 대소문자 혼선:** sqlmap 명령어 입력 시 옵션 인자의 대소문자(`-U`와 `-u`)를 명확히 구분하지 않아 `missing a mandatory option` (필수 인자 누락) 에러가 발생했습니다.
* **공식 매뉴얼 정독의 중요성:** 자동화 공격 도구는 고도로 구조화된 문법 형식을 따르므로, 에러가 발생했을 때는 감으로 수정하기보다 제공되는 기본 매뉴얼(`-h`, `--help`)을 열어 명세서를 정독하는 습관이 훨씬 효율적임을 배웠습니다.

### 💡 실무를 위한 액션 플랜
* 포트폴리오를 위해 오늘 구축한 Ubuntu-Apache-MariaDB-PHP 연동 구조를 draw.io나 Excalidraw 같은 무료 다이어그램 도구를 활용하여 시각화하겠습니다.
* 모의해킹 파트 강화를 위해 오늘 사용한 sqlmap의 핵심 옵션(`-u`, `--cookie`, `--data`, `-p`, `-D`, `-T`, `--dump`)의 기능을 상세히 정리해두겠습니다.

### 🤝 함께 나누고 싶은 점
* 인프라 서버를 구성할 때 리눅스 권한 문제나 서비스 재시작 타이밍 등 잦은 트러블슈팅이 발생하는데, 팀원들과 시스템 로그(예: `/var/log/apache2/error.log`)를 확인하고 원인을 찾는 노하우를 공유하면 좋을 것 같습니다.

---
**📚 참고자료**
* DVWA 공식 GitHub 저장소
* 데이터베이스 공격 자동화 도구 공식 문서 (sqlmap.org)
