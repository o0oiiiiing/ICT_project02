# :tangerine:제주여행
`한국 ICT 인재개발원 2차 프로젝트`<br>
주제 : OPEN API를 활용한 위치 정보 기반의 MVC 여행 정보 제공 및 커뮤니티<br><br>
![메인페이지](https://github.com/o0oiiiiing/ICT_project02/blob/main/%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80.png)<br>
<br>

## 개발기간
2024년 4월 22일 ~ 2024년 5월 31일<br><br>

## 팀 구성원
팀장 : 원유영<br>
팀원 : 박다현, 유경화, 최현민, 이성훈<br><br>
![팀 구성원](https://github.com/o0oiiiiing/ICT_project02/blob/main/%ED%8C%80%20%EA%B5%AC%EC%84%B1%EC%9B%90.png)<br><br>

## 개발 환경
![개발 환경](https://github.com/o0oiiiiing/ICT_project02/blob/main/%EA%B0%9C%EB%B0%9C%ED%99%98%EA%B2%BD.png)<br><br>

## ERD
![ERD](https://github.com/o0oiiiiing/ICT_project02/blob/main/ERD.png)<br><br>

## 기능 소개
<table>
  <tr>
    <th>분류</th>
    <th>요구사항명</th>
    <th>요구사항 상세</th>
  </tr>
  <tr>
    <td rowspan="5">공통</td>
    <td>header(공통)</td>
    <td>홈버튼, 카테고리이동, 검색창, 로그인/로그아웃, 나의여행(마이페이지)<br>나의여행 클릭시 로그인 인터셉터를 이용해 로그인 안되어있을 시 로그인 창으로 이동</td>
  </tr>
  <tr>
    <td>footer(공통)</td>
    <td>저작권, 개인정보약관, 사업자번호 등등</td>
  </tr>
  <tr>
    <td>날씨api</td>
    <td>날씨 아이콘 클릭 시 제주시, 서귀포시 실시간 날씨 및 온도 출력</td>
  </tr>
  <tr>
    <td>챗봇</td>
    <td>챗 gpt api 이용해서 사용자가 질문 시 답변</td>
  </tr>
  <tr>
    <td>탑버튼</td>
    <td>페이지가 아래로 내려갔을 때 탑버튼 생기고 누르면 맨 위로 이동</td>
  </tr>
  <tr> 
    <td rowspan="3">메인페이지</td>
    <td>팝업창</td>
    <td>오늘만 이 창을 열지 않음 누르면 쿠키 저장되서 24시간동안 보이지 않음<br>새로고침 때마다 관광지 및 음식점 별 추천 장소 달라짐</td>
  </tr>
  <tr>
    <td>메인 이미지 슬라이드</td>
    <td>이미지 자동으로 슬라이드</td>
  </tr>
  <tr>
    <td>현재 인기있는 장소</td>
    <td>조회순으로 정렬하기 -> 클릭 시 상세페이지로 바로 이동</td>
  </tr>
  
</table>





