<%-- 
    Document   : detalleEmpleado.jsp
    Created on : Dec 2, 2015, 7:01:32 PM
    Author     : lsanchez
--%>

<%@page import="beans.Empleado"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Empleado" />
</jsp:include>
<body>
    <%@ include file="login-checker.jsp"%> 
    <jsp:include page="navbar.jsp">
        <jsp:param name="active" value="3" />
    </jsp:include>
    <script src="js/sorttable.js"></script>
    <% Empleado empleado = (Empleado) session.getAttribute("empleado");%>
    <div id="container" class='container'>
        <div class='jumbotron'>
            <center>
                <h1><%= empleado.getNombreCand()%></h1> 
                <br> <br>
                <div class="container">
                    <div class="panel panel-success">
                        <div class="panel-heading"> 
                            <h2> Datos Generales</h2> 
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-6 text-left">
                                <h3><u>Nomina:</u> <%=empleado.getNomina()%><br>
                                    <br><u>Departamento:</u> <%=empleado.getDepartamento()%><br>
                                    <br><u>Puesto:</u> <%=empleado.getPuesto()%><br>
                                    <br><u>Fecha de Entrada:</u> <%=empleado.getFechaEntrada()%><br>
                                    <br><u>Salario:</u> <%=empleado.getSalario()%><br>
                                    <br><u>Dias de vacaciones al año:</u> <%=empleado.getDiasVacaciones()%><br>
                                    <% if (empleado.getSupervisor() != null) {%>
                                    <br><u>Supervisor:</u> <%=empleado.getSupervisor()%><br>
                                    <% }%>
                                </h3>
                            </div>
                            <div class="col-lg-6 text-left">
                                <h3><u>Telefono:</u> <%=empleado.getTelCand()%><br> 
                                    <br><u>E-mail:</u> <%=empleado.getEmailCand()%><br>
                                    <br><u>Direccion:</u> <br>
                                    <br><%=empleado.getCalle()%> #<%=empleado.getNumero()%><br> 
                                    <br><%=empleado.getCiudad()%>, <%=empleado.getEstado()%><br> 
                                    <br><%=empleado.getCodigo()%><br> 
                                </h3> 
                            </div>
                        </div> 
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2> Habilidades </h2> 
                    </div>
                    <div class="panel-body">
                        <table class ='table table-striped table-hover text-center'> 
                            <% for (int i = 0; i < empleado.getHabilidades().size(); i++) {%>
                            <tr>
                                <td><h3><%=empleado.getHabilidades().get(i)%></h3></td> 
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2> Titulos </h2> 
                    </div>
                    <div class="panel-body">
                        <table class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Institucion</th>
                                <th class="text-center">Titulacion</th>
                                <th class="text-center">Fecha</th>
                            </tr>
                            <% for (int i = 0; i < empleado.getTitulos().size(); i++) {%>
                            <tr>
                                <td><%=empleado.getTitulos().get(i).getInstituto()%></td> 
                                <td><%=empleado.getTitulos().get(i).getTitulacion()%></td>
                                <td><%=empleado.getTitulos().get(i).getFecha()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2> Certificados </h2> 
                    </div>
                    <div class="panel-body">
                        <table class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Organizacion</th>
                                <th class="text-center">Certificacion</th>
                                <th class="text-center">Fecha</th>
                            </tr>
                            <% for (int i = 0; i < empleado.getCertificados().size(); i++) {%>
                            <tr>
                                <td><%=empleado.getCertificados().get(i).getOrganizacion()%></td> 
                                <td><%=empleado.getCertificados().get(i).getCertificacion()%></td>
                                <td><%=empleado.getCertificados().get(i).getFecha()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2> Historial </h2> 
                    </div>
                    <div class="panel-body">
                        <table class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Puesto</th>
                                <th class="text-center">Fecha</th>
                                <th class="text-center">Salario</th>
                            </tr>
                            <% for (int i = 0; i < empleado.getHistorial().size(); i++) {%>
                            <tr>
                                <td><%=empleado.getHistorial().get(i).getPuesto()%></td> 
                                <td><%=empleado.getHistorial().get(i).getFecha()%></td>
                                <td><%=empleado.getHistorial().get(i).getSalario()%></td>
                            </tr>
                            <%}%>
                        </table> 
                    </div> 
                </div>
            </center>
        </div>
    </div>
</div>
</body>
<%@ include file="footer.jsp"%>
