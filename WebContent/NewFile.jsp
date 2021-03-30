<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 추가CSS -->
<link rel="stylesheet" href="css/custom.css">

<title>Insert title here</title>

<style type="text/css">

@-webkit-keyframes kenburns-right {
  0% {
    -webkit-transform: scale(1) translate(0, 0);
            transform: scale(1) translate(0, 0);
    -webkit-transform-origin: 84% 50%;
            transform-origin: 84% 50%;
  }
  100% {
    -webkit-transform: scale(1.25) translateX(20px);
            transform: scale(1.25) translateX(20px);
    -webkit-transform-origin: right;
            transform-origin: right;
  }
}

@keyframes kenburns-right {
  0% {
    -webkit-transform: scale(1) translate(0, 0);
            transform: scale(1) translate(0, 0);
    -webkit-transform-origin: 84% 50%;
            transform-origin: 84% 50%;
  }
  100% {
    -webkit-transform: scale(1.25) translateX(20px);
            transform: scale(1.25) translateX(20px);
    -webkit-transform-origin: right;
            transform-origin: right;
  }
  
  .kenburns-right {
	-webkit-animation: kenburns-right 5s ease-out both;
	        animation: kenburns-right 5s ease-out both;
}
}
</style>

</head>
<body>
<img alt="" src="./images/bbb.png" class="-webkit-keyframes kenburns-right">

</body>
</html>