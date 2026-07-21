---
layout: default
---
# [보안 인프라] 인프라 보안 수업 - Snort 3 IDS 소스코드 컴파일 및 네트워크 환경 최적화

**날짜:** 2026년 5월 11일
**주제:** Snort 3, 소스 컴파일, NIC 최적화(Promiscuous/Offload), 트러블슈팅

---

## 📝 오늘 배운 내용 상세 요약

### 1. Snort 3 소스코드 컴파일 및 최적화 설치
* **메모리 최적화:** Snort의 퍼포먼스 향상을 위해 구글의 `gperftools` (TCMalloc) 라이브러리를 소스 컴파일하여 사전 설치함.
* **의존성 트러블슈팅:** Snort 3 `configure_cmake.sh` 과정 중 발생한 의존성 누락(PCRE2) 에러를 확인하고, `libpcre2-dev` 패키지를 설치하여 해결함.
* **빌드 및 설치:** `make` 및 `make install`을 통해 Snort 3.12.2.0 버전을 성공적으로 빌드하고 동적 링크(`ldconfig`)를 완료함.

### 2. 패킷 분석을 위한 물리적/논리적 네트워크 인터페이스(NIC) 세팅
* **무작위 모드(Promiscuous Mode) 활성화:** VirtualBox 네트워크 어댑터 설정에서 '무작위 모드: 모두 허용'을 적용하고, Ubuntu CLI에서 `ip link set dev enp0s3 promisc on`을 통해 호스트가 목적지가 아닌 패킷도 수집하도록 설정함.
* **네트워크 오프로드(Offload) 기능 비활성화:** NIC가 패킷을 임의로 병합하여 IDS 탐지를 방해하는 것을 막기 위해 `ethtool`을 사용하여 GRO(Generic Receive Offload) 및 LRO(Large Receive Offload) 기능을 강제 해제함.
* **Systemd 데몬 등록:** 재부팅 후에도 NIC 무작위 모드와 오프로드 해제 설정이 유지되도록 `snort3-nic.service`를 직접 작성하고 활성화(`systemctl enable`)함.

### 3. Snort 환경 설정(snort.lua) 및 사용자 룰(local.rules) 연동
* **설정 파일 연동:** Snort의 핵심 설정 파일인 `snort.lua`를 수정하여 사용자 정의 룰 파일인 `local.rules`를 인클루드 하도록 구성함.
* **구문 에러(Syntax Error) 해결:** 설정 파일 검증(`snort -c snort.lua`) 중 발생한 라인 198번의 괄호(`}`) 누락 에러를 파악하고, `vim` 편집기로 즉각 조치하여 최종적으로 성공적인 Configuration 검증(0 errors, 0 warnings)을 완료함.
* **Snort 아키텍처의 이해:** 패킷이 Snort 내부에서 처리되는 과정(Packet Decoder -> Preprocessor -> Detection Engine -> Alert/Log)과 탐지 룰의 구조(Rule Header + Rule Options)를 이론적으로 정립함.

---

## 💭 오늘의 회고 및 실무 다짐

### 📌 배운 점
* 패키지 관리자(`apt`)를 통한 단순 설치를 넘어, 실제 실무 환경처럼 소스코드를 다운로드하고 CMake로 환경을 구성하여 직접 컴파일(Build)하는 깊이 있는 과정을 경험했습니다.
* IDS(침입탐지시스템)가 정상적으로 작동하려면 소프트웨어적인 룰 설정뿐만 아니라, 하드웨어(NIC) 단에서 LRO/GRO 같은 패킷 변형 기능을 끄고 무작위 모드(Promiscuous)를 켜주어야만 '원본 패킷'을 제대로 스니핑할 수 있다는 네트워크 인프라의 핵심 원리를 배웠습니다.
* 노트 필기를 통해 Snort의 구조를 4단계(Sniffer -> Preprocessor -> Detection -> Alert)로 나누어 이해하니, 수많은 설정 명령어들이 어느 단계를 세팅하기 위함인지 명확해졌습니다.

### 🚨 트러블슈팅 및 개선할 점
* **의존성 및 오타 해결:** 컴파일 도중 `libpcre2` 관련 에러가 났을 때 로그를 통해 필요 패키지를 찾아 설치하는 경험을 했습니다. 또한 `ethtool`을 `ethool`로 오타를 내거나, `snort.lua` 파일을 수정하면서 괄호 닫기(`}`)를 실수로 누락하여 데몬 실행이 실패(Fatal Error)하는 상황을 겪었습니다.
* **엔지니어의 습관:** 에러가 발생했을 때 당황하지 않고 CLI 화면에 출력된 에러 메시지(`line 198: '}' expected...`)를 끝까지 읽어 원인을 정확히 짚어낸 점은 좋았습니다. 앞으로는 긴 명령어를 칠 때 'Tab' 키를 활용해 오타를 줄이고, `snort.lua` 같은 시스템 코어 설정 파일을 수정하기 전에는 반드시 `cp` 명령어로 원본 파일을 백업해 두는 습관을 들여야겠습니다.

### 💡 액션 플랜
* 오늘 만든 `local.rules` 빈 파일에 노트에 필기해 둔 룰 구조(`alert tcp any any -> any 80 (msg:"..."; sid:1000001;)`)를 참고하여, 실제 ICMP(Ping)나 TCP 웹 접속을 탐지하는 나만의 첫 번째 커스텀 룰을 작성해 보기.
* 공격 단말(예: Kali Linux 등)에서 패킷을 쏴서 실제로 Snort가 탐지하고 Alert 로그를 남기는지 가시적으로 확인하기.

### 🤝 함께 나누고 싶은 점
무작정 인터넷의 명령어를 복사/붙여넣기 하기보다는 에러가 났을 때 `FATAL` 로그가 정확히 몇 번째 줄, 어떤 문제를 가리키는지 차분히 읽어보는 것이 인프라/보안 엔지니어의 가장 중요한 역량인 것 같습니다.
