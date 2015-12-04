<%-- 
    Document   : agregarEntrevista
    Created on : Dec 3, 2015, 1:17:44 PM
    Author     : jcou
--%>

<%@page import="beans.Empleado"%>
<%@page import="java.util.LinkedList"%>
<%@page import="beans.Candidate"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Agregar Entrevista" />
</jsp:include>
<body>
    <%@ include file="login-checker.jsp"%> 
    <jsp:include page="navbar.jsp">
        <jsp:param name="active" value="2" />
    </jsp:include>
    <%  LinkedList<Candidate> candidates = (LinkedList<Candidate>) session.getAttribute("candidatos");
        LinkedList<Empleado> empleados = (LinkedList<Empleado>) session.getAttribute("empleados");
    %>
    <script src="js/sorttable.js"></script>
    <div id="container" class='container'>
        <div class='jumbotron'>
            <center>
                <h1>Agregar Entrevista </h1> 
                <br> <br>            
                <div class="panel panel-primary">
                    <div class="panel-body text-left">
                        <form action="Entrevista" method="post">
                            <div class="form-group">
                                <label for="candidato">Candidato:</label>
                                <select name="candidato" class="form-control">
                                    <% for (int i = 0; i < candidates.size(); i++) {%>
                                    <option value="<%=candidates.get(i).getIdCand()%>">
                                        <%=candidates.get(i).getNombreCand()%>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="fecha">Fecha:</label>
                                <input type="date" class="form-control" name="fecha">
                            </div>
                            <div class="form-group">
                                <label for="plataforma">Plataforma</label>
                                <input type="text" class="form-control" name="plataforma">
                            </div>
                            <div class="form-group">
                                <label for="entrevistador">Entrevistador</label>
                                <select name="entrevistador" class="form-control">
                                    <% for (int i = 0; i < empleados.size(); i++) {%>
                                    <option value="<%=empleados.get(i).getNomina()%>">
                                        <%=empleados.get(i).getNombreCand()%>
                                    </option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="aptitud">Aptitud</label>
                                <input type="text" class="form-control" name="aptitud">
                            </div>
                            <div class="form-group">
                                <label for="feedback">Feedback</label>
                                <textarea class="form-control" rows="5" name="feedback"></textarea>
                            </div>
                            <input class="hidden" name="button" value="addEnt">
                            <input type='submit' class='btn btn-info' value="Agregar">
                        </form>
                    </div>
                </div>
            </center>
        </div>
    </div>
</body>
<%@ include file="footer.jsp"%>
