<%-- 
    Document   : CarritoCompra
    Created on : 5/08/2025, 18:15:08
    Author     : josel
--%>

<%@page import="dao.ProductoDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CompraDAO"%>
<%@page import="dao.DetalleCompraDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous"> 
        <style>
        </style>
    </head> 
    <body class="d-flex flex-column min-vh-100"> 

        <nav class="navbar navbar-dark bg-danger px-3"> 
            <div class="container-fluid"> 
                <a class="navbar-brand" href="../menuPrincipal.jsp"> 
                    <img src="../image/logo.png" alt="Logo" height="90"> 
                </a> 
                <div class="container mt-1 text-center text-light text-start" style="margin-left: 6rem;">
                    <p class="fs-4"><strong><h2>Carrito de Compra</h2></strong></p> 
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

            <div class="container-fluid mt-4"> 
                <div class="row gx-3">
                    <div class="col-sm-6">
                        <div class="card rounded-4 flex-grow-1" style="width: 1150px">
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th>Producto</th>
                                            <th>Precio</th>
                                            <th>Cantidad</th>
                                            <th>Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
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
                                            <td><a href=""><img src="../image/Delete_icon.png" alt="ERROR" width="20" height="20"/></a></td>
                                                    <%
                                                        ProductoDAO producto = new ProductoDAO();
                                                        producto.getProductoByNombre(nombreProducto);
                                                        String rutaFoto = "";
                                                        if (nombreProducto.equals("Takamine GD30")) {
                                                            rutaFoto = "../image/takamine_GD30.jpg";
                                                        } else if (nombreProducto.equals("Ibanez AW54")) {
                                                            rutaFoto = "../image/ibanez_AW54.jpg";
                                                        } else if (nombreProducto.equals("Taylor Academy 10")) {
                                                            rutaFoto = "../image/taylor_academy10.jpg";
                                                        } else if (nombreProducto.equals("Takamine GN93")) {
                                                            rutaFoto = "../image/takamine_GN93.jpg";
                                                        } else if (nombreProducto.equals("Ibanez PF15")) {
                                                            rutaFoto = "../image/ibanez_PF15.jpg";
                                                        } // Guitarras Eléctricas
                                                        else if (nombreProducto.equals("Fender Stratocaster")) {
                                                            rutaFoto = "../image/FenderStratocaster.png";
                                                        } else if (nombreProducto.equals("Fender Telecaster")) {
                                                            rutaFoto = "../image/FenderTelecaster.png";
                                                        } else if (nombreProducto.equals("Ibanez RG550")) {
                                                            rutaFoto = "../image/IbanezRG550.jpg";
                                                        } else if (nombreProducto.equals("Fender Jazzmaster")) {
                                                            rutaFoto = "../image/FenderJazzmaster.jpg";
                                                        } else if (nombreProducto.equals("Ibanez ART120")) {
                                                            rutaFoto = "../image/IbanezART120.jpg";
                                                        } // Guitarras Electroacústicas
                                                        else if (nombreProducto.equals("Takamine EF341SC")) {
                                                            rutaFoto = "../image/takamineEF341sc.jpg";
                                                        } else if (nombreProducto.equals("Taylor 214ce")) {
                                                            rutaFoto = "../image/Taylor 214ce.png";
                                                        } else if (nombreProducto.equals("Ibanez AEG50")) {
                                                            rutaFoto = "../image/Ibanez AEG50.png";
                                                        } else if (nombreProducto.equals("Takamine GN75CE")) {
                                                            rutaFoto = "../image/Takamine GN75CE.jpg";
                                                        } else if (nombreProducto.equals("Ibanez TCY10E")) {
                                                            rutaFoto = "../image/Ibanez TCY10E.jpg";
                                                        } // Amplificadores
                                                        else if (nombreProducto.equals("Amplificador 30W")) {
                                                            rutaFoto = "../image/amplificador.jpg";
                                                        } else if (nombreProducto.equals("Orange Crush 20RT")) {
                                                            rutaFoto = "../image/Orange Crush 20RT.png";
                                                        } else if (nombreProducto.equals("Marshall DSL40CR")) {
                                                            rutaFoto = "../image/Marshall DSL40CR.jpg";
                                                        } else if (nombreProducto.equals("Orange Rocker 15")) {
                                                            rutaFoto = "../image/Orange Rocker 15.png";
                                                        } else if (nombreProducto.equals("Marshall MG30FX")) {
                                                            rutaFoto = "../image/Marshall MG30FX.jpg";
                                                        } // Accesorios
                                                        else if (nombreProducto.equals("Pedal de distorsión")) {
                                                            rutaFoto = "../image/pedaldistorsion.jpg";
                                                        } else if (nombreProducto.equals("Pedal Cry Baby Wah")) {
                                                            rutaFoto = "../image/crybeibi.jpg";
                                                        } else if (nombreProducto.equals("Set de Púas Dunlop")) {
                                                            rutaFoto = "../image/puasdunlop.jpg";
                                                        } else if (nombreProducto.equals("Cincho Ernie Ball Jacquard")) {
                                                            rutaFoto = "../image/ernieballcincho.jpg";
                                                        } else if (nombreProducto.equals("Estuche rígido para eléctrica")) {
                                                            rutaFoto = "../image/fundafender.jpg";
                                                        }

                                                    %>
                                            <td><img src="<%= rutaFoto%>" alt="hola" width="70" height="70"/></td>
                                            <td><%= nombreProducto%></td>
                                            <td>Q<%= precio%></td>
                                            <td><%= cantidad%></td>
                                            <td>Q<%= subtotal%></td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <input type="button" name="recargar" value="Actualizar Carrito" class="btn btn-outline-secondary">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="card ms-auto rounded-4 w-75">
                            <div class="card-body px-4 py-3">
                                <p class="card-title fs-5">Total Carrito</p>
                                <br>
                                <div class="card-body">
                                    <div class="d-flex justify-content-between mb-2">
                                        <span><strong>Subtotal:</strong></span>
                                        <span>Q895.00</span>
                                    </div>
                                    <br>
                                    <div class="mb-3">
                                        <strong>Envío:</strong>
                                        <div class="form-check mt-2">
                                            <input class="form-check-input" type="radio" name="envio" id="radioEnvio" value="30"checked>
                                            <label class="form-check-label" for="radioEnvio">
                                                Costo de Envío: Q30.00
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="envio" id="radioTienda" value="0">
                                            <label class="form-check-label" for="radioTienda">
                                                Recoger en tienda
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="d-flex justify-content-between mb-2">
                                        <span><strong>Total:</strong></span>
                                        <span>Q2900.00</span>
                                    </div>
                                    <div class="card-text d-grid gap-2 col-6 mx-auto text-center">
                                        <a href="../ServletFactura" class="btn btn-danger">Realizar compra</a>
                                    </div>
                                </div>
                            </div>
                        </div>
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
