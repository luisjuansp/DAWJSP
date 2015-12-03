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
        <jsp:param name="active" value="3" />
    </jsp:include>
    <script src="js/sorttable.js"></script>
    <% LinkedList<Empleado> empleados = (LinkedList<Empleado>) session.getAttribute("empleados");%>

    <div id="container" class='container'>
        <div class='jumbotron'>
            <center>
                <h1>Empleados</h1> 
                <br> <br>            
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Nombre</th>
                                <th class="text-center">Departamento</th>
                                <th class="text-center">Telefono</th>
                                <th class="text-center">Email</th>
                                <th class="text-center"></th>
                            </tr>
                            <% for (int i = 0; i < empleados.size(); i++) {%>
                            <tr>
                                <td><%=empleados.get(i).getNombreCand()%></td> 
                                <td><%=empleados.get(i).getDepartamento()%></td>
                                <td><%=empleados.get(i).getTelCand()%></td>
                                <td><%=empleados.get(i).getEmailCand()%></td>
                                <td> 
                                    <button type='button' class='btn btn-info' name='detalle' value=<%=i%>
                                            onclick="verDetalles(<%= empleados.get(i).getNomina()%>)">Detalles</button> 
                                </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
            </center>
        </div>
    </div>
    <form id="getDetalle" action="Empleado" method="post">
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
