<%-- 
    Document   : menuPrincipal
    Created on : 23 jul 2025, 18:20:36
    Author     : Marcos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html> 
    <head> 
        <meta charset="UTF-8"> 
        <title>Tienda de Guitarras</title> 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous"> 
        <style>
            .card-img-top {
                width: 100%;
                height: 280px;
                object-fit: cover;
                border-radius: 0.5rem 0.5rem 0 0;
            }

            .card-body {
                padding: 2rem 1.5rem;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                height: 100%;
            }

            .card {
                min-height: 500px;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                align-items: center;
                text-align: center;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
                border-radius: 0.5rem;
                transition: all 0.3s ease;
            }

            .card:hover {
                transform: scale(1.02);
            }

            .row {
                margin-bottom: 2.5rem;
            }
        </style>
    </head> 
    <body class="d-flex flex-column min-vh-100"> 

        <nav class="navbar navbar-dark bg-danger px-3"> 
            <div class="container-fluid"> 
                <a class="navbar-brand" href="index.jsp"> 
                    <img src="image/logo.png" alt="Logo" height="90"> 
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
                        <a href="ProductoServlet?accion=listar" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de productos</strong>
                        </a>
                        <a href="pages/administracionUsuarios.jsp" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de Usuarios</strong>
                        </a>
                        <a href="DetalleServlet?accion=listar" class="text-danger text-decoration-none">
                            <strong class="text-danger">Administración de Detalles de Compra</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>


        <main class="flex-grow-1"> 

            <div class="container mt-4"> 
                <div class="row justify-content-center"> 
                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="image/Guitarra Acústica.jpg" class="card-img-top" alt="Guitarra Acústica"> 
                            <div class="card-body"> 
                                <h5 class="card-title">Guitarra Acústica</h5> 
                                <p class="card-text">Sonido cálido y natural para los amantes del folk y lo clásico.</p> 
                                <a href="#" class="btn btn-danger">Ver más</a> 
                            </div> 
                        </div> 
                    </div> 

                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="image/Guitarra Eléctrica.jpg" class="card-img-top" alt="Guitarra Eléctrica"> 
                            <div class="card-body"> 
                                <h5 class="card-title">Guitarra Eléctrica</h5> 
                                <p class="card-text">Ideal para rock, metal o jazz con un diseño moderno y potente.</p> 
                                <a href="#" class="btn btn-danger">Ver más</a> 
                            </div> 
                        </div> 
                    </div> 

                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="image/Pedal de Efectos.jpg" class="card-img-top" alt="Pedal de efectos"> 
                            <div class="card-body"> 
                                <h5 class="card-title">Pedal de Efectos</h5> 
                                <p class="card-text">Explora nuevos sonidos y efectos para tu guitarra eléctrica.</p> 
                                <a href="#" class="btn btn-danger">Ver más</a> 
                            </div> 
                        </div> 
                    </div> 
                </div> 

                <div class="row justify-content-center"> 
                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="image/Amplificador Compacto.jpg" class="card-img-top" alt="Amplificador"> 
                            <div class="card-body"> 
                                <h5 class="card-title">Amplificador Compacto</h5> 
                                <p class="card-text">Portátil pero potente, ideal para ensayos o uso en casa.</p> 
                                <a href="#" class="btn btn-danger">Ver más</a> 
                            </div> 
                        </div> 
                    </div> 

                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="image/Juego de Cuerdas.jpg" class="card-img-top" alt="Cuerdas"> 
                            <div class="card-body"> 
                                <h5 class="card-title">Juego de Cuerdas</h5> 
                                <p class="card-text">Cuerdas de alta calidad para un sonido limpio y duradero.</p> 
                                <a href="#" class="btn btn-danger">Ver más</a> 
                            </div> 
                        </div> 
                    </div> 

                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="image/Afinador Digital.png" class="card-img-top" alt="Afinador"> 
                            <div class="card-body"> 
                                <h5 class="card-title">Afinador</h5> 
                                <p class="card-text">Asegura una afinación precisa en segundos con pantalla LED.</p> 
                                <a href="#" class="btn btn-danger">Ver más</a> 
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