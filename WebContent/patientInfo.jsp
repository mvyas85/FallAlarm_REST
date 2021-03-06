<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Fall Alarm - About Us</title>


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

    <!-- Portfolio -->
    <section id="portfolio" class="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-15 col-lg-offset-1 text-center">
                    <h2>Register New Patient</h2>
                    <hr class="small">
                    
                    
					<form id="registrationForm" name="rform" action="PatientInfoServlet" method="post" class="form-horizontal">
					
					    <div class="form-group">
					        <label class="col-sm-4 control-label">Patient ID</label>
 					        <div class="col-sm-5"><select name="pid_list" class="form-control inlne-input">
						    	<c:forEach var="d" items="${pids}">
						      		<option value="${d}">${d}</option>
						    	</c:forEach>
						  	</select>
					        </div> 
					        
					    </div>
					    <div class="form-group">
					        <label class="col-sm-4 control-label">Name</label>
					        <div class="col-sm-5">
					            <input type="text" class="form-control" name="name" value="${name}" readonly />
					        </div>
					    </div>
					    <div class="form-group">
					        <label class="col-sm-4 control-label" >Gender</label>
					        <div class="col-sm-5">
					            <input type="text" class="form-control" name="gender" value="${gender}" readonly />
					        </div>
					    </div>
					
					    <div class="form-group">
					        <label class="col-sm-4 control-label">Date of birth</label>
					        <div class="col-sm-5">
					            <input type="date" class="form-control" name="birthday" value="${birthday}" readonly />
					        </div>
					    </div>
					
					    <div class="form-group">
					        <label class="col-sm-4 control-label">Email address</label>
					        <div class="col-sm-5">
					            <input type="email" class="form-control" name="email" value="${email}" readonly />
					        </div>
					    </div>
					    
					    <div class="form-group">
					        <label class="col-sm-4 control-label">Phone</label>
					        <div class="col-sm-5">
					            <input type="tel" class="form-control" name="phone" value="${phone}" readonly />
					        </div>
					    </div>
					
					
					    <div class="form-group">
					        <label class="col-sm-4 control-label">Address</label>
					        <div class="col-sm-5">
					            <input type="text" class="form-control" name="address" value="${address}" readonly />
					        </div>
					    </div>
					
					    <div class="form-group">
					        <label class="col-sm-4 control-label">Zip Code</label>
					        <div class="col-sm-5">
					            <input type="number" class="form-control" name="zip"  value="${zip}" readonly />
					        </div>
					    </div>  
					    <div class="form-group">
					        <div>
					           <input type="submit" name = "submit" class="btn btn-dark" value = "Get Patient info">
					        </div>
					    </div>
					
					    </div>
					</form>

            </div>
        </div>
    </section>

</body>

</html>