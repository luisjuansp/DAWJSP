<%-- 
    Document   : navbar
    Created on : Dec 1, 2015, 12:52:05 PM
    Author     : lsanchez
--%>

<nav class="navbar navbar-default navbar-static-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header ">
            <a class="navbar-brand">Human Capital System</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <%String active = (String) request.getParameter("active");%>
                <li <%
                    if (active.equals("1")) {
                        out.print("class=\"active\"");
                    }
                    %> ><a href="#" onclick="getCandidates()"><span>Candidatos</span></a></li>
                <li <%
                    if (active == "2") {
                        out.print("class=\"active\"");
                    }
                    %> ><a href="#"><span>Entrevistas</span></a></li>
                <li <%
                    if (active == "3") {
                        out.print("class=\"active\"");
                    }
                    %> ><a href="#"  onclick="getEmpleados()"><span>Empleados</span></a></li>
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
