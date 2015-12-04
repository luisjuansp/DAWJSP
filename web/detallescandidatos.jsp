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
                        <h2> Datos </h2> 
                    </div> 
                    <div class="panel-body">
                        <h3>Telefono: <%= candidato.getTelCand()%></br>
                            <br>E-mail: <%= candidato.getEmailCand()%></br> 
                            <br>Paga esperada: <%= candidato.getExpectEconCand()%></br>
                            <br>Estado: <%= candidato.getEstado()%></br>
                            <br>Ciudad: <%= candidato.getCiudad()%></br> 
                            <br>Calle: <%= candidato.getCalle()%></br> 
                            <br>Codigo Postal: <%= candidato.getCodigo()%></br> 
                        </h3> 
                    </div> 
                </div>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h2> Habilidades </h2> 
                    </div> 
                    <div class="panel-body"><h3>
                            <% for (int i = 0; i < candidato.getHabilidades().size(); i++) {%>
                            <%= candidato.getHabilidades().get(i)%> <br> <br>
                            <% }%>
                        </h3> 
                    </div>
            </center>
        </div>
    </div>
</body>
<%@ include file="footer.jsp"%>