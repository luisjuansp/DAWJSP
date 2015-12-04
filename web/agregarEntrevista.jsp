<%-- 
    Document   : agregarEntrevista
    Created on : Dec 3, 2015, 1:17:44 PM
    Author     : jcou
--%>

<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Agregar Entrevista" />
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
                <h1>Agregar Entrevista </h1> 
                <br> <br>            
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-left">Fecha</th>
                                <td class ="text-left"><input type="text" name= "Fecha" size="40"></td>

                            </tr>

                            <tr>
                                <th class="text-left">Plataforma</th>
                                <td class ="text-left"><input type="text" name= "Plataforma" size="40"></td>
                            </tr>

                            <tr>
                                <th class="text-left">Entrevistador</th>
                                <td class ="text-left"><input type="text" name= "Entrevistador" size="40"></td>
                            </tr>

                            <tr>
                                <th class="text-left">Retroalimentacion</th>
                                <td class="text-left" ><textarea rows="4" cols="50"></textarea></td>
                            </tr> 

                            <tr>
                                <th class="text-left">Descripcion</th>
                                <td class="text-left"> <textarea rows="4" cols="50"></textarea> </td>
                            </tr>

                            <tr>
                                <th class="text-left">Aptitud</th>
                                <td class ="text-left"><input type="text" name= "Aptitud" size="40"></td>
                            </tr>
                        </table>
                        <button type='button' class='btn btn-info' name='detalle' title="Agregar"> Agregar
                        </button> 
                    </div>
                </div>
            </center>
        </div>
    </div>
