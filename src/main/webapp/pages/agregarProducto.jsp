<%--
    Document   : agregarProducto
    Created on : 28 jul 2025, 16:04:00
    Author     : Bradley Oliva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%
    // Obtener la fecha y hora actual de Guatemala
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
    String currentDateTime = now.format(formatter);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Agregar Producto - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    <body>
        <%-- Barra de Navegación Superior --%>
        <nav class="navbar navbar-dark bg-danger px-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp"><img src="<%= request.getContextPath() %>/image/logo.png" alt="Logo" height="90"></a>
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

        <%-- Contenido Principal: Formulario de Agregar Producto --%>
        <main class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <h1 class="mb-4 text-center">Agregar Nuevo Producto</h1>
                    <%-- El formulario enviará los datos al ServletAgregarProducto para guardar el producto --%>
                    <form action="ServletAgregarProducto" method="post">
                        <%-- Campo oculto para indicar al servlet la acción a realizar --%>
                        <input type="hidden" name="accion" value="insertar">

                        <div class="mb-3">
                            <label for="nombreProducto" class="form-label">Nombre del Producto:</label>
                            <input type="text" id="nombreProducto" name="nombreProducto" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="descripcionProducto" class="form-label">Descripción:</label>
                            <textarea id="descripcionProducto" name="descripcionProducto" class="form-control" rows="3"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="precio" class="form-label">Precio:</label>
                            <input type="number" id="precio" name="precio" class="form-control" step="0.01" min="0" required>
                        </div>
                        <div class="mb-3">
                            <label for="stock" class="form-label">Stock:</label>
                            <input type="number" id="stock" name="stock" class="form-control" min="0" required>
                        </div>
                        
                        <%-- Nuevos campos basados en la tabla Productos --%>
                        <div class="mb-3">
                            <label for="idCategoria" class="form-label">ID Categoría:</label>
                            <%-- Podrías considerar un <select> aquí para seleccionar de categorías existentes --%>
                            <input type="number" id="idCategoria" name="idCategoria" class="form-control" min="1" required>
                        </div>
                        <div class="mb-3">
                            <label for="idProveedor" class="form-label">ID Proveedor:</label>
                            <%-- Podrías considerar un <select> aquí para seleccionar de proveedores existentes --%>
                            <input type="number" id="idProveedor" name="idProveedor" class="form-control" min="1" required>
                        </div>
                        <div class="mb-3">
                            <label for="fechaCreacion" class="form-label">Fecha de Creación:</label>
                            <%-- Usamos type="datetime-local" para una mejor UX si el navegador lo soporta.
                                 El valor por defecto será la fecha y hora actual de Guatemala. --%>
                            <input type="datetime-local" id="fechaCreacion" name="fechaCreacion" class="form-control" value="<%= currentDateTime %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="marca" class="form-label">Marca:</label>
                            <input type="text" id="marca" name="marca" class="form-control">
                        </div>
                        <div class="mb-3">
                            <label for="imagen" class="form-label">URL de la Imagen:</label>
                            <input type="text" id="imagen" name="imagen" class="form-control">
                        </div>

                        <%-- Botones de acción --%>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success btn-lg">Guardar Producto</button>
                            <%-- El botón Cancelar ahora regresa a la página de administración de productos --%>
                            <a href="<%= request.getContextPath() %>/pages/administracionProductos.jsp" class="btn btn-secondary btn-lg">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </main>

        <%-- Pie de Página (Footer) --%>
        <footer class="bg-dark text-white text-center py-3 mt-5">
            Tienda de Guitarras. Todos los derechos reservados.
        </footer>

        <%-- Script de Bootstrap para funcionalidades como el menú desplegable --%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>