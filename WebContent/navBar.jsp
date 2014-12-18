
    <!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top hidden-xs" role="navigation">
	  <div class="container">
	  <ul class="nav navbar-nav">
		 <li class="active"><a href="#"><div class="Title"></div></a></li>
         <li>
			<a href="/FallAlarm_DocPortal/index.jsp">Home</a>
		</li>
		<li>
			<a href="/FallAlarm_DocPortal/about.jsp">About</a>
		</li> 
		<li>
			<c:if test="${not empty loggedUser}">
                <a href="PatientDetailServlet">Check Status</a>
			</c:if>
		</li>
		<li>
			<c:if test="${not empty loggedUser}">
			<a href="/FallAlarm_DocPortal/portfolio.jsp">Register Patient</a>
			</c:if>
		</li>
		<li>
			<c:if test="${not empty loggedUser}">
			<a href="PatientInfoServlet">Patient Info</a>
			</c:if>	
		</li>
		<li>
			<c:if test="${not empty loggedUser}">
			<a href="ContactServlet">Location Finder</a>
			</c:if>	
		</li>
		
	  </ul>
	  </div>
	</nav>
    <a id="menu-toggle" href="#" class="btn btn-dark btn-lg toggle"><i class="fa fa-bars"></i></a>
    <nav id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <a id="menu-close" href="#" class="btn btn-light btn-lg pull-right toggle"><i class="fa fa-times"></i></a>
            <li class="sidebar-brand">
                <a href="/FallAlarm_DocPortal/index.jsp">Start</a>
            </li>
            <li>
                <a href="/FallAlarm_DocPortal/index.jsp">Home</a>
            </li>
            <li>
                <a href="/FallAlarm_DocPortal/about.jsp">About</a>
            </li>
            <li>
                <a href="PatientDetailServlet">Check Status</a>
            </li>
            <li>
                <a href="/FallAlarm_DocPortal/portfolio.jsp">Register Patient</a>
            </li>
            <li>
                <a href="ContactServlet">Location Finder</a>
            </li>
        </ul>
    </nav>