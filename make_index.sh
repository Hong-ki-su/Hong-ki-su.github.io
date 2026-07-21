#!/bin/bash

# 1. HTML 상단 및 CSS 디자인 영역 (Bootstrap + 커스텀 카드 UI)
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
  .section { margin-top: 40px; }
  .card { height: 100%; border: none; box-shadow: 0 2px 4px rgba(0,0,0,0.05); }
  
  /* 하단 전체 학습 기록 전용 그리드 디자인 */
  .log-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 15px;
    list-style: none;
    padding: 0;
  }
  .log-card {
    display: block;
    padding: 15px 20px;
    background-color: #ffffff;
    border: 1px solid #e1e4e8;
    border-radius: 8px;
    color: #24292e;
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.2s ease-in-out;
  }
  .log-card:hover {
    background-color: #0d6efd;
    color: #ffffff;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  }
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
    <h2>소개</h2>
    <p>울산과학대학교 전기전자공학과(반도체응용) 졸업<br>인프라·보안 국비교육 수강<br>Linux / Network / Security 분야 학습</p>
  </div>
  
  <div class="section">
    <h2>기술 스택</h2>
    <span class="badge bg-primary">Linux</span>
    <span class="badge bg-success">Windows Server</span>
    <span class="badge bg-danger">Cisco</span>
    <span class="badge bg-dark">GNS3</span>
    <span class="badge bg-warning text-dark">pfSense</span>
    <span class="badge bg-info text-dark">Python</span>
    <span class="badge bg-secondary">Wazuh</span>
    <span class="badge bg-primary">Snort</span>
  </div>
  
  <div class="section">
    <h2>대표 프로젝트</h2>
    <div class="row">
      <div class="col-md-3 mb-3"><div class="card"><div class="card-body"><h5>Cisco</h5><a href="2026-03-24-cisco.html" class="btn btn-sm btn-outline-primary mt-2">보기</a></div></div></div>
      <div class="col-md-3 mb-3"><div class="card"><div class="card-body"><h5>Ubuntu Monitoring</h5><a href="2026-04-28-ubuntu-monitoring.html" class="btn btn-sm btn-outline-success mt-2">보기</a></div></div></div>
      <div class="col-md-3 mb-3"><div class="card"><div class="card-body"><h5>DVWA</h5><a href="2026-06-23-dvwa-web-hacking.html" class="btn btn-sm btn-outline-danger mt-2">보기</a></div></div></div>
      <div class="col-md-3 mb-3"><div class="card"><div class="card-body"><h5>Malware Analysis</h5><a href="2026-07-15-static-malware-analysis.html" class="btn btn-sm btn-outline-dark mt-2">보기</a></div></div></div>
    </div>
  </div>

  <div class="section">
    <h2>전체 학습 기록</h2>
    <ul class="log-grid">
EOF

# 2. 파일 목록을 읽어와서 예쁘게 변환하는 반복문
for file in *.html
do
    # index.html과 README.html은 목록에서 제외
    if [ "$file" != "index.html" ] && [ "$file" != "README.html" ]; then
        
        # 확장자(.html) 제거
        name_no_ext="${file%.html}"
        
        # 정규식을 이용해 날짜(YYYY-MM-DD)와 뒷부분(주제) 분리
        if [[ $name_no_ext =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.*)$ ]]; then
            date_part="${BASH_REMATCH[1]}"
            title_part="${BASH_REMATCH[2]//-/ }" # 하이픈(-)을 띄어쓰기로 변환
            title_part=$(echo "$title_part" | tr 'a-z' 'A-Z') # 소문자를 대문자로 변환
            
            # 최종 출력 텍스트 (예: 2026-03-24 | CISCO)
            display_name="${date_part} | ${title_part}"
        else
            display_name="$name_no_ext"
        fi
        
        # 변환된 이름으로 a 태그 생성 및 파일에 쓰기
        echo "      <li><a href=\"$file\" class=\"log-card\">$display_name</a></li>" >> index.html
    fi
done

# 3. HTML 하단 닫기
cat >> index.html << 'EOF'
    </ul>
  </div>
</div>
</body>
</html>
EOF

echo "포트폴리오 생성 완료!"
