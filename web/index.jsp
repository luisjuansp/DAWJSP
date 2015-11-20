<%-- 
    Document   : index
    Created on : Nov 5, 2015, 2:36:49 PM
    Author     : Luis Juan Sanchez P
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="login-checker.jsp" %> 
        <h1>Hello World!</h1>
        <form action="getCandidates" method="post">
            <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
