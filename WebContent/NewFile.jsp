<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


 <style type="text/css">
#layerpop {
   position: absolute;
   top: 50px;
   right: 100px;
   bottom: 0;
   left: 0;
   z-index: 10040;
   overflow: auto;
   overflow-y: auto;
}
 </style>
</head>

<body>


<!--  
 <button class="btn btn-default" id="popbutton">모달출력버튼</button><br/>

<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
    
    </div>
  </div>
</div> -->

<div class=container>
<button id="popbutton" class="btn btn-default" data-toggle="modal">모달출력버튼</button><br/>



<div class="modal" id="layerpop" >

  <div class="modal-dialog">

    <div class="modal-content">

      <!-- header -->

      <div class="modal-header">

        <!-- 닫기(x) 버튼 -->

        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

        <!-- header title -->

        <h4 class="modal-title">Header</h4>

      </div>

      <!-- body -->

      <div class="modal-body">

            Body 

      </div>

      <!-- Footer -->

      <div class="modal-footer">

        Footer

        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>

      </div>

    </div>

  </div>

</div>
</div>


<script type="text/javascript">


 $(function(){
	    $("#popbutton").click(function(){
	        $('div.modal').modal({
		                      remote : 'login2.jsp'
		                });
	    })
	})
  
</script>  

</body>
</html>