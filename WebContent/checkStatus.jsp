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


    <script>
		var selection = <%= request.getAttribute("selectedDepartment") %>;
		</script>
     
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
                    <form id="registrationForm" action="PatientDetailServlet" method="post" class="form-horizontal">
					    <div class="form-group">
					        
					        <label class="col-sm-3 inlne-lable">Patient ID :</label>
								  <select name="pid_list" class="form-control inlne-input">
								    <c:forEach var="d" items="${Data}">
								      <option value="${d}">${d}</option>
								    </c:forEach>
								  </select>
							<label class="col-sm-3 control-label inlne-lable">Date :</label>
								  <input type="date" class="form-control inlne-input" name="searchdate" placeholder="YYYY/MM/DD"  value="${searchdate}" required />
							<label class="col-sm-3 control-label inlne-lable">Class Risk</label>
								   <select id="department" name="classRisk" class="form-control inlne-input" >
									    <option value="1">1</option>
									    <option value="2">2</option>
									    <option value="3">3</option>
									    <option value="4">4</option>
									    <option value="5">5</option>
								  </select>
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
    
     <c:out value="${searchResults}"></c:out>
    <!-- Callout -->
    <aside class="callout">
        <div class="text-vertical-center">
        		  <c:choose>
				      <c:when test="${empty searchResults}">
             			<h1>Prevent risk from falling</h1>
			      	  </c:when>
			      	  <c:otherwise>

						<table class="rwd-table">
					        <thead>
					            <tr>
					                <th>Time</th>
					                <th>AccX</th>
					                <th>AccY</th>
					                <th>AccZ</th>
					                
					                <th>GyrX</th>
					                <th>GyrY</th>
					                <th>GyrZ</th>
					                
					                <th>Location</th>
					            </tr>
					        </thead>
					        <tbody>
					            <c:forEach items="${resultData}" var="user">
					                <tr>
					                    <td><c:out value="${user.dateTime}" /></td>
					                    <td><c:out value="${user.accX}" /></td>
					                    <td><c:out value="${user.accY}" /></td>
					                    <td><c:out value="${user.accZ}" /></td>
					                    
					                    <td><c:out value="${user.gyrX}" /></td>
					                    <td><c:out value="${user.gyrY}" /></td>
					                    <td><c:out value="${user.gyrZ}" /></td>
					                    
					                    <td><a class="btn btn-light" href="ContactServlet?locX=${user.locX}&locY=${user.locY}&PID=${user.deviceID}&searchdate=${searchdate}&Time=${user.dateTime}&classRisk=${selectedDepartment}">View Location</a></td>
					                </tr>
					            </c:forEach>
					        </tbody>
			    		</table>
			      	 </c:otherwise>
				 </c:choose>
        </div>
    </aside>
    <script>
		document.getElementById("department").selectedIndex = selection -1;
	</script>
</body>

</html>