<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- List를 순회하기 위해서 태그 라이브러리 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<script src="js/realtime_api.js"></script>

<title>초단기실황조회 FORM</title>
</head>
<body>
	<div class="col-md-8" style="margin:3rem;">
		<form action="getultrasrtncst" method="post">
			<h5 style="float:left; margin-right:30px">지역</h5>
			<div class="col-sm-2" style="display:inline-block; margin-right:50px; float:left;">
				<select class="form-select" name="region_1" id="region_1" aria-label="시/도" style="width:auto;" onchange="addrchange(this)">
				  	<option selected disabled>시/도</option>
				  	<option value="서울특별시">서울특별시</option>
				  	<option value="경기도">경기도</option>
				  	<option value="강원도">강원도</option>
				  	<option value="인천광역시">인천광역시</option>
				  	<option value="대전광역시">대전광역시</option>
			  		<option value="대구광역시">대구광역시</option>
			  		<option value="울산광역시">울산광역시</option>
			  		<option value="광주광역시">광주광역시</option>
			  		<option value="부산광역시">부산광역시</option>
			 	 	<option value="전라남도">전라남도</option>
				  	<option value="전라북도">전라북도</option>
				 	<option value="충청남도">충청남도</option>
				  	<option value="충청북도">충청북도</option>
				  	<option value="경상남도">경상남도</option>
				  	<option value="경상북도">경상북도</option>
				  	<option value="제주특별자치도">제주특별자치도</option>
				  	<option value="세종특별자치시">세종특별자치시</option>
				</select>
			</div>
			<div style="display:inline-block; margin-right:20px; float:left;">
				<select class="form-select" name="region_2" id="region_2" aria-label="시/군/구" style="width:auto;">
				  	<option selected disabled>시/군/구</option>
				</select>
			</div>
			<div class="text-center" style="display:inline-block; float:left;">
				<input type="submit" value="조회"/>
			</div>
		</form>
	</div>
	<br/>
	<div class="container-fluid py-5">
		<h2>초단기실황 조회 항목</h2>
		<table border="1">
			<!-- <tr>현재 일시 : </tr><br/> -->
			<tr>지역 : ${loc}</tr><br/>
			<tr>조회 날짜 : ${date}</tr><br/>
			<tr>조회 시간 : ${time}</tr><br/>
			<tr>온도 : ${list.t1h} °C</tr><br/>
			<tr>습도 : ${list.reh} %</tr><br/>
		</table>	
	</div>
	
	<!-- 
	<form action="getultrasrtncst" method="post" style="display:block;">
		<li><a>초단기실황조회는 1일 이내의 일시만 가능합니다.</a></li>
		<!-- 조회 날짜 : <input type="text" name="date"/> ( 단, yyyymmdd 형태로 입력.  ex)20220105 )
		<br/>
		조회 시간 : <input type="text" name="time" /> ( 단, hhmm 형태로 입력.  ex)0600 )
		<br/> 
		nx : <input type="text" name="nx" />
		<br/>
		ny : <input type="text" name="ny" />
		<br/>
		<input type="submit" value="조회"/>
	</form>
	-->	
</body>
<!--
	<script>
		//주소 대분류값 선택에 따른 소분류값 출력
		function addrchange(e){
			var seoul = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
			var gyeonggi = ["가평군","고양시 덕양구","고양시 일산동구","고양시 일산서구","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시 분당구","성남시 수정구","성남시 중원구","수원시 권선구","수원시 영통구","수원시 장안구","수원시 팔달구","시흥시","안산시 단원구","안산시 상록구", "안성시","안양시 동안구","안양시 만안구","양주시","양평군","여주시","연천군","오산시","용인시 기흥구","용인시 수지구","용인시 처인구","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"];
			var gangwon = ["강릉시","고성군","동해시","삼척시","속초시","양구군","양양군","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","화천군","횡성군"];
			var incheon = ["강화군","계양구","남동구","동구","미추홀구","부평구","서구","연수구","옹진군","중구"];
			var daejeon = ["대덕구","동구","서구","유성구","중구"];
			var daegu = ["남구","달서구","달성군","동구","북구","서구","수성구","중구"];
			var ulsan = ["남구","동구","북구","울주군","중구"];
			var gwangju = ["광산구","남구","동구","북구","서구"];
			var busan = ["강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구"];
			var jeollanamdo = ["강진구","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여주시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
			var jeollabukdo = ["고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시 덕진구","전주시 완산구","정읍시","진안군"];
			var chungcheongnamdo = ["계룡시","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시 동남구","천안시 서북구","청양군","태안군","홍성군"];
			var chungcheongbukdo = ["괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","증평군","진천군","청주시 상당구","청주시 서원구","청주시 청원구","청주시 흥덕구","충주시"];
			var gyeongsangnamdo = ["거제시","거창군","고성군","김해시","남해군","밀양시","사천시","산청군","양산시","의령군","진주시","창녕군","창원시 마산합포구","창원시 마산회원구","창원시 성산구","창원시 의창구","창원시 진해구","통영시","하동군","함안군","함양군","합천군"];
			var gyeongsangbukdo = ["경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포함시 남구","포항시 북구"];
			var jeju = ["서귀포시","제주시"];
			var sejong = ["세종특별자치시"];
			var target = document.getElementById("region_2");
			
			if(e.value=="서울특별시") var d = seoul;
			else if(e.value=="경기도") var d = gyeonggi;
			else if(e.value=="강원도") var d = gangwon;
			else if(e.value=="인천광역시") var d = incheon;
			else if(e.value=="대전광역시") var d = daejeon;
			else if(e.value=="대구광역시") var d = daegu;
			else if(e.value=="울산광역시") var d = ulsan;
			else if(e.value=="광주광역시") var d = gwangju;
			else if(e.value=="부산광역시") var d = busan;
			else if(e.value=="전라남도") var d = jeollanamdo;
			else if(e.value=="전라북도") var d = jeollabukdo;
			else if(e.value=="충청남도") var d = chungcheongnamdo;
			else if(e.value=="충청북도") var d = chungcheongbukdo;
			else if(e.value=="경상남도") var d = gyeongsangnamdo;
			else if(e.value=="경상북도") var d = gyeongsangbukdo;
			else if(e.value=="제주특별자치도") var d = jeju;
			else if(e.value=="세종특별자치시") var d = sejong;
			
			target.options.length=0;
			
			for (x in d){
				var opt = document.createElement("option");
				opt.value= d[x];
				opt.innerHTML = d[x];
				target.appendChild(opt);
			}
		}
	</script>
-->
</html>