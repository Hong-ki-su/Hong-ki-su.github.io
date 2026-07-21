#!/bin/bash

echo "과제 파일 5개 생성을 시작합니다..."

1. OWASP Juice Shop 웹 해킹 실습

cat > 2026-04-10-owasp-juice-shop.md << 'MD_EOF'

layout: default

[Web Security] OWASP Juice Shop 웹 취약점 분석 및 모의해킹

날짜: 2026년 4월
주제: 웹 애플리케이션 취약점 진단 (XSS, Broken Access Control, Input Validation)

📝 실습 개요

대표적인 웹 취약점 테스트 환경인 OWASP Juice Shop을 대상으로 다양한 웹 공격 기법을 테스트하고 원인을 분석했습니다.

1. 크로스 사이트 스크립팅 (DOM XSS)

공격 내용: 검색창에 검증되지 않은 스크립트 <iframe src="javascript:alert('XSS')">를 삽입하여 사용자의 브라우저에서 강제로 팝업창이 실행되도록 유도했습니다.

취약점 원인: 사용자 입력값에 대한 서버 및 클라이언트 측의 필터링(검증) 미흡으로 발생했습니다.

2. 부적절한 접근 통제 (Broken Access Control)

공격 내용: 웹 화면(/#/administration) 접근은 막혀있었으나, 서버 내부 데이터를 직접 호출하는 API 경로(/rest/admin/application-configuration)로 우회 접근하여 민감한 서버 구성 설정을 탈취했습니다.

취약점 원인: 백엔드 API 자원 요청 시 사용자 권한(Authorization) 검증 로직이 누락되었습니다.

3. 입력값 검증 누락 (Zero Stars 파라미터 변조)

공격 내용: 고객 피드백 화면에서 프록시 도구(Burp Suite)를 사용해 요청 패킷을 가로챈 뒤, UI에서 선택할 수 없는 별점 값("rating": 0)으로 데이터를 변조하여 서버로 전송 및 등록에 성공했습니다.

취약점 원인: 클라이언트(브라우저) 측 검증에만 의존하고, 서버 측에서 데이터 유효성 검증을 2차로 수행하지 않아 발생한 취약점입니다.
MD_EOF

2. Snort, Suricata, OSSEC 실습

cat > 2026-05-15-snort-suricata-ossec.md << 'MD_EOF'

layout: default

[NIDS/NIPS] Snort & Suricata 기반 트래픽 탐지 및 차단, OSSEC 시스템 보안

날짜: 2026년 5월 15일 ~ 22일
주제: 침입 탐지/방지 시스템(IDS/IPS) 구축, DDoS/스캔 공격 방어, 시스템 무결성 점검

🛡️ 네트워크 공격 탐지 및 차단 (NIPS/NIDS)

1. Snort NIPS 구성 및 ICMP/DDoS 차단

Snort를 IPS(NIPS) 모드로 동작시켜 Kali Linux로부터 들어오는 악의적인 트래픽을 실시간으로 차단(Drop)했습니다.

명령어: sudo snort -c /etc/snort/snort.conf -Q --daq nfq

방어 내역:

TCP SYN Flood 공격 탐지 및 차단 (hping3 플러딩 공격 방어)

Smurf DDoS Attack 탐지 및 차단

UDP Flooding Attack 차단

2. Suricata NIDS 구성 및 스캔 탐지

Suricata를 IDS(NIDS)로 구축하여 네트워크 상의 비정상 스캔 행위를 모니터링했습니다.

명령어: sudo suricata -c /etc/suricata/suricata.yaml -i enp0s3

탐지 내역: fast.log를 통해 SSH Scan(포트 22) 및 비정상 ICMP Ping 행위가 정확히 기록됨을 확인했습니다.

🖥️ OSSEC HIDS 시스템 무결성 점검

OSSEC HIDS 서버를 구축하고 DVWA 리눅스 에이전트를 연결하여 Active 상태를 확인했습니다.

권한 제어 실습: 특정 스크립트에 SetUID(4755)를 부여하여 일반 사용자가 루트 권한으로 실행할 수 있게 설정하였고, 공유 디렉터리에 Sticky Bit(1777)를 설정하여 소유자만 파일을 삭제할 수 있도록 접근 통제 실습을 진행했습니다.
MD_EOF

3. CTF Mercury 모의해킹

cat > 2026-06-01-ctf-mercury-walkthrough.md << 'MD_EOF'

layout: default

[CTF] Boot-to-Root 모의해킹 워크스루 : Mercury

날짜: 2026년 6월
주제: 정보 수집, SQL Injection(sqlmap), SSH 침투, PATH Hijacking 권한 상승

🚩 침투 시나리오 및 실행 과정

1단계: 포트 스캔 및 정보 수집 (Enumeration)

sudo nmap -sV -sC 192.168.55.129 수행 결과 8080 포트에서 Python(Django) 기반 웹 서비스 확인.

2단계: 정보 노출 취약점 악용 (Information Disclosure)

존재하지 않는 임의의 경로(/asdf)로 접근하여 404 에러를 유발.

배포 환경에서 DEBUG = True로 설정된 Django 설정 오류를 통해 시스템 라우팅 목록이 노출됨. 숨겨진 디렉토리 mercuryfacts/ 식별.

3~4단계: SQL Injection 식별 및 탈취 (sqlmap)

파라미터에 싱글 쿼터(')를 주입하여 MySQL 문법 에러 확인.

sqlmap 도구를 활용하여 자동화 공격 수행:

sqlmap -u "http://192.168.55.129:8080/mercuryfacts/1*/" -D mercury -T users --dump --batch


관리자 계정(webmaster) 및 패스워드(mercuryisthesizeof0.056Earths) 정보 탈취 성공.

5단계: 초기 침투 (Initial Foothold)

탈취한 계정으로 SSH 접속 성공 및 user_flag.txt 획득 완료.

6단계: 권한 상승 (Privilege Escalation - PATH Hijacking)

notes.txt에서 Base64로 인코딩된 linuxmaster 계정 비밀번호 획득.

sudo -l 확인 결과, SETENV 옵션으로 /usr/bin/check_syslog.sh 스크립트를 root 권한으로 실행 가능함을 확인.

해당 스크립트가 절대경로가 아닌 tail 명령어를 사용하고 있음을 노려 PATH Hijacking 시도.

echo '/bin/bash' > /tmp/tail
chmod +x /tmp/tail
sudo PATH=/tmp:$PATH /usr/bin/check_syslog.sh


가짜 tail 바이너리가 실행되며 Root 쉘 획득 및 root_flag.txt 최종 탈취 성공!
MD_EOF

4. Wazuh 트러블슈팅

cat > 2026-06-10-wazuh-troubleshooting.md << 'MD_EOF'

layout: default

[Infra/Security] Wazuh Agent 구축 및 API 트러블슈팅 기록

날짜: 2026년 6월
주제: 오픈소스 SIEM(Wazuh) 에이전트 연동 및 에러 분석

💡 실습 개요 및 트러블슈팅

Wazuh 매니저와 클라이언트 에이전트 간의 연동을 통해 중앙 집중형 로그 분석 환경을 구축하고자 하였습니다.

설치 시도:

wget https://packages.wazuh.com/4.x/apt/pool/main/w/wazuh-agent/wazuh-agent_4.8.2-1_amd64.deb
sudo WAZUH_MANAGER="192.168.55.153" dpkg -i wazuh-agent_4.8.2-1_amd64.deb


이슈 발생 (Error 2001):
Wazuh API Dashboard 접근 시 Error connecting to API: Error: 2001 - Unexpected end of JSON input 에러가 지속적으로 발생하였습니다.

회고 및 다짐:
다양한 각도(네트워크 통신 확인, API 인증서 확인, 데몬 재시작 등)에서 접근해 보았으나 원인을 명확히 파악하지 못해 아쉬움이 남습니다. 비록 이번 과정에서 완벽한 연동에는 실패했지만, 향후 실무 환경이나 개인 랩 환경에서 JSON 파싱 에러와 Manager-API 간의 통신 아키텍처를 더 깊이 분석하여 반드시 해결해 볼 계획입니다.
MD_EOF

5. Python / Shell Script

cat > 2026-06-20-python-pygame.md << 'MD_EOF'

layout: default

[Development] Python Pygame 미니 게임 및 Shell 스크립트

날짜: 2026년 6월
주제: Python 로직 구현 및 Bash 스크립트를 이용한 로그 무결성 자동 점검

🐍 Python: Pygame 기반 미니 게임 구현

키보드 이벤트(pygame.event.get())를 활용하여 캐릭터(좌표 x,y)를 이동시키는 간단한 '미나 피하기 게임' 로직을 작성하고 구동 테스트를 진행했습니다.
(Linux 환경 내 X11/EGL 드라이버 연동 이슈에 대한 경고 로그 분석 경험 포함)

📜 Shell Script: 시스템 보안 로그 자동 점검

인프라 운영에 필수적인 로그 파일 권한을 자동 점검하는 쉘 스크립트(log_check.sh)를 작성하였습니다.

rsyslog 서비스 동작 상태 점검

/var/log/syslog, /var/log/auth.log 파일의 권한(640)이 안전하게 유지되고 있는지 검사하는 자동화 로직 구현.
MD_EOF

echo "5개의 마크다운 파일 생성이 완료되었습니다!"
