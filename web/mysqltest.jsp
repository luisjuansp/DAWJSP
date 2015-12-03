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
        <jsp:include page="navbar.jsp" flush="true">
        <jsp:param name="active" value="0" />
    </jsp:include>
        <br>
        <% String data = (String) request.getAttribute("table"); %>
        <%= data %>
    </body>
    
        <form id="getDetalle" action="getCandidates" method="post">
        <input type="hidden" name="button" value="getall" />
        <input type="hidden" name="specId" id="specId" value=0>
    </form>

    <script>
        function verDetalles(x) {
            document.getElementById("specId").value = x;
            document.getElementById("getDetalle").submit();
        }
    </script>
    
</html>
