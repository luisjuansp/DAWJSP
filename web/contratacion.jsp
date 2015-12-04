<%-- 
    Document   : contratacion
    Created on : Dec 4, 2015, 3:13:37 AM
    Author     : fofo
--%>

<%@page import="beans.Candidate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <jsp:include page="header.jsp">
        <jsp:param name="pageTitle" value="Contratar" />
    </jsp:include>
    <body>
        <%@ include file="login-checker.jsp"%> 
        <jsp:include page="navbar.jsp">
            <jsp:param name="active" value="1" />
        </jsp:include>
        <% Candidate candidato = (Candidate) session.getAttribute("candidato");%>
        <h1>Contratación</h1>
    <center>
        <form id="getDetalle" action="getCandidates" method="post">
        <table cellspacing="5" border="0">
            <tr>
                <td align="right" style="vertical-align: middle;"><label>Puesto:&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" name="puesto" placeholder="puesto" required></td>
            </tr>
            <tr>
                <td align="right"><label>Departamento:&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" name="departamento" placeholder="departamento" required></td>
            </tr>
            <tr>
                <td align="right"><label>Salario&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                <td><input type="number" class="form-control" name="salario" placeholder="salario" required></td>
            </tr>
            <tr>
                <td align="right"><label>Dias de Vacaciones&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                <td><input type="number" class="form-control" name="vacaciones" placeholder="vacaciones" required></td>
            </tr>
            <tr>
                <td></td>
                <td class="text-center"><br><button class="displayer btn btn-danger" onclick="contratar(<%= candidato.getIdCand()%>)">Contratar!</button></td>
                <input type="hidden" name = "specId" id = "specId" value = 0>
                <input type="hidden" name="button" value="finalizarcontrato" />
                <input type="hidden" name = "specId" id = "specId" value = 0>
            </tr>
        </table>  
            
        </form>
    </center>
        <script>
            function contratar(x) {
                document.getElementById("specId").value = x;
                document.getElementById("getDetalle").submit();
            }
        </script>

    </body>
    <%@ include file="footer.jsp"%>
</html>
