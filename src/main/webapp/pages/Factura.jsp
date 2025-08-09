<%-- 
    Document   : Facturs
    Created on : 8/08/2025, 10:52:08
    Author     : Bradley Oliva
--%>

<%@page import="java.util.Random"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="dao.CompraDAO"%>
<%@page import="dao.DetalleCompraDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Factura</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }
            .navbar-red {
                background-color: #dc3545;
            }
            .navbar-brand img {
                height: 90px;
            }
            .navbar-text-white {
                color: white;
            }
            .factura-container {
                max-width: 950px;
                margin: 30px auto;
                padding: 30px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                border: 1px solid #dc3545;
            }
            .factura-header {
                display: flex;
                justify-content: space-between;
                align-items: top;
                margin-bottom: 20px;
            }
            .emisor-info, .autorizacion-info {
                flex: 1;
            }
            .emisor-info h6, .autorizacion-info h6 {
                color: #dc3545;
                margin-bottom: 5px;
            }
            .receptor-info {
                margin-bottom: 20px;
                border-bottom: 1px solid #dc3545;
                border-top: 1px solid #dc3545;
                padding: 15px 0;
            }
            .receptor-info h6 {
                color: #dc3545;
                margin-bottom: 5px;
            }
            .factura-details table {
                width: 100%;
                border-collapse: collapse;
            }
            .factura-details th, .factura-details td {
                padding: 8px;
                border: 1px solid #ddd;
                text-align: left;
            }
            .factura-details thead th {
                background-color: #dc3545;
                color: #fff;
                font-weight: bold;
            }
            .factura-total-section {
                text-align: right;
                margin-top: 20px;
            }
            .factura-total-label {
                font-weight: bold;
                margin-right: 10px;
            }

            /* Estilo para el título de la factura */
            #titulo-factura {
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
            }
        </style>
    </head>
    <body class="bg-light d-flex flex-column min-vh-100">

        <nav class="navbar navbar-dark bg-danger px-3">
            <div class="d-flex align-items-center w-100 position-relative">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/menuPrincipal.jsp">
                    <img src="${pageContext.request.contextPath}/image/logo.png" alt="Logo" height="90">
                </a>
                <div id="titulo-factura" class="text-light">
                    <h2 class="m-0">Factura</h2>
                </div>
                <button class="btn btn-outline-light ms-auto" type="button" data-bs-toggle="offcanvas" data-bs-target="#menuPrincipal" aria-controls="menuPrincipal">
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
                        <strong><a href="" class="text-danger text-decoration-none">Guitarras</a></strong>
                        <ul class="list-unstyled ps-3 mt-2">
                            <li><a href="#" class="text-danger text-decoration-none">Acústicas</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Eléctricas</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Electroacústicas</a></li>
                            <li><a href="#" class="text-danger text-decoration-none">Clásicas</a></li>
                        </ul>
                    </li>
                    <li class="list-group-item">
                        <strong><a href="" class="text-danger text-decoration-none">Accesorios</a></strong>
                    </li>
                    <li class="list-group-item">
                        <strong><a href="acercaDe.jsp" class="text-danger text-decoration-none">Nosotros</a></strong>
                    </li>
                </ul>
            </div>
        </div>

        <main class="flex-grow-1">
            <%
                Random rnd = new Random();

                int numSD = 100000 + rnd.nextInt(900000);
                int numSD2 = 100000 + rnd.nextInt(900000);
                int numOD = 10000000 + rnd.nextInt(90000000);

                Usuario usu = (Usuario) request.getAttribute("usuario");
                String subtotal2 = (String) request.getParameter("subtotal");
                Double total = (Double) request.getAttribute("total");
                String nomComp = usu.getNombre() + " " + usu.getApellido();
            %>
            <div class="factura-container">
                <div class="factura-header">
                    <div class="emisor-info">
                        <h6>GUITARKINAL</h6>
                        <p><strong>Nit Emisor:</strong> <%= usu.getNit()%></p>
                    </div>
                    <div class="autorizacion-info text-end">
                        <h6>NÚMERO DE AUTORIZACIÓN:</h6>
                        <p><%= numSD + "-" + numSD2%></p>
                        <h6>Serie: 9ADA8CEF Número de DTE:</h6>
                        <p>DTE-2025-<%=numOD%></p>
                        <p><strong>Fecha y hora de emisión: </strong><%= new java.util.Date()%></p>
                    </div>
                </div>

                <div class="receptor-info">
                    <div class="row">
                        <div class="col-6">
                            <h6>Nombre Receptor:</h6>
                            <p><%= nomComp%></p>
                        </div>
                        <div class="col-6">
                            <h6>Dirección comprador:</h6>
                            <p><%= usu.getDireccion()%></p>
                        </div>
                    </div>
                </div>

                <div class="factura-details">
                    <table class="table table-sm">
                        <thead>
                            <tr>
                                <th>#No</th>
                                <th>Descripción</th>
                                <th>Cantidad</th>
                                <th>P. Unitario (Q)</th>
                                <th>Total (Q)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int num = 0;
                                DetalleCompraDAO dao = new DetalleCompraDAO();
                                CompraDAO compra = new CompraDAO();
                                int idOrden = compra.getUltimoIdCompra();
                                List<Object[]> carrito = dao.getDetallesCompraPorOrden(idOrden);
                                for (Object[] fila : carrito) {
                                    String nombreProducto = (String) fila[0];
                                    Double precio = (Double) fila[1];
                                    Integer cantidad = (Integer) fila[2];
                                    Double subtotal = (Double) fila[3];
                            %>
                            <tr>
                                <td><%=num++%></td>
                                <td><%= nombreProducto%>)</td>
                                <td><%= cantidad%></td>
                                <td>Q<%= precio%></td>
                                <td>Q<%= subtotal%></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <div class="d-flex justify-content-end mt-4">
                    <div class="pe-5">
                        <p><strong>SUBTOTAL:</strong></p>
                        <p><strong>TOTAL:</strong></p>
                    </div>
                    <div class="pe-5">
                        <p>Q<%= subtotal2%></p>
                        <p><strong>Q<%= total%></strong></p>
                    </div>
                </div>
            </div>
        </main>

        <footer class="bg-dark text-white text-center py-3">
            Tienda de Guitarras. Todos los derechos reservados.
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>