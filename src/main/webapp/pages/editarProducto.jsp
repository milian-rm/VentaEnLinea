<%--
    Document   : editarProducto
    Created on : 28 jul 2025, 16:04:00
    Author     : Bradley Oliva
--%>

<%@page import="model.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- Importa tu clase Producto si ya la tienes definida, para pre-llenar los campos --%>
<%-- Ejemplo: <%@page import="model.Producto" %> --%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Producto - GuitarKinal</title>
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
                        <a href="administracion.jsp" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de Productos</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <%-- Contenido Principal: Formulario de Editar Producto --%>
        <main class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <h1 class="mb-4 text-center">Editar Producto</h1> <%-- Título cambiado a "Editar Producto" --%>
                    <%-- El formulario enviará los datos al ServletEditarProducto para actualizar el producto --%>
                    <%
                    Producto p = (Producto) request.getAttribute("listaProducto");
                    %>
                    <form action="<%= request.getContextPath() %>/ProductoServlet" method="post"> 

                        <input type="hidden" name="accion" value="actualizar">

                        <input type="hidden" name="id" value="<%= p.getIdProducto() %>">
                       


                        <div class="mb-3">
                            <label for="nombreProducto" class="form-label">Nombre del Producto: </label>
                          
                            <input type="text" id="nombreProducto" name="nombreProducto" class="form-control" value="<%= p.getNombreProducto() %>" required>
                        </div>
                        <div class="mb-3">
                            <label for="descripcionProducto" class="form-label">Descripción: </label>
                            <input id="descripcionProducto" name="descripcionProducto" class="form-control" value="<%= p.getDescripcionProducto()%>">
                        </div>
                        <div class="mb-3">
                            <label for="precio" class="form-label">Precio: </label>
                            <input type="number" id="precio" name="precio" class="form-control" step="0.01" min="0" value="<%= p.getPrecio()%>">
                        </div>
                        <div class="mb-3">
                            <label for="stock" class="form-label">Stock: </label>
                            <input type="number" id="stock" name="stock" class="form-control" min="0" value="<%= p.getStock()%>">
                        </div>
                        <div class="mb-3">
                            <label for="idCategoria" class="form-label">Categoría: </label>
                            <input type="text" id="categoria" name="idCategoria" class="form-control" value="<%= p.getCategoria() %>">
                        </div>
                        <div class="mb-3">
                            <label for="idProveedor" class="form-label">Marca: </label>
                            <input type="text" id="marca" name="idProveedor" class="form-control" value="<%= p.getProveedor() %>">
                        </div>
                        
                        <%-- Botones de acción --%>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success btn-lg">Guardar Cambios</button> <%-- Texto del botón cambiado --%>
                            <%-- El botón Cancelar regresa a la página de administración de productos --%>
                            <a href="<%= request.getContextPath() %>/ProductoServlet?accion=listar" class="btn btn-secondary btn-lg">Cancelar</a>
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