
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
