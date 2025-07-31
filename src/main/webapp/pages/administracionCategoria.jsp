<%--
    Document   : administracionCategoria
    Created on : 29 jul 2025, 11:25:43
    Author     : bradley oliva
--%>
<%@page import="model.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- ELIMINAR O COMENTAR LA SIGUIENTE LÍNEA CUANDO SE USE UN MODELO REAL: --%>
<%-- <%@page import="model.Categoria" %> --%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administración de Categorías - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet"> <%-- Añadido para los íconos --%>
        <style>
            .navbar-brand img {
                border-radius: 8px;
            }
            .table-responsive {
                margin-top: 20px;
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

        <main class="container mt-5">
            <div class="main-header">
                <a href="<%= request.getContextPath() %>/pages/admin_dashboard.jsp" class="btn btn-danger">
                    <i class="bi bi-arrow-left-circle"></i> Volver al Panel
                </a>
                <h1 class="mb-0">Administración de Categorías</h1>
                <a href="<%= request.getContextPath() %>/pages/agregarCategoria.jsp" class="btn btn-success">
                    <i class="bi bi-plus-circle"></i> Agregar Categoría
                </a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID Categoría</th>
                            <th>Nombre Categoría</th>
                            <th>Descripción</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        List<Categoria> lista = (List<Categoria>) request.getAttribute("listaCategoria");
                        if (lista != null && !lista.isEmpty()) {
                            for (Categoria cate : lista) {
                        %>
                        <tr>
                            <td><%= cate.getIdCategoria() %></td>
                            <td><%= cate.getNombreCategoria() %></td>
                            <td><%= cate.getDescripcion() %></td>
                            <td><%= cate.getEstado() %></td>

                            <td>
                                <a href="CategoriaServlet?accion=editar&id=<%= cate.getIdCategoria() %>" class="btn btn-warning btn-sm">
                                    <i class="bi bi-pencil-square"></i> Editar
                                </a>
                                <a href="CategoriaServlet?accion=eliminar&id=<%= cate.getIdCategoria() %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar esta categoría?');">
                                    <i class="bi bi-trash"></i> Eliminar
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr><td colspan="5" class="text-center">No hay Categorías registradas.</td></tr>
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