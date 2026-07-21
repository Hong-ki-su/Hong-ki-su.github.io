#!/bin/bash

# 1. HTML 상단 및 CSS 디자인 (부드러운 스크롤 애니메이션 추가)
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>홍기수 포트폴리오</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  /* 부드러운 스크롤 이동 효과 */
  html { scroll-behavior: smooth; }
  
  body { background: #f4f6f9; color: #333; }
  .hero { background: #2c3e50; color: white; padding: 60px 20px; text-align: center; }
  .hero h1 { font-weight: 800; margin-bottom: 10px; }
  .section { margin-top: 40px; margin-bottom: 40px; }
  
  .log-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
    gap: 15px;
  }
  
  .log-item {
    display: block;
    padding: 16px;
    background-color: #ffffff;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    text-decoration: none;
    color: #2c3e50;
    transition: all 0.2s ease;
  }
  .log-item:hover {
    border-color: #3498db;
    background-color: #f8fbfe;
    transform: translateY(-3px);
    box-shadow: 0 6px 12px rgba(0,0,0,0.08);
    color: #2980b9;
  }
  .log-date { font-size: 0.85rem; color: #7f8c8d; margin-bottom: 6px; display: block; font-weight: 600; }
  .log-title { font-size: 1rem; font-weight: 700; line-height: 1.4; }
</style>
</head>
<body>
<div class="hero">
  <h1>홍기수</h1>
  <h4>Infrastructure & Security Engineer Portfolio</h4>
  <p class="mt-3">Linux · Network · Security · Python</p>
</div>
<div class="container mb-5">
  
  <div class="section">
    <h3 class="fw-bold mb-3">👨‍💻 프로필 및 기술 스택</h3>
    <p class="text-secondary">
      교육: 울산과학대학교 반도체응용 전공 졸업 / 이스트캠프 가디언즈 정보보호 인프라 교육 수강<br>
      목표: 네트워크 관제 및 보안 AI 관리 분야 엔지니어
    </p>
    <div class="mt-3 mb-5">
      <span class="badge bg-primary fs-6 me-1">Linux</span>
      <span class="badge bg-success fs-6 me-1">Windows Server</span>
      <span class="badge bg-danger fs-6 me-1">Cisco</span>
      <span class="badge bg-dark fs-6 me-1">GNS3</span>
      <span class="badge bg-warning text-dark fs-6 me-1">pfSense</span>
      <span class="badge bg-info text-dark fs-6 me-1">Python</span>
      <span class="badge bg-secondary fs-6 me-1">Wazuh</span>
      <span class="badge bg-primary fs-6 me-1">Snort</span>
    </div>
  </div>

  <!-- 주요 프로젝트 요약 카드 영역 (클릭 시 하단으로 스크롤 이동) -->
  <h3 class="fw-bold border-bottom pb-2 mb-4">🚀 주요 프로젝트</h3>
  <div class="row mb-5">
    <div class="col-md-6 mb-4">
      <div class="card h-100 shadow-sm border-primary">
        <div class="card-body">
          <h5 class="card-title fw-bold text-primary">네트워크 구축</h5>
          <p class="card-text text-secondary mb-3">Cisco, VPN, Firewall, pfSense</p>
          <a href="#network" class="btn btn-outline-primary w-100 fw-bold">상세페이지 보기</a>
        </div>
      </div>
    </div>
    <div class="col-md-6 mb-4">
      <div class="card h-100 shadow-sm border-success">
        <div class="card-body">
          <h5 class="card-title fw-bold text-success">시스템 운영</h5>
          <p class="card-text text-secondary mb-3">Ubuntu, Windows Server, MariaDB</p>
          <a href="#system" class="btn btn-outline-success w-100 fw-bold">상세페이지 보기</a>
        </div>
      </div>
    </div>
    <div class="col-md-6 mb-4">
      <div class="card h-100 shadow-sm border-danger">
        <div class="card-body">
          <h5 class="card-title fw-bold text-danger">보안 실습</h5>
          <p class="card-text text-secondary mb-3">DVWA, WebGoat, Wazuh, Metasploit</p>
          <a href="#security" class="btn btn-outline-danger w-100 fw-bold">상세페이지 보기</a>
        </div>
      </div>
    </div>
    <div class="col-md-6 mb-4">
      <div class="card h-100 shadow-sm border-dark">
        <div class="card-body">
          <h5 class="card-title fw-bold text-dark">악성코드 분석</h5>
          <p class="card-text text-secondary mb-3">Flare VM, Static Malware Analysis</p>
          <a href="#malware" class="btn btn-outline-dark w-100 fw-bold">상세페이지 보기</a>
        </div>
      </div>
    </div>
  </div>

  <h3 class="fw-bold border-bottom pb-2 mb-4 mt-5">📚 전체 학습 기록 상세</h3>
EOF

# 2. 임시 공간 생성
> tmp_network.html
> tmp_system.html
> tmp_security.html
> tmp_malware.html
> tmp_etc.html

# 3. 모든 마크다운(.md) 파일을 돌면서 분류
for file in *.md
do
    if [ "$file" = "README.md" ]; then continue; fi
    if [ "$file" = "*.md" ]; then continue; fi
    # 찌꺼기 파일(tmp_...)이 목록에 뜨지 않도록 방어
    if [[ "$file" == tmp_* ]]; then continue; fi 

    name_no_ext="${file%.md}"
    link_href="${name_no_ext}.html"

    # 파일명에서 날짜(YYYY-MM-DD)와 제목 분리
    if [[ $name_no_ext =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)$ ]]; then
        date_part="${BASH_REMATCH[1]}"
        title_part="${BASH_REMATCH[2]//-/ }"
        title_part=$(echo "$title_part" | tr 'a-z' 'A-Z')
    else
        date_part="학습 기록"
        title_part=$(echo "$name_no_ext" | tr 'a-z' 'A-Z')
    fi

    # 개별 파일 버튼 HTML 틀
    card_html="<a href=\"$link_href\" class=\"log-item\"><span class=\"log-date\">📅 $date_part</span><span class=\"log-title\">$title_part</span></a>"

    fname=$(echo "$file" | tr 'A-Z' 'a-z')
    
    if [[ "$fname" == *"cisco"* || "$fname" == *"vpn"* || "$fname" == *"pfsense"* || "$fname" == *"gns3"* ]]; then
        echo "$card_html" >> tmp_network.html
    elif [[ "$fname" == *"ubuntu"* || "$fname" == *"virtualbox"* || "$fname" == *"windows"* || "$fname" == *"mariadb"* || "$fname" == *"linux"* || "$fname" == *"shell"* ]]; then
        echo "$card_html" >> tmp_system.html
    elif [[ "$fname" == *"flare"* || "$fname" == *"malware"* ]]; then
        echo "$card_html" >> tmp_malware.html
    elif [[ "$fname" == *"kali"* || "$fname" == *"kail"* || "$fname" == *"dvwa"* || "$fname" == *"wazuh"* || "$fname" == *"snort"* || "$fname" == *"webgoat"* || "$fname" == *"pentest"* || "$fname" == *"vuln"* || "$fname" == *"wordpress"* || "$fname" == *"metasploit"* || "$fname" == *"graylog"* || "$fname" == *"bee-box"* || "$fname" == *"ids"* ]]; then
        echo "$card_html" >> tmp_security.html
    else
        echo "$card_html" >> tmp_etc.html
    fi
done

# 4. 분류된 구역을 화면에 배치하는 함수 (id를 부여하여 링크 추적 가능하게 함)
append_project_card() {
    local title="$1"
    local bg_color="$2"
    local tmp_file="$3"
    local section_id="$4"

    if [ -s "$tmp_file" ]; then
        # id="$section_id" 를 통해 상단 버튼과 연결됨
        echo "<div id=\"$section_id\" class=\"card mb-5 border-${bg_color} shadow-sm\" style=\"scroll-margin-top: 20px;\">" >> index.html
        echo "  <div class=\"card-header bg-${bg_color} text-white fs-5 fw-bold py-3\">$title</div>" >> index.html
        echo "  <div class=\"card-body bg-light p-4\">" >> index.html
        echo "    <div class=\"log-grid\">" >> index.html
        cat "$tmp_file" >> index.html
        echo "    </div>" >> index.html
        echo "  </div>" >> index.html
        echo "</div>" >> index.html
    fi
}

# 5. 각 카테고리별 출력 (id값 network, system, security, malware 매칭)
append_project_card "🌐 네트워크 구축 (Cisco, GNS3, pfSense)" "primary" "tmp_network.html" "network"
append_project_card "🖥️ 시스템 인프라 (Ubuntu, Windows Server, VirtualBox)" "success" "tmp_system.html" "system"
append_project_card "🛡️ 모의해킹 및 보안 관제 (Kali, DVWA, Wazuh, WebGoat)" "danger" "tmp_security.html" "security"
append_project_card "🦠 악성코드 분석 (FLARE-VM, Malware Analysis)" "dark" "tmp_malware.html" "malware"
append_project_card "📁 기타 실습 기록" "secondary" "tmp_etc.html" "etc"

# 6. 마무리 및 임시 찌꺼기 파일 청소
cat >> index.html << 'EOF'
</div>
</body>
</html>
EOF

rm -f tmp_network.html tmp_system.html tmp_security.html tmp_malware.html tmp_etc.html

echo "상단 버튼 네비게이션이 적용된 포트폴리오 생성 완료!"
