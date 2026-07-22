#!/bin/bash

# ==========================================
# 0. 공통 CSS 스타일 정의
# ==========================================
CSS_STYLE='
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
<style>
  body { background: #f4f6f9; color: #333; font-family: "Pretendard", sans-serif; word-break: keep-all; }
  .hero { background: #2c3e50; color: white; padding: 60px 20px; text-align: center; }
  .hero h1 { font-weight: 800; margin-bottom: 10px; }
  .section { margin-top: 40px; margin-bottom: 40px; }
  .nav-tabs { margin-bottom: 25px; border-bottom: 2px solid #dee2e6; }
  .nav-tabs .nav-link { font-weight: 700; color: #6c757d; border: none; padding: 12px 25px; font-size: 1.1rem; }
  .nav-tabs .nav-link.active { color: #2c3e50; border-bottom: 4px solid #3498db; background: transparent; }
  .nav-tabs .nav-link:hover { color: #3498db; }
  .intro-box { background: #ffffff; border-left: 5px solid #3498db; padding: 20px; border-radius: 5px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); margin-bottom: 30px; }
  .log-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 15px; }
  .log-item { display: block; padding: 16px; background-color: #ffffff; border: 1px solid #e0e0e0; border-radius: 8px; text-decoration: none; color: #2c3e50; transition: all 0.2s ease; }
  .log-item:hover { border-color: #3498db; background-color: #f8fbfe; transform: translateY(-3px); box-shadow: 0 6px 12px rgba(0,0,0,0.08); color: #2980b9; }
  .log-date { font-size: 0.85rem; color: #7f8c8d; margin-bottom: 6px; display: block; font-weight: 600; }
  .log-title { font-size: 1rem; font-weight: 700; line-height: 1.4; }
  .award-card { border: 2px solid #f39c12; background: #fffdf7; border-radius: 12px; padding: 25px; box-shadow: 0 4px 15px rgba(243, 156, 18, 0.15); margin-bottom: 20px; }
  .award-title { color: #d35400; font-weight: 800; font-size: 1.4rem; margin-bottom: 15px; border-bottom: 2px dashed #f39c12; padding-bottom: 10px; }
  .assignment-card { border: 2px solid #34495e; background: #ffffff; border-radius: 12px; padding: 25px; box-shadow: 0 4px 15px rgba(52, 73, 94, 0.1); margin-bottom: 40px; }
</style>
'

# ==========================================
# 1-A. [관제 직무용] 메인 페이지 (index.html)
# ==========================================
cat > index.html << HTML_EOF
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>홍기수 | 네트워크 관제 포트폴리오</title>
$CSS_STYLE
</head>
<body>
<div class="hero">
  <h1>홍기수</h1>
  <h4>Network Security Monitoring Engineer</h4>
</div>
<div class="container mt-4 mb-5">
  
  <!-- 직무 선택 탭 -->
  <ul class="nav nav-tabs justify-content-center">
    <li class="nav-item">
      <a class="nav-link active" href="index.html">👁️ 네트워크 관제 직무</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="index_engineer.html">🛠️ 보안 인프라 엔지니어 직무 ➔</a>
    </li>
  </ul>

  <!-- 관제용 자기소개 -->
  <div class="intro-box">
    <h4 class="fw-bold text-dark mb-3">"끝까지 파고들어 원인을 규명하는 관제 엔지니어"</h4>
    <p class="text-secondary fs-6 lh-lg mb-0">
      단순한 알람 모니터링을 넘어, 패킷 하나하나를 분석하고 이상 징후의 근본 원인을 찾아내는 데 강점이 있습니다.<br>
      가디언즈 부트캠프를 통해 <strong>Snort와 Suricata를 활용한 탐지 패턴 분석</strong> 및 <strong>Wazuh 기반의 로그 분석</strong> 역량을 길렀습니다. 에러가 발생해도 포기하지 않고 트러블슈팅을 해낸 끈기로 24시간 안정적인 네트워크 환경을 수호하겠습니다.
    </p>
  </div>
  
  <div class="section">
    <div class="mt-3 mb-4 text-center">
      <span class="badge bg-danger fs-6 me-1">Suricata/Snort</span>
      <span class="badge bg-secondary fs-6 me-1">Wazuh (SIEM)</span>
      <span class="badge bg-primary fs-6 me-1">Linux</span>
      <span class="badge bg-info text-dark fs-6 me-1">Python</span>
      <span class="badge bg-dark fs-6 me-1">Wireshark</span>
    </div>
  </div>

  <!-- 수상 내역 및 주요 결과물 -->
  <div class="award-card">
    <div class="award-title">🏆 부트캠프 우수 성과 및 프로젝트</div>
    <div class="row">
      <div class="col-md-6 mb-3">
        <h5 class="fw-bold text-dark">🥇 2차 프로젝트 우수상</h5>
        <a href="2차프로젝트 우수상_상장.jpg" target="_blank" class="btn btn-warning fw-bold text-dark w-100 mb-2">🏅 상장 원본 보기</a>
      </div>
      <div class="col-md-6 mb-3">
        <h5 class="fw-bold text-dark">📊 모의해킹 및 프로젝트 문서</h5>
        <a href="3_2지(easy)하조_모의해킹결과보고서.pdf" target="_blank" class="btn btn-outline-success fw-bold w-100 mb-2">📄 2차 모의해킹 보고서 보기</a>
        <a href="어울림_보고서.pdf" target="_blank" class="btn btn-outline-danger fw-bold w-100">📄 1차 프로젝트 보고서 보기</a>
      </div>
    </div>
  </div>

  <!-- 주요 과제 파일 섹션 -->
  <div class="assignment-card">
    <h4 class="fw-bold text-dark mb-3" style="border-bottom: 2px dashed #34495e; padding-bottom: 10px;">📝 관제 및 분석 실습 과제</h4>
    <div class="d-flex flex-wrap gap-2">
      <a href="홍기수_보안 인프라 실습 과제3.pdf" target="_blank" class="btn btn-outline-dark fw-bold">📄 NIDS/NIPS 패킷 분석 실습 (Snort/Suricata)</a>
      <a href="홍기수_보안 인프라 실습 과제4.pdf" target="_blank" class="btn btn-outline-dark fw-bold">📄 취약점 진단 및 로그 분석 실습</a>
    </div>
  </div>

  <h3 class="fw-bold border-bottom pb-2 mb-4 mt-5">🚀 상세 학습 기록</h3>
  <div class="row mb-5">
    <div class="col-md-6 mb-4">
      <div class="card h-100 shadow-sm border-danger">
        <div class="card-body">
          <h5 class="card-title fw-bold text-danger">보안 실습 및 관제</h5>
          <p class="card-text text-secondary mb-3">Wazuh, Snort, Suricata, DVWA</p>
          <a href="security.html" class="btn btn-outline-danger w-100 fw-bold">상세페이지 보기</a>
        </div>
      </div>
    </div>
    <div class="col-md-6 mb-4">
      <div class="card h-100 shadow-sm border-dark">
        <div class="card-body">
          <h5 class="card-title fw-bold text-dark">악성코드 분석</h5>
          <p class="card-text text-secondary mb-3">Flare VM, Static Malware Analysis</p>
          <a href="malware.html" class="btn btn-outline-dark w-100 fw-bold">상세페이지 보기</a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
HTML_EOF

# ==========================================
# 1-B. [엔지니어 직무용] 메인 페이지 (index_engineer.html)
# ==========================================
cat > index_engineer.html << HTML_EOF
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>홍기수 | 보안 인프라 엔지니어 포트폴리오</title>
$CSS_STYLE
</head>
<body>
<div class="hero" style="background: #27ae60;">
  <h1>홍기수</h1>
  <h4>Security Infrastructure Engineer</h4>
</div>
<div class="container mt-4 mb-5">
  
  <!-- 직무 선택 탭 -->
  <ul class="nav nav-tabs justify-content-center">
    <li class="nav-item">
      <a class="nav-link" href="index.html">⬅️ 네트워크 관제 직무</a>
    </li>
    <li class="nav-item">
      <a class="nav-link active" href="index_engineer.html" style="border-bottom-color: #27ae60; color: #27ae60;">🛠️ 보안 인프라 엔지니어 직무</a>
    </li>
  </ul>

  <!-- 엔지니어용 자기소개 -->
  <div class="intro-box" style="border-left-color: #27ae60;">
    <h4 class="fw-bold text-dark mb-3">"탄탄한 기초 위에 안전한 아키텍처를 설계하는 엔지니어"</h4>
    <p class="text-secondary fs-6 lh-lg mb-0">
      IT 인프라의 뼈대를 세우고 안전하게 보호하는 구축 및 운영 프로세스에 매력을 느꼈습니다.<br>
      <strong>Cisco 장비 및 pfSense 기반의 방화벽 구축</strong>부터 <strong>Linux/Windows Server 서버 인프라 구성</strong>까지 전반적인 아키텍처를 직접 구성해보았습니다. 인프라 구축의 흐름을 이해하고, 발생 가능한 보안 위협을 선제적으로 차단하는 믿음직한 엔지니어가 되겠습니다.
    </p>
  </div>
  
  <div class="section">
    <div class="mt-3 mb-4 text-center">
      <span class="badge bg-danger fs-6 me-1">Cisco Router/Switch</span>
      <span class="badge bg-primary fs-6 me-1">Linux/Windows Server</span>
      <span class="badge bg-warning text-dark fs-6 me-1">pfSense Firewall</span>
      <span class="badge bg-dark fs-6 me-1">GNS3</span>
    </div>
  </div>

  <!-- 수상 내역 및 주요 결과물 -->
  <div class="award-card" style="border-color: #27ae60;">
    <div class="award-title" style="color: #27ae60; border-bottom-color: #27ae60;">🏆 부트캠프 우수 성과 및 프로젝트</div>
    <div class="row">
      <div class="col-md-6 mb-3">
        <h5 class="fw-bold text-dark">🥇 2차 프로젝트 우수상</h5>
        <a href="2차프로젝트 우수상_상장.jpg" target="_blank" class="btn btn-warning fw-bold text-dark w-100 mb-2">🏅 상장 원본 보기</a>
      </div>
      <div class="col-md-6 mb-3">
        <h5 class="fw-bold text-dark">📊 인프라 설계 및 구축 문서</h5>
        <a href="2_2지(easy)하조_2차팀프로젝트계획서.pdf" target="_blank" class="btn btn-outline-primary fw-bold w-100 mb-2">📄 2차 인프라 프로젝트 계획서</a>
        <a href="어울림_보고서.pdf" target="_blank" class="btn btn-outline-danger fw-bold w-100">📄 1차 인프라 구축 결과 보고서</a>
      </div>
    </div>
  </div>

  <!-- 주요 과제 파일 섹션 -->
  <div class="assignment-card">
    <h4 class="fw-bold text-dark mb-3" style="border-bottom: 2px dashed #34495e; padding-bottom: 10px;">📝 시스템 및 네트워크 실습 과제</h4>
    <div class="d-flex flex-wrap gap-2">
      <a href="기업정보보호관리_과제_홍기수.pdf" target="_blank" class="btn btn-outline-dark fw-bold">📄 기업정보보호관리 인프라 과제</a>
      <a href="홍기수_보안 인프라 실습 과제3.pdf" target="_blank" class="btn btn-outline-dark fw-bold">📄 OSSEC 기반 시스템 무결성 점검 실습</a>
    </div>
  </div>

  <h3 class="fw-bold border-bottom pb-2 mb-4 mt-5">🚀 상세 학습 기록</h3>
  <div class="row mb-5">
    <div class="col-md-6 mb-4">
      <div class="card h-100 shadow-sm border-primary">
        <div class="card-body">
          <h5 class="card-title fw-bold text-primary">네트워크 구축</h5>
          <p class="card-text text-secondary mb-3">Cisco, VPN, Firewall, pfSense</p>
          <a href="network.html" class="btn btn-outline-primary w-100 fw-bold">상세페이지 보기</a>
        </div>
      </div>
    </div>
    <div class="col-md-6 mb-4">
      <div class="card h-100 shadow-sm border-success">
        <div class="card-body">
          <h5 class="card-title fw-bold text-success">시스템 운영</h5>
          <p class="card-text text-secondary mb-3">Ubuntu, Windows Server, MariaDB</p>
          <a href="system.html" class="btn btn-outline-success w-100 fw-bold">상세페이지 보기</a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
HTML_EOF

# ==========================================
# 2. 임시 파일 초기화
# ==========================================
rm -f tmp_*.txt
> tmp_network.txt
> tmp_system.txt
> tmp_security.txt
> tmp_malware.txt

# ==========================================
# 3. 마크다운(.md) 파일 분류
# ==========================================
for file in *.md
do
    if [ "$file" = "README.md" ]; then continue; fi
    if [ "$file" = "*.md" ]; then continue; fi
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

# ==========================================
# 4. 상세 페이지 자동 생성 함수
# ==========================================
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
<title>$title - 상세 페이지</title>
$CSS_STYLE
</head>
<body>
<div class="container mt-5 mb-5">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="fw-bold">📁 상세 학습 기록</h2>
    <a href="index.html" class="btn btn-secondary fw-bold">⬅ 메인으로 돌아가기</a>
  </div>
  
  <div class="card border-${bg_color} shadow-sm">
    <div class="card-header bg-${bg_color} text-white fs-5 fw-bold py-3">$title</div>
    <div class="card-body bg-light p-4">
      <div class="log-grid">
HTML_EOF
    
    if [ -s "$tmp_file" ]; then
        cat "$tmp_file" >> "$target_html"
    else
        echo "<p class='text-muted'>등록된 학습 기록이 없습니다.</p>" >> "$target_html"
    fi

    cat >> "$target_html" << HTML_EOF
      </div>
    </div>
  </div>
</div>
</body>
</html>
HTML_EOF
}

# ==========================================
# 5. 각 카테고리 상세 페이지(HTML) 찍어내기
# ==========================================
create_detail_page "network.html" "🌐 네트워크 구축 (Cisco, GNS3, pfSense)" "primary" "tmp_network.txt"
create_detail_page "system.html" "🖥️ 시스템 인프라 (Ubuntu, Windows Server, VirtualBox)" "success" "tmp_system.txt"
create_detail_page "security.html" "🛡️ 모의해킹 및 보안 관제 (Kali, DVWA, Wazuh, WebGoat)" "danger" "tmp_security.txt"
create_detail_page "malware.html" "🦠 악성코드 분석 (FLARE-VM, Malware Analysis)" "dark" "tmp_malware.txt"

# 6. 임시 파일 찌꺼기 삭제
rm -f tmp_*.txt

echo "관제 및 엔지니어 탭 분리 완료! 스크립트가 성공적으로 저장되었습니다."
