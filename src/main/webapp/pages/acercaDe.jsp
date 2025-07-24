<%-- 
    Document   : acercaDe
    Created on : 23/07/2025, 22:03:04
    Author     : Roberto
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Información | GuitarKinal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    <body style="background-color: #f1f1f1;" class="d-flex flex-column min-vh-100">
        
        <!-- Barra superior con logo -->
        <nav class="navbar navbar-dark bg-danger px-3"> 
            <div class="container-fluid"> 
                <a class="navbar-brand" href="../index.jsp"> 
                    <img src="../image/logo.png" alt="Logo" height="90"> 
                </a> 
                <div class="container mt-1 text-center text-light text-start" style="margin-left: 6rem;">
                    <h2 class="fs-4 fw-bold">Acerca De</h2> 
                </div> 
            </div> 
        </nav> 

        <!-- Contenido -->
        <main class="flex-grow-1">
            <div class="container py-5">
                <div class="text-center mb-4">
                    <img src="https://i.imgur.com/GUP9CG7.png" alt="Logo GuitarKinal" style="">
                    <p class="lead mt-3">Tu tienda en línea especializada en guitarras y accesorios musicales</p>
                </div>

                <div class="bg-white p-4 rounded-5 shadow-sm mb-4">
                    <h2 class="text-danger">Misión</h2>
                    <p>
                        En <strong>GuitarKinal</strong>, nuestra misión es ofrecer a músicos de todos los niveles 
                        productos de alta calidad como guitarras eléctricas, acústicas, electroacústicas, pedales de efectos, 
                        accesorios y amplificadores, a través de una plataforma en línea accesible, confiable y segura.
                        Nos esforzamos por brindar una experiencia personalizada, eficiente y apasionada por la música.
                    </p>
                </div>

                <div class="bg-white p-4 rounded-5 shadow-sm mb-4">
                    <h2 class="text-danger">Visión</h2>
                    <p>
                        Ser la tienda en línea líder en Guatemala en la venta de instrumentos y accesorios para guitarra, 
                        reconocida por la excelencia en el servicio al cliente, la innovación en tecnología musical y el compromiso 
                        con la comunidad artística.
                    </p>
                </div>

                <div class="bg-white p-4 rounded-5 shadow-sm">
                    <h2 class="text-danger">Valores</h2>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <strong>Pasión por la música:</strong> Nos mueve el amor por el arte musical y por quienes lo crean.</li>
                        <li class="list-group-item">
                            <strong>Compromiso con el cliente:</strong> Ofrecemos atención personalizada y soporte en cada compra.</li>
                        <li class="list-group-item">
                            <strong>Responsabilidad:</strong> Entregamos productos de forma segura y puntual.</li>
                        <li class="list-group-item">
                            <strong>Innovación:</strong> Buscamos siempre mejorar nuestra plataforma y catálogo.</li>
                        <li class="list-group-item">
                            <strong>Confianza:</strong> Creamos relaciones duraderas con nuestros clientes y aliados.</li>
                    </ul>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-3">
            GuitarKinal © 2025. Todos los derechos reservados.
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" 
                crossorigin="anonymous"></script>
    </body>
</html>

