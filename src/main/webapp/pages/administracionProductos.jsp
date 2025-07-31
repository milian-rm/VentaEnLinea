<%--
    Document   : administracion
    Created on : 28 jul 2025, 15:40:00
    Author     : Bradley Oliva
--%>

<%@page import="model.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administración de Productos - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <style>
            .table-responsive {
                margin-top: 20px;
            }
            /* Added for navbar brand image styling */
            .navbar-brand img {
                border-radius: 8px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-danger px-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">
                    <img src="<%= request.getContextPath() %>/image/logo.png" alt="Logo" height="90">
                </a>
                <div class="container mt-1 text-center text-light text-start" style="margin-left: 6rem;">
                    <p class="fs-4"><strong><h2>Bienvenido a tienda GuitarKinal</h2></strong></p>
                </div>

            </div>
        </nav>

        <main class="container mt-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <%-- Botón "Volver al Panel" --%>
                <a href="<%= request.getContextPath() %>/pages/admin_dashboard.jsp" class="btn btn-danger me-auto">Volver al Panel</a>
                <h1 class="mb-0">Administración de Productos</h1>
                <a href="<%= request.getContextPath() %>/pages/agregarProducto.jsp" class="btn btn-success ms-auto">Agregar Producto</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Código</th>
                            <th>Categoría</th>
                            <th>Marca</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Fecha Creación</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Producto> lista = (List<Producto>) request.getAttribute("listaProducto");
                            if (lista != null && !lista.isEmpty()) {
                                for (Producto p : lista) {
                                System.out.println(p);
                        %>
                        <tr>
                            <td><%= p.getIdProducto() %></td>
                            <td><%= p.getCategoria() %></td>
                            <td><%= p.getProveedor() %></td>
                            <td><%= p.getNombreProducto() %></td>
                            <td><%= p.getDescripcionProducto()%></td>
                            <td><%= p.getPrecio() %></td>
                            <td><%= p.getStock() %></td>
                            <td><%= p.getFechaCreacion() %></td>
                            <td>
                                <a href="ProductoServlet?accion=editar&id=<%= p.getIdProducto()%>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="ProductoServlet?accion=eliminar&id=<%= p.getIdProducto()%>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de eliminar este usuario?');">Eliminar</a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr><td colspan="9">No hay usuarios registrados.</td></tr>
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