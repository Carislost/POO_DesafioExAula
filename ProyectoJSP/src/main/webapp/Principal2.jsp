<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 13/10/2023
  Time: 05:54 p. m.
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
    <title>Gestión de Categorías </title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/font-awesome.min.css">
    <script src="js/jquery-3.2.1.slim.min.js"></script>
    <script src="js/bootstrap1.min.js"></script>
</head>
<body>
<jsp:include page="menu.jsp"/>
<h1 class="text-center">Gestión de Categorías</h1>
<h2 class="text-center">
    Bienvenido: <%=usuario%>
</h2>
<div class="container">
    <div style="padding: 0;">
        <%
            st = conexion.prepareStatement("SELECT id, usuario FROM Usuarios");
            rs = st.executeQuery();
        %>
        <form role="form" action="categoriaController.jsp" method="POST">
            <div class="col-md-12" id="conten">
                <input type="hidden" value="insertar" name="operacion" id="operacion">
                <div class="form-group">
                    <label for="nombre">Nombre de la Categoría:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingresa el nombre" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <div class="input-group">
                        <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Descripción de la categoría" required></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fecha_creacion">Fecha de Creación:</label>
                    <div class="input-group">
                        <input type="date" class="form-control" id="fecha_creacion" name="fecha_creacion" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="creado_por">Creado Por:</label>
                    <div class="input-group">
                        <select name="creado_por" id="creado_por" class="form-control" required>
                            <%
                                // Aquí vamos a llenar el combobox con los usuarios de la base de datos
                                PreparedStatement stUsuarios = conexion.prepareStatement("SELECT id, usuario FROM Usuarios");
                                ResultSet rsUsuarios = stUsuarios.executeQuery();
                                while (rsUsuarios.next()) {
                            %>
                            <option value="<%=rsUsuarios.getInt("id")%>"><%=rsUsuarios.getString("usuario")%></option>
                            <%
                                }
                                rsUsuarios.close();
                            %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <div class="input-group">
                        <select name="estado" id="estado" class="form-control" required>
                            <option value="Activo">Activo</option>
                            <option value="Inactivo">Inactivo</option>
                        </select>
                    </div>
                </div>
                <div style="margin-left: 30%;">
                    <input type="submit" class="btn btn-success col-md-6 " value="Guardar">
                </div>
            </div>
        </form>
        <%
            if(request.getParameter("exito") != null){
                System.out.println("<div class='alert alert-success' role='alert'>Operacion realizada con exito</div>");
            }
        %>
    </div>
    <jsp:include page="consultaCategorias.jsp"/>
</div>
</body>
</html>
