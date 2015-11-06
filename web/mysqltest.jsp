<%-- 
    Document   : mysqltest
    Created on : Nov 5, 2015, 3:58:37 PM
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
        <h1>Candidates!</h1>
        <% String data = (String) request.getAttribute("table"); %>
        <%= data %>
    </body>
</html>
