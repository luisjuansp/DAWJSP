<%-- 
    Document   : detallesEntrevista
    Created on : Dec 3, 2015, 6:02:39 PM
    Author     : jcou
--%>

<%@page import="beans.Entrevista"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Entrevista" />
</jsp:include>
<body>
    <%@ include file="login-checker.jsp"%> 
    <jsp:include page="navbar.jsp">
        <jsp:param name="active" value="2" />
    </jsp:include>
    <script src="js/sorttable.js"></script>
    <div id="container" class='container'>
        <div class='jumbotron'>
            <center>
                <h1>Detalles Entrevista </h1> 
                <br> <br>            
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-left">Fecha</th>
                                <td class ="text-left"> <label for="Fecha"></label></td>

                            </tr>
                            <tr>
                                <th class="text-left">Plataforma</th>
                                <td class ="text-left"><label for="Plataforma"></label></td>
                            </tr>
                            <tr>
                                <th class="text-left">Entrevistador</th>
                                <td class ="text-left"><label for="Entrevistador"></label></td>
                            </tr>
                            <tr>
                                <th class="text-left">Retroalimentacion</th>
                                <td class="text-left" ><label for="Retroalimentacion"></label></td>
                            </tr> 
                            <tr>
                                <th class="text-left">Descripcion</th>
                                <td class="text-left"><label for="Descripcion"></label> </td>
                            </tr>
                            <tr>
                                <th class="text-left">Aptitud</th>
                                <td class ="text-left"><label for="Aptitud"></label></td>
                            </tr>
                        </table>
                        <button type='button' class='btn btn-info' name='detalle' title="Regresar"> Regresar
                        </button> 
                        <h2>ID:</h2> 
                        <label for="ID"></label>
                    </div>
                </div>
            </center>
        </div>
    </div>
</body>
<%@ include file="footer.jsp"%>