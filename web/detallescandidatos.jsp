<%-- 
    Document   : detallescandidatos
    Created on : Dec 1, 2015, 4:57:03 PM
    Author     : fofo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidatos</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <script src="js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    </head>
    <%@page import="beans.Candidate"%>
    <%@page import="java.util.LinkedList"%>
    <jsp:include page="header.jsp">
        <jsp:param name="pageTitle" value="Candidato" />
    </jsp:include>
    <body>
        <% Candidate candidato = (Candidate) session.getAttribute("candidato");%>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header ">
                    <a class="navbar-brand">Human Capital System</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li ><a href="#" onclick="getCandidates()"><span>Candidatos</span></a></li>
                        <li ><a href="#" ><span>Entrevistas</span></a></li>
                        <li ><a href="#" onclick="getEmpleados()"><span>Empleados</span></a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#" onclick="logout()">Logout</a>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <form id="logout" action="Login" method="post">
            <input type="hidden" name="button" value="Logout" />
        </form>

        <script>
            function logout() {
                document.getElementById("logout").submit();
            }
        </script>

        <form id="getCandi" action="getCandidates" method="post">
            <input type="hidden" name="button" value="getbasic" />
        </form>

        <script>
            function getCandidates() {
                document.getElementById("getCandi").submit();
            }
        </script>

        <form id="getListaEmp" action="Empleado" method="post">
            <input type="hidden" name="button" value="getList" />
        </form>

        <script>
            function getEmpleados() {
                document.getElementById("getListaEmp").submit();
            }
        </script>

        <br>
        <div class='container-fluid'>
            <div class='jumbotron'>
                <center>
                    <h1><%= candidato.getNombreCand()%></h1> <br> <br> <div class="panel panel-info">
                        <div class="panel-heading"> <h2> Datos </h2> </div> <div class="panel-body"><h3>Telefono: <%= candidato.getTelCand()%></br> <br>E-mail: <%= candidato.getEmailCand()%></br> <br>Paga esperada: <%= candidato.getExpectEconCand()%></br> <br>Estado: <%= candidato.getEstado()%></br> <br>Ciudad: <%= candidato.getCiudad()%></br> <br>Calle: <%= candidato.getCalle()%></br> <br>Codigo Postal: <%= candidato.getCodigo()%></br> </h3> </div> </div><div class="panel panel-info">
                        <div class="panel-heading"> <h2> Habilidades </h2> </div> <div class="panel-body"><h3>
                                <% for (int i = 0; i < candidato.getHabilidades().size(); i++) {%>
                                <%= candidato.getHabilidades().get(i)%> <br> <br>
                                <% }%>
                            </h3> </div> </div> </div>
        </center>
    </div>
</div>
</body>
</html>