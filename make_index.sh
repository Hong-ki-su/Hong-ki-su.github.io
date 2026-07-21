#!/bin/bash

# 1. HTML 상단 및 CSS 디자인 영역
cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>홍기수 포트폴리오</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  body { background: #f8f9fa; }
  .hero { background: #212529; color: white; padding: 60px; text-align: center; }
  .section { margin-top: 50px; margin-bottom: 20px; }
  .category-title { border-bottom: 2px solid #dee2e6; padding-bottom: 10px; margin-bottom: 20px; font-weight: bold; color: #343a40; }
  
  /* 카테고리 안의 파일들을 바둑판으로 정렬 */
  .log-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 15px;
    list-style: none;
    padding: 0;
  }
  
  /* 개별 파일 카드 디자인 */
  .log-card {
    display: block;
    padding: 15px 20px;
    background-color: #ffffff;
    border-left: 4px solid #0d6efd;
    border-radius: 6px;
    color: #212529;
    text-decoration: none;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    transition: all 0.2s ease-in-out;
  }
  .log-card:hover {
    background-color: #f1f8ff;
    border-left: 4px solid #0a58ca;
    color: #0a58ca;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  }
  .card-date { font-size: 13px; color: #6c757d; margin-bottom: 5px; display: block; }
  .card-title-text { font-size: 15px; font-weight: 600; }
</style>
</head>
<body>
<div class="hero">
  <h1>홍기수</h1>
  <h4>Infrastructure & Security Portfolio</h4>
  <p>Linux · Network · Security · Python</p>
</div>
<div class="container mb-5">
  
  <div class="section">
    <h2 class="category-title">👨‍💻 프로필 및 기술 스택</h2>
    <p>
      <strong>교육:</strong> 울산과학대학교 전기전자공학과(반도체응용) 졸업 / 인프라·보안 국비교육 수강<br>
      <strong>목표:</strong> 네트워크 관제 및 보안 AI 관리 분야 엔지니어
    </p>
    <div class="mt-3">
      <span class="badge bg-primary">Linux</span>
      <span class="badge bg-success">Windows Server</span>
      <span class="badge bg-danger">Cisco</span>
      <span class="badge bg-dark">GNS3</span>
      <span class="badge bg-warning text-dark">pfSense</span>
      <span class="badge bg-info text-dark">Python</span>
      <span class="badge bg-secondary">Wazuh</span>
      <span class="badge bg-primary">Snort</span>
    </div>
  </div>
EOF

# 2. 카테고리별로 파일을 담을 임시 공간 만들기
> tmp_network.html
> tmp_system.html
> tmp_security.html
> tmp_malware.html
> tmp_etc.html

# 3. 모든 HTML 파일을 돌면서 알맞은 구역에 분류하기
for file in *.html
do
    if [ "$file" = "index.html" ] || [ "$file" = "README.html" ]; then continue; fi

    name_no_ext="${file%.html}"

    # 파일명에서 날짜(YYYY-MM-DD)와 제목 분리
    if [[ $name_no_ext =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)$ ]]; then
        date_part="${BASH_REMATCH[1]}"
        title_part="${BASH_REMATCH[2]//-/ }"
        title_part=$(echo "$title_part" | tr 'a-z' 'A-Z') # 대문자로 변환
    else
        date_part="학습 기록"
        title_part="$name_no_ext"
    fi

    # 카드 HTML 뼈대
    card_html="<li><a href=\"$file\" class=\"log-card\"><span class=\"card-date\">🗓 $date_part</span><span class=\"card-title-text\">$title_part</span></a></li>"

    # 파일명에 들어간 단어를 보고 구역 나누기 (소문자로 변환해서 비교)
    fname="${file,,}"
    if [[ "$fname" == *"cisco"* || "$fname" == *"vpn"* || "$fname" == *"pfsense"* || "$fname" == *"gns3"* ]]; then
        echo "$card_html" >> tmp_network.html
    elif [[ "$fname" == *"ubuntu"* || "$fname" == *"windows"* || "$fname" == *"mariadb"* || "$fname" == *"virtualbox"* || "$fname" == *"linux"* || "$fname" == *"shell"* ]]; then
        echo "$card_html" >> tmp_system.html
    elif [[ "$fname" == *"flare"* || "$fname" == *"malware"* ]]; then
        echo "$card_html" >> tmp_malware.html
    elif [[ "$fname" == *"kali"* || "$fname" == *"dvwa"* || "$fname" == *"bwapp"* || "$fname" == *"wazuh"* || "$fname" == *"snort"* || "$fname" == *"webgoat"* || "$fname" == *"pentest"* || "$fname" == *"vuln"* || "$fname" == *"wordpress"* || "$fname" == *"metasploit"* || "$fname" == *"graylog"* ]]; then
        echo "$card_html" >> tmp_security.html
    else
        echo "$card_html" >> tmp_etc.html
    fi
done

# 4. 분류된 구역들을 화면에 찍어내는 함수
append_section() {
    local title="$1"
    local tmp_file="$2"
    local emoji="$3"

    if [ -s "$tmp_file" ]; ]; then
        echo "<div class=\"section\">" >> index.html
        echo "  <h3 class=\"category-title\">$emoji $title</h3>" >> index.html
        echo "  <ul class=\"log-grid\">" >> index.html
        cat "$tmp_file" >> index.html
        echo "  </ul>" >> index.html
        echo "</div>" >> index.html
    fi
}

# 5. 순서대로 구역 합치기
append_section "네트워크 (Network) 구축 실습" "tmp_network.html" "🌐"
append_section "시스템 운영 및 인프라 구축" "tmp_system.html" "🖥️"
append_section "보안 관제 및 모의해킹" "tmp_security.html" "🛡️"
append_section "악성코드 분석" "tmp_malware.html" "🦠"
append_section "기타 실습 기록" "tmp_etc.html" "📁"

# 6. 마무리 및 임시 파일 청소
cat >> index.html << 'EOF'
</div>
</body>
</html>
EOF

rm tmp_network.html tmp_system.html tmp_security.html tmp_malware.html tmp_etc.html

echo "자동 분류 포트폴리오 생성 완료!"
