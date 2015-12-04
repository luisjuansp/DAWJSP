<%-- 
    Document   : listaEntrevistas
    Created on : Dec 3, 2015, 7:48:58 PM
    Author     : lsanchez
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="beans.Entrevista"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Empleados" />
</jsp:include>
<body>
    <%@ include file="login-checker.jsp"%> 
    <jsp:include page="navbar.jsp">
        <jsp:param name="active" value="2" />
    </jsp:include>
    <script src="js/sorttable.js"></script>
    <% LinkedList<Entrevista> entrevistas = (LinkedList<Entrevista>) session.getAttribute("entrevistas");%>

    <div id="container" class='container'>
        <div class='jumbotron'>
            <center>
                <h1>Entrevistas</h1> 
                <br> <br>            
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Fecha</th>
                                <th class="text-center">Plataforma</th>
                                <th class="text-center">Aptitud</th>
                                <th class="text-center">Entrevistado</th>
                                <th class="text-center">Entrevistador</th>
                                <th class="text-center"></th>
                            </tr>
                            <% for (int i = 0; i < entrevistas.size(); i++) {%>
                            <tr>
                                <td><%=entrevistas.get(i).getFecha()%></td> 
                                <td><%=entrevistas.get(i).getPlataforma()%></td>
                                <td><%=entrevistas.get(i).getAptitud()%></td>
                                <td><%=entrevistas.get(i).getCandidato()%></td>
                                <td><%=entrevistas.get(i).getEmpleado()%></td>
                                <td> 
                                    <button type='button' class='btn btn-info' name='detalle' value=<%=i%>
                                            onclick="verDetalles(<%= entrevistas.get(i).getIdEnt()%>)">Detalles</button> 
                                </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
            </center>
        </div>
    </div>
    <form id="getDetalle" action="Entrevista" method="post">
        <input type="hidden" name="button" value="getDetalle" />
        <input type="hidden" name="specId" id="specId" value=0>
    </form>

    <script>
        function verDetalles(x) {
            document.getElementById("specId").value = x;
            document.getElementById("getDetalle").submit();
        }
    </script>
</body>
<%@ include file="footer.jsp"%>
