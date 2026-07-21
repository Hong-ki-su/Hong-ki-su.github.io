#!/bin/bash

cat > index.html << 'EOF'
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>홍기수 포트폴리오</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#f8f9fa;
}
.hero{
    background:#212529;
    color:white;
    padding:60px;
    text-align:center;
}
.section{
    margin-top:40px;
}
.card{
    height:100%;
}
</style>
</head>
<body>

<div class="hero">
<h1>홍기수</h1>
<h4>Infrastructure & Security Portfolio</h4>
<p>Linux · Network · Security · Python</p>
</div>

<div class="container">

<div class="section">
<h2>소개</h2>

<p>
울산과학대학교 전기전자공학과(반도체응용) 졸업<br>
인프라·보안 국비교육 수강<br>
Linux / Network / Security 분야 학습
</p>
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

<div class="col-md-3 mb-3">
<div class="card">
<div class="card-body">
<h5>Cisco</h5>
<a href="2026-03-24-cisco.html">보기</a>
</div>
</div>
</div>

<div class="col-md-3 mb-3">
<div class="card">
<div class="card-body">
<h5>Ubuntu Monitoring</h5>
<a href="2026-04-28-ubuntu-monitoring.html">보기</a>
</div>
</div>
</div>

<div class="col-md-3 mb-3">
<div class="card">
<div class="card-body">
<h5>DVWA</h5>
<a href="2026-06-23-dvwa-web-hacking.html">보기</a>
</div>
</div>
</div>

<div class="col-md-3 mb-3">
<div class="card">
<div class="card-body">
<h5>Malware Analysis</h5>
<a href="2026-07-15-static-malware-analysis.html">보기</a>
</div>
</div>
</div>

</div>
</div>

<div class="section">
<h2>전체 학습 기록</h2>
<ul>
EOF

for file in *.html
do
    if [ "$file" != "index.html" ]; then
        echo "<li><a href=\"$file\">$file</a></li>" >> index.html
    fi
done

cat >> index.html << 'EOF'
</ul>

</div>
</div>

</body>
</html>
EOF
