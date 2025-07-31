<%--
    Document   : administracionCompras
    Created on : 28/07/2025, 15:51:02
    Author     : Bradley Oliva
--%>

<%@page import="model.Compra"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administración de Compras - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet"> <%-- Enlace para los íconos de Bootstrap --%>
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
            .main-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }
            .main-header h1 {
                flex-grow: 1;
                text-align: center;
                margin: 0;
            }
        </style>
    </head>
    <body class="d-flex flex-column min-vh-100">
        <nav class="navbar navbar-dark bg-danger px-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="<%= request.getContextPath()%>/index.jsp">
                    <img src="<%= request.getContextPath()%>/image/logo.png" alt="Logo" height="90">
                </a>
                <div class="container mt-1 text-center text-light text-start" style="margin-left: 6rem;">
                    <p class="fs-4"><strong><h2>Bienvenido a tienda GuitarKinal</h2></strong></p>
                </div>
            </div>
        </nav>


        <main class="container mt-5 flex-grow-1">
            <div class="main-header">
                <%-- Botón "Volver al Panel" --%>
                <a href="<%= request.getContextPath()%>/pages/admin_dashboard.jsp" class="btn btn-danger">
                    <i class="bi bi-arrow-left-circle"></i> Volver al Panel
                </a>
                <h1 class="mb-0">Administración de Compras</h1>
                <%-- Botón "Agregar Nueva Compra" --%>
                <a href="<%= request.getContextPath()%>/pages/agregarCompra.jsp" class="btn btn-success">
                    <i class="bi bi-plus-circle"></i> Agregar Nueva Compra
                </a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID Compra</th>
                            <th>ID Usuario</th>
                            <th>Fecha Compra</th>
                            <th>Total</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Compra> lista = (List<Compra>) request.getAttribute("listaCompra");
                            if (lista != null && !lista.isEmpty()) {
                                for (Compra c : lista) {
                        %>
                        <tr>
                            <td><%= c.getIdOrden()%></td>
                            <td><%= c.getUsuario()%></td>
                            <td><%= c.getFechaOrden()%></td>
                            <td><%= c.getTotalOrden()%></td>
                            <td><%= c.getEstadoOrden()%></td>
                            <td>
                                <a href="ServletCompra?accion=editar&id=<%= c.getIdOrden()%>" class="btn btn-warning btn-sm">
                                    <i class="bi bi-pencil-square"></i> Editar
                                </a>
                                <a href="ServletCompra?accion=eliminar&id=<%= c.getIdOrden()%>" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar esta compra?');">
                                    <i class="bi bi-trash"></i> Eliminar
                                </a>
                            </td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="6" class="text-center text-muted">
                                No hay Compras registradas.
                            </td>
                        </tr>
                        <% }%>
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