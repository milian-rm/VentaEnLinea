<%-- 
    Document   : editarRecibo
    Created on : 29/07/2025, 09:29:42
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <%@page import="model.Recibo" %> --%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Editar Recibo - GuitarKinal</title>
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
                        <a href="administracion.jsp" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de Productos</strong>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="administracionUsuarios.jsp" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de Usuarios</strong>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="administracionDetalleCompra.jsp" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de Detalles de Compra</strong>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="administracionProveedor.jsp" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de Proveedores</strong>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="administracionRecibo.jsp" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de Recibos</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <%-- Contenido Principal: Formulario de Editar Recibo --%>
        <main class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5">
                    <h1 class="mb-4 text-center">Editar Recibo</h1>
                    <%-- El formulario enviará los datos al ServletRecibo para actualizar el recibo --%>
                    <form action="ServletRecibo" method="post">
                        <input type="hidden" name="accion" value="actualizar">
                        <input type="hidden" name="idRecibo" value="1">

                        <div class="mb-3">
                            <label for="idOrden" class="form-label">ID Orden:</label>
                            <input type="number" id="idOrden" name="idOrden" class="form-control" value="101" min="1" required>
                        </div>
                        <div class="mb-3">
                            <label for="fechaRecibo" class="form-label">Fecha Recibo:</label>
                            <%-- La fecha de recibo se muestra pero no es editable directamente en este formulario.
                                 En un caso real, el value vendría de un objeto Recibo cargado de la base de datos --%>
                            <input type="text" id="fechaRecibo" name="fechaRecibo" class="form-control" value="2024-07-28 11:00:00" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="total" class="form-label">Total:</label>
                            <input type="number" id="total" name="total" class="form-control" step="0.01" min="0" value="599.98" required>
                        </div>
                        <div class="mb-3">
                            <label for="metodoPago" class="form-label">Método de Pago:</label>
                            <select id="metodoPago" name="metodoPago" class="form-select" required>
                                <option value="">Seleccione un método</option>
                                <option value="Tarjeta" selected>Tarjeta</option>
                                <option value="Efectivo">Efectivo</option>
                            </select>
                        </div>

                        <%-- Botones de acción --%>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-success btn-lg">Guardar Cambios</button>
                            <a href="administracionRecibo.jsp" class="btn btn-secondary btn-lg">Cancelar</a>
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
