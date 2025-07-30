<%--
    Document   : administracionDetalleCompra
    Created on : 28 jul 2025, 18:48:15
    Author     : Marcos
--%>

<%@page import="model.DetalleCompra"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administración de Detalles de Compra - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <style>
            .table-responsive {
                margin-top: 20px;
            }
            .navbar-brand img {
                border-radius: 8px;
            }
            .btn-sm {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-danger px-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">
                    <img src="<%= request.getContextPath() %>/image/logo.png" alt="Logo GuitarKinal" height="90">
                </a>
                <div class="container mt-1 text-center text-light text-start" style="margin-left: 6rem;">
                    <p class="fs-4"><strong><h2>Bienvenido a tienda GuitarKinal</h2></strong></p>
                </div>
            </div>
        </nav>

        <%-- Contenido Principal: Tabla de Detalles de Compra --%>
        <main class="container mt-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <%-- Botón "Volver al Panel" --%>
                <a href="<%= request.getContextPath() %>/pages/admin_dashboard.jsp" class="btn btn-danger me-auto">Volver al Panel</a>
                <h1 class="mb-0">Administración de Detalles de Compra</h1>
                <a href="<%= request.getContextPath() %>/pages/agregarDetalleCompra.jsp" class="btn btn-success ms-auto">Agregar Detalle de Compra</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID Detalle</th>
                            <th>ID Orden</th>
                            <th>ID Producto</th>
                            <th>Cantidad</th>
                            <th>Precio Unitario</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<DetalleCompra> lista = (List<DetalleCompra>) request.getAttribute("listaDetalle");
                            if (lista != null && !lista.isEmpty()) {
                                for (DetalleCompra d : lista) {
                                System.out.println(lista);
                        %>
                        <tr>
                            <td><%= d.getIdDetalleOrden() %></td>
                            <td><%= d.getCompra() %></td>
                            <td><%= d.getProducto() %></td>
                            <td><%= d.getCantidad() %></td>
                            <td><%= d.getPrecioUnitario() %></td>
                            <td>
                                <a href="DetalleServlet?accion=editar&id=<%= d.getIdDetalleOrden()%>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="DetalleServlet?accion=eliminar&id=<%= d.getIdDetalleOrden()%>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de eliminar este usuario?');">Eliminar</a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr><td colspan="6">No hay detalles de compra registrados.</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </main>

        <footer class="bg-dark text-white text-center py-3 mt-auto">
            Tienda de Guitarras. Todos los derechos reservados.
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>