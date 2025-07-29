<%--
    Document   : administracionCategoria
    Created on : 29 jul 2025, 11:25:43
    Author     : bradley oliva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- ELIMINAR O COMENTAR LA SIGUIENTE LÍNEA CUANDO SE USE UN MODELO REAL: --%>
<%-- <%@page import="model.Categoria" %> --%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administración de Categorías - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <style>
            .navbar-brand img {
                border-radius: 8px;
            }
            .table-responsive {
                margin-top: 20px;
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

        <main class="container mt-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="mb-0">Administración de Categorías</h1>
                <a href="<%= request.getContextPath() %>/pages/agregarCategoria.jsp" class="btn btn-success">Agregar Categoría</a>
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
                        <%-- Ejemplo de una fila de categoría. En un caso real, esto sería dinámico desde la base de datos --%>
                        <tr>
                            <td>1</td>
                            <td>Guitarras Acústicas</td>
                            <td>Variedad de guitarras acústicas para todos los niveles.</td>
                            <td>Activo</td>
                            <td>
                                <a href="<%= request.getContextPath() %>/pages/editarCategoria.jsp?id=1" class="btn btn-warning btn-sm">Editar</a>
                                <a href="<%= request.getContextPath() %>/ServletCategoria?accion=eliminar&id=1" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar esta categoría?')">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Pedales de Efectos</td>
                            <td>Amplia selección de pedales para transformar el sonido.</td>
                            <td>Activo</td>
                            <td>
                                <a href="<%= request.getContextPath() %>/pages/editarCategoria.jsp?id=2" class="btn btn-warning btn-sm">Editar</a>
                                <a href="<%= request.getContextPath() %>/ServletCategoria?accion=eliminar&id=2" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar esta categoría?')">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Cuerdas</td>
                            <td>Cuerdas de alta calidad para guitarras eléctricas y acústicas.</td>
                            <td>Inactivo</td>
                            <td>
                                <a href="<%= request.getContextPath() %>/pages/editarCategoria.jsp?id=3" class="btn btn-warning btn-sm">Editar</a>
                                <a href="<%= request.getContextPath() %>/ServletCategoria?accion=eliminar&id=3" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar esta categoría?')">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" class="text-center">Aquí se mostrarán las categorías de la base de datos (cuando se conecte). Estos son ejemplos.</td>
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