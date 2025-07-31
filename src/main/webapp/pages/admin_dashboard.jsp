<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.RolUsuario"%>
<%
    // Verificar que el usuario esté logueado y sea administrador
    if (session.getAttribute("idUsuario") == null) {
        response.sendRedirect("../pages/login.jsp?error=acceso_denegado");
        return;
    }
    
    String rolUsuario = (String) session.getAttribute("rol");
    if (!"Admin".equals(rolUsuario)) {
        response.sendRedirect("../menuPrincipal.jsp?error=no_autorizado");
        return;
    }
    
    String nombreAdmin = (String) session.getAttribute("nombre");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administración - GuitarKinal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-danger">
        <div class="container-fluid">
            <a class="navbar-brand" href="../index.jsp">
                <img src="../image/logo.png" alt="Logo" height="50">
                <span class="ms-2">Panel de Administración</span>
            </a>
            <div class="d-flex align-items-center text-white">
                <span class="me-3">Bienvenido, <%= nombreAdmin %></span>
                <a href="../logout" class="btn btn-outline-light btn-sm">
                    <i class="bi bi-box-arrow-right"></i> Cerrar Sesión
                </a>
            </div>
        </div>
    </nav>

    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-md-3 col-lg-2">
                <div class="card">
                    <div class="card-header bg-dark text-white">
                        <h6 class="mb-0"><i class="bi bi-gear"></i> Mantenimientos</h6>
                    </div>
                    <div class="list-group list-group-flush">
                        <a href="administracionUsuarios.jsp" class="list-group-item list-group-item-action">
                            <i class="bi bi-people"></i> Administración de Usuarios
                        </a>
                        <a href="../ProductoServlet?accion=listar" class="list-group-item list-group-item-action">
                            <i class="bi bi-box"></i> Administración de Productos
                        </a>
                        <a href="../DetalleServlet?accion=listar" class="list-group-item list-group-item-action">
                            <i class="bi bi-clipboard-check"></i> Administración de Detalles de Compra
                        </a>
                        <a href="../ReciboServlet?accion=listar" class="list-group-item list-group-item-action">
                            <i class="bi bi-receipt"></i> Administración de Recibos
                        </a>
                        <a href="categorias.jsp" class="list-group-item list-group-item-action">
                            <i class="bi bi-tags"></i> Categorías
                        </a>
                        <a href="../ProveedorServlet?accion=listar" class="list-group-item list-group-item-action">
                            <i class="bi bi-building"></i> Proveedores
                        </a>
                        <a href="compras.jsp" class="list-group-item list-group-item-action">
                            <i class="bi bi-cart"></i> Compras
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md-9 col-lg-10">
                <div class="row">
                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-primary">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h6 class="card-title">Usuarios</h6>
                                        <h4 id="totalUsuarios">-</h4>
                                    </div>
                                    <i class="bi bi-people fs-1"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-success">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h6 class="card-title">Productos</h6>
                                        <h4 id="totalProductos">-</h4>
                                    </div>
                                    <i class="bi bi-box fs-1"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-warning">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h6 class="card-title">Categorías</h6>
                                        <h4 id="totalCategorias">-</h4>
                                    </div>
                                    <i class="bi bi-tags fs-1"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 mb-4">
                        <div class="card text-white bg-info">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <div>
                                        <h6 class="card-title">Proveedores</h6>
                                        <h4 id="totalProveedores">-</h4>
                                    </div>
                                    <i class="bi bi-building fs-1"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0"><i class="bi bi-speedometer2"></i> Accesos Rápidos</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <a href="agregarUsuario.jsp?action=create" class="btn btn-primary w-100">
                                            <i class="bi bi-person-plus"></i><br>
                                            Crear Nuevo Usuario
                                        </a>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <a href="agregarProducto.jsp?action=create" class="btn btn-success w-100">
                                            <i class="bi bi-plus-square"></i><br>
                                            Agregar Producto
                                        </a>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <a href="agregarCategoria.jsp?action=create" class="btn btn-warning w-100">
                                            <i class="bi bi-tag"></i><br>
                                            Nueva Categoría
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mb-0"><i class="bi bi-clock-history"></i> Actividad Reciente</h5>
                            </div>
                            <div class="card-body">
                                <p class="text-muted">Las últimas acciones se mostrarán aquí...</p>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Cargar estadísticas (puedes implementar esto después con AJAX)
        document.addEventListener('DOMContentLoaded', function() {
            // Por ahora valores estáticos, después puedes cargarlos dinámicamente
            document.getElementById('totalUsuarios').textContent = '0';
            document.getElementById('totalProductos').textContent = '0';
            document.getElementById('totalCategorias').textContent = '0';
            document.getElementById('totalProveedores').textContent = '0';
        });
    </script>
</body>
</html>