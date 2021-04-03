<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Ethereal by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/noscript.css"/>
		
		<!-- 제이쿼리 -->
  		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>   
   		<!-- emailjs -->
  		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>
		
		
		
	</head>
	<body class="is-preload">

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Wrapper -->
					<div id="wrapper">

						<!-- Panel (Banner) -->
							<section class="panel banner right">
								<div class="content color0 span-3-75">
									<h1 class="major">Information<br />
									</h1>
									<p><br>3rd floor, 23rd floor, Baekbeom-ro, Mapo-gu, Seoul,<br> Republic of Korea <a href="http://naver.me/GozwUAyZ">Go</a><br><strong>02)707-1480</strong></p>
									<ul class="actions">
										<li><a href="#first" class="button primary color1 circle icon solid fa-angle-right">Next</a></li>
									</ul>
								</div>
								<div class="image filtered span-1-75" data-position="25% 25%">
									<img src="image/pic02.jpg" alt="" />
								</div>
							</section>

							
						<!-- Panel (Contact) -->
							<section class="panel color4-alt" id="first">
								<div class="intro color4">
									<h2 class="major">Contact</h2>
									<p style="color: #fff;">행복한 동물 요양 보호소 개인사정 등에 의한 동물들을 보호 및 생활할 수 있도록 따뜻한 보금자리가 되어주고 있습니다.</p>
								</div>
								<div class="inner columns divided">
									<div class="span-3-25">
											<div class="fields">
												<div class="field half">
													<label for="name">Name</label>
													<input type="text" name="name" id="name" />
												</div>
												<div class="field half">
													<label for="email">Email</label>
													<input type="email" name="email" id="email" />
												</div>
												<div class="field">
													<label for="message">Message</label>
													<textarea name="message" id="message" rows="4"></textarea>
												</div>
											</div>
											<ul class="actions">
												<li><input type="button" value="Send Message" class="button primary" id="btn"></li>
											</ul>
									</div>
									<div class="span-1-5">
										<ul class="contact-icons color1">
											<li class="icon brands fa-twitter"><a href="#">@untitled-tld</a></li>
											<li class="icon brands fa-facebook-f"><a href="#">facebook.com/untitled</a></li>
											<li class="icon brands fa-instagram"><a href="https://www.instagram.com/07.s3/">@Akke_sun</a></li>
										
										</ul>
									</div>
								</div>
							</section>

							<section class="panel">
								
								<div class="gallery">
									
									<div class="group span-4-5">
										<a href="image/gallery/fulls/05.jpg" class="image filtered span-3" data-position="top"><img src="image/gallery/thumbs/05.jpg" alt="" /></a>
										<a href="image/gallery/fulls/06.jpg" class="image filtered span-1-5" data-position="center"><img src="image/gallery/thumbs/06.jpg" alt="" /></a>
										<a href="image/gallery/fulls/07.jpg" class="image filtered span-1-5" data-position="bottom"><img src="image/gallery/thumbs/07.jpg" alt="" /></a>
										<a href="image/gallery/fulls/08.jpg" class="image filtered span-3" data-position="top"><img src="image/gallery/thumbs/08.jpg" alt="" /></a>
									</div>
									
								</div>
							</section>



						<!-- Panel -->
							<section class="panel color2-alt">
								<div class="intro color2">
									<h2 class="major">안락사 없이 평생을 지켜주는 공간</h2>
									<p style="color: #fff;">이 세상 모든 반려동물과의 삶이 행복하기를 원합니다. 동물에 대한 마음으로 만든 도그마루의 사설 보호소 반려동물의 행복을 위한 안락사 없는 동물보호소 이곳은 도그마루 입니다.</p>
								</div>
							
							</section>

					</div>
			</div>

		<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/main.js"></script>

<script>
$(document).ready(function() {
	let service_id = 'service_pxdtnjg';
	let template_id = 'template_yf1dpxs';
	let user_id =  'user_2jsA4CYFSAFj7plaOFdxo';
	
	emailjs.init(user_id);	 // 접속	
	
    $('#btn').click(function(){       	 
    	
      //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
      let templateParams = {	
        name: $('#name').val(),
        email : $('#email').val(),
        message : $('#message').val()
      };
                
            	
     //내보내기
     emailjs.send(service_id, template_id, templateParams)
     .then(function(response) {
     	 console.log('SUCCESS!');
     	 alert("메일을 성공적으로 보냈습니다!")
     }, 
     	  
      function(error) {  
     	 console.log('FAILED...', error);
     });
     	      
    });
    
  });


</script>




	</body>
</html>