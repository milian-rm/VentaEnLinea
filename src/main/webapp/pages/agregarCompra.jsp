<%--
    Document   : agregarCompra
    Created on : 29/07/2025, 09:10:00
    Author     : Bradley Oliva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Agregar Compra - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    <body>
        <%-- Barra de Navegación Superior --%>
        <nav class="navbar navbar-dark bg-danger px-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">
                    <img src="<%= request.getContextPath() %>/image/logo.png" alt="Logo" height="90">
                </a>
                <div class="container mt-1 text-center text-light text-start" style="margin-left: 6rem;">
                    <p class="fs-4"><strong><h2>Bienvenido a tienda GuitarKinal</h2></strong></p>
                </div>
                <button class="btn btn-outline-light" type="button" data-bs-toggle="offcanvas" data-bs-target="#menuPrincipal" aria-controls="menuPrincipal">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>

        <%-- Menú Desplegable (Offcanvas) --%>
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
                        <strong class="text-danger">Administración</strong>
                        <ul class="list-unstyled ps-3 mt-2">
                            <li><a href="<%= request.getContextPath() %>/pages/administracionProductos.jsp" class="text-danger text-decoration-none">Productos</a></li>
                            <li><a href="<%= request.getContextPath() %>/pages/administracionCompras.jsp" class="text-danger text-decoration-none">Compras</a></li>
                            <li><a href="<%= request.getContextPath() %>/pages/administracionDetalleCompra.jsp" class="text-danger text-decoration-none">Detalle Compras</a></li>
                            <li><a href="<%= request.getContextPath() %>/pages/administracionProveedor.jsp" class="text-danger text-decoration-none">Proveedores</a></li>
                            <li><a href="<%= request.getContextPath() %>/pages/administracionUsuarios.jsp" class="text-danger text-decoration-none">Usuarios</a></li>
                            <li><a href="<%= request.getContextPath() %>/pages/administracionCategoria.jsp" class="text-danger text-decoration-none">Categorias</a></li>
                            <li><a href="<%= request.getContextPath() %>/pages/administracionRecibo.jsp" class="text-danger text-decoration-none">Recibo</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

        <%-- Contenido Principal: Formulario de Agregar Compra --%>
        <main class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <h1 class="mb-4 text-center">Agregar Nueva Compra</h1>
                    <%-- El formulario enviará los datos al ServletAgregarCompra para guardar la compra --%>
                    <form action="ServletAgregarCompra" method="post">
                        <%-- Campo oculto para indicar al servlet la acción a realizar --%>
                        <input type="hidden" name="accion" value="insertar">

                        <div class="mb-3">
                            <label for="idUsuario" class="form-label">ID Usuario:</label>
                            <%-- Idealmente, este campo podría ser un select dinámico con IDs de usuarios existentes --%>
                            <input type="text" id="idUsuario" name="idUsuario" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="fechaCompra" class="form-label">Fecha de Compra:</label>
                            <%-- Usamos datetime-local para fecha y hora. El valor inicial puede ser la fecha y hora actual. --%>
                            <input type="datetime-local" id="fechaCompra" name="fechaCompra" class="form-control" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(new java.util.Date()) %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="totalCompra" class="form-label">Total:</label>
                            <input type="number" id="totalCompra" name="totalCompra" class="form-control" step="0.01" min="0" required>
                        </div>
                        <div class="mb-3">
                            <label for="estadoCompra" class="form-label">Estado:</label>
                            <select id="estadoCompra" name="estadoCompra" class="form-select" required>
                                <option value="Pendiente" selected>Pendiente</option>
                                <option value="Completada">Completada</option>
                                <option value="Enviado">Enviado</option>
                                <option value="Cancelada">Cancelada</option>
                            </select>
                        </div>

                        <%-- Botones de acción --%>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success btn-lg">Guardar Compra</button>
                            <%-- El botón Cancelar regresa a la página de administración de compras --%>
                            <a href="<%= request.getContextPath() %>/pages/administracionCompras.jsp" class="btn btn-secondary btn-lg">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>

        <%-- Pie de Página (Footer) --%>
        <footer class="bg-dark text-white text-center py-3 mt-5">
            Tienda de Guitarras. Todos los derechos reservados.
        </footer>

        <%-- Script de Bootstrap para funcionalidades --%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>