<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

 <!-- 부트스트랩 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 폰트 -->
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />
<!-- 카카오 맵스 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=92928f9e601c2b81c37ec8882d4901ac&libraries=services"></script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>견생역전</title>


<style>
/* #banner{
	 background: url(images/ccc.jpg) no-repeat center; 
	 height: 700px;
	 padding: 120px 0px;
	 margin-top: 82px;

} */
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

.img {

}

.carousel-inner {
	width: 100%;
	height: 100%;
}
</style>

</head>
<body>

<div id="banner" class="container-fluid">
		<!-- 윗부분 캐러셀 -->	
<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active img">
      <img src="./images/aaa.jpg" alt="Los Angeles" width="1100" height="500">
      <div class="carousel-caption">
        <h3>Los Angeles</h3>
        <p>We had such a great time in LA!</p>
      </div>   
    </div>
    <div class="carousel-item img">
      <img src="./images/bbb.png" alt="Chicago" width="1100" height="500" >
      <div class="carousel-caption">
        <h3>Chicago</h3>
        <p>Thank you, Chicago!</p>
      </div>   
    </div>
    <div class="carousel-item img">
      <img src="./images/ccc.jpg" alt="New York" width="1100" height="500">
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
	



<!-- count -->
<table align="center" class="countname">
<col width="600"><col width="600"><col width="600">
<col width="600"><col width="600"><col width="600"><col width="600"><col width="600">
	<tr></tr>
	<tr>
	
		<th></th>
		<th class="memberCountCon1" ></th>
		<th></th>
		<th class="memberCountCon2" ></th>
		<th></th>
		<th class="memberCountCon3" ></th>
		<th></th>
	</tr>
</table>

<table align="center"  class="countname" >
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



<div id="wrapper">
	<div id="staff" class="container">
		<div class="title" id='title'>
			<h2>INFORMATION</h2>
			<br/>
			<span>
			견생역전은 유기견이 새로운 주인을 만날 수 있도록 돕는 자선단체 입니다.<br/>
			여러분의 제보가 귀여운 멍멍이의 생명을 구할 수 있습니다.		
			</span> 
		</div>
		<img src="images/ddd.jpg" width="100%" height="100%" alt="" />
		<!-- <div class="boxA"><img src="images/222.png" width="300" height="450" alt="" /></div>
		<div class="boxB"><img src="images/777.png" width="300" height="450" alt="" /></div>
		<div class="boxC"><img src="images/555.png" width="300" height="450" alt="" /></div> -->
	</div>
	
	<!-- 인포 정보 더 만들기 (다른 게시판들 접근성 더 키우기?) -->
	<!-- 메일링 서비스 -->
	<div id="page" class="container">
		<div class="boxA">
			<h2>Fusce ultrices<br />
				<span>fringilla metus</span></h2>
			<p>Donec leo, vivamus fermentum nibh in augue praesent a lacus at urna congue rutrum.</p>
			<ul class="style4">
				<li class="first"><a href="#">Consectetuer adipiscing elit</a></li>
				<li><a href="#">Metus aliquam pellentesque</a></li>
				<li><a href="#">Proin gravida orci porttitor</a></li>
			</ul>
		</div>
		<div class="boxB">
			<h2>Praesent<br />
				<span> scelerisque scelerisque</span></h2>
			<ul class="style3">
				<li class="first">
					<p class="date"><a href="#">Dec<b>30</b></a></p>
					<h3>Amet sed volutpat mauris</h3>
					<p><a href="#">Mauris tempus nibh sodales adipiscing dolore.</a></p>
				</li>
				<li>
					<p class="date"><a href="#">Dec<b>28</b></a></p>
					<h3>Sagittis diam dolor amet</h3>
					<p><a href="#">Duis arcu tortor fringilla sed  sed magna.</a></p>
				</li>
			</ul>
		</div>
		<div class="boxC">
			<h2>Etiam posuere<br />
				<span>augue sit amet</span></h2>
			<ul class="style4">
				<li class="first"><a href="#">Consectetuer adipiscing elit</a></li>
				<li><a href="#">Metus aliquam pellentesque</a></li>
				<li><a href="#">Suspendisse iaculis mauris</a></li>
				<li><a href="#">Urnanet non molestie semper</a></li>
				<li><a href="#">Suspendisse iaculis mauris</a></li>
			</ul>
		</div>
	</div>
	
	<br/>
	<div class='container' align='center' id='useful'>
	<h2>유용한 정보</h2>
	<br>
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
<!-- 유용한정보  -->
	    <div id="menu3" class="container tab-pane fade"><br>
	    	  <iframe class="tapPan" src="use?param=UsefulTabPagingList" >

			</iframe>

	    </div>	    
	   </div>
	</div>
	<br/><br/><br/><br/><br/> 	
	   
	   
	   
	<!-- 동물병원 검색 -->   
	<div class='container' align=center>
	 <h2>우리동네 동물병원</h2>
	  <br/>
	  <div id="map" style="width:100%;height:350px;"> </div>
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
	    

	
</div>



<script type="text/javascript">


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
//searchPlaces();



//장소검색 값을 넣어주는 함수
function searchPlaces() {

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


$(function() {
	$("#_menu3P").load('usefullist.jsp');
});


</script>



</body>
</html>
