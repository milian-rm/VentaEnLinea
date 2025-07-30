<%-- 
    Document   : administracionUsuarios
    Created on : 28 jul 2025, 17:29:03
    Author     : Marcos
--%>

<%@page import="model.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page import="java.util.List, model.Usuario" %>--%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Administración de Usuarios - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
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
                <a class="navbar-brand" href="<%= request.getContextPath()%>/index.jsp">
                    <img src="<%= request.getContextPath()%>/image/logo.png" alt="Logo GuitarKinal" height="90">
                </a>
                <div class="container mt-1 text-center text-light text-start" style="margin-left: 6rem;">
                    <p class="fs-4"><strong><h2>Bienvenido a tienda GuitarKinal</h2></strong></p>
                </div>
                <button class="btn btn-outline-light" type="button" data-bs-toggle="offcanvas" data-bs-target="#menuPrincipal" aria-controls="menuPrincipal">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>

        <div class="offcanvas offcanvas-end" tabindex="-1" id="menuPrincipal" aria-labelledby="menuLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="menuLabel">Menú</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Cerrar"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <strong class="text-danger">Guitarras</strong>
                        <ul class="list-unstyled ps-3 mt-2">
                            <li><a href="#" class="text-danger text-decoration-none">Acústicas</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Eléctricas</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Electroacústicas</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Clásicas</a></li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <strong class="text-danger">Accesorios</strong>
                        <ul class="list-unstyled ps-3 mt-2">
                            <li><a href="#" class="text-danger text-decoration-none">Cuerdas</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Afinadores</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Estuches</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Pedales</a></li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <strong class="text-danger">Nosotros</strong>
                        <ul class="list-unstyled ps-3 mt-2">
                            <li><a href="#" class="text-danger text-decoration-none">Visión</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Misión</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Valores</a></li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <a href="administracionProductos.jsp" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de Productos</strong>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="administracionUsuarios.jsp" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de Usuarios</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <main class="container mt-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="mb-0">Administración de Usuarios</h1>
                <a href="${pageContext.request.contextPath}/pages/agregarUsuario.jsp" class="btn btn-success">Agregar Usuario</a>
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
                            <th>Rol</th>
                            <th>NIT</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Usuario> lista = (List<Usuario>) request.getAttribute("listaUsuario");
                            if (lista != null && !lista.isEmpty()) {
                                for (Usuario u : lista) {
                        %>
                        <%-- colspan ajustado para incluir la nueva columna de Fecha Registro --%>
                        <%-- Aquí se mostrarán los usuarios de la base de datos (cuando se conecte)Estos son ejemplos. --%>
                        <tr>
                            <td><%= u.getIdUsuario()%></td>
                            <td><%= u.getNombre()%></td>
                            <td><%= u.getApellido()%></td>
                            <td><%= u.getCorreo()%></td>
                            <td><%= u.getTelefono()%></td>
                            <td><%= u.getDireccion()%></td>
                            <td><%= u.getFechaRegistro()%></td>
                            <td><%= u.getRol()%></td>
                            <td><%= u.getNit()%></td>
                            <td>
                                <a href="ServletUsuario?accion=editar&id=<%= u.getIdUsuario()%>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="ServletUsuario?accion=eliminar&id=<%= u.getIdUsuario()%>" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar a este usuario?')">Eliminar</a>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                        <tr>
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