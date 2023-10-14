<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 10/10/2023
  Time: 11:53 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="conexion.jsp" %>

<%
    String operacion = request.getParameter("operacion");

    if ("Registrarse".equals(operacion)) {
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        try {
            st = conexion.prepareStatement("INSERT INTO Usuarios(usuario, contrasenia) VALUES (?, SHA2(?,256))");
            st.setString(1, usuario);
            st.setString(2, password);
            st.executeUpdate();

            response.sendRedirect("login.html");
        } catch (SQLException e) {
            System.out.println("<h2>Error al registrar el usuario: " + e.getMessage() + "</h2>");
            System.out.println("<a href='registro.html'>Volver al registro</a>");
        }
    }
%>