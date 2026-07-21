#!/bin/bash

==========================================

0. 공통으로 사용할 CSS 스타일 정의

==========================================

CSS_STYLE='

==========================================

1. 메인 페이지 (index.html) 생성

==========================================

cat > index.html << EOF

<!-- 2차 프로젝트 (우수상) 카드 -->
<div class="col-md-6 mb-4">
  <div class="card h-100 shadow-sm award-card">
    <div class="card-body">
      <span class="badge bg-warning text-dark mb-2 fs-6">🏆 우수상 (이스트소프트 대표이사상)</span><br>
      <span class="badge bg-secondary mb-3">2차 프로젝트</span>
      <h5 class="card-title fw-bold">가디언즈 정보보호 인프라 2차 프로젝트</h5>
      <p class="card-text text-secondary small">팀 2지(easy)하조 (김혜미, 신연선, 신재훈, 남재근, 홍기수)<br>가장 우수한 성적으로 2차 프로젝트 우수상 수상</p>
      <div class="mt-3">
        <a href="2_2지(easy)하조_2차팀프로젝트계획서.pdf" class="btn btn-outline-dark fw-bold btn-sm mb-2" target="_blank">📄 프로젝트 계획서 보기</a>
        <a href="3_2지(easy)하조_모의해킹결과보고서.pdf" class="btn btn-outline-dark fw-bold btn-sm mb-2" target="_blank">📄 모의해킹 결과보고서</a>
        <a href="2차프로젝트 우수상_상장.jpg" class="btn btn-warning fw-bold btn-sm mb-2" target="_blank">🏅 상장 원본 보기</a>
      </div>
    </div>
  </div>
</div>

<!-- 1차 프로젝트 카드 -->
<div class="col-md-6 mb-4">
  <div class="card h-100 shadow-sm border-secondary">
    <div class="card-body">
      <span class="badge bg-secondary mb-3">1차 프로젝트</span>
      <h5 class="card-title fw-bold">어울림 통합 보안 솔루션 컨설팅</h5>
      <p class="card-text text-secondary small">팀 어울림 (임예슬, 정재원, 정준희, 홍기수)<br>프론트엔드 UI 기획/개발 및 데이터베이스 연동, 에러 핸들링 담당</p>
      <div class="mt-3">
        <a href="어울림_보고서.pdf" class="btn btn-outline-dark fw-bold btn-sm" target="_blank">📄 발표자료(PPT) 보기</a>
      </div>
    </div>
  </div>
</div>


==========================================

2. 임시 파일 초기화

==========================================

rm -f tmp_*.txt

tmp_network.txt
tmp_system.txt
tmp_security.txt
tmp_malware.txt

==========================================

3. 마크다운(.md) 파일 분류

==========================================

for file in .md
do
if [ "$file" = "README.md" ]; then continue; fi
if [ "$file" = ".md" ]; then continue; fi

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

if [[ "$fname" == *"cisco"* \vert{}\vert{} "$fname" == *"vpn"* || "$fname" == *"pfsense"* \vert{}\vert{} "$fname" == *"gns3"* ]]; then
    echo "$card_html" >> tmp_network.txt
elif [[ "$fname" == *"ubuntu"* \vert{}\vert{} "$fname" == *"virtualbox"* || "$fname" == *"windows"* \vert{}\vert{} "$fname" == *"mariadb"* || "$fname" == *"linux"* \vert{}\vert{} "$fname" == *"shell"* ]]; then
    echo "$card_html" >> tmp_system.txt
elif [[ "$fname" == *"flare"* \vert{}\vert{} "$fname" == *"malware"* ]]; then
    echo "$card_html" >> tmp_malware.txt
else
    echo "$card_html" >> tmp_security.txt
fi


done

==========================================

4. 상세 페이지 자동 생성 함수

==========================================

create_detail_page() {
local target_html="$1"
local title="$2"
local bg_color="$3"
local tmp_file="$4"

cat > "$target_html" << EOF


if [ -s "$tmp_file" ]; then
    cat "$tmp_file" >> "$target_html"
else
    echo "<p class='text-muted'>등록된 학습 기록이 없습니다.</p>" >> "$target_html"
fi

cat >> "$target_html" << EOF
  </div>
</div>


==========================================

5. 각 카테고리 상세 페이지(HTML) 찍어내기

==========================================

create_detail_page "network.html" "🌐 네트워크 구축 (Cisco, GNS3, pfSense)" "primary" "tmp_network.txt"
create_detail_page "system.html" "🖥️ 시스템 인프라 (Ubuntu, Windows Server, VirtualBox)" "success" "tmp_system.txt"
create_detail_page "security.html" "🛡️ 모의해킹 및 보안 관제 (Kali, DVWA, Wazuh, WebGoat)" "danger" "tmp_security.txt"
create_detail_page "malware.html" "🦠 악성코드 분석 (FLARE-VM, Malware Analysis)" "dark" "tmp_malware.txt"

rm -f tmp_*.txt
echo "수상 내역이 추가된 포트폴리오 생성 완료!"
