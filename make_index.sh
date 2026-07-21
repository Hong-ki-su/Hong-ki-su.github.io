#!/bin/bash

# ==========================================
# 0. 공통으로 사용할 CSS 스타일 정의
# ==========================================
CSS_STYLE='
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  body { background: #f4f6f9; color: #333; }
  .hero { background: #2c3e50; color: white; padding: 60px 20px; text-align: center; }
  .hero h1 { font-weight: 800; margin-bottom: 10px; }
  .section { margin-top: 40px; margin-bottom: 40px; }
  .log-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 15px; }
  .log-item { display: block; padding: 16px; background-color: #ffffff; border: 1px solid #e0e0e0; border-radius: 8px; text-decoration: none; color: #2c3e50; transition: all 0.2s ease; }
  .log-item:hover { border-color: #3498db; background-color: #f8fbfe; transform: translateY(-3px); box-shadow: 0 6px 12px rgba(0,0,0,0.08); color: #2980b9; }
  .log-date { font-size: 0.85rem; color: #7f8c8d; margin-bottom: 6px; display: block; font-weight: 600; }
  .log-title { font-size: 1rem; font-weight: 700; line-height: 1.4; }
</style>
'

# ==========================================
# 1. 메인 페이지 (index.html) 생성
# ==========================================
cat > index.html << EOF
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>홍기수 포트폴리오</title>
$CSS_STYLE
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

  <h3 class="fw-bold border-bottom pb-2 mb-4">🚀 주요 프로젝트</h3>
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
    <div class="col-md-6 mb-4">
      <div class="card h-100 shadow-sm border-danger">
        <div class="card-body">
          <h5 class="card-title fw-bold text-danger">보안 실습</h5>
          <p class="card-text text-secondary mb-3">DVWA, WebGoat, Wazuh, Metasploit</p>
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
EOF

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

    cat > "$target_html" << EOF
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
EOF
    
    # 분류된 파일이 있으면 넣고 없으면 메시지 출력
    if [ -s "$tmp_file" ]; then
        cat "$tmp_file" >> "$target_html"
    else
        echo "<p class='text-muted'>등록된 학습 기록이 없습니다.</p>" >> "$target_html"
    fi

    cat >> "$target_html" << EOF
      </div>
    </div>
  </div>
</div>
</body>
</html>
EOF
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

echo "페이지 분리형 포트폴리오 생성 완료!"
