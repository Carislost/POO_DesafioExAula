<%--
  Created by IntelliJ IDEA.
  User: UDB
  Date: 30/9/2023
  Time: 12:27
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
            <th>Precio</th>
            <th>Costo</th>
            <th>Eliminar</th>
            <th>Modificar</th>
        </tr>
        </thead>
        <tbody>
        <%
            st = conexion.prepareStatement("SELECT * FROM Productos");
            rs = st.executeQuery();
            while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("id_productos")%>
            </td>
            <td><%=rs.getString("nombre")%>
            </td>
            <td><%=rs.getString("descripcion")%>
            </td>
            <td><%=rs.getString("precio")%>
            </td>
            <td><%=rs.getString("costo")%>
            </td>
            <td><button class="btn btn-danger"
                        onclick="alerta('<%=rs.getString("id_productos")%>')">Eliminar</button></td>
            <td><button class="btn btn-info"
                        onclick="modificar('<%=rs.getString("id_productos")%>','<%=rs.getString("nombre")%>','<%=rs.getString("descripcion")%>','<%=rs.getString("precio")%>','<%=rs.getString("costo")%>')" >Modificar</button></td>
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
        var opcion = confirm("Esta seguro de eliminar este producto");
        if (opcion == true) {
            location.href ="controller.jsp?operacion=eliminar&id="+id;
        }
    }
    function modificar(id, nombre, descripcion, precio, costo)
    {
        var elem = document.getElementById("id_categorias");
        if (elem) {
            elem.value = id;
        } else {
            console.error("Elemento id_categorias no encontrado");
        }
        document.getElementById("nombre").value=nombre;
        document.getElementById("descripcion").value=descripcion;
        document.getElementById("precio").value=precio;
        document.getElementById("costo").value=costo;
        document.getElementById("operacion").value="modificar";
        hijo = document.getElementById("passhidden");
        padre = hijo.parentNode;
        padre.removeChild(hijo);
    }
</script>