<%-- 
    Document   : detallescandidatos
    Created on : Dec 1, 2015, 4:57:03 PM
    Author     : fofo
--%>

<%@page import="beans.Candidate"%>
<%@page import="java.util.LinkedList"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Candidato" />
</jsp:include>
<body>
    <%@ include file="login-checker.jsp"%> 
    <jsp:include page="navbar.jsp">
        <jsp:param name="active" value="1" />
    </jsp:include>
    <script src="js/sorttable.js"></script>
    <% Candidate candidato = (Candidate) session.getAttribute("candidato");%>
    <div class='container-fluid'>
        <div class='jumbotron'>
            <center>
                <h1><%= candidato.getNombreCand()%></h1> 
                <br> <br>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h2> Datos Generales </h2> 
                    </div> 
                    <div class="panel-body">
                        <div class="col-lg-6 text-left">
                            <h3><u>Telefono:</u> <%= candidato.getTelCand()%></br>
                                <br><u>E-mail:</u> <%= candidato.getEmailCand()%></br> 
                                <br><u>Paga esperada:</u> <%= candidato.getExpectEconCand()%></br>
                            </h3> 
                        </div>
                        <div class="col-lg-6 text-left">
                            <h3>
                                <u>Direccion:</u> <br>
                                <br><%=candidato.getCalle()%> #<%=candidato.getNumero()%><br> 
                                <br><%=candidato.getCiudad()%>, <%=candidato.getEstado()%><br> 
                                <br><%=candidato.getCodigo()%><br> 

                            </h3>
                        </div>
                    </div> 
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h2> Habilidades </h2> 
                    </div> 
                    <div class="panel-body"><h3>
                            <table class ='table table-striped table-hover text-center'>
                                <% for (int i = 0; i < candidato.getHabilidades().size(); i++) {%>
                                <tr>
                                    <td><%= candidato.getHabilidades().get(i)%> </td>
                                </tr>
                                <% }%>
                            </table>
                        </h3> 
                    </div>
                </div>

                <div class="panel panel-info">
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
                            <% for (int i = 0; i < candidato.getTitulos().size(); i++) {%>
                            <tr>
                                <td><%=candidato.getTitulos().get(i).getInstituto()%></td> 
                                <td><%=candidato.getTitulos().get(i).getTitulacion()%></td>
                                <td><%=candidato.getTitulos().get(i).getFecha()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>
                <br>
                <div class="panel panel-info">
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
                            <% for (int i = 0; i < candidato.getCertificados().size(); i++) {%>
                            <tr>
                                <td><%=candidato.getCertificados().get(i).getOrganizacion()%></td> 
                                <td><%=candidato.getCertificados().get(i).getCertificacion()%></td>
                                <td><%=candidato.getCertificados().get(i).getFecha()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h2> Entrevistas con otras compañias </h2> 
                    </div>
                    <div class="panel-body">
                        <table class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Compañia</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Interes</th>
                            </tr>
                            <% for (int i = 0; i < candidato.getTitulos().size(); i++) {%>
                            <tr>
                                <td><%=candidato.getCompanias().get(i).getCompa()%></td> 
                                <td><%=candidato.getCompanias().get(i).getStatus()%></td>
                                <td><%=candidato.getCompanias().get(i).getInteres()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h2> Trabajos anteriores </h2> 
                    </div>
                    <div class="panel-body">
                        <table class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Empresa</th>
                                <th class="text-center">Puesto</th>
                                <th class="text-center">Fecha Entrada</th>
                                <th class="text-center">Fecha Salida</th>
                                <th class="text-center">Salario</th>
                            </tr>
                            <% for (int i = 0; i < candidato.getTrabajos().size(); i++) {%>
                            <tr>
                                <td><%=candidato.getTrabajos().get(i).getEmpresa()%></td> 
                                <td><%=candidato.getTrabajos().get(i).getPuesto()%></td> 
                                <td><%=candidato.getTrabajos().get(i).getEntrada()%></td> 
                                <td><%=candidato.getTrabajos().get(i).getSalida()%></td> 
                                <td><%=candidato.getTrabajos().get(i).getSalario()%></td> 
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>

            </center>
        </div>
    </div>
</body>
<%@ include file="footer.jsp"%>