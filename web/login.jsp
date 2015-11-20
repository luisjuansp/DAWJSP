<%-- 
    Document   : Login
    Created on : Nov 6, 2015, 12:48:50 PM
    Author     : fofo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            Boolean login = (Boolean) session.getAttribute("login");
            if (login != null) {
                if (login == false) {
        %>
        <%="Por favor intenta de nuevo"%>
        <%        } else {
                    response.sendRedirect("login.jsp");
                }
            }
        %>
        <form action="getLogin" method="post">
            <table cellspacing="5" border="0">
                <tr>
                    <td align="right">User name:</td>
                    <td><input type="text" name="username" required></td>
                </tr>
                <tr>
                    <td align="right">Password:</td>
                    <td><input type="text" name="password" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><br><input type="submit" value="Submit"></td>
                </tr>
            </table>
        </form>   
    </body>
</html>
