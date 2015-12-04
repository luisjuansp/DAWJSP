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
    <script src="js/sorttable.js"></script>
    <% Empleado empleado = (Empleado) session.getAttribute("empleado");%>
    <div id="container" class='container'>
        <div class='jumbotron'>
            <center>
                <div class="text-right">
                    <button class="displayer btn btn-info" onclick="startEdit()">Edit</button>
                    <button class="editer btn btn-success" onclick="submitEdit()">Submit</button>
                    <button class="editer btn btn-warning" onclick="closeEdit()">Cancel</button>
                </div>
                <h1><%= empleado.getNombreCand()%></h1> 
                <br> <br>
                <div class="container">
                    <div class="panel panel-success">
                        <div class="panel-heading"> 
                            <h2>Datos Generales</h2> 
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-6 text-left">
                                <h3>
                                    <u>Nomina:</u>
                                    <span >
                                        <%=empleado.getNomina()%>
                                    </span>
                                    <input type="number" hidden="true" name="nomina" value="<%=empleado.getNomina()%>" form="editEmp">
                                    <br>
                                    <br>
                                    <u>Departamento:</u> 
                                    <span id="departamentodis" class="displayer" >
                                        <%=empleado.getDepartamento()%>
                                    </span>
                                    <input type="text" class="editer" name="departamento" value="<%=empleado.getDepartamento()%>" form="editEmp">
                                    <br>
                                    <br>
                                    <u>Puesto:</u> 
                                    <span id="puestodis" class="displayer">
                                        <%=empleado.getPuesto()%>
                                    </span>
                                    <input type="text"  class="editer" name="puesto" value="<%=empleado.getPuesto()%>" form="editEmp">
                                    <br>
                                    <br>
                                    <u>Fecha de Entrada:</u> 
                                    <span id="fechadis" class="displayer" >
                                        <%=empleado.getFechaEntrada()%>
                                    </span>
                                    <input type="date" class="editer" name="fecha" value="<%=empleado.getFechaEntrada()%>" form="editEmp">
                                    <br>
                                    <br>
                                    <u>Salario:</u> 
                                    <span id="salariodis" class="displayer" >
                                        <%=empleado.getSalario()%>
                                    </span>
                                    <input type="number" class="editer" name="salario" value="<%=empleado.getSalario()%>" form="editEmp">
                                    <br>
                                    <br>
                                    <u>Dias de vacaciones al año:</u> 
                                    <span id="vacacionesdis" class="displayer" >
                                        <%=empleado.getDiasVacaciones()%>
                                    </span>
                                    <input type="number" class="editer" name="vacaciones" value="<%=empleado.getDiasVacaciones()%>" form="editEmp">
                                    <br>
                                    <% if (empleado.getSupervisor() != null) {%>
                                    <br>
                                    <u>Supervisor:</u>
                                    <span>
                                        <%=empleado.getSupervisor()%>
                                    </span>
                                    <br>
                                    <% }%>
                                </h3>
                            </div>
                            <div class="col-lg-6 text-left">
                                <h3>
                                    <u>Telefono:</u> 
                                    <span id="teldis" class="displayer" >
                                        <%=empleado.getTelCand()%>
                                    </span>
                                    <input type="text" class="editer" name="tel" value="<%=empleado.getTelCand()%>" form="editEmp">
                                    <br> 
                                    <br>
                                    <u>E-mail:</u> 
                                    <span id="emaildis" class="displayer" >
                                        <%=empleado.getEmailCand()%>
                                    </span>
                                    <input type="email" class="editer" name="email" value="<%=empleado.getEmailCand()%>" form="editEmp">
                                    <br>
                                    <br>
                                    <u>Direccion:</u>
                                    <br>
                                    <br>
                                    <span id="calledis" class="displayer" >
                                        <%=empleado.getCalle()%> 
                                    </span>
                                    <input type="text" class="editer" name="calle" value="<%=empleado.getCalle()%>" form="editEmp">
                                    <span id="numerodis" class="displayer" >
                                        #<%=empleado.getNumero()%>
                                    </span>
                                    <input type="number" class="editer" name="numero" value="<%=empleado.getNumero()%>" form="editEmp">
                                    <br> 
                                    <br>
                                    <span id="ciudaddis" class="displayer" >
                                        <%=empleado.getCiudad()%>
                                    </span>
                                    <input type="text" class="editer" name="ciudad" value="<%=empleado.getCiudad()%>" form="editEmp">
                                    <span id="estadodis" class="displayer" >
                                        , <%=empleado.getEstado()%>
                                    </span>
                                    <input type="text" class="editer" name="estado" value="<%=empleado.getEstado()%>" form="editEmp">
                                    <br> 
                                    <br>
                                    <span id="codigodis" class="displayer" >
                                        <%=empleado.getCodigo()%>
                                    </span>
                                    <input type="number" class="editer" name="codigo" value="<%=empleado.getCodigo()%>" form="editEmp">
                                    <br> 
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
                        <table id="habilidades" class ='table table-striped table-hover text-center'> 
                            <% for (int i = 0; i < empleado.getHabilidades().size(); i++) {%>
                            <tr>
                                <td><h3><%=empleado.getHabilidades().get(i)%></h3></td> 
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2> Titulos </h2> 
                    </div>
                    <div class="panel-body">
                        <table id="titulos" class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Institucion</th>
                                <th class="text-center">Titulacion</th>
                                <th class="text-center">Fecha</th>
                            </tr>
                            <% for (int i = 0; i < empleado.getTitulos().size(); i++) {%>
                            <tr>
                                <td><%=empleado.getTitulos().get(i).getInstituto()%></td> 
                                <td><%=empleado.getTitulos().get(i).getTitulacion()%></td>
                                <td><%=empleado.getTitulos().get(i).getFecha()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2> Certificados </h2> 
                    </div>
                    <div class="panel-body">
                        <table id="certificados" class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Organizacion</th>
                                <th class="text-center">Certificacion</th>
                                <th class="text-center">Fecha</th>
                            </tr>
                            <% for (int i = 0; i < empleado.getCertificados().size(); i++) {%>
                            <tr>
                                <td><%=empleado.getCertificados().get(i).getOrganizacion()%></td> 
                                <td><%=empleado.getCertificados().get(i).getCertificacion()%></td>
                                <td><%=empleado.getCertificados().get(i).getFecha()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h2> Historial </h2> 
                    </div>
                    <div class="panel-body">
                        <table id="historial" class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Puesto</th>
                                <th class="text-center">Fecha</th>
                                <th class="text-center">Salario</th>
                            </tr>
                            <% for (int i = 0; i < empleado.getHistorial().size(); i++) {%>
                            <tr>
                                <td><%=empleado.getHistorial().get(i).getPuesto()%></td> 
                                <td><%=empleado.getHistorial().get(i).getFecha()%></td>
                                <td><%=empleado.getHistorial().get(i).getSalario()%></td>
                            </tr>
                            <%}%>
                        </table> 
                    </div>
                </div>
            </center>
        </div>
    </div>  
    <form id="editEmp" action="Empleado" method="post">
        <input type="hidden" name="button" value="editEmp" />
    </form>
    <script>
        var editers;
        var displayers;
        var habilidadesSize;
        var addedHab;
        var titulosSize;
        var addedTit;
        var certificadosSize;
        var addedCer;
        var historialSize;
        var addedHis;

        $(document).ready(function () {
            editers = document.getElementsByClassName("editer");
            displayers = document.getElementsByClassName("displayer");
            for (var i = 0; i < editers.length; i++) {
                editers[i].style.display = 'none';
            }
        });

        function addRowHabilidades() {
            var habilidades = document.getElementById("habilidades");
            var row = habilidades.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            cell1.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"habilidad\" form=\"editEmp\">";
            cell2.innerHTML = "<button class=\"btn btn-info\" onclick=\"addRowHabilidades()\">+</button>";
        }

        function addRowTitulos() {
            var titulos = document.getElementById("titulos");
            var row = titulos.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            cell1.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"institucion\" form=\"editEmp\">";
            cell2.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"titulacion\" form=\"editEmp\">";
            cell3.innerHTML = "<input type=\"date\" class=\"form-control\" name=\"titfecha\" form=\"editEmp\">";
            cell4.innerHTML = "<button class=\"btn btn-info\" onclick=\"addRowTitulos()\">+</button>";
        }

        function addRowCertificados() {
            var certificados = document.getElementById("certificados");
            var row = certificados.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            cell1.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"organizacion\" form=\"editEmp\">";
            cell2.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"certificacion\" form=\"editEmp\">";
            cell3.innerHTML = "<input type=\"date\" class=\"form-control\" name=\"cerfecha\" form=\"editEmp\">";
            cell4.innerHTML = "<button class=\"btn btn-info\" onclick=\"addRowCertificados()\">+</button>";
        }

        function addRowHistorial() {
            var historial = document.getElementById("historial");
            var row = historial.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            cell1.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"hispuesto\" form=\"editEmp\">";
            cell2.innerHTML = "<input type=\"date\" class=\"form-control\" name=\"hisfecha\" form=\"editEmp\">";
            cell3.innerHTML = "<input type=\"number\" class=\"form-control\" name=\"hissalario\" form=\"editEmp\">";
            cell4.innerHTML = "<button class=\"btn btn-info\" onclick=\"addRowHistorial()\">+</button>";
        }

        function startEdit() {
            for (var i = 0; i < editers.length; i++) {
                editers[i].style.display = 'inline';
            }
            for (var i = 0; i < displayers.length; i++) {
                displayers[i].style.display = 'none';
            }
            //HABILIDADES
            var habilidades = document.getElementById("habilidades");
            habilidadesSize = habilidades.rows.length;
            addedHab = 1;
            addRowHabilidades();
            //TITULOS
            var titulos = document.getElementById("titulos");
            titulosSize = titulos.rows.length;
            addedTit = 1;
            addRowTitulos();
            //CERTIFICACION
            var certificados = document.getElementById("certificados");
            certificadosSize = certificados.rows.length;
            addedCer = 1;
            addRowCertificados();
            //HISTORIAL
            var historial = document.getElementById("historial");
            historialSize = historial.rows.length;
            addedHis = 1;
            addRowHistorial();
        }

        function closeEdit() {
            for (var i = 0; i < displayers.length; i++) {
                displayers[i].style.display = 'inline';
            }

            for (var i = 0; i < editers.length; i++) {
                editers[i].style.display = 'none';
            }

            var habilidades = document.getElementById("habilidades");
            for (var i = habilidades.rows.length - 1; i >= habilidadesSize; i--) {
                deleteHabilidadRow(i);
            }

            var titulos = document.getElementById("titulos");
            for (var i = titulos.rows.length - 1; i >= titulosSize; i--) {
                deleteTituloRow(i);
            }

            var certificados = document.getElementById("certificados");
            for (var i = certificados.rows.length - 1; i >= certificadosSize; i--) {
                deleteCertificadoRow(i);
            }

            var historial = document.getElementById("historial");
            for (var i = historial.rows.length - 1; i >= historialSize; i--) {
                deleteHistorialRow(i);
            }
        }

        function deleteHabilidadRow(r) {
            document.getElementById("habilidades").deleteRow(r);
        }

        function deleteTituloRow(r) {
            document.getElementById("titulos").deleteRow(r);
        }

        function deleteCertificadoRow(r) {
            document.getElementById("certificados").deleteRow(r);
        }

        function deleteHistorialRow(r) {
            document.getElementById("historial").deleteRow(r);
        }

        function submitEdit() {
            $editForm = $('#editEmp');
            $.ajax({
                //$editForm.ajaxComplete({
                url: $editForm.attr('action'),
                type: 'POST',
                //dataType: 'json',
                data: $editForm.serializeArray(),
                success: function (result) {
                    console.log(result);
                    //HABILIDADES
                    var habilidadesNew = document.getElementsByName("habilidad");
                    var habilidadesData = [];
                    for (var i = 0; i < habilidadesNew.length; i++) {
                        if (habilidadesNew[i].value.trim().length !== 0) {
                            habilidadesData.push(habilidadesNew[i].value);
                        }
                    }

                    //TITULOS
                    var institutosNew = document.getElementsByName("institucion");
                    var titulacionNew = document.getElementsByName("titulacion");
                    var titfechasNew = document.getElementsByName("titfecha");
                    var institutosData = [];
                    var titulacionData = [];
                    var titfechasData = [];
                    for (var i = 0; i < institutosNew.length; i++) {
                        if (institutosNew[i].value.trim().length !== 0) {
                            institutosData.push(institutosNew[i].value);
                            titulacionData.push(titulacionNew[i].value);
                            titfechasData.push(titfechasNew[i].value);
                        }
                    }

                    //CERTIFICADO
                    var organizacionesNew = document.getElementsByName("organizacion");
                    var certificacionNew = document.getElementsByName("certificacion");
                    var cerfechasNew = document.getElementsByName("cerfecha");
                    var organizacionesData = [];
                    var certificacionData = [];
                    var cerfechasData = [];
                    for (var i = 0; i < organizacionesNew.length; i++) {
                        if (organizacionesNew[i].value.trim().length !== 0) {
                            organizacionesData.push(organizacionesNew[i].value);
                            certificacionData.push(certificacionNew[i].value);
                            cerfechasData.push(cerfechasNew[i].value);
                        }
                    }

                    //HISTORIAL
                    var hispuestosNew = document.getElementsByName("hispuesto");
                    var hisfechasNew = document.getElementsByName("hisfecha");
                    var hissalarioNew = document.getElementsByName("hissalario");
                    var hispuestosData = [];
                    var hisfechasData = [];
                    var hissalarioData = [];
                    for (var i = 0; i < hispuestosNew.length; i++) {
                        if (hispuestosNew[i].value.trim().length !== 0) {
                            hispuestosData.push(hispuestosNew[i].value);
                            hisfechasData.push(hisfechasNew[i].value);
                            hissalarioData.push(hissalarioNew[i].value);
                        }
                    }

                    document.getElementById("departamentodis").innerHTML =
                            document.getElementsByName("departamento")[0].value;

                    document.getElementById("puestodis").innerHTML =
                            document.getElementsByName("puesto")[0].value;

                    document.getElementById("fechadis").innerHTML =
                            document.getElementsByName("fecha")[0].value;

                    document.getElementById("vacacionesdis").innerHTML =
                            document.getElementsByName("vacaciones")[0].value;

                    document.getElementById("teldis").innerHTML =
                            document.getElementsByName("tel")[0].value;

                    document.getElementById("emaildis").innerHTML =
                            document.getElementsByName("email")[0].value;

                    document.getElementById("calledis").innerHTML =
                            document.getElementsByName("calle")[0].value;

                    document.getElementById("numerodis").innerHTML =
                            document.getElementsByName("numero")[0].value;

                    document.getElementById("ciudaddis").innerHTML =
                            document.getElementsByName("ciudad")[0].value;

                    document.getElementById("estadodis").innerHTML =
                            document.getElementsByName("estado")[0].value;

                    document.getElementById("codigodis").innerHTML =
                            document.getElementsByName("codigo")[0].value;

                    closeEdit();

                    var habilidades = document.getElementById("habilidades");
                    for (var i = 0; i < habilidadesData.length; i++) {
                        var row = habilidades.insertRow(-1);
                        var cell1 = row.insertCell(0);
                        cell1.innerHTML = "<h3>" + habilidadesData[i] + "</h3>";
                    }

                    console.log(habilidadesData);

                    var titulos = document.getElementById("titulos");
                    for (var i = 0; i < institutosData.length; i++) {
                        var row = titulos.insertRow(-1);
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        cell1.innerHTML = institutosData[i];
                        cell2.innerHTML = titulacionData[i];
                        cell3.innerHTML = titfechasData[i];
                    }

                    console.log(institutosData);
                    console.log(titulacionData);
                    console.log(titfechasData);

                    var certificados = document.getElementById("certificados");
                    for (var i = 0; i < organizacionesData.length; i++) {
                        var row = certificados.insertRow(-1);
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        cell1.innerHTML = organizacionesData[i];
                        cell2.innerHTML = certificacionData[i];
                        cell3.innerHTML = cerfechasData[i];
                    }

                    console.log(organizacionesData);
                    console.log(certificacionData);
                    console.log(cerfechasData);

                    var historial = document.getElementById("historial");
                    for (var i = 0; i < hispuestosData.length; i++) {
                        var row = historial.insertRow(-1);
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        cell1.innerHTML = hispuestosData[i];
                        cell2.innerHTML = hisfechasData[i];
                        cell3.innerHTML = hissalarioData[i];
                    }

                    console.log(hispuestosData);
                    console.log(hisfechasData);
                    console.log(hissalarioData);
                }
            });
        }
    </script>
</body>
<%@ include file="footer.jsp"%>
