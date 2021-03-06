<%-- 
    Document   : mysqltest
    Created on : Nov 5, 2015, 3:58:37 PM
    Author     : Luis Juan Sanchez P
--%>

<%@page import="beans.Candidate"%>
<%@page import="java.util.LinkedList"%>
<jsp:include page="header.jsp">
    <jsp:param name="pageTitle" value="Candidatos" />
</jsp:include>
<body>
    <%@ include file="login-checker.jsp"%> 
    <jsp:include page="navbar.jsp">
        <jsp:param name="active" value="1" />
    </jsp:include>
    <script src="js/sorttable.js"></script>
    <% LinkedList<Candidate> candidatos = (LinkedList<Candidate>) session.getAttribute("candidatos");%>

    <div class='container'>
        <div class='jumbotron'>
            <center>
                <div class="text-right">
                    <a class="btn btn-primary" href="./agregarCandidato.jsp">Agregar</a>
                </div>
                <h1>Candidatos</h1> <br> <br>
                <div class="panel panel-primary">
                    <div class="panel-body">
                        <table class ='sortable table table-hover table-striped text-center'> <tr>
                                <th class="text-center"> Nombre</th>
                                <th class="text-center"> Telefono</th>
                                <th class="text-center"> Email</th>
                                <th>  </th>
                            </tr>
                            <% for (int i = 0; i < candidatos.size(); i++) {%>
                            <tr>
                                <td> <%= candidatos.get(i).getNombreCand()%> </td>
                                <td> <%= candidatos.get(i).getTelCand()%> </td>
                                <td> <%= candidatos.get(i).getEmailCand()%> </td>
                                <td> <button type = 'button' class = 'btn btn-info' name = 'detalle' value = " + store + " onclick = 
                                             "verDetalles(<%= candidatos.get(i).getIdCand()%>)" > Detalles </button> </td>
                            </tr>
                            <% }
                            %>


                        </table>
                    </div>
                </div>
            </center>
        </div>            
        <form id="getDetalle" action="getCandidates" method="post">
            <input type="hidden" name="button" value="getall" />
            <input type="hidden" name = "specId" id = "specId" value = 0>
        </form>

        <script>
            function verDetalles(x) {
                document.getElementById("specId").value = x;
                //alert(document.getElementById("specId").value);
                document.getElementById("getDetalle").submit();
            }
        </script>
</body>
<%@ include file="footer.jsp"%>
