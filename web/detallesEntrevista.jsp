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
    <% Entrevista entrevista = (Entrevista) session.getAttribute("entrevista");%>
    <script src="js/sorttable.js"></script>
    <div id="container" class='container'>
        <div class='jumbotron'>
            <center>
                <div class="text-right">
                    <button class="displayer btn btn-info" onclick="startEdit()">Edit</button>
                    <button class="editer btn btn-success" onclick="submitEdit()">Submit</button>
                    <button class="editer btn btn-warning" onclick="closeEdit()">Cancel</button>
                </div>
                <h1>Detalles Entrevista </h1> 
                <br> <br>            
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h2> Datos Generales </h2> 
                    </div> 
                    <div class="panel-body">
                        <div class="col-lg-6 text-left">
                            <h3>
                                <u>Candidato:</u>
                                <span id="candidatodis" class="displayer" >
                                    <%=entrevista.getCandidato()%>
                                </span>
                                <input type="text" class="editer" name="candidato" value="<%=entrevista.getCandidato()%>" form="editEnt">
                                <br>
                                <br>
                                <u>Fecha:</u> 
                                <span id="fechadis" class="displayer" >
                                    <%=entrevista.getFecha()%>
                                </span>
                                <input type="date" class="editer" name="fecha" value="<%=entrevista.getFecha()%>" form="editEnt">
                                <br>
                                <br>
                                <u>Plataforma:</u> 
                                <span id="plataformadis" class="displayer">
                                    <%=entrevista.getPlataforma()%>
                                </span>
                                <input type="text" class="editer" name="plataforma" value="<%=entrevista.getPlataforma()%>" form="editEnt">
                                <br>
                            </h3> 
                        </div>
                        <div class="col-lg-6 text-left">
                            <h3>
                                <u>Entrevistador:</u>
                                <span id="entrevistadordis" class="displayer" >
                                    <%=entrevista.getEmpleado()%>
                                </span>
                                <input type="text" class="editer" name="entrevistador" value="<%=entrevista.getEmpleado()%>" form="editEnt">
                                <br>
                                <br>
                                <u>Aptitud:</u> 
                                <span id="aptituddis" class="displayer" >
                                    <%=entrevista.getAptitud()%>
                                </span>
                                <input type="text" class="editer" name="aptitud" value="<%=entrevista.getAptitud()%>" form="editEnt">
                                <br>
                            </h3> 
                        </div>
                        <div class="col-lg-12 text-left">
                            <h3>
                                <u>Feedback:</u> 
                                <div class="panel panel-primary text-center">
                                    <br>
                                    <span id="feedbackdis" class="displayer" >
                                        <%=entrevista.getFeedback()%>
                                    </span>
                                    <textarea cols="60" rows="5" class="editer" name="feedback" form="editEnt"><%=entrevista.getFeedback()%></textarea>
                                    <br>
                                    <br>
                                </div>
                            </h3> 
                        </div>
                    </div>
                </div>
            </center>
        </div>
    </div>
    <form id="editEnt" action="Entrevista" method="post">
        <input type="hidden" name="idEnt" value="<%= entrevista.getIdEnt()%>">
        <input type="hidden" name="button" value="editEnt" />
    </form>
    <script>

        $(document).ready(function () {
            editers = document.getElementsByClassName("editer");
            displayers = document.getElementsByClassName("displayer");
            for (var i = 0; i < editers.length; i++) {
                editers[i].style.display = 'none';
            }
        });

        function startEdit() {
            for (var i = 0; i < editers.length; i++) {
                editers[i].style.display = 'inline';
            }
            for (var i = 0; i < displayers.length; i++) {
                displayers[i].style.display = 'none';
            }
        }


        function closeEdit() {
            for (var i = 0; i < displayers.length; i++) {
                displayers[i].style.display = 'inline';
            }

            for (var i = 0; i < editers.length; i++) {
                editers[i].style.display = 'none';
            }
        }

        function submitEdit() {
            $editForm = $('#editEnt');
            $.ajax({
                //$editForm.ajaxComplete({
                url: $editForm.attr('action'),
                type: 'POST',
                //dataType: 'json',
                data: $editForm.serializeArray(),
                success: function (result) {
                    console.log(result);
                    document.getElementById("fechadis").innerHTML = 
                            document.getElementsByName("fecha")[0].value;
                    
                    document.getElementById("plataformadis").innerHTML = 
                            document.getElementsByName("plataforma")[0].value;
                    
                    document.getElementById("aptituddis").innerHTML = 
                            document.getElementsByName("aptitud")[0].value;
                    
                    document.getElementById("feedbackdis").innerHTML = 
                            document.getElementsByName("feedback")[0].value;
                    closeEdit();
                }
            });
        }
    </script>
</body>
<%@ include file="footer.jsp"%>