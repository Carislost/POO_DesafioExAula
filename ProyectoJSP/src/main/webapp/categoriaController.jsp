<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 10/10/2023
  Time: 11:42 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="jakarta.servlet.http.HttpSession" %><%@ include file="conexion.jsp" %>
<html>
<head>
    <title>Controlador de Categorías y Sesión</title>
</head>
<body>
<h1>Manejando Categorías y Sesión</h1>
<%
    HttpSession session_actual = request.getSession(true);
    String operacion = request.getParameter("operacion");
    System.out.println(operacion);

//    if (operacion.equals("salir")) {
//        session_actual.setAttribute("USER", null);
//        response.sendRedirect("login.html");
//
//    } else if (operacion.equals("logueo")) {
//        try {
//            String usuario = request.getParameter("usuario");
//            String password = request.getParameter("password");
//
//            st = conexion.prepareStatement("SELECT count(usuario), usuario FROM Usuarios WHERE usuario= ? AND contrasenia=SHA2(?,256)");
//            st.setString(1, usuario);
//            st.setString(2, password);
//            rs = st.executeQuery();
//            rs.next();
//
//            if (rs.getInt(1) == 1) {
//                session_actual.setAttribute("USER", usuario);
//                response.sendRedirect("Principal2.jsp");
//            } else {
//                response.sendRedirect("login.html");
//            }
//            rs.close();
//            conexion.close();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }

    if (operacion.equals("insertar")) {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String fecha_creacion = request.getParameter("fecha_creacion");
        String estado = request.getParameter("estado");
        int creado_por = Integer.parseInt(request.getParameter("creado_por"));

        st = conexion.prepareStatement("INSERT INTO Categorias(nombre, descripcion, fecha_creacion, estado, creado_por) VALUES (?, ?, ?, ?, ?)");
        st.setString(1, nombre);
        st.setString(2, descripcion);
        st.setString(3, fecha_creacion);
        st.setString(4, estado);
        st.setInt(5, creado_por);
        st.executeUpdate();

        response.sendRedirect("Principal2.jsp?exito=si");

    } else if (operacion.equals("modificar")) {
        int id_categorias = Integer.parseInt(request.getParameter("id_categorias"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String fecha_creacion = request.getParameter("fecha_creacion");
        String estado = request.getParameter("estado");
        int creado_por = Integer.parseInt(request.getParameter("creado_por"));


        st = conexion.prepareStatement("UPDATE Categorias SET nombre=?, descripcion=?, fecha_creacion=?, estado=?, creado_por=? WHERE id_categorias=?");

        st.setString(1, nombre);
        st.setString(2, descripcion);
        st.setString(3, fecha_creacion);
        st.setString(4, estado);
        st.setInt(5, creado_por);
        st.setInt(6, id_categorias);
        st.executeUpdate();

        response.sendRedirect("Principal2.jsp?exito=si");

    } else if (operacion.equals("eliminar")) {
        String idCategoriasStr = request.getParameter("id");
        if (idCategoriasStr == null || idCategoriasStr.trim().isEmpty()) {
            System.out.println("<h2>Error: ID de categoría no proporcionado</h2>");
            System.out.println("<a href='Principal2.jsp'>Volver</a>");
            return;
        }
        int id_categorias = Integer.parseInt(idCategoriasStr);

        try {
            st = conexion.prepareStatement("DELETE FROM Categorias WHERE id_categorias=?");
            st.setInt(1, id_categorias);
            st.executeUpdate();
            response.sendRedirect("Principal2.jsp?exito=si");
        } catch (SQLException e) {
            System.out.println("<h2>Error al eliminar la categoría: " + e.getMessage() + "</h2>");
            System.out.println("<a href='Principal2.jsp'>Volver</a>");
        }
    }
%>
</body>
</html>
