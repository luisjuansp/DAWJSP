<%-- 
    Document   : login-checker
    Created on : Nov 19, 2015, 5:27:11 PM
    Author     : lsanchez
--%>

<%
    Boolean login = (Boolean) session.getAttribute("login");
    if(login == null || login == false){
        response.sendRedirect("login.jsp");
    } else {
%>