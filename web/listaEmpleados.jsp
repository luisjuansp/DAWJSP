<%-- 
    Document   : listaEmpleados
    Created on : Dec 2, 2015, 1:17:44 PM
    Author     : lsanchez
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="beans.Empleado"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Empleados" />
</jsp:include>
<body>
    <%@ include file="login-checker.jsp"%> 
    <jsp:include page="navbar.jsp">
        <jsp:param name="active" value="2" />
    </jsp:include>
    <% LinkedList<Empleado> empleados = (LinkedList<Empleado>) session.getAttribute("empleados");%>
    <h1><%= empleados.getFirst().getNombreCand() %></h1>
    <h1><%= empleados.getLast().getNombreCand() %></h1>
</body>
<%@ include file="footer.jsp"%> 
</html>
