<%--
    Document   : administracion
    Created on : 28 jul 2025, 15:40:00
    Author     : Bradley Oliva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- ELIMINAR O COMENTAR LA SIGUIENTE LÍNEA: --%>
<%-- <%@page import="model.Producto" %> --%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administración de Productos - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <style>
            .table-responsive {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
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

        <main class="container mt-5">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="mb-0">Administración de Productos</h1>
                <a href="agregarProducto.jsp" class="btn btn-success">Agregar Producto</a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Código</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th>Categoría</th>
                            <th>Marca</th>
                            <th>Fecha Creación</th> <%-- Agregado: Columna para Fecha Creación --%>
                            <th>Imagen</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>101</td>
                            <td>Guitarra Acústica Modelo X</td>
                            <td>Guitarra clásica de madera de abeto, ideal para principiantes.</td>
                            <td>$299.99</td>
                            <td>50</td>
                            <td>Acústicas</td>
                            <td>Yamaha</td>
                            <td>2024-07-28 10:30:00</td> <%-- Ejemplo de Fecha Creación --%>
                            <td><img src="image/Guitarra Acustica.jpg" alt="Producto" style="width: 80px; height: auto;"></td>
                            <td>
                                <a href="editarProducto.jsp?id=101" class="btn btn-warning btn-sm">Editar</a>
                                <a href="eliminarProducto?id=101" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar este producto?')">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>102</td>
                            <td>Pedal Distorsión ZVex</td>
                            <td>Pedal de efectos de alta ganancia, ideal para rock y metal.</td>
                            <td>$129.50</td>
                            <td>25</td>
                            <td>Pedales</td>
                            <td>ZVex</td>
                            <td>2024-07-27 14:00:00</td> <%-- Ejemplo de Fecha Creación --%>
                            <td><img src="image/Pedal de Efectos.jpg" alt="Producto" style="width: 80px; height: auto;"></td>
                            <td>
                                <a href="editarProducto.jsp?id=102" class="btn btn-warning btn-sm">Editar</a>
                                <a href="eliminarProducto?id=102" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar este producto?')">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <%-- colspan ajustado para incluir la nueva columna de Fecha Creación --%>
                            <td colspan="10" class="text-center">Aquí se mostrarán los productos de la base de datos (cuando se conecte)Estos son ejemplos.</td>
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