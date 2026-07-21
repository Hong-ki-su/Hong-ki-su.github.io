---
layout: default
---
# [GNS3/보안] 인프라 보안 수업 - 라우터 기반 방화벽(RACL, DACL, ZFW) 구축

**날짜:** 2026년 4월 29일  
**주제:** GNS3, OSPF, RACL, DACL, Zone-Based Firewall(ZFW)

---

## 📝 오늘 배운 내용 요약

### 1. GNS3 토폴로지 구성 및 OSPF 라우팅 기반 작업
* **네트워크 구성:** 내부(Inside) 망과 외부(Outside) 망을 구분하여 R1부터 R6까지 이어지는 확장 토폴로지를 구성했습니다. (실습은 R1~R4 위주로 진행)
* **OSPF 설정:** 모든 라우터에 IP를 할당하고 OSPF(Area 0)를 설정하여 End-to-End Ping 통신이 가능하도록 기반(Underlay) 네트워크를 완성했습니다.

### 2. RACL (Reflexive ACL) 설정 및 검증
* **개념:** 상태 기반(Stateful) 방화벽의 초기 형태로, 내부 사용자가 시작한 트래픽의 '응답(Return)' 트래픽만 동적으로 허용하는 기법입니다.
* **실습 내역:** 
  * 내부(R1)에서 외부(R4)로 나가는 트래픽에 `reflect` 키워드를 사용하여 세션 상태를 저장했습니다.
  * 외부에서 내부로 들어오는 인터페이스에 `evaluate` 키워드를 사용하여, 저장된 세션에 대한 응답 트래픽만 들어올 수 있도록 `access-group`을 적용했습니다.

### 3. DACL (Dynamic ACL / Lock-and-Key) 설정 및 검증
* **개념:** 외부 사용자가 내부망에 접근하기 위해 먼저 라우터에 원격 접속(Telnet)하여 '인증'을 거치면, 임시로 방화벽에 구멍(Hole)을 열어주는 기법입니다.
* **실습 내역:** 
  * R2에 로컬 계정(`estcamp`) 생성 및 vty 라인에 `autocommand access-enable host timeout 10`을 설정했습니다.
  * 외부(R4)에서 R2로 Telnet 접속 후 로그인하면, 동적 ACL(Dynamic DACL)이 활성화되어 제한된 시간 동안 내부망 통신이 허용됨을 확인했습니다. (`show access-list` 매치 카운트 증가 확인)

### 4. ZFW (Zone-Based Firewall) 기본 설정
* **개념:** 인터페이스 기반의 ACL을 넘어, 인터페이스들을 존(Zone)으로 묶고 존 간의 통신 정책을 제어하는 현대적인 방화벽 구성 방식입니다.
* **실습 내역:**
  * **존 생성 및 할당:** `inside`, `outside` 존을 만들고 각각 f0/0, f0/1 인터페이스에 매핑했습니다.
  * **트래픽 분류 (Class-map):** 검사할 트래픽을 지정했습니다. (예: `match access-group`)
  * **정책 설정 (Policy-map):** 분류된 트래픽에 대해 `inspect` (상태 추적 허용) 액션을 지정했습니다.
  * **정책 적용 (Zone-pair):** `inside`에서 `outside`로 향하는 존 페어를 만들고 생성한 정책(`service-policy`)을 적용했습니다.

---

## 💭 오늘의 회고

### 배운 점
* 단순히 패킷을 차단/허용하는 Standard/Extended ACL을 넘어, 트래픽의 '상태(State)'를 기억하는 RACL과 인증 기반의 DACL의 동작 원리를 눈으로 직접 확인했습니다.
* R4에서 R2로 Telnet 인증을 성공한 직후에만 통신이 되는 DACL의 Lock-and-Key 메커니즘이 매우 흥미로웠습니다.
* ZFW(존 기반 방화벽)의 체계적인 설정 순서(Zone 생성 $\rightarrow$ Interface 매핑 $\rightarrow$ Class-map $\rightarrow$ Policy-map $\rightarrow$ Zone-pair 적용)를 실습을 통해 익힐 수 있었습니다.

### 트러블슈팅 및 개선할 점
* **오타 및 축약어 혼선:** 명령어 타이핑 중 잦은 오타(`telent`, `do access-list`, `conf y` 등)와 축약어 사용 시 혼선으로 인해 에러 메시지(`% Invalid input...`)를 자주 마주했습니다.
* **구조의 낯설음:** ZFW 설정 시 Class-map과 Policy-map의 구조가 낯설어 구조를 머릿속에 바로 그리는 데 시간이 걸렸습니다.
* **인프라 세팅 이슈:** 가상머신(GNS3 VM) 연동 문제와 로컬 서버 네트워크 어댑터 바인딩(`0.0.0.0` $\rightarrow$ `127.0.0.1`) 이슈로 긴 시간 트러블슈팅을 겪었습니다. 실습 환경(인프라)을 온전히 세팅하는 것도 네트워크 엔지니어의 중요한 역량임을 깨달았습니다.

### 💡 액션 플랜
* `Tab` 키 자동 완성 기능과 `?` (도움말) 기능을 더욱 적극적으로 활용하여 명령어 오타율을 줄이겠습니다.
* ZFW의 설정 5단계 로직을 백지에 안 보고 적을 수 있을 정도로 복습하겠습니다.

---
**📚 참고자료**
* 강의 슬라이드: GNS3 실습 - RACL / DACL, ZFW (Zone-Based FW) 토폴로지 자료
* 직접 구성한 R1~R6 GNS3 토폴로지 및 트러블슈팅 기록
* Cisco IOS Access-List 및 Zone-Based Policy Firewall Configuration Guide
