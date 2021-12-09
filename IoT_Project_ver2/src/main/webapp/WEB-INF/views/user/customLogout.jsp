<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>로그아웃</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/join/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/join/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/join/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/join/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">로그아웃 페이지</h3>
                </div>
                <div class="panel-body">
                    <form role="form" method='post' action="/customLogout">
                        <fieldset>                            
                            <a href="/" class="btn btn-lg btn-success btn-block">로그아웃</a>
                        </fieldset>
                        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>                    	   
                	</form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="/resources/join/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/resources/join/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/join/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/resources/join/sb-admin-2.js"></script>
    
<script>
$(".btn-success").on("click",function(e){
	e.preventDefault();
	$("form").submit();
	<c:if test="${param.logout != null }">
		$(document).ready(function(){
			alert("로그아웃하였습니다.");
			window.location = '/'
	});
	</c:if>
});
</script>

</body>
</html>

