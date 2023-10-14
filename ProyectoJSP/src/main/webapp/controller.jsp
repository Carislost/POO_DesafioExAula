<%--
  Created by IntelliJ IDEA.
  User: UDB
  Date: 30/9/2023
  Time: 12:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpSession" %><%@ include file="conexion.jsp" %>
<html>
<head>
    <title>Controlador de Productos y Sesión</title>
</head>
<body>
<h1>Manejando Productos y Sesión</h1>
<%
    HttpSession session_actual = request.getSession(true);
    String operacion = request.getParameter("operacion");
    System.out.println(operacion);

    if (operacion.equals("salir")) {
        session_actual.setAttribute("USER", null);
        response.sendRedirect("login.html");

    } else if (operacion.equals("logueo")) {
        try {
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");

            st = conexion.prepareStatement("SELECT count(usuario), usuario FROM Usuarios WHERE usuario= ? AND contrasenia=SHA2(?,256)");
            st.setString(1, usuario);
            st.setString(2, password);
            rs = st.executeQuery();
            rs.next();

            if (rs.getInt(1) == 1) { //solo una coincidencia es permitida
                session_actual.setAttribute("USER", usuario);
                response.sendRedirect("principal.jsp");
            } else {
                response.sendRedirect("login.html");
            }
            rs.close();
            conexion.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        } else if (operacion.equals("insertar")) {
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    double precio = Double.parseDouble(request.getParameter("precio"));
    double costo = Double.parseDouble(request.getParameter("costo"));

    st = conexion.prepareStatement("INSERT INTO Productos(nombre, descripcion, precio, costo) VALUES (?, ?, ?, ?)");
    st.setString(1, nombre);
    st.setString(2, descripcion);
    st.setDouble(3, precio);
    st.setDouble(4, costo);
    st.executeUpdate();

    response.sendRedirect("principal.jsp?exito=si");

    } else if (operacion.equals("modificar")) {
    int id_productos = Integer.parseInt(request.getParameter("id_productos"));
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    double precio = Double.parseDouble(request.getParameter("precio"));
    double costo = Double.parseDouble(request.getParameter("costo"));

    st = conexion.prepareStatement("UPDATE Productos SET nombre=?, descripcion=?, precio=?, costo=? WHERE id_productos=?");
    st.setString(1, nombre);
    st.setString(2, descripcion);
    st.setDouble(3, precio);
    st.setDouble(4, costo);
    st.setInt(5, id_productos);
    st.executeUpdate();

    response.sendRedirect("principal.jsp?exito=si");

    }  else if (operacion.equals("eliminar")) {

        String idProductosStr = request.getParameter("id");
        if (idProductosStr == null || idProductosStr.trim().isEmpty()) {
            System.out.println("<h2>Error: ID de producto no proporcionado</h2>");
            System.out.println("<a href='principal.jsp'>Volver</a>");
            return;
        }
        int id_productos = Integer.parseInt(idProductosStr);

        try {
            st = conexion.prepareStatement("DELETE FROM Productos WHERE id_productos=?");
            st.setInt(1, id_productos);
            st.executeUpdate();
            response.sendRedirect("principal.jsp?exito=si");
        } catch (SQLException e) {
            System.out.println("<h2>Error al eliminar el producto: " + e.getMessage() + "</h2>");
            System.out.println("<a href='principal.jsp'>Volver</a>");
        }
    }
%>
</body>
</html>