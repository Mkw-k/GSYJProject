<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
JSP태그 페이지 (메인페이지)

->JSP태그를 통하여, 헤더/ 메인/ 풋터로 페이지가 나누어짐 
->구현에서는 메인부분만 왓다갔다함     
    
    
--%>
<%
    	String content = request.getParameter("content");
    	if(content == null){
    		content = "main";
    	}
    	
    	
    	String content2 = "menu";
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 추가CSS -->
<link rel="stylesheet" href="css/custom.css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />


<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.header{
	position:fixed;
	width: 100%;
	/* border: "1";
	cellpadding: "2"; 
	cellspacing: "0"; */
}

.body{
	/*  height: 2000px; */
}

.footer{
	
}



</style>
</head>
<body>

	<table style="width: 100%">

<tr>
	<td class="header">
		 <jsp:include page="menu.jsp" flush="false"/>
	</td>
</tr>

<tr>
	<td class="body">
		<jsp:include page='<%=content + ".jsp" %>' flush="false"/> 
	</td>
</tr>

<tr>
	<td class="footer">
		<jsp:include page="bottom.jsp" flush="false"/>
	</td>
</tr>
</table>

</body>
</html>