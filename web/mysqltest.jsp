<%-- 
    Document   : mysqltest
    Created on : Nov 5, 2015, 3:58:37 PM
    Author     : Luis Juan Sanchez P
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="header.jsp" flush="true">
    <jsp:param name="pageTitle" value="Candidatos" />
</jsp:include>   
    <body>
        <br>
        <% String data = (String) request.getAttribute("table"); %>
        <%= data %>
    </body>
</html>
