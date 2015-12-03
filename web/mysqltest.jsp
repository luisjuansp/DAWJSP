<%-- 
    Document   : mysqltest
    Created on : Nov 5, 2015, 3:58:37 PM
    Author     : Luis Juan Sanchez P
--%>

<%@page import="beans.Candidate"%>
<%@page import="java.util.LinkedList"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Empleados" />
</jsp:include>
<body>
    <%@ include file="login-checker.jsp"%> 
    <jsp:include page="navbar.jsp">
        <jsp:param name="active" value="2" />
    </jsp:include>
    <% LinkedList<Candidate> candidatos = (LinkedList<Candidate>) session.getAttribute("candidatos");%>

    <div class='container-fluid'>
        <div class='jumbotron'>
            <center>
                <h1>Candidatos</h1> <br> <br>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <table class ='table'> <tr>
                                <th> Nombre</th>
                                <th> Telefono</th>
                                <th> Email</th>
                                <th>  </th>
                            </tr>
                            <% for (int i = 0; i < candidatos.size(); i++) {%>
                            <tr>
                                <td> <%= candidatos.get(i).getNombreCand()%> </td>
                                <td> <%= candidatos.get(i).getTelCand()%> </td>
                                <td> <%= candidatos.get(i).getEmailCand()%> </td>
                                <td> <button type = 'button' class = 'btn btn-info' name = 'detalle' value = " + store + " onclick = 
                                             "verDetalles(<%= candidatos.get(i).getIdCand()%>)" > Detalles </button> </td>
                            </tr>
                            <% }
                            %>


                        </table>
                    </div>
                </div>
            </center>
        </div>            
        <form id="getDetalle" action="getCandidates" method="post">
            <input type="hidden" name="button" value="getall" />
            <input type="hidden" name = "specId" id = "specId" value = 0>
        </form>

        <script>
            function verDetalles(x) {
                document.getElementById("specId").value = x;
                document.getElementById("getDetalle").submit();
            }
        </script>
</body>
<%@ include file="footer.jsp"%> 
</html>