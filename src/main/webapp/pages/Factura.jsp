<%-- 
    Document   : Facturs
    Created on : 8/08/2025, 10:52:08
    Author     : Bradley Oliva
--%>

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
                <a class="navbar-brand" href="../menuPrincipal.jsp">
                    <img src="../image/logo.png" alt="Logo" height="90">
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
            <div class="factura-container">
                <div class="factura-header">
                    <div class="emisor-info">
                        <h6>GUITARKINAL</h6>
                        <p><strong>Nit Emisor:</strong> 14945428</p>
                    </div>
                    <div class="autorizacion-info text-end">
                        <h6>NÚMERO DE AUTORIZACIÓN:</h6>
                        <p>TEXTO MUY LARGO DE AUTORIZACIÓN</p>
                        <h6>Serie: 9ADA8CEF Número de DTE:</h6>
                        <p>TEXTO DE SERIE Y DTE</p>
                        <p><strong>Fecha y hora de emisión:</strong> 22-mar-2025 19:45:35</p>
                    </div>
                </div>

                <div class="receptor-info">
                    <div class="row">
                        <div class="col-6">
                            <h6>Nombre Receptor:</h6>
                            <p>NOMBRE DEL COMPRADOR</p>
                        </div>
                        <div class="col-6">
                            <h6>Dirección comprador:</h6>
                            <p>CIUDAD, GUATEMALA, GUATEMALA</p>
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
                            <tr>
                                <td>1</td>
                                <td>Guitarra Eléctrica (Ejemplo)</td>
                                <td>1</td>
                                <td>Q1500.00</td>
                                <td>Q1500.00</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Cuerdas de Guitarra (Ejemplo)</td>
                                <td>2</td>
                                <td>Q50.00</td>
                                <td>Q100.00</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
                <div class="d-flex justify-content-end mt-4">
                    <div class="pe-5">
                        <p><strong>SUBTOTAL:</strong></p>
                        <p><strong>TOTAL:</strong></p>
                    </div>
                    <div class="pe-5">
                        <p>Q1600.00</p>
                        <p><strong>Q1600.00</strong></p>
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