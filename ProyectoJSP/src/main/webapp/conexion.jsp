<%--
  Created by IntelliJ IDEA.
  User: UDB
  Date: 30/9/2023
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection conexion =null;
    //private Statement s =null;
    ResultSet rs=null;
    PreparedStatement st =null;
    Class.forName("com.mysql.jdbc.Driver");
// Se obtiene una conexión con la base de datos.
    conexion =
            DriverManager.getConnection("jdbc:mysql://localhost/Misuper", "root", "");
    String valor;
%>
