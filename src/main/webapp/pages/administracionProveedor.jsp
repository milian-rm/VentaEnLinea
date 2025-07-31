<%-- 
    Document   : administracionProveedor
    Created on : 29/07/2025, 08:01:51
    Author     : informatica
--%>
<%@page import="model.Proveedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- <%@page import="java.util.List, model.Proveedor" %> --%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Administración de Proveedores - GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
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
            .main-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }
            .main-header h1 {
                flex-grow: 1;
                text-align: center;
                margin: 0;
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

        <%-- Contenido Principal: Tabla de Proveedores --%>
        <main class="container mt-5">
            <div class="main-header">
                <%-- Botón "Volver al Panel" agregado a la izquierda --%>
                <a href="<%= request.getContextPath() %>/pages/admin_dashboard.jsp" class="btn btn-danger">
                    <i class="bi bi-arrow-left-circle"></i> Volver al Panel
                </a>
                <h1 class="mb-0">Administración de Proveedores</h1>
                <%-- Botón "Agregar Proveedor" agregado a la derecha --%>
                <a href="<%= request.getContextPath() %>/pages/agregarProveedor.jsp" class="btn btn-success">
                    <i class="bi bi-plus-circle"></i> Agregar Proveedor
                </a>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Contacto</th>
                            <th>Teléfono</th>
                            <th>Email</th>
                            <th>Dirección</th>
                            <th>País Origen</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Proveedor> lista = (List<Proveedor>) request.getAttribute("listaProveedor");
                            if (lista != null && !lista.isEmpty()) {
                               for (Proveedor pro : lista) {
                                // System.out.println(lista); // Línea de depuración, se recomienda quitar en producción
                        %>
                        <tr>
                            <td><%= pro.getIdProveedor() %></td>
                            <td><%= pro.getNombreProveedor() %></td>
                            <td><%= pro.getContacto() %></td>
                            <td><%= pro.getTelefono() %></td>
                            <td><%= pro.getEmail() %></td>
                            <td><%= pro.getDireccion() %></td>
                            <td><%= pro.getPaisOrigen() %></td>
                            <td><%= pro.getEstado()%></td>
                            <td>
                                <a href="ProveedorServlet?accion=editar&id=<%= pro.getIdProveedor()%>"class="btn btn-warning btn-sm">
                                    <i class="bi bi-pencil-square"></i> Editar
                                </a>
                                <a href="ProveedorServlet?accion=eliminar&id=<%= pro.getIdProveedor()%>" class="btn btn-danger btn-sm" onclick="return confirm('¿Desea eliminar a este proveedor?');">
                                    <i class="bi bi-trash"></i> Eliminar
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>        
                        <tr><td colspan="9" class="text-center">No hay Proveedores registrados.</td></tr>
                        <% } %>
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
