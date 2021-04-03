<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
      String content = request.getParameter("content");
      if(request.getParameter("content")==null) {
            content = (String)request.getAttribute("content");   
            if((String)request.getAttribute("content") == null){
               content = request.getParameter("content");
               if(content == null){
                   content = "main";
                   
                } 
            }
      }      
%>

<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8>


<title>견생역전</title>
</head>

<body>
<table style="width: 100%">
<tr>
	<td>
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