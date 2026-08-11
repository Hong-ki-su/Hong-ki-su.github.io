#!/bin/bash

# ==========================================
# 1. [관제 직무용] 메인 페이지 (index.html) 생성
# ==========================================
cat > index.html << 'HTML_EOF'
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>홍기수 | 네트워크 관제 엔지니어 포트폴리오</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
<style>
  body { background: #f4f6f8; color: #1e293b; font-family: "Pretendard", sans-serif; word-break: keep-all; }
  .hero { background: #ffffff; padding: 80px 20px 60px; border-bottom: 1px solid #e2e8f0; }
  .hero h1 { font-weight: 800; font-size: 2.8rem; color: #0f172a; letter-spacing: -1px; }
  .hero p.subtitle { color: #0ea5e9; font-weight: 700; font-size: 1.2rem; margin-top: 10px; text-transform: uppercase; letter-spacing: 1px; }
  .hero p.desc { color: #64748b; font-size: 1.1rem; max-width: 700px; margin: 20px 0 0; line-height: 1.6; }
  .section-title { font-size: 1.5rem; font-weight: 800; color: #0f172a; margin-bottom: 30px; display: flex; align-items: center; }
  .section-title::before { content: ""; display: inline-block; width: 4px; height: 24px; background: #0ea5e9; margin-right: 12px; border-radius: 2px; }
  .section-container { margin-top: 60px; margin-bottom: 60px; }
  .cap-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; }
  .cap-card { background: #ffffff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 25px; transition: transform 0.2s, box-shadow 0.2s; }
  .cap-card:hover { transform: translateY(-3px); box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1); border-color: #cbd5e1; }
  .cap-num { font-size: 0.85rem; font-weight: 700; color: #94a3b8; margin-bottom: 10px; letter-spacing: 1px; }
  .cap-title { font-size: 1.25rem; font-weight: 800; color: #1e293b; margin-bottom: 12px; }
  .cap-desc { font-size: 0.95rem; color: #64748b; line-height: 1.6; margin: 0; }
  .tech-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; }
  .tech-card { background: #ffffff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 25px; }
  .tech-category { font-size: 1rem; font-weight: 700; color: #0ea5e9; margin-bottom: 15px; border-bottom: 1px solid #f1f5f9; padding-bottom: 10px; }
  .tech-badge { display: inline-block; background: #f1f5f9; color: #334155; padding: 6px 12px; border-radius: 6px; font-size: 0.9rem; font-weight: 600; margin: 0 8px 8px 0; border: 1px solid #e2e8f0; }
  .project-card { background: #ffffff; border: 1px solid #e2e8f0; border-radius: 16px; padding: 30px; margin-bottom: 30px; position: relative; }
  .project-status { position: absolute; top: 30px; right: 30px; background: #dcfce7; color: #166534; font-size: 0.85rem; font-weight: 700; padding: 6px 12px; border-radius: 20px; border: 1px solid #bbf7d0; }
  .project-meta { font-size: 0.9rem; font-weight: 600; color: #94a3b8; margin-bottom: 8px; }
  .project-title { font-size: 1.6rem; font-weight: 800; color: #0f172a; margin-bottom: 15px; }
  .project-tags { margin-bottom: 20px; }
  .project-tag { display: inline-block; background: #e0f2fe; color: #0369a1; padding: 5px 10px; border-radius: 6px; font-size: 0.85rem; font-weight: 700; margin: 0 6px 6px 0; }
  .project-desc-list { padding-left: 20px; color: #475569; font-size: 1rem; line-height: 1.7; margin-bottom: 25px; }
  .project-desc-list li { margin-bottom: 10px; }
  .project-desc-list strong { color: #1e293b; font-weight: 700; }
  .btn-custom { display: inline-flex; align-items: center; background: #ffffff; color: #0ea5e9; font-weight: 700; padding: 8px 16px; border: 2px solid #0ea5e9; border-radius: 8px; text-decoration: none; font-size: 0.95rem; transition: all 0.2s; }
  .btn-custom:hover { background: #0ea5e9; color: #ffffff; }
  .footer { background: #0f172a; color: #94a3b8; padding: 40px 20px; text-align: center; margin-top: 80px; }
</style>
</head>
<body>
<div class="hero">
  <div class="container">
    <h1>홍기수</h1>
    <p class="subtitle">Network Security Monitoring Engineer</p>
    <p class="desc">가디언즈 정보보호 인프라 교육 과정을 성공적으로 수료하며 침입 탐지와 로그 분석 실무를 완성한 네트워크 관제 엔지니어입니다. 쏟아지는 트래픽 속에서 비정상 패킷의 흐름을 읽어내고, 근본 원인을 규명할 때까지 끝까지 파고드는 끈기를 강점으로 삼고 있습니다.</p>
  </div>
</div>
<div class="container">
  <div class="section-container">
    <h2 class="section-title">핵심 역량</h2>
    <div class="cap-grid">
      <div class="cap-card">
        <div class="cap-num">CAP • 01</div>
        <h3 class="cap-title">침입 탐지 및 패킷 분석</h3>
        <p class="cap-desc">Suricata와 Snort를 NIDS/NIPS로 운용하며 악의적인 트래픽 패턴을 분석하고, Wireshark를 통한 패킷 단위의 심층 분석으로 공격 페이로드를 식별합니다.</p>
      </div>
      <div class="cap-card">
        <div class="cap-num">CAP • 02</div>
        <h3 class="cap-title">시스템 무결성 및 통합 로그 관제</h3>
        <p class="cap-desc">Wazuh(SIEM) 및 OSSEC을 연동하여 서버 무결성을 점검하고, 분산된 시스템 로그를 중앙 집중화하여 실시간으로 모니터링하는 관제 환경을 구성할 수 있습니다.</p>
      </div>
      <div class="cap-card">
        <div class="cap-num">CAP • 03</div>
        <h3 class="cap-title">취약점 진단 및 악성코드 분석</h3>
        <p class="cap-desc">OWASP 기반 웹 취약점을 진단하고 방어 룰셋을 수립하며, FLARE VM 기반에서 정적·동적 분석 도구를 활용하여 악성코드의 행위와 시스템 변조를 식별합니다.</p>
      </div>
      <div class="cap-card">
        <div class="cap-num">CAP • 04</div>
        <h3 class="cap-title">인프라 아키텍처 이해도</h3>
        <p class="cap-desc">정확한 관제를 위해 네트워크 장비(Cisco)와 방화벽(pfSense)의 구조를 직접 설계하고 구축해 본 경험으로 전체 인프라의 데이터 흐름을 이해하고 있습니다.</p>
      </div>
    </div>
  </div>

  <div class="section-container">
    <h2 class="section-title">기술 스택</h2>
    <div class="tech-grid">
      <div class="tech-card">
        <div class="tech-category">보안 관제 & 탐지</div>
        <span class="tech-badge">Wazuh (SIEM)</span><span class="tech-badge">Snort (NIDS/NIPS)</span><span class="tech-badge">Suricata</span><span class="tech-badge">OSSEC</span>
      </div>
      <div class="tech-card">
        <div class="tech-category">분석 & 진단 도구</div>
        <span class="tech-badge">FLARE VM</span><span class="tech-badge">Procmon/Sysmon</span><span class="tech-badge">Wireshark</span><span class="tech-badge">OWASP</span>
      </div>
      <div class="tech-card">
        <div class="tech-category">시스템 & 스크립트</div>
        <span class="tech-badge">Linux (Ubuntu)</span><span class="tech-badge">Windows Server</span><span class="tech-badge">Python</span><span class="tech-badge">Shell Script</span>
      </div>
    </div>
  </div>

  <div class="section-container">
    <h2 class="section-title">주요 실무 과제 및 프로젝트</h2>

    <!-- 2차 프로젝트 (우수상) -->
    <div class="project-card" style="border: 2px solid #0ea5e9;">
      <div class="project-status" style="background: #e0f2fe; color: #0369a1; border-color: #bae6fd;">🥇 우수상 수상</div>
      <div class="project-meta">팀 프로젝트 / 모의해킹 및 방어 인프라</div>
      <h3 class="project-title">가디언즈 2차 보안 인프라 구축</h3>
      <div class="project-tags"><span class="project-tag">모의해킹</span><span class="project-tag">취약점 분석</span><span class="project-tag">방어 인프라</span></div>
      <ul class="project-desc-list">
        <li><strong>모의해킹 및 취약점 분석:</strong> 구축된 기업망을 대상으로 침투 테스트를 진행하고 패킷 단위의 보안 취약점을 식별 및 분석.</li>
        <li><strong>우수상 수상 성과:</strong> 공격 탐지부터 대응 방안까지 관제적 시각을 결합한 체계적인 프로세스를 인정받아 프로젝트 우수상을 수상했습니다.</li>
      </ul>
      <div class="d-flex flex-wrap gap-2">
        <a href="2차프로젝트 우수상_상장.jpg" target="_blank" class="btn-custom" style="background:#0ea5e9; color:#fff;">🏅 우수상 상장 보기 →</a>
        <a href="final_hacking.pdf" target="_blank" class="btn-custom">📄 모의해킹 결과 보고서 →</a>
      </div>
    </div>

    <!-- 3차 파이널 프로젝트 (수료) -->
    <div class="project-card">
      <div class="project-status" style="background: #f1f5f9; color: #475569; border-color: #e2e8f0;">수료 프로젝트</div>
      <div class="project-meta">팀 프로젝트 / 통합 로그 분석 및 악성코드 분석</div>
      <h3 class="project-title">가디언즈 3차 파이널 프로젝트 (공공자전거 통합운영 서비스)</h3>
      <div class="project-tags"><span class="project-tag">Wazuh/Snort</span><span class="project-tag">로그 상관분석</span><span class="project-tag">악성코드 분석</span></div>
      <ul class="project-desc-list">
        <li><strong>보안 관제 및 룰셋 적용:</strong> Snort(IDS/IPS) 및 Wazuh(SIEM)를 구축하고, 웹 모의해킹(OWASP Top 5) 공격에 대한 실시간 탐지/차단 룰을 직접 설정하여 통합 로그 모니터링 환경을 구성했습니다.</li>
        <li><strong>악성코드 정적/동적 분석:</strong> FLARE VM 환경에서 악성행위 시뮬레이터(PyInstaller)를 대상으로 PEiD, Procmon 등을 활용해 파일 조작 및 JSON 운영 데이터 변조 행위를 집중 분석하고 대응 방안을 도출했습니다.</li>
      </ul>
      <div class="d-flex flex-wrap gap-2">
        <!-- 💡 에러 방지를 위해 단순화된 영문 파일명 적용 -->
        <a href="final_ppt.pptx" target="_blank" class="btn-custom" style="background:#0ea5e9; color:#fff;">📊 3차 파이널 발표 자료 (PPT) →</a>
        <a href="final_hacking.pdf" target="_blank" class="btn-custom">📄 모의해킹 결과 보고서 →</a>
        <a href="final_malware.pdf" target="_blank" class="btn-custom">📄 악성코드 분석 보고서 →</a>
      </div>
    </div>

    <!-- 1차 프로젝트 -->
    <div class="project-card">
      <div class="project-status" style="background: #f1f5f9; color: #475569; border-color: #e2e8f0;">완료</div>
      <div class="project-meta">팀 프로젝트 / 초기 인프라 설계</div>
      <h3 class="project-title">가디언즈 1차 네트워크 아키텍처 수립</h3>
      <div class="project-tags"><span class="project-tag">네트워크 기획</span><span class="project-tag">인프라 아키텍처</span></div>
      <ul class="project-desc-list">
        <li><strong>네트워크 아키텍처 수립:</strong> 요구사항 분석을 통해 라우터/스위치 기반의 초기 네트워크 토폴로지 설계.</li>
      </ul>
      <div class="d-flex flex-wrap gap-2">
        <a href="어울림_보고서.pdf" target="_blank" class="btn-custom">📄 1차 인프라 구축 보고서 →</a>
      </div>
    </div>

    <!-- 개인 실습 -->
    <div class="project-card">
      <div class="project-status" style="background: #f1f5f9; color: #475569; border-color: #e2e8f0;">완료</div>
      <div class="project-meta">개인 실습 / 보안 관제 및 로그 통합</div>
      <h3 class="project-title">침입 탐지 시스템 및 로그 분석 실습</h3>
      <div class="project-tags"><span class="project-tag">Wazuh</span><span class="project-tag">Snort</span><span class="project-tag">CTF 진단</span></div>
      <ul class="project-desc-list">
        <li><strong>NIDS/NIPS 룰셋 기반 탐지:</strong> Snort와 Suricata를 활용하여 악성 패킷 스니핑 및 비정상 트래픽 탐지/차단 정책 실습을 수행했습니다.</li>
      </ul>
      <div class="d-flex flex-wrap gap-2">
        <a href="홍기수_보안 인프라 실습 과제3.pdf" target="_blank" class="btn-custom">📄 실습 과제 3 (IDS/IPS 분석) →</a>
        <a href="홍기수_보안 인프라 실습 과제4.pdf" target="_blank" class="btn-custom">📄 실습 과제 4 (CTF/Wazuh) →</a>
      </div>
    </div>
  </div>

  <div class="section-container">
    <h2 class="section-title">상세 학습 기록</h2>
    <div class="cap-grid">
      <div class="cap-card" style="text-align: center;"><h3 class="cap-title" style="color: #ef4444;">🛡️ 보안 실습 관제</h3><a href="security.html" class="btn-custom w-100 justify-content-center" style="border-color: #ef4444; color: #ef4444;">학습 기록 보기 →</a></div>
      <div class="cap-card" style="text-align: center;"><h3 class="cap-title" style="color: #334155;">🦠 악성코드 분석</h3><a href="malware.html" class="btn-custom w-100 justify-content-center" style="border-color: #334155; color: #334155;">학습 기록 보기 →</a></div>
      <div class="cap-card" style="text-align: center;"><h3 class="cap-title" style="color: #0ea5e9;">🌐 네트워크 구축</h3><a href="network.html" class="btn-custom w-100 justify-content-center">학습 기록 보기 →</a></div>
    </div>
  </div>
</div>
<div class="footer"><p>© 2026. Hong Gi Su. (Network Security Monitoring)</p></div>
</body>
</html>
HTML_EOF

# ==========================================
# 2. [엔지니어 직무용] 별도 페이지 (engineer.html) 생성
# ==========================================
cat > engineer.html << 'HTML_EOF'
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>홍기수 | 보안 인프라 엔지니어 포트폴리오</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
<style>
  body { background: #f4f6f8; color: #1e293b; font-family: "Pretendard", sans-serif; word-break: keep-all; }
  .hero { background: #ffffff; padding: 80px 20px 60px; border-bottom: 1px solid #e2e8f0; }
  .hero h1 { font-weight: 800; font-size: 2.8rem; color: #0f172a; letter-spacing: -1px; }
  .hero p.subtitle { color: #10b981; font-weight: 700; font-size: 1.2rem; margin-top: 10px; text-transform: uppercase; letter-spacing: 1px; }
  .hero p.desc { color: #64748b; font-size: 1.1rem; max-width: 700px; margin: 20px 0 0; line-height: 1.6; }
  .section-title { font-size: 1.5rem; font-weight: 800; color: #0f172a; margin-bottom: 30px; display: flex; align-items: center; }
  .section-title::before { content: ""; display: inline-block; width: 4px; height: 24px; background: #10b981; margin-right: 12px; border-radius: 2px; }
  .section-container { margin-top: 60px; margin-bottom: 60px; }
  .cap-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; }
  .cap-card { background: #ffffff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 25px; transition: transform 0.2s, box-shadow 0.2s; }
  .cap-card:hover { transform: translateY(-3px); box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1); border-color: #cbd5e1; }
  .cap-num { font-size: 0.85rem; font-weight: 700; color: #94a3b8; margin-bottom: 10px; letter-spacing: 1px; }
  .cap-title { font-size: 1.25rem; font-weight: 800; color: #1e293b; margin-bottom: 12px; }
  .cap-desc { font-size: 0.95rem; color: #64748b; line-height: 1.6; margin: 0; }
  .tech-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; }
  .tech-card { background: #ffffff; border: 1px solid #e2e8f0; border-radius: 12px; padding: 25px; }
  .tech-category { font-size: 1rem; font-weight: 700; color: #10b981; margin-bottom: 15px; border-bottom: 1px solid #f1f5f9; padding-bottom: 10px; }
  .tech-badge { display: inline-block; background: #f1f5f9; color: #334155; padding: 6px 12px; border-radius: 6px; font-size: 0.9rem; font-weight: 600; margin: 0 8px 8px 0; border: 1px solid #e2e8f0; }
  .project-card { background: #ffffff; border: 1px solid #e2e8f0; border-radius: 16px; padding: 30px; margin-bottom: 30px; position: relative; }
  .project-status { position: absolute; top: 30px; right: 30px; background: #dcfce7; color: #166534; font-size: 0.85rem; font-weight: 700; padding: 6px 12px; border-radius: 20px; border: 1px solid #bbf7d0; }
  .project-meta { font-size: 0.9rem; font-weight: 600; color: #94a3b8; margin-bottom: 8px; }
  .project-title { font-size: 1.6rem; font-weight: 800; color: #0f172a; margin-bottom: 15px; }
  .project-tags { margin-bottom: 20px; }
  .project-tag { display: inline-block; background: #d1fae5; color: #059669; padding: 5px 10px; border-radius: 6px; font-size: 0.85rem; font-weight: 700; margin: 0 6px 6px 0; }
  .project-desc-list { padding-left: 20px; color: #475569; font-size: 1rem; line-height: 1.7; margin-bottom: 25px; }
  .project-desc-list li { margin-bottom: 10px; }
  .project-desc-list strong { color: #1e293b; font-weight: 700; }
  .btn-custom { display: inline-flex; align-items: center; background: #ffffff; color: #10b981; font-weight: 700; padding: 8px 16px; border: 2px solid #10b981; border-radius: 8px; text-decoration: none; font-size: 0.95rem; transition: all 0.2s; }
  .btn-custom:hover { background: #10b981; color: #ffffff; }
  .footer { background: #0f172a; color: #94a3b8; padding: 40px 20px; text-align: center; margin-top: 80px; }
</style>
</head>
<body>
<div class="hero">
  <div class="container">
    <h1>홍기수</h1>
    <p class="subtitle">Security Infrastructure Engineer</p>
    <p class="desc">가디언즈 정보보호 인프라 교육 수료 및 네트워크관리사 2급 지식을 바탕으로 IT 인프라 아키텍처를 설계하는 보안 인프라 엔지니어입니다. 탄탄한 망 분리 설계부터 시스템 서버(Linux/Windows) 운영까지, 어떠한 장애에도 흔들리지 않는 튼튼한 뼈대를 구축하는 것을 목표로 합니다.</p>
  </div>
</div>
<div class="container">
  <div class="section-container">
    <h2 class="section-title">핵심 역량</h2>
    <div class="cap-grid">
      <div class="cap-card">
        <div class="cap-num">CAP • 01</div>
        <h3 class="cap-title">보안 인프라 아키텍처 설계</h3>
        <p class="cap-desc">Cisco 라우터/스위치 및 방화벽(pfSense)을 활용하여 기업 요구사항에 맞는 안전한 토폴로지와 망 분리 환경을 직접 설계 및 구축할 수 있습니다.</p>
      </div>
      <div class="cap-card">
        <div class="cap-num">CAP • 02</div>
        <h3 class="cap-title">서버 운영 체제 및 시스템 관리</h3>
        <p class="cap-desc">Linux(Ubuntu)와 Windows Server를 기반으로 사내 서비스 인프라를 가상화(VirtualBox, GNS3) 환경에서 안정적으로 구축하고 운영합니다.</p>
      </div>
      <div class="cap-card">
        <div class="cap-num">CAP • 03</div>
        <h3 class="cap-title">보안 관리 체계 수립</h3>
        <p class="cap-desc">단순한 구축을 넘어 기업 정보보호 관리 체계(ISMS)의 중요성을 이해하고, 시스템 무결성 검증을 인프라 설계 단계부터 고려합니다.</p>
      </div>
      <div class="cap-card">
        <div class="cap-num">CAP • 04</div>
        <h3 class="cap-title">트러블슈팅 및 프로세스 자동화</h3>
        <p class="cap-desc">인프라 구축 중 발생하는 네트워크/서버 장애 상황에서 근본 원인을 추적하는 문제 해결 능력을 갖췄으며, 쉘 스크립트 기반 관리를 지향합니다.</p>
      </div>
    </div>
  </div>

  <div class="section-container">
    <h2 class="section-title">기술 스택</h2>
    <div class="tech-grid">
      <div class="tech-card">
        <div class="tech-category">네트워크 장비 & 인프라</div>
        <span class="tech-badge">Cisco</span><span class="tech-badge">pfSense</span><span class="tech-badge">GNS3</span><span class="tech-badge">VPN (IPsec/SSL)</span>
      </div>
      <div class="tech-card">
        <div class="tech-category">서버 운영 & 가상화</div>
        <span class="tech-badge">Linux (Ubuntu)</span><span class="tech-badge">Windows Server</span><span class="tech-badge">VirtualBox</span><span class="tech-badge">MariaDB</span>
      </div>
      <div class="tech-card">
        <div class="tech-category">자동화 & 보안 기술</div>
        <span class="tech-badge">Shell Script</span><span class="tech-badge">Python</span><span class="tech-badge">OSSEC</span><span class="tech-badge">Firewall Policies</span>
      </div>
    </div>
  </div>

  <div class="section-container">
    <h2 class="section-title">주요 실무 과제 및 프로젝트</h2>

    <!-- 2차 프로젝트 (우수상) -->
    <div class="project-card" style="border: 2px solid #10b981;">
      <div class="project-status" style="background: #e0f2fe; color: #0369a1; border-color: #bae6fd;">🥇 우수상 수상</div>
      <div class="project-meta">팀 프로젝트 / 인프라 기획 및 아키텍처 구축</div>
      <h3 class="project-title">가디언즈 2차 보안 인프라 구축</h3>
      <div class="project-tags"><span class="project-tag">네트워크 설계</span><span class="project-tag">방어 인프라</span><span class="project-tag">망 분리</span></div>
      <ul class="project-desc-list">
        <li><strong>인프라 설계 및 구축:</strong> 가상화 환경(GNS3, VirtualBox)을 활용하여 기업용 망 분리 설계 및 접근 제어 정책 기반의 인프라를 구축.</li>
        <li><strong>프로젝트 우수상:</strong> 탄탄한 구축 계획서 작성부터 최종 방어 시스템 구현까지의 기술적 완성도를 인정받아 우수상 수상.</li>
      </ul>
      <div class="d-flex flex-wrap gap-2">
        <a href="2차프로젝트 우수상_상장.jpg" target="_blank" class="btn-custom" style="background:#10b981; color:#fff; border-color:#10b981;">🏅 우수상 상장 보기 →</a>
        <a href="2_2지(easy)하조_2차팀프로젝트계획서.pdf" target="_blank" class="btn-custom">📄 인프라 설계 계획서 →</a>
      </div>
    </div>

    <!-- 3차 파이널 프로젝트 (수료) -->
    <div class="project-card">
      <div class="project-status" style="background: #f1f5f9; color: #475569; border-color: #e2e8f0;">수료 프로젝트</div>
      <div class="project-meta">팀 프로젝트 / 보안 아키텍처 및 망 분리 구축</div>
      <h3 class="project-title">가디언즈 3차 파이널 프로젝트 (공공자전거 서비스 통합 인프라 구축)</h3>
      <div class="project-tags"><span class="project-tag">방화벽/VPN</span><span class="project-tag">망 분리(VLAN)</span><span class="project-tag">통합 보안 솔루션</span></div>
      <ul class="project-desc-list">
        <li><strong>보안 인프라 아키텍처 설계:</strong> 내부망(DB/LOG)과 DMZ(WEB/WAF) 간의 VLAN 기반 네트워크 망 분리를 설계하고, pfSense 방화벽을 구축하여 포트 포워딩 및 외부 접근을 엄격히 통제했습니다.</li>
        <li><strong>통합 보안 솔루션 인프라 구성:</strong> 인프라 전반에 Snort(IDS/IPS) 및 Wazuh(SIEM) 서버를 유기적으로 연동하여 시스템 무결성 점검 체계를 완성하고 안전한 인프라 뼈대를 구축했습니다.</li>
      </ul>
      <div class="d-flex flex-wrap gap-2">
        <!-- 💡 에러 방지를 위해 단순화된 영문 파일명 적용 -->
        <a href="final_ppt.pptx" target="_blank" class="btn-custom" style="background:#10b981; color:#fff; border-color:#10b981;">📊 3차 파이널 발표 자료 (PPT) →</a>
        <a href="final_hacking.pdf" target="_blank" class="btn-custom">📄 인프라 및 모의해킹 보고서 →</a>
        <a href="final_malware.pdf" target="_blank" class="btn-custom">📄 인프라 악성행위 분석 보고서 →</a>
      </div>
    </div>

    <!-- 1차 프로젝트 -->
    <div class="project-card">
      <div class="project-status" style="background: #f1f5f9; color: #475569; border-color: #e2e8f0;">완료</div>
      <div class="project-meta">팀 프로젝트 / 초기 인프라 설계</div>
      <h3 class="project-title">가디언즈 1차 네트워크 아키텍처 수립</h3>
      <div class="project-tags"><span class="project-tag">네트워크 기획</span><span class="project-tag">인프라 아키텍처</span></div>
      <ul class="project-desc-list">
        <li><strong>네트워크 아키텍처 수립:</strong> 요구사항 분석을 통해 라우터/스위치 기반의 초기 네트워크 토폴로지 설계.</li>
      </ul>
      <div class="d-flex flex-wrap gap-2">
        <a href="어울림_보고서.pdf" target="_blank" class="btn-custom">📄 1차 인프라 구축 보고서 →</a>
      </div>
    </div>

  </div>

  <div class="section-container">
    <h2 class="section-title">상세 학습 기록</h2>
    <div class="cap-grid">
      <div class="cap-card" style="text-align: center;"><h3 class="cap-title" style="color: #0ea5e9;">🌐 네트워크 구축</h3><a href="network.html" class="btn-custom w-100 justify-content-center" style="border-color: #0ea5e9; color: #0ea5e9;">학습 기록 보기 →</a></div>
      <div class="cap-card" style="text-align: center;"><h3 class="cap-title" style="color: #10b981;">🖥️ 시스템 운영</h3><a href="system.html" class="btn-custom w-100 justify-content-center" style="border-color: #10b981; color: #10b981;">학습 기록 보기 →</a></div>
    </div>
  </div>
</div>
<div class="footer"><p>© 2026. Hong Gi Su. (Security Infrastructure Engineering)</p></div>
</body>
</html>
HTML_EOF

# ==========================================
# 3. 상세페이지 자동 생성 로직 및 "스마트 뒤로가기" 적용
# ==========================================
rm -f tmp_*.txt
> tmp_network.txt
> tmp_system.txt
> tmp_security.txt
> tmp_malware.txt

for file in *.md; do
    if [ "$file" = "README.md" ] || [ "$file" = "*.md" ]; then continue; fi
    if [[ "$file" == tmp_* ]]; then continue; fi 
    name_no_ext="${file%.md}"
    link_href="${name_no_ext}.html"
    if [[ $name_no_ext =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)$ ]]; then
        date_part="${BASH_REMATCH[1]}"
        title_part="${BASH_REMATCH[2]//-/ }"
        title_part=$(echo "$title_part" | tr 'a-z' 'A-Z')
    else
        date_part="학습 기록"
        title_part=$(echo "$name_no_ext" | tr 'a-z' 'A-Z')
    fi
    card_html="<a href=\"$link_href\" class=\"log-item\"><span class=\"log-date\">📅 $date_part</span><span class=\"log-title\">$title_part</span></a>"
    fname=$(echo "$file" | tr 'A-Z' 'a-z')
    if [[ "$fname" == *"cisco"* || "$fname" == *"vpn"* || "$fname" == *"pfsense"* || "$fname" == *"gns3"* ]]; then
        echo "$card_html" >> tmp_network.txt
    elif [[ "$fname" == *"ubuntu"* || "$fname" == *"virtualbox"* || "$fname" == *"windows"* || "$fname" == *"mariadb"* || "$fname" == *"linux"* || "$fname" == *"shell"* ]]; then
        echo "$card_html" >> tmp_system.txt
    elif [[ "$fname" == *"flare"* || "$fname" == *"malware"* ]]; then
        echo "$card_html" >> tmp_malware.txt
    else
        echo "$card_html" >> tmp_security.txt
    fi
done

create_detail_page() {
    local target_html="$1"
    local title="$2"
    local bg_color="$3"
    local tmp_file="$4"
    cat > "$target_html" << HTML_EOF
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$title</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
<style>
  body { background: #f4f6f8; color: #1e293b; font-family: "Pretendard", sans-serif; }
  .log-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 15px; }
  .log-item { display: block; padding: 16px; background-color: #ffffff; border: 1px solid #e2e8f0; border-radius: 8px; text-decoration: none; color: #0f172a; transition: all 0.2s ease; }
  .log-item:hover { border-color: #0ea5e9; transform: translateY(-3px); box-shadow: 0 6px 12px rgba(0,0,0,0.05); color: #0ea5e9; }
  .log-date { font-size: 0.85rem; color: #64748b; margin-bottom: 6px; display: block; font-weight: 600; }
  .log-title { font-size: 1rem; font-weight: 700; line-height: 1.4; }
  .footer { background: #0f172a; color: #94a3b8; padding: 40px 20px; text-align: center; margin-top: 80px; }
</style>
</head>
<body>
<div class="container mt-5 mb-5" style="min-height: 60vh;">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="fw-bold" style="color: #0f172a;">📁 상세 학습 기록</h2>
    <a href="javascript:void(0);" onclick="if(document.referrer.includes('engineer')){window.location.href='engineer.html';}else{window.location.href='index.html';}" class="btn btn-outline-secondary fw-bold">⬅ 이전 페이지로 돌아가기</a>
  </div>
  <div class="card shadow-sm" style="border: 1px solid #e2e8f0; border-radius: 12px; overflow: hidden;">
    <div class="card-header text-white fs-5 fw-bold py-3" style="background-color: var(--bs-${bg_color}); border-bottom: none;">$title</div>
    <div class="card-body p-4" style="background-color: #ffffff;">
      <div class="log-grid">
HTML_EOF
    if [ -s "$tmp_file" ]; then cat "$tmp_file" >> "$target_html"; else echo "<p class='text-muted'>등록된 학습 기록이 없습니다.</p>" >> "$target_html"; fi
    cat >> "$target_html" << HTML_EOF
      </div>
    </div>
  </div>
</div>
<div class="footer"><p>© 2026. Hong Gi Su. All rights reserved.</p></div>
</body>
</html>
HTML_EOF
}

create_detail_page "network.html" "🌐 네트워크 구축 (Cisco, GNS3, pfSense)" "primary" "tmp_network.txt"
create_detail_page "system.html" "🖥️ 시스템 인프라 (Ubuntu, Windows Server, VirtualBox)" "success" "tmp_system.txt"
create_detail_page "security.html" "🛡️ 모의해킹 및 보안 관제 (Kali, DVWA, Wazuh, WebGoat)" "danger" "tmp_security.txt"
create_detail_page "malware.html" "🦠 악성코드 분석 (FLARE-VM, Malware Analysis)" "dark" "tmp_malware.txt"

rm -f tmp_*.txt
echo "안전한 파일명 변경 및 스크립트 덮어쓰기 완료!"
