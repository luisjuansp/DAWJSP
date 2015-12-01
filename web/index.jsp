<%-- 
    Document   : index
    Created on : Nov 5, 2015, 2:36:49 PM
    Author     : Luis Juan Sanchez P
--%>

<jsp:include page="header.jsp" flush="true">
    <jsp:param name="pageTitle" value="Human Capital System" />
</jsp:include>
<%@ include file="login-checker.jsp" %> 
<body>
    <h1>Hello World!</h1>
    <form action="getCandidates" method="post">
        <br>
        <input type="submit" name = "button" value="getall">
    </form>
    
</body>
</html>
