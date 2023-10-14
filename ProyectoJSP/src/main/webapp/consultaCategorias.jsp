<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 13/10/2023
  Time: 07:54 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="conexion.jsp" %>
<div class="">
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Estado</th>
            <th>Fecha de Creación</th>
            <th>Creado Por</th>
            <th>Eliminar</th>
            <th>Modificar</th>
        </tr>
        </thead>
        <tbody>
        <%
            st = conexion.prepareStatement("SELECT c.id_categorias, c.nombre, c.descripcion, c.estado, c.fecha_creacion, u.usuario AS creado_por FROM Categorias c LEFT JOIN Usuarios u ON c.creado_por = u.id");
            rs = st.executeQuery();
            while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("id_categorias")%></td>
            <td><%=rs.getString("nombre")%></td>
            <td><%=rs.getString("descripcion")%></td>
            <td><%=rs.getString("estado")%></td>
            <td><%=rs.getString("fecha_creacion")%></td>
            <td><%=rs.getString("creado_por")%></td>
            <td><button class="btn btn-danger"
                        onclick="alerta('<%=rs.getString("id_categorias")%>')">Eliminar</button></td>
            <td><button class="btn btn-info"
                        onclick="modificar('<%=rs.getString("id_categorias")%>',
                                '<%=rs.getString("nombre")%>',
                                '<%=rs.getString("descripcion")%>',
                                '<%=rs.getString("estado")%>',
                                '<%=rs.getString("fecha_creacion")%>',
                                '<%=rs.getString("creado_por")%>')">Modificar</button>
            </td>
        </tr>
        <%
            }
            conexion.close();
        %>
        </tbody>
    </table>
</div>
<script>
    function alerta(id)
    {
        var mensaje;
        var opcion = confirm("¿Está seguro de eliminar esta categoría?");
        if (opcion == true) {
            location.href ="categoriaController.jsp?operacion=eliminar&id="+id;
        }
    }
    function modificar(id, nombre, descripcion, estado, fecha_creacion, creado_por)
    {
        document.getElementById("id_categorias").value = id;
        document.getElementById("nombre").value = nombre;
        document.getElementById("descripcion").value = descripcion;
        document.getElementById("estado").value = estado;
        document.getElementById("fecha_creacion").value = fecha_creacion;
        document.getElementById("creado_por").value = creado_por;
        document.getElementById("operacion").value = "modificar";
        location.href ="categoriaController.jsp?operacion=modificar";
    }
</script>
