<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
    

<%
MemberDto mem = null;
String nowLog = "";
if(session.getAttribute("login") == null){
   nowLog = "로그인 해주세요";
}else{
   Object ologin = session.getAttribute("login");
   mem = (MemberDto)ologin;
   nowLog = mem.getMyid()+" 님 환영합니다";
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부스스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">

#menu{
   margin-left: 30%;
    font-size: 20px;
   
}

#logo{
   padding-left: 100px;
}

#header-wrapper{ 
   background: c4977f;
}

</style>

</head>
<body>
<div id="header-wrapper">
   <div id="header" class="container-fluid">
      <div id="logo">
         <h1><a href="mem?param=toIndex">RedMarket</a></h1>
      </div>
      <div id="menu">
            <a href="mem?param=Info"  class="btn btn-light">INFO</a>
            <a href="abandog?param=reportADPage" class="btn btn-light">유기견제보</a>
            <a href="rescued?param=list" class="btn btn-light">입양신청</a>
            <a href="bbs?param=toBbslist" class="btn btn-light">커뮤니티</a>
            <a href="#"  class="btn btn-light">입양후기</a>
            <a href="#"  class="btn btn-light">유용한정보</a>
         
            <!-- 로그인 타입에 따라 다르게 보이는 버튼-->
            <c:choose>
              <c:when test="${login == null}" > 
                  <a href="mem?param=toAddMember"  class="btn btn-light ">회원가입</a>                 
                  </c:when>
                <c:when test="${login.mymanager == 1}" > 
                   <button class="btn btn-info dropdown-toggle" type="button" id="mypageDropdownMenuButton" 
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리자 페이지
               </button>
                  <div class=dropdown-menu aria-labelledby="dropdownMenuButton">
                     <a class=dropdown-item href="abandog?param=getAllAbandonedDogPagingList">유기견 제보 관리</a>
                     <a class=dropdown-item href="adopt?param=adoptList">입양신청서 관리</a>
                     <a class=dropdown-item href="manager?param=managerRescuedList">입양 리스트 관리</a>
                     <a class=dropdown-item href="#">회원 정보 관리</a>
                  </div>
                 </c:when>

                  <c:when test="${login.mymanager == 0}" > 
                  <%-- a href="pages?param=myPagee&id=${login.myid }" accesskey="5" title="">마이 페이지</a> --%>
                     <button class="btn btn-info dropdown-toggle" type="button" id="mypageDropdownMenuButton" 
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           마이페이지
                      </button>
                     <div class=dropdown-menu aria-labelledby="dropdownMenuButton">
                        <a class=dropdown-item href="abandog?param=getMyAbandonedDogPagingList">나의 유기견 제보 확인</a>
                        <a class=dropdown-item href="#">나의 입양신청 확인</a>
                        <a class=dropdown-item href="#">회원 정보 관리</a>
                     </div>
                     
                  
                 </c:when>
            </c:choose>
   
            <a id = "logname" href="javascript:log()"  class="btn btn-light">로그인</a>

      </div>
   </div>
</div>
   
   
<%

if (session.getAttribute("login") == null) {
%>
   <script type="text/javascript">
   /* alert("로그아웃 성공") */
   $("#logname").html("로그인");
   </script>
<%
   }
%>

<%

if (session.getAttribute("login") != null) {
   /* Boolean b = (Boolean)request.getAttribute("b"); */
%>
   <script type="text/javascript">
   /* alert("로그인 성공") */
   $("#logname").html("로그아웃");
   </script>
<%
   }
%>


<script type="text/javascript">
$(document).ready(function() { 
   $("#topbutton1").click(function() {
      location.href = "mem?param=toAddMember";
   });
});

function log() {

   $("#logname").click(function() {
      if($("#logname").html() == "로그인"){
         location.href = "mem?param=login";   
      }else if($("#logname").html() == "로그아웃"){
         location.href = "mem?param=logout";
      }
      
      });
}
   

</script>

</body>
</html>