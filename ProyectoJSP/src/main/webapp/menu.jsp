<%--
  Created by IntelliJ IDEA.
  User: UDB
  Date: 30/9/2023
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession session_actual = request.getSession(false);
    String usuario = (String) session_actual.getAttribute("USER");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" role="navigation">
    <div class="container">
        <a class="navbar-brand" href="#">Supermercado</a>
        <button class="navbar-toggler border-0" type="button" data-toggle="collapse" datatarget="#exCollapsingNavbar">
            &#9776;
        </button>
        <div class="collapse navbar-collapse" id="exCollapsingNavbar">
            <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
                <li class="dropdown order-2">
                    <button type="button" id="dropdownMenu2" data-toggle="dropdown" class="btn btn-outline-secondary dropdown-toggle">
                        Formularios
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right mt-2">
                        <a class="dropdown-item" href="principal.jsp">Productos</a>
                        <a class="dropdown-item" href="Principal2.jsp">Categorias</a>
                    </ul>
                </li>
                <li class="dropdown order-1">
                    <button type="button" id="dropdownMenu1" data-toggle="dropdown"
                            class="btn btn-outline-secondary dropdown-toggle"><i class="fa fauser"></i> <%=usuario%>
                        <span class="caret"></span></button>
                    <ul class="dropdown-menu dropdown-menu-right mt-2">
                        <a class="dropdown-item" href="controller.jsp?operacion=salir"><i class="fa fa-sign-out"></i> Logout</a>
            </ul>
            </li>
            </ul>
        </div>
    </div>
</nav>