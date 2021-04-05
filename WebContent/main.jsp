<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<!--bootstarp-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 카카오 맵스 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92928f9e601c2b81c37ec8882d4901ac&libraries=services"></script>

<meta content=charset=utf-8>
<title>견생역전</title>

<style>

iframe{
	
	border:1px;
	border-color:#fff;
	overflow-x: scroll;
	height: 1200px;
	frameborder:0 ;
	marginheight:0;
	marginwidth:0; 
	scrolling:no;	
}

.tapPan {
   width: 100%;
   height: 1070px;
   border: none;
}

.tab-content {
   width: 100%;
   height: 100%;
}

#banner{
	 background: url("./images/main.png") no-repeat center; 
	 background-size: 100%;
	/*  height: 1000px; */
	 padding: 380px 0px;
}
#countText{
	color: black;
}
.memberCountCon1 {
	
	color: black;
	flex: center;
	font-size: 55pt !important;
}
.memberCountCon2 {
	
	color: black;
	flex: center;
	font-size: 55pt !important;
	
}
.memberCountCon3 {
	
	color: black;
	flex: center;
	font-size: 55pt !important;
	
}

.ad_s {
	 background: url("./images/qqq.png") no-repeat center; 
	 background-size: 100%;
	 height: 1000px;
	 padding: 380px 0px;
	
}



/* 탭패널 안에 페이지 넘겨오는 용도 iframe */
.tapPan {
   width: 100%;
   height: 1070px;
   border: none;
}

.tab-content {
   width: 100%;
   height: 100%;
}
/*//////////////////////////////  */

/* 이미지배너스타일 */
.imgBanner{
	padding: 5px 5px;
}

</style>

</head>
<body>


<!-- 메인 이미지 -->
<!-- <div id="banner" class="container-fluid"></div> -->

<div class="container-fluid">
<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="./images/main.png" alt="Los Angeles" width="100%" height="800">
      <div class="carousel-caption">
        <h3>Los Angeles</h3>
        <p>We had such a great time in LA!</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="./image/carousel01.jpg" alt="Chicago" width="100%" height="800">
      <div class="carousel-caption">
        <h3>Chicago</h3>
        <p>Thank you, Chicago!</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="./image/carousel02.jpg" alt="New York" width="100%" height="800">
      <div class="carousel-caption">
        <h3>New York</h3>
        <p>We love the Big Apple!</p>
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
</div>

<br><br>

<!-- count -->
<table align="center" class="countname countText">
<col width="600"><col width="600"><col width="600">
<col width="600"><col width="600"><col width="600"><col width="600"><col width="600">
	<tr></tr>
	<tr>
		<th></th>
		<th class="memberCountCon1" style="color: #000; " ></th>
		<th></th>
		<th class="memberCountCon2" style="color: #000"></th>
		<th></th>
		<th class="memberCountCon3" style="color: #000" ></th>
		<th></th>
	</tr>
</table>

<table align="center"  class="countname"  style="color: #000;font-size: 20px;">
<col width="600" ><col width="600"><col width="600">
<col width="600"><col width="600"><col width="600"><col width="600"><col width="600">
	<tr></tr>
	<tr>
		<th></th>
			<th >Rescued animal</th>
		<th></th>
			<th > Today adopted animal</th>
		<th></th>
		<th >Total adopted animal</th>
		<th></th>
	</tr>
</table>



	<!-- INFO -->
	<div id='info'></div>
	<iframe src="NewFile.jsp" border="0" framespacing="0" marginheight="0" marginwidth="0" scrolling="no"  vspace="0" style="width: 100%; " ></iframe>

	
	
	<div class="container-fluid" style="padding: 0px 100px;">
		<table style="width: 100%;">
			<tr>
				<td rowspan="2"> 
				<img alt="" src="./image/후기 & 커뮤니티/후기 & 커뮤니티 (10).jfif" style="height: 600px;" class="imgBanner">
				</td>
				<td colspan="2">
				<img alt="" src="./image/후기 & 커뮤니티/후기 & 커뮤니티 (8).jfif" style="height: 300px; width: 100%;" class="imgBanner">
				</td>
			</tr>
			<tr>
				<td>
				<img alt="" src="./image/후기 & 커뮤니티/후기 & 커뮤니티 (3).jfif" style="height: 300px; width: 100%;" class="imgBanner">
				</td>
				<td>
				<img alt="" src="./image/후기 & 커뮤니티/후기 & 커뮤니티 (3).jfif" style="height: 300px; width: 100%;" class="imgBanner">
				</td>
			</tr>
		</table>
	</div>
		
	
	<!--입양시스템 -->
	<div class="ad_s">
		<img alt="" src="" >
	</div>

