<%--
    Document   : administracionRecibo
    Created on : 29/07/2025, 09:07:13
    Author     : informatica
--%>

<%@page import="model.Recibo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <%@page import="java.util.List, model.Recibo" %> --%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administración de Recibos - GuitarKinal</title>
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


        <%-- Contenido Principal: Tabla de Recibos --%>
        <main class="container mt-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <%-- Botón "Volver al Panel" --%>
                <a href="<%= request.getContextPath() %>/pages/admin_dashboard.jsp" class="btn btn-danger me-auto">Volver al Panel</a>
                <h1 class="mb-0">Administración de Recibos</h1>
                <a href="<%= request.getContextPath() %>/pages/agregarRecibo.jsp" class="btn btn-success ms-auto">Agregar Recibo</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID Recibo</th>
                            <th>ID Orden</th>
                            <th>Fecha Recibo</th>
                            <th>Total</th>
                            <th>Método de Pago</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Recibo> lista = (List<Recibo>) request.getAttribute("listaRecibo");
                            if (lista != null && !lista.isEmpty()) {
                                for (Recibo r : lista) {
                                System.out.println(lista);
                        %>
                        <tr>
                            <td><%= r.getIdProveedor() %></td>
                            <td><%= r.getIdOrden() %></td>
                            <td><%= r.getFechaRecibo() %></td>
                            <td><%= r.getTotal() %></td>
                            <td><%= r.getMetodoPago() %></td>
                            <td>
                                <a href="ReciboServlet?accion=editar&id=<%= r.getIdProveedor() %>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="ReciboServlet?accion=eliminar&id=<%= r.getIdProveedor()%>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de eliminar este usuario?');">Eliminar</a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr><td colspan="6">No hay recibos registrados.</td></tr>
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