<%-- 
    Document   : editarUsuario
    Created on : 28 jul 2025, 17:50:10
    Author     : Marcos
--%>

<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <%@page import="model.Usuario" %> --%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Editar Usuario - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" xintegrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <style>
            .navbar-brand img {
                border-radius: 8px;
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
                        <a href="administracion.jsp" class="text-danger text-decoration-none">
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

        <%-- Contenido Principal: Formulario de Editar Usuario --%>
        <main class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <h1 class="mb-4 text-center">Editar Usuario</h1>
                    <%
                        Usuario usu = (Usuario) request.getAttribute("usuarioEditar");
                    %>
                    <form action="ServletUsuario" method="post">
                        <input type="hidden" name="accion" value="actualizar">
                        <input type="hidden" name="id" value="<%= usu.getIdUsuario()%>">

                        <div class="mb-3">
                            <label for="nombreUsuario" class="form-label">Nombre:</label>
                            <input type="text" id="nombre" name="nombre" class="form-control" value="<%=usu.getNombre()%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="apellidoUsuario" class="form-label">Apellido:</label>
                            <input type="text" id="apellido" name="apellido" class="form-control" value="<%=usu.getApellido()%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="emailUsuario" class="form-label">Email:</label>
                            <input type="email" id="emailUsuario" name="emailUsuario" class="form-control" value="<%=usu.getCorreo()%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="telefonoUsuario" class="form-label">Teléfono:</label>
                            <input type="text" id="telefono" name="telefono" class="form-control" value="<%=usu.getTelefono()%>">
                        </div>
                        <div class="mb-3">
                            <label for="direccionUsuario" class="form-label">Dirección:</label>
                            <textarea id="direccionUsuario" name="direccion" class="form-control" rows="3"><%=usu.getDireccion()%></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="nuevaContrasena" class="form-label">Nueva Contraseña:</label>
                            <input type="password" id="contrasena" name="contrasena" class="form-control"value="<%=usu.getContrasena()%>" >
                        </div>
                        <div class="mb-3">
                            <label for="rolUsuario" class="form-label">Rol:</label>
                            <input type="text" id="rol" name="rol" class="form-control" value="<%=usu.getRol()%>" required>
                        </div>
                        <div class="mb-3">
                            <label for="nitUsuario" class="form-label">Nit:</label>
                            <input type="text" id="nit" name="nit" class="form-control" value="<%= usu.getNit()%>" required>
                        </div>

                        <%-- Botones de acción --%>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success btn-lg">Guardar Cambios</button>
                            <a href="ServletUsuario?accion=listar" class="btn btn-secondary btn-lg">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>

        <footer class="bg-dark text-white text-center py-3 mt-5">
            Tienda de Guitarras. Todos los derechos reservados.
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
