
layout: default

$$Development$$

 Python Pygame 미니 게임 및 Shell 스크립트

날짜: 2026년 6월
주제: Python 로직 구현 및 Bash 스크립트를 이용한 로그 무결성 자동 점검

🐍 Python: Pygame 기반 미니 게임 구현

키보드 이벤트(pygame.event.get())를 활용하여 캐릭터(좌표 x,y)를 이동시키는 간단한 '미나 피하기 게임' 로직을 작성하고 구동 테스트를 진행했습니다.
(Linux 환경 내 X11/EGL 드라이버 연동 이슈에 대한 경고 로그 분석 경험 포함)

📜 Shell Script: 시스템 보안 로그 자동 점검

인프라 운영에 필수적인 로그 파일 권한을 자동 점검하는 쉘 스크립트(log_check.sh)를 작성하였습니다.

rsyslog 서비스 동작 상태 점검

/var/log/syslog, /var/log/auth.log 파일의 권한(640)이 안전하게 유지되고 있는지 검사하는 자동화 로직 구현.
