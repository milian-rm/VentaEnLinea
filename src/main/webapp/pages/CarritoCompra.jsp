<%-- 
    Document   : CarritoCompra
    Created on : 5/08/2025, 18:15:08
    Author     : josel
--%>

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
                                        <tr>
                                            <td><a href=""><img src="../image/Delete_icon.png" alt="ERROR" width="20" height="20"/></a></td>
                                            <td><img src="../image/takamine_GD30.jpg" alt="hola" width="70" height="70"/></td>
                                            <td>Guitarra Acustica Takamine GD30</td>
                                            <td>Q2800.00</td>
                                            <td><input type="number" name="cantidad" value="1" style="width: 40%"></td>
                                            <td>Q2800.00</td>
                                        </tr>
                                        <tr>
                                            <td><a href=""><img src="../image/Delete_icon.png" alt="ERROR" width="20" height="20"/></a></td>
                                            <td><img src="../image/puasdunlop.jpg" alt="hola" width="70" height="70"/></td>
                                            <td>Set de Púas Dunlop</td>
                                            <td>Q100.00</td>
                                            <td><input type="number" name="cantidad" value="1" style="width: 40%"></td>
                                            <td>Q100.00</td>
                                        </tr>
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
                                        <a href="#" class="btn btn-danger">Realizar compra</a>
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
