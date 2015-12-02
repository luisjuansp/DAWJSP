<%-- 
    Document   : index
    Created on : Nov 5, 2015, 2:36:49 PM
    Author     : Luis Juan Sanchez P
--%>

<%@page import="beans.User"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Human Capital System" />
</jsp:include>
<body>

    <%@ include file="login-checker.jsp"%> 
    <jsp:include page="navbar.jsp">
        <jsp:param name="active" value="0" />
    </jsp:include>
    <div id="container" class="container text-center">
        <div class="jumbotron">
            <h1>Human Capital System</h1>
        </div>
        <div class="alert alert-info" role="alert">
            <% User user = (User) session.getAttribute("User");%>
            <h2>Bienvenido <%= user.getUsername() %></h2>
        </div>
    </div>
</body>
<%@ include file="footer.jsp"%> 
</html>
