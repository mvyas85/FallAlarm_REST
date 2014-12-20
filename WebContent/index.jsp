<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Fall Alarm Doctor's Portal</title>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>HELP - FallArm</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="resources/css/bootstrapvalidator.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/css/stylish-portfolio.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<%@ include file="./navBar.jsp"%>

    <!-- Header -->
    <header id="top" class="header">
        <div class="text-vertical-center" style="vertical-align: middle;">
		<div class="col-sm-3" style="float:none;margin:0 auto;">
            <div class="panel panel-default" style="width: 550px;">
			  <div class="panel-heading">
			  
				  <c:choose>
				      <c:when test="${ empty loggedUser}">
						<h3 class="panel-title">Login</h3>
			      </c:when>
			      <c:otherwise>
						<h3 class="panel-title">Welcome</h3>
			      </c:otherwise>
				 </c:choose>
			  </div>
			  
			  <div class="panel-body">
			  <div  class="logo"> </div>
			  <c:choose>
			      <c:when test="${ empty loggedUser}">
			      		<form class="form-vertical" name ="frm" style="display:inline-block;"role="form"  method="POST" action="LoginServlet" onSubmit="return validLogin()" >
						  <div id="error_msg">${loginError}</div>
						  <div class="form-group">
							
							<div class="col-sm-10" style="margin: 7px;">
							  <input type="text" name="username" class="form-control" id="inputUserName" placeholder="User Name">
							</div>
						  </div>
						  <div class="form-group">
							
							<div class="col-sm-10" style="margin: 7px;">
							  <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password">
							</div>
						  </div>
						  <div class="form-group">
							<div class="col-sm-offset-2 col-sm-10" style=" margin: 7px;">
							  <button type="submit" name = "submit" value="Login" class="btn btn-default">Sign in</button>
							</div>
						  </div>
						</form>
			      </c:when>
			      <c:otherwise>
			      <div style="text-align:left;">
			      	<p><b>ID:</b> <c:out value="${loggedUserId}"></c:out></p>
			      	<p> <b>Name:</b><c:out value="${loggedUserName}"></c:out></p>
			      	<p> <b>Phone:</b><c:out value="${loggedUserPhone}"></c:out></p>
			      	<p> <b>Email:</b><c:out value="${loggedUserEmail}"></c:out></p>
			      	</div>
			      	
			      	<p><a href="LogoutServlet">Log out</a></p>
			      </c:otherwise>
			</c:choose>
			  </div>
			</div>
			</div>
        </div>
    </header>	
</body>
</html>