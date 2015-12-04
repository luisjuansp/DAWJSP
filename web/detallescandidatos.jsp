<%-- 
    Document   : detallescandidatos.jsp
    Created on : Dec 2, 2015, 7:01:32 PM
    Author     : fofo
--%>

<%@page import="beans.Candidate"%>
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
    <div id="container" class='container'>

        <div class='jumbotron'>
            <center>
                <div class="text-right">
                    <button class="displayer btn btn-info" onclick="startEdit()">Edit</button>
                    <button class="editer btn btn-success" onclick="submitEdit()">Submit</button>
                    <button class="editer btn btn-warning" onclick="closeEdit()">Cancel</button>
                    <button class="displayer btn btn-danger" onclick="contratar()">Contratar!</button>
                </div>
                <h1><%= candidato.getNombreCand()%></h1> 
                <br> <br>
                <div class="container">
                    <div class="panel panel-success">
                        <div class="panel-info"> 
                            <h2>Datos Generales</h2> 
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-6 text-left">
                                <h3>
                                    <u>Nomina:</u>
                                    <span class="displayer" >
                                        <%=candidato.getIdCand()%>
                                    </span>
                                    <input type="number" class="editer" name="nomina" value="<%=candidato.getIdCand()%>" form="editCand">
                                    <br>
                                    <br>
                                    <u>Telefono:</u> 
                                    <span class="displayer" >
                                        <%=candidato.getTelCand()%>
                                    </span>
                                    <input type="text" class="editer" name="tel" value="<%=candidato.getTelCand()%>" form="editCand">
                                    <br> 
                                    <br>
                                    <u>E-mail:</u> 
                                    <span class="displayer" >
                                        <%=candidato.getEmailCand()%>
                                    </span>
                                    <input type="email" class="editer" name="email" value="<%=candidato.getEmailCand()%>" form="editCand">
                                    <br>
                                    <br>
                                    <u>Paga esperada:</u> 
                                    <span class="displayer" >
                                        <%=candidato.getExpectEconCand()%>
                                    </span>
                                    <input type="paga" class="editer" name="paga" value="<%=candidato.getExpectEconCand()%>" form="editCand">
                                    <br>
                                </h3>
                            </div>
                            <div class="col-lg-6 text-left">
                                <h3>     
                                    <br>
                                    <u>Direccion:</u>
                                    <br>
                                    <br>
                                    <span class="displayer" >
                                        <%=candidato.getCalle()%> 
                                    </span>
                                    <input type="text" class="editer" name="calle" value="<%=candidato.getCalle()%>" form="editCand">
                                    <span class="displayer" >
                                        #<%=candidato.getNumero()%>
                                    </span>
                                    <input type="number" class="editer" name="numero" value="<%=candidato.getNumero()%>" form="editCand">
                                    <br> 
                                    <br>
                                    <span class="displayer" >
                                        <%=candidato.getCiudad()%>
                                    </span>
                                    <input type="text" class="editer" name="ciudad" value="<%=candidato.getCiudad()%>" form="editCand">
                                    <span class="displayer" >
                                        , <%=candidato.getEstado()%>
                                    </span>
                                    <input type="text" class="editer" name="estado" value="<%=candidato.getEstado()%>" form="editCand">
                                    <br> 
                                    <br>
                                    <span class="displayer" >
                                        <%=candidato.getCodigo()%>
                                    </span>
                                    <input type="number" class="editer" name="codigo" value="<%=candidato.getCodigo()%>" form="editCand">
                                    <br> 
                                </h3> 
                            </div>
                        </div> 
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-info">
                        <h2> Habilidades </h2> 
                    </div>
                    <div class="panel-body">
                        <table id="habilidades" class ='table table-striped table-hover text-center'> 
                            <% for (int i = 0; i < candidato.getHabilidades().size(); i++) {%>
                            <tr>
                                <td><h3><%=candidato.getHabilidades().get(i)%></h3></td> 
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>
                <div class="panel panel-success">
                    <div class="panel-info">
                        <h2> Titulos </h2> 
                    </div>
                    <div class="panel-body">
                        <table id="titulos" class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Institucion</th>
                                <th class="text-center">Titulacion</th>
                                <th class="text-center">Fecha</th>
                            </tr>
                            <% for (int i = 0; i < candidato.getTitulos().size(); i++) {%>
                            <tr>
                                <td><%=candidato.getTitulos().get(i).getInstituto()%></td> 
                                <td><%=candidato.getTitulos().get(i).getTitulacion()%></td>
                                <td><%=candidato.getTitulos().get(i).getFecha()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div> 
                </div>
                <div class="panel panel-success">
                    <div class="panel-info">
                        <h2> Certificados </h2> 
                    </div>
                    <div class="panel-body">
                        <table id="certificados" class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Organizacion</th>
                                <th class="text-center">Certificacion</th>
                                <th class="text-center">Fecha</th>
                            </tr>
                            <% for (int i = 0; i < candidato.getCertificados().size(); i++) {%>
                            <tr>
                                <td><%=candidato.getCertificados().get(i).getOrganizacion()%></td> 
                                <td><%=candidato.getCertificados().get(i).getCertificacion()%></td>
                                <td><%=candidato.getCertificados().get(i).getFecha()%></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
                <div class="panel panel-success">
                    <div class="panel-info">
                        <h2> Entrevista con otras compañias </h2> 
                    </div>
                    <div class="panel-body">
                        <table id="companias" class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Compañia</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Interes</th>
                            </tr>
                            <% for (int i = 0; i < candidato.getCompanias().size(); i++) {%>
                            <tr>
                                <td><%=candidato.getCompanias().get(i).getCompa()%></td> 
                                <td><%=candidato.getCompanias().get(i).getStatus()%></td>
                                <td><%=candidato.getCompanias().get(i).getInteres()%></td>
                            </tr>
                            <%}%>
                        </table> 
                    </div>
                </div>
                        <div class="panel panel-success">
                    <div class="panel-info">
                        <h2> Trabajos Anteriores </h2> 
                    </div>
                    <div class="panel-body">
                        <table id="trabajos" class ='sortable table table-striped table-hover text-center'> 
                            <tr>
                                <th class="text-center">Empresa</th>
                                <th class="text-center">Puesto</th>
                                <th class="text-center">Fecha Entrada</th>
                                <th class="text-center">Fecha Salida</th>
                                <th class="text-center">Salario</th>
                            </tr>
                            <% for (int i = 0; i < candidato.getTrabajos().size(); i++) {%>
                            <tr>
                                <td><%=candidato.getTrabajos().get(i).getEmpresa()%></td> 
                                <td><%=candidato.getTrabajos().get(i).getPuesto()%></td>
                                <td><%=candidato.getTrabajos().get(i).getEntrada()%></td>
                                <td><%=candidato.getTrabajos().get(i).getSalida()%></td>
                                <td><%=candidato.getTrabajos().get(i).getSalario()%></td>
                            </tr>
                            <%}%>
                        </table> 
                    </div>
                </div>
                        
            </center>
        </div>
    </div>  
    <form id="editCand" action="getCandidates" method="post">
        <input type="hidden" name="button" value="editCand" />
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
        var companiasSize;
        var addedComp;
        var trabajoSize;
        var addedTrab;

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
            cell1.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"habilidad\" form=\"editCand\">";
            cell2.innerHTML = "<button class=\"btn btn-info\" onclick=\"addRowHabilidades()\">+</button>";
        }

        function addRowTitulos() {
            var titulos = document.getElementById("titulos");
            var row = titulos.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            cell1.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"institucion\" form=\"editCand\">";
            cell2.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"titulacion\" form=\"editCand\">";
            cell3.innerHTML = "<input type=\"date\" class=\"form-control\" name=\"titfecha\" form=\"editCand\">";
            cell4.innerHTML = "<button class=\"btn btn-info\" onclick=\"addRowTitulos()\">+</button>";
        }

        function addRowCertificados() {
            var certificados = document.getElementById("certificados");
            var row = certificados.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            cell1.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"organizacion\" form=\"editCand\">";
            cell2.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"certificacion\" form=\"editCand\">";
            cell3.innerHTML = "<input type=\"date\" class=\"form-control\" name=\"cerfecha\" form=\"editCand\">";
            cell4.innerHTML = "<button class=\"btn btn-info\" onclick=\"addRowCertificados()\">+</button>";
        }

        function addRowCompanias() {
            var historial = document.getElementById("companias");
            var row = historial.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            cell1.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"compania\" form=\"editCand\">";
            cell2.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"status\" form=\"editCand\">";
            cell3.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"interes\" form=\"editCand\">";
            cell4.innerHTML = "<button class=\"btn btn-info\" onclick=\"addRowCompanias()\">+</button>";
        }
        
        function addRowTrabajos() {
            var historial = document.getElementById("trabajos");
            var row = historial.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            var cell6 = row.insertCell(5);
            cell1.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"empresa\" form=\"editCand\">";
            cell2.innerHTML = "<input type=\"text\" class=\"form-control\" name=\"puesto\" form=\"editCand\">";
            cell3.innerHTML = "<input type=\"date\" class=\"form-control\" name=\"entrada\" form=\"editCand\">";
            cell4.innerHTML = "<input type=\"date\" class=\"form-control\" name=\"salida\" form=\"editCand\">";
            cell5.innerHTML = "<input type=\"number\" class=\"form-control\" name=\"salario\" form=\"editCand\">";
            cell6.innerHTML = "<button class=\"btn btn-info\" onclick=\"addRowTrabajos()\">+</button>";
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
            //Compañias
            var companias = document.getElementById("companias");
            companiasSize = companias.rows.length;
            addedComp = 1;
            addRowCompanias();
            //Trabajos
            var trabajos = document.getElementById("trabajos");
            trabajosSize = trabajos.rows.length;
            addedTrab = 1;
            addRowTrabajos();
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

            var companias = document.getElementById("companias");
            for (var i = companias.rows.length - 1; i >= companiasSize; i--) {
                deleteCompaniasRow(i);
            }
            
            var trabajos = document.getElementById("trabajos");
            for (var i = trabajos.rows.length - 1; i >= trabajosSize; i--) {
                deleteTrabajosRow(i);
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

        function deleteCompaniasRow(r) {
            document.getElementById("companias").deleteRow(r);
        }
        
        function deleteTrabajosRow(r) {
            document.getElementById("trabajos").deleteRow(r);
        }

        function submitEdit() {
            $editForm = $('#editCand');
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

                    //COMPAÑIAS
                    var companiaNew = document.getElementsByName("compania");
                    var statusNew = document.getElementsByName("status");
                    var interesNew = document.getElementsByName("interes");
                    var companiaData = [];
                    var statusData = [];
                    var interesData = [];
                    for (var i = 0; i < companiaNew.length; i++) {
                        if (companiaNew[i].value.trim().length !== 0) {
                            companiaData.push(companiaNew[i].value);
                            statusData.push(statusNew[i].value);
                            interesData.push(interesNew[i].value);
                        }
                    }
                    
                    //TRABAJOS
                    var empresaNew = document.getElementsByName("empresa");
                    var puestoNew = document.getElementsByName("puesto");
                    var entradaNew = document.getElementsByName("entrada");
                    var salidaNew = document.getElementsByName("salida");
                    var salarioNew = document.getElementsByName("salario");
                    var empresaData = [];
                    var puestoData = [];
                    var entradaData = [];
                    var salidaData = [];
                    var salarioData = [];
                    for (var i = 0; i < empresaNew.length; i++) {
                        if (empresaNew[i].value.trim().length !== 0) {
                            empresaData.push(empresaNew[i].value);
                            puestoData.push(puestoNew[i].value);
                            entradaData.push(entradaNew[i].value);
                            salidaData.push(salidaNew[i].value);
                            salarioData.push(salarioNew[i].value);
                        }
                    }

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

                    
                }
            });
        }
    </script>
    <form id="getDetalle" action="getCandidates" method="post">
            <input type="hidden" name="button" value="contratar" />
        </form>

        <script>
            function contratar() {
                document.getElementById("getDetalle").submit();
            }
        </script>
</body>
<%@ include file="footer.jsp"%>
