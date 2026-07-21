
layout: default

$$Infra/Security$$

 Wazuh Agent 구축 및 API 트러블슈팅 기록

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
