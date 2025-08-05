<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html> 
    <head> 
        <meta charset="UTF-8"> 
        <title>Guitarras Electroacústicas</title> 
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
                    <img src="../image/logo.png" alt="Logo" height="90"> 
                </a> 
                <div class="container mt-1 text-center text-light text-start" style="margin-left: 6rem;">
                    <p class="fs-4"><strong><h2>Guitarras Electroacústicas</h2></strong></p> 
                </div> 
                <a class="navbar-brand" href=""> 
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


        <main class="flex-grow-1"> 

            <div class="container mt-4"> 
                <div class="row justify-content-center"> 
                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="../image/takamineEF341sc.jpg" class="mt-3" style="height: 250px; object-fit: cover;" alt="Fender Stratocaster">
                            <div class="card-body"> 
                                <h5 class="card-title">Takamine EF341SC</h5> 
                                <p class="card-text">Electroacústica profesional con acabado negro brillante</p> 
                                <a href="TakamineEF341SC.jsp" class="btn btn-danger">Ver más</a> 
                            </div> 
                        </div> 
                    </div> 
                    
                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="../image/Taylor 214ce.png" class="mt-3" style="height: 250px; object-fit: cover;" alt="Fender Telecaster">
                            <div class="card-body"> 
                                <h5 class="card-title">Taylor 214ce</h5> 
                                <p class="card-text">Tapa sólida y electrónica ES2</p> 
                                <a href="Taylor214ce.jsp" class="btn btn-danger">Ver más</a> 
                            </div> 
                        </div> 
                    </div> 
                    
                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="../image/Ibanez AEG50.png" class="mt-3" style="height: 250px; object-fit: cover;" alt="Ibanez RG550">
                            <div class="card-body"> 
                                <h5 class="card-title">Ibanez AEG50</h5> 
                                <p class="card-text">Cuerpo delgado con preamp Ibanez AEQ-TTS</p> 
                                <a href="IbanezAEG50.jsp" class="btn btn-danger">Ver más</a> 
                            </div> 
                        </div> 
                    </div> 

                    

                    
                <div class="row justify-content-center"> 
                    
                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="../image/Takamine GN75CE.jpg" class="mt-3" style="height: 250px; object-fit: cover;" alt=">Fender Jazzmaster">
                            <div class="card-body"> 
                                <h5 class="card-title">Takamine GN75CE</h5> 
                                <p class="card-text">Cuerpo NEX con acabado rubí</p> 
                                <a href="TakamineGN75CE.jsp" class="btn btn-danger">Ver más</a> 
                            </div> 
                        </div> 
                    </div> 
                    
                    <div class="col-md-4 mb-4"> 
                        <div class="card h-100"> 
                            <img src="../image/Ibanez TCY10E.jpg" class="mt-3" style="height: 250px; object-fit: cover;" alt="Ibanez ART120">
                            <div class="card-body"> 
                                <h5 class="card-title">Ibanez TCY10E</h5> 
                                <p class="card-text">Modelo Talman, compacto y cómodo</p> 
                                <a href="Ibanez TCY10E.jsp" class="btn btn-danger">Ver más</a> 
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