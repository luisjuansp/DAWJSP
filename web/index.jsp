<%-- 
    Document   : index
    Created on : Nov 5, 2015, 2:36:49 PM
    Author     : Luis Juan Sanchez P
--%>

<%@page import="beans.User"%>
<jsp:include page="header.jsp" flush="true">
    <jsp:param name="pageTitle" value="Human Capital System" />
</jsp:include>
<%@ include file="login-checker.jsp" %> 
<body>
    <jsp:include page="navbar.jsp" flush="true">
        <jsp:param name="active" value="0" />
    </jsp:include>
    <div class="container text-center">
        <div class="jumbotron">
            <h1>Human Capital System</h1>
        </div>
        <div class="alert alert-info" role="alert">
            <% User user = (User) session.getAttribute("User");%>
            <h2>Bienvenido <%= user.getUsername() %></h2>
        </div>
    </div>
</body>
</html>