<!-- 타이틀 모델 1 유용한 영상 -->
<div class="container-fluid">
  	<div class="row" style="display: flex; align-items: center;">
		<div class="col-5" >
			<hr width = "100%" color = "#DEE2E6">
		</div>
		<div class="col-2" style="text-align: center; ">
			<h1>USEFUL CONTENT</h1>
		</div>
		<div class="col-5">
			<hr width = "100%" color = "#DEE2E6" > 
		</div>  	
  	</div>
</div>

<!-- 유용한 정보  -->
<div class="container-fluid">
	<br><br><br><br><br>
	<div class="row">
	<div class="col-12">	
	<div align='center' id='useful'>
	<div style="width:90%">
	
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link active" data-toggle="tab" href="#menu1">견종별 특징</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#menu2">육아 팁</a>

	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#menu3">유용한 동영상</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="menu1" class="container tab-pane active"><br>
	      	<p>1번 내용</p>
	    </div>
	    <div id="menu2" class="container tab-pane fade"><br>
	     	 <p>2번 내용</p>
	    </div>
	    <div id="menu3" class="container tab-pane fade"><br>
	     	<iframe class="tapPan" src="use?param=UsefulTabPagingList" ></iframe>
	    </div>	    
	   </div>
	   </div>
	</div>
	<br/><br/><br/><br/><br/><br/> 	
	</div>
	</div>
</div>	   
	   
	   

  
    

	   

	<!-- 타이틀 모델 2 동물병원 검색 -->  
	<div class="container">
	<div class="row">
		<div class="col-12" style="text-align: center;">
			<font style="font-size: 50px; font-weight: bold;" >동물병원 검색</font><br>
			<hr style="height: 2px;" width="100px" align="center" color="black" >
				
		</div>
	</div>
</div>
	<!-- 동물병원 검색 --> 
	<div align=center>

	  <br>
	  <div id="map" style="width:80%;height:450px;"> </div>
	  <br/>
	   <form class = 'form-inline' onsubmit="searchHospital(); return false;">
	   		 <div class='col'>
	   		 <div class='row-4'></div>
	   		 <div class='row-4'>
	   		 <input type="text" id="keyword" class='form-control' placeholder="우리 동네"></input> 
	  		 <button class='btn' type="submit">검색</button>  
	   		 </div>
	   		 <div class='row-4'></div>
	   		 </div>	
	   </form>
	  </div> 
	  <br/> 
	    

<div>

</div>


<script>
////////////////////// Count 관련 함수 //////////////////////

var memberCountConTxt= 21;

$({ val : 0 }).animate({ val : memberCountConTxt }, {
 duration: 2000,
step: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".memberCountCon1").text(num);
},
complete: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".memberCountCon1").text(num);
}
});

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


var memberCountConTxt= 80;

$({ val : 0 }).animate({ val : memberCountConTxt }, {
 duration: 2000,
step: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".memberCountCon2").text(num);
},
complete: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".memberCountCon2").text(num);
}
});

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}




var memberCountConTxt= 170;

$({ val : 0 }).animate({ val : memberCountConTxt }, {
 duration: 2000,
step: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".memberCountCon3").text(num);
},
complete: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".memberCountCon3").text(num);
}
});

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>




<script>
////////////////////// 카카오 맵스  ////////////////////////

//마커를 클릭하면 장소명을 표출할 인포윈도우
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.503131786164694, 127.02430725714143), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  
    

//지도 생성
var map = new kakao.maps.Map(mapContainer, mapOption); 

//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

//키워드로 장소를 검색
searchPlaces();


//장소검색 값을 넣어주는 함수
function searchHospital() {

    var keyword = document.getElementById('keyword').value;
    if (keyword == null || keyword == "") {
        alert('키워드를 입력해주세요!');
        return false;
    }
    keyword = keyword + " 동물병원";
    ps.keywordSearch( keyword, placesSearchCB); 
}


// 키워드 검색 완료 시 호출되는 콜백함수
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정
        map.setBounds(bounds);
    } 
}


// 지도에 마커를 표시하는 함수
function displayMarker(place) {    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
    // 마커에 클릭이벤트를 등록
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}

</script>



</body>
</html>
