<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Fall Alarm - Check Status</title>


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
    <!-- Services -->
    <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
    <section id="services" class="services bg-primary">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-10 col-lg-offset-1">
                    <h2>Check Patient Status</h2>
                    <hr class="small">
                    <form id="registrationForm" action="PatientDetailServlet" method="get" class="form-horizontal">
					    <div class="form-group">
					        <label class="col-sm-3 control-label">Patient ID :</label>
					        <div class="col-sm-5" >
								  <select name="pid_list" class="form-control">
								    <c:forEach var="d" items="${Data}">
								      <option value="${d}">${d}</option>
								    </c:forEach>
								  </select>
								  <label class="col-sm-3 control-label">Date :</label>
								  <input type="date" class="form-control" name="date" placeholder="YYYY/MM/DD" required />
								   <label class="col-sm-3 control-label">Class Risk</label>
								   <select name="classRisk" class="form-control" >
								    <option value="1">1</option>
								    <option value="2">2</option>
								    <option value="3">3</option>
								    <option value="4">4</option>
								    <option value="5">5</option>
								  </select>
					        </div>
					    </div>
					    <div class="form-group">
        					<div>
                    		<button type="submit" class="btn btn-light">Submit</button>
                			</div>
        				</div>
					</form>
        		</div>
        <!-- /.container -->
    </section>
    
    <!-- Callout -->
    <aside class="callout">
        <div class="text-vertical-center">
            <h1>Prevent risk from falling</h1>
             <table border=1>
        <thead>
            <tr>
                <th>User Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>DOB</th>
                <th>Email</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td><c:out value="${user.userid}" /></td>
                    <td><c:out value="${user.firstName}" /></td>
                    <td><c:out value="${user.lastName}" /></td>
                    <td><fmt:formatDate pattern="yyyy-MMM-dd" value="${user.dob}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><a href="UserController?action=edit&userId=<c:out value="${user.userid}"/>">Update</a></td>
                    <td><a href="UserController?action=delete&userId=<c:out value="${user.userid}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
        </div>
    </aside>
    
</body>

</html>