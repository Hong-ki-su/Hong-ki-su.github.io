
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
