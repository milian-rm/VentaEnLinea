<%--
    Document   : administracionUsuarios
    Created on : 28 jul 2025, 17:29:03
    Author     : Marcos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="java.util.List, model.Usuario" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administración de Usuarios - GuitarKinal</title>
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

        <main class="container mt-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <%-- Botón "Volver al Panel" --%>
                <a href="<%= request.getContextPath() %>/pages/admin_dashboard.jsp" class="btn btn-danger me-auto">Volver al Panel</a>
                <h1 class="mb-0">Administración de Usuarios</h1>
                <a href="agregarUsuario.jsp" class="btn btn-success ms-auto">Agregar Usuario</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Email</th>
                            <th>Teléfono</th>
                            <th>Dirección</th>
                            <th>Fecha Registro</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- colspan ajustado para incluir la nueva columna de Fecha Registro --%>
                        <%-- Aquí se mostrarán los usuarios de la base de datos (cuando se conecte)Estos son ejemplos. --%>
                        <tr>
                            <td>1</td>
                            <td>Juan</td>
                            <td>Pérez</td>
                            <td>juan.perez@example.com</td>
                            <td>555-1234</td>
                            <td>Calle Falsa 123, Ciudad</td>
                            <td>2024-07-28 10:00:00</td>
                            <td>
                                <a href="editarUsuario.jsp?id=1" class="btn btn-warning btn-sm">Editar</a>
                                <a href="ServletUsuarios?accion=eliminar&id=1" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar a este usuario?')">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>María</td>
                            <td>González</td>
                            <td>maria.gonzalez@example.com</td>
                            <td>555-5678</td>
                            <td>Avenida Siempre Viva 456, Pueblo</td>
                            <td>2024-07-27 15:30:00</td>
                            <td>
                                <a href="editarUsuario.jsp?id=2" class="btn btn-warning btn-sm">Editar</a>
                                <a href="ServletUsuarios?accion=eliminar&id=2" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar a este usuario?')">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <%-- The colspan for this row should be 8 to cover all columns including the actions. --%>
                            <td colspan="8" class="text-center text-muted">Aquí se mostrarán los usuarios de la base de datos. Estos son ejemplos.</td>
                        </tr>
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