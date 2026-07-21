
layout: default

$$NIDS/NIPS$$

 Snort & Suricata 기반 트래픽 탐지 및 차단, OSSEC 시스템 보안

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
