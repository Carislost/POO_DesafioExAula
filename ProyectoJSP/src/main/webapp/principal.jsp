<%--
  Created by IntelliJ IDEA.
  User: UDB
  Date: 30/9/2023
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ include file="conexion.jsp" %>
<%
    HttpSession session_actual = request.getSession(false);
    String usuario = (String) session_actual.getAttribute("USER");
    String nombres = (String) session_actual.getAttribute("NAME");
    if (usuario == null) {
        response.sendRedirect("login.html");
    }
%>
<html lang="es">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Gestión de Productos</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/font-awesome.min.css">
    <script src="js/jquery-3.2.1.slim.min.js"></script>
    <script src="js/bootstrap1.min.js"></script>
</head>
<body>
<jsp:include page="menu.jsp"/>
<h1 class="text-center">Bienvenido al supermercado</h1>
<h2 class="text-center">Bienvenido: <%=usuario%> </h2>
<div class="container">
    <div style="padding: 0;">
        <form role="form" action="controller.jsp" method="POST">
            <div class="col-md-12" id="conten">
                <input type="hidden" name="id_productos" id="id_productos">
                <input type="hidden" value="insertar" name="operacion" id="operacion">
                <div class="form-group">
                    <label for="nombre">Nombre del Producto:</label>
                    <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre del producto" required>
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <textarea class="form-control" name="descripcion" id="descripcion" placeholder="Descripción del producto" required></textarea>
                </div>
                <div class="form-group">
                    <label for="precio">Precio:</label>
                    <input type="number" step="0.01" class="form-control" name="precio" id="precio" placeholder="Precio" required>
                </div>
                <div class="form-group">
                    <label for="costo">Costo:</label>
                    <input type="number" step="0.01" class="form-control" name="costo" id="costo" placeholder="Costo" required>
                </div>
                <div style="margin-left: 30%;">
                    <input type="submit" class="btn btn-success col-md-6 " value="Guardar">
                </div>
            </div>
        </form>
        <%
            if(request.getParameter("exito") != null){
                System.out.println("<div class='alert alert-success' role='alert'>Operación realizada con éxito</div>");
            }
        %>
    </div>
    <!--notese el uso de jsp:include -->
    <jsp:include page="consulta.jsp"/>
</div>
</body>
</html>

