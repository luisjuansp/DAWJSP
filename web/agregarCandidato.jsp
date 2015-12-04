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
                    <div class="panel-body text-left">
                        <form id="addCand" action="getCandidates" method="post">
                            <div class="col-lg-6 text-left">
                                <h3>
                                    <label>Nombre:</label>
                                    <input type="text" name="nombre" form="addCand">
                                    <br>
                                    <br>
                                    <label>Telefono:</label> 
                                    <input type="text" class="editer" name="tel"  form="addCand">
                                    <br> 
                                    <br>
                                    <label>E-mail:</label> 
                                    <input type="email" class="editer" name="email"  form="addCand">
                                    <br>
                                    <br>
                                    <label>Paga esperada:</label> 
                                    <input type="paga" class="editer" name="paga"  form="addCand">
                                    <br>
                                </h3>
                            </div>
                            <div class="col-lg-6 text-left">
                                <h3>     
                                    <label>Direccion:</label>
                                    <br>
                                    <br>
                                    <input type="text" class="editer" name="calle" placeholder="Calle" form="addCand">
                                    <input type="number" class="editer" name="numero" placeholder="Numero" form="addCand">
                                    <br> 
                                    <br>
                                    <input type="text" class="editer" name="ciudad" placeholder="Ciudad" form="addCand">
                                    <input type="text" class="editer" name="estado" placeholder="Estado" form="addCand">
                                    <br> 
                                    <br>
                                    <input type="number" class="editer" name="codigo" placeholder="Codigo Postal" form="addCand">
                                    <br> 
                                </h3> 
                            </div>
                            <input class="hidden" name="button" value="addCand">
                            <input type='submit' class='btn btn-info' value="Agregar">
                        </form>
                    </div>
                </div>
            </center>
        </div>
    </div>
</body>
<%@ include file="footer.jsp"%>
