<%-- 
    Document   : Login
    Created on : Nov 6, 2015, 12:48:50 PM
    Author     : fofo
--%>

<jsp:include page="header.jsp" flush="true">
    <jsp:param name="pageTitle" value="Login" />
</jsp:include>
<body>
    <%
        session.setAttribute("login", null);
        Boolean login = (Boolean) session.getAttribute("login");
        if (login != null) {
            if (login == false) {
    %>
    <%="Por favor intenta de nuevo"%>
    <%        } else {
                response.sendRedirect("index.jsp");
            }
        }
    %>
    <br>
    <div class="container-fluid">
        <div class="jumbotron">
            <center>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <form action="getLogin" method="post">
                            <table cellspacing="5" border="0">
                                <tr>
                                    <td align="right" style="vertical-align: middle;"><label>Username:&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                                    <td><input type="text" class="form-control" name="username" placeholder="Username" required></td>
                                </tr>
                                <tr>
                                    <td align="right"><label>Password:&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                                    <td><input type="password" class="form-control" name="password" placeholder="password" required></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="text-center"><br><input type="submit" class="btn btn-success" value="Submit"></td>
                                </tr>
                            </table>
                        </form>   
                    </div>
                </div>
            </center>
        </div>
    </div>
</body>
</html>
