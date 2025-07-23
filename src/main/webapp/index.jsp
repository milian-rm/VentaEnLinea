<%-- 
    Document   : index
    Created on : 22/07/2025, 17:59:24
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GuitarKinal</title>
    <link rel="stylesheet" href="style/estilos.css">
</head>
<body>
    <!-- Header principal -->
    <header class="header-guitarras">
        <div class="logo-nombre">
            <img src="style/logoGuitarKinal(1).png" alt="Logo GuitarKinal" class="logo-guitarras">
            <span class="nombre-guitarras"></span>
        </div>
        <div class="menu-hamburguesa" id="menuHamburguesa">
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="buscador-header">
            <input type="text" id="buscador" placeholder="Buscar guitarra...">
        </div>
        <nav class="nav-header" id="navHeader">
            <a href="index.html">Iniciar Sesión</a>
            <a href="">Registrarse</a>
            <a href="">Contacto</a>
            <a href="">Acerca de</a>
            <a href=""></a>
        </nav>
    </header>

    <!-- Banner principal con carrusel -->
        <section class="banner-principal">
               <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="style/tt}.jpg" alt="Banner 1">
            </div>
            <div class="carousel-item">
                <img src="style/lllp.jpg" alt="Banner 2">
            </div>
            <div class="carousel-item">
                <img src="style/dfdfdfdfd.jpg" alt="Banner 3">
            </div>
        </div>
        <div class="banner-texto">
            <h1></h1>
            <p></p>
        </div>
    </section>

    <!-- Productos destacados -->
    <main>
        <h2 class="titulo-catalogo">PRODUCTOS DESTACADOS</h2>
        <div class="catalogo-grid">
            <div class="tarjeta-reloj">
                <img src="style/1100NT.png" alt="Guitarra Acústica Yamaha">
                <h3>Guitarra Acústica Yamaha</h3>
                <p class="precio">Q2,500.00</p>
                <a href="" class="btn-detalle">Comprar</a>
            </div>
            <div class="tarjeta-reloj">
                <img src="style/fender-player-stratocaster-hss-pf-car.jpg" alt="Guitarra Eléctrica Fender">
                <h3>Guitarra Eléctrica Fender</h3>
                <p class="precio">Q8,000.00</p>
                <a href="" class="btn-detalle">Comprar</a>
            </div>
            <div class="tarjeta-reloj">
                <img src="style/1100NT.png" alt="Guitarra Clásica Alhambra">
                <h3>Guitarra Clásica Alhambra</h3>
                <p class="precio">Q3,200.00</p>
                <a href="" class="btn-detalle">Comprar</a>
            </div>
            <div class="tarjeta-reloj">
                <img src="style/613FdiNeTuL.jpg" alt="Guitarra Electroacústica Ibanez">
                <h3>Guitarra Electroacústica Ibanez</h3>
                <p class="precio">Q5,500.00</p>
                <a href="" class="btn-detalle">Comprar</a>
            </div>
        </div>
    </main>

    <!-- Sección de contacto -->
    <section class="contacto-section">
        <h3>CONTACTO</h3>
        <p><strong>DIRECCIÓN</strong><br>Guatemala</p>
        <p><strong>TELÉFONO</strong><br>4163-5899</p>
        <p><strong>CORREO ELECTRÓNICO</strong><br>guitarkinal@gmail.com</p>
    </section>

    <footer class="footer-relojeria">
        © 2025 GuitarKinal. Todos los derechos reservados.
    </footer>

    <script>
        // Carrusel automático
        const carousel = document.querySelector('.carousel-inner');
        const items = document.querySelectorAll('.carousel-item');
        let currentIndex = 0;

        function showSlide(index) {
            carousel.style.transform = `translateX(-${index * 100}%)`;
        }

        function nextSlide() {
            currentIndex = (currentIndex + 1) % items.length;
            showSlide(currentIndex);
        }

        setInterval(nextSlide, 3000);

        // Menú hamburguesa
        document.getElementById('menuHamburguesa').addEventListener('click', function() {
            document.getElementById('navHeader').classList.toggle('mostrar');
        });

        // Buscador
        document.getElementById('buscador').addEventListener('keyup', function() {
            const filtro = this.value.toLowerCase();
            const tarjetas = document.querySelectorAll('.tarjeta-reloj');
            tarjetas.forEach(function(tarjeta) {
                const nombre = tarjeta.querySelector('h3').textContent.toLowerCase();
                tarjeta.style.display = nombre.includes(filtro) ? '' : 'none';
            });
        });
    </script>
</body>
</html>