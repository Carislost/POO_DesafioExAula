<%--
  Created by IntelliJ IDEA.
  User: UDB
  Date: 30/9/2023
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>For JSP</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <h3>Tablas de multiplicar</h3>
    </div>
        <%
 for (int i = 1; i <= 10; i++) {
 %>
    <div class="card">
        <div class="card-header"><%="Tabla del " + i%>
        </div>
        <ul class="list-group list-group-flush">
            <%
                for (int j = 1; j <= 10; j++) {
                    System.out.println("<li class='list-group-item'>" + i + " x " + j + " = " + (i * j) + "</li>");
                }//Cerrando el for más interno
            %>
        </ul>
    </div>
    <% }//Cerrando el for más externo
    %>
</div>
</body>
</html>
