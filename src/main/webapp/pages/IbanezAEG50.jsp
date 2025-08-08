<%-- 
    Document   : FenderCD-60SCE
    Created on : 4/08/2025, 8:49:31 a. m.
    Author     : Angel Rodriguez
--%>

<%@page import="model.Producto"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="web.ServletCarrito"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>IbanezAEG50 | Tienda en Línea</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <style>
            *{
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f5f5f5;
                color: #333;
            }

            header {
                background-color: #1e1e2f;
                color: white;
                padding: 20px;
                text-align: center;
                font-size: 1.5rem;
            }

            .producto-container {
                display: flex;
                max-width: 1200px;
                margin: 40px auto;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
                padding: 40px;
                gap: 40px;
            }

            .producto-imagen {
                flex: 1;
            }

            .producto-imagen img {
                width: 100%;
                max-height: 500px;
                object-fit: contain;
                border-radius: 10px;
            }

            .producto-detalles {
                flex: 1;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }

            .producto-detalles h1 {
                font-size: 55px;
                margin-bottom: 10px;
            }

            .descripcion {
                font-size: 30px;
                color: #555;
                margin-bottom: 20px;
            }

            .proveedor {
                font-size: 25px;
                color: #888;
                margin-bottom: 15px;
            }

            .categoria {
                font-size: 20px;
                color: #999;
                margin-bottom: 15px;
            }

            .precio {
                font-size: 40px;
                color: #d63384;
                margin-bottom: 10px;
            }

            .stock {
                font-size: 25px;
                color: #666;
                margin-bottom: 25px;
            }

            .compra-form {
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .compra-form input[type="number"] {
                width: 70px;
                padding: 8px;
                font-size: 1rem;
            }

            .compra-form button {
                padding: 10px 20px;
                font-size: 1rem;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .compra-form button:hover {
                background-color: #218838;
            }

            footer {
                text-align: center;
                padding: 30px;
                color: #777;
                background-color: #f0f0f0;
                margin-top: 60px;
            }

            @media (max-width: 768px) {
                .producto-container {
                    flex-direction: column;
                    padding: 20px;
                }
            }

            .btn-regresar {
                background-color: #dc3545;
                /* Rojo Bootstrap */
                color: white;
                border: 2px solid #dc3545;
                transition: all 0.3s ease;
            }

            .btn-regresar:hover {
                background-color: white;
                color: #dc3545;
                border-color: #dc3545;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-dark bg-danger px-3"> 
            <div class="container-fluid"> 
                <a class="navbar-brand" href="index.jsp"> 
                    <img src="../image/logo.png" alt="Logo" height="90"> 
                </a> 
                <div class="container mt-1 text-center text-light text-start" style="margin-left: 6rem;">
                    <p class="fs-4"><strong><h2>Guitarras Electroacústicas</h2></strong></p> 
                </div> 
                <a class="navbar-brand" href="CarritoCompra.jsp"> 
                    <img src="../image/carro-de-la-compra(1).png" alt="Logo" height="60"> 
                </a> 
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

        <div class="container mt-4">
            <a href="../pages/guitarrasElectroacusticas.jsp"><button class="btn btn-regresar">Regresar al menú</button></a>
        </div>

        <section class="producto-container">
            <div class="producto-imagen">
                <img src="../image/Ibanez AEG50.png" alt="IbanezAEG50">
            </div>
            <div class="producto-detalles">
                <div>
                    <%
                        ProductoDAO productoDAO = new ProductoDAO();
                        Producto producto = productoDAO.getProductoById(13);
                        int stock = 0;
                        stock = producto.getStock();
                    %>
                    <h1>Ibanez AEG50</h1>
                    <p class="descripcion">Cuerpo delgado con preamp Ibanez AEQ-TTS</p>
                    <p class="proveedor">Proveedor: Ibanez</p>
                    <p class="categoria">Categoría: Electroacústicas</p>
                    <p class="precio">Q.2600.00 </p>
                    <p class="stock">Stock disponible: <%=stock%> unidades</p>
                </div>

                <form class="compra-form" action="${pageContext.request.contextPath}/ServletCarrito" method="post">
                    <input type="hidden" name="idProducto" value="13">
                    <input type="hidden" name="idCompra" value="${idCompraActiva}">
                    <label for="cantidad">Cantidad:</label>
                    <input type="number" id="cantidad" name="cantidad" min="1" max="<%=stock%>" value="1">
                    <button type="submit">Agregar al carrito</button>
                </form>
            </div>
        </section>

        <footer class="bg-dark text-white text-center py-3">
            Tienda de Guitarras. Todos los derechos reservados.
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>