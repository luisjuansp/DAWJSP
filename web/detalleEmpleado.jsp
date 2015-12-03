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
                            <div class="col-lg-6">
                                <h3>Nomina: <%=empleado.getNomina()%><br>
                                    <br>Departamento: <%=empleado.getDepartamento()%><br>
                                    <br>Puesto: <%=empleado.getPuesto()%><br>
                                    <br>Fecha de Entrada: <%=empleado.getFechaEntrada()%><br>
                                    <br>Salario: <%=empleado.getSalario()%><br>
                                    <br>Dias de vacaciones al año: <%=empleado.getDiasVacaciones()%><br>
                                    <% if (empleado.getSupervisor() != null) {%>
                                    <br>Supervisor: <%=empleado.getSupervisor()%><br>
                                    <% }%>
                                </h3>
                            </div>
                            <div class="col-lg-6">
                                <h3>Telefono: <%=empleado.getTelCand()%><br> 
                                    <br>E-mail: <%=empleado.getEmailCand()%><br>
                                    <br>Direccion: <br>
                                    <br><%=empleado.getCalle()%> #<%=empleado.getNumero()%><br> 
                                    <br><%=empleado.getCiudad()%>, <%=empleado.getEstado()%><br> 
                                    <br>Codigo Postal: <%=empleado.getCodigo()%><br> 
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
                        <h3>Java<br>
                            <br>C++<br>
                            <br></h3>
                    </div> 
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2> Titulos </h2> 
                    </div>
                    <div class="panel-body">
                        <h3>Java<br>
                            <br>C++<br>
                            <br></h3>
                    </div> 
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2> Certificaciones </h2> 
                    </div>
                    <div class="panel-body">
                        <h3>Java<br>
                            <br>C++<br>
                            <br></h3>
                    </div> 
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2> Historial </h2> 
                    </div>
                    <div class="panel-body">
                        <h3>Java<br>
                            <br>C++<br>
                            <br></h3>
                    </div> 
                </div>
            </center>
        </div>
    </div>
</div>
</body>
<%@ include file="footer.jsp"%>
