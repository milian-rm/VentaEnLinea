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
            <!-- Se busca el atributo idUsuario proveniente del servlet de login para verificar si la sesion a sido iniciada o aun no -->
            <%
                Object usuarioEnSesion = session.getAttribute("idUsuario");
                String destinoMenu;
                if (usuarioEnSesion != null) {
                    destinoMenu = "pages/menuPrincipal.jsp";
                } else {
                    destinoMenu = "pages/login.jsp";
                }
            %>
            <a href="<%= destinoMenu %>">Menú Principal</a>
            <a href="pages/login.jsp">Iniciar Sesión</a>
            <a href="pages/register.jsp">Registrarse</a>
            <a href="pages/acercaDe.jsp">Acerca de</a>
            <a href="pages/admin-login.jsp">Administracion</a>
            <a href="pages/manejo_Cookies.jsp">Ver Cookies</a>  
            <a href="pages/manejo_Contador.jsp">Ver Contador</a>  
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
                <img src="image/FenderStratocaster.png" alt="Guitarra Eléctrica Fender">
                <h3>Guitarra Eléctrica Fender Stratocaster</h3>
                <p class="precio">Q4,500.00</p>
                <a href="pages/FenderStratocaster.jsp" class="btn-detalle">Comprar</a>
            </div>
            <div class="tarjeta-reloj">
                <img src="image/FenderTelecaster.png" alt="Guitarra Eléctrica Fender">
                <h3>Guitarra Eléctrica Fender Telecaster</h3>
                <p class="precio">Q4,700.00</p>
                <a href="pages/FenderTelecaster.jsp" class="btn-detalle">Comprar</a>
            </div>
            <div class="tarjeta-reloj">
                <img src="image/IbanezRG550.jpg" alt="Guitarra Eléctrica Ibanez">
                <h3>Guitarra Eléctrica Ibanez RG550</h3>
                <p class="precio">Q5,200.00</p>
                <a href="pages/IbanezRG550.jsp" class="btn-detalle">Comprar</a>
            </div>
            <div class="tarjeta-reloj">
                <img src="image/IbanezART120.jpg" alt="Guitarra Eléctrica Ibanez">
                <h3>Guitarra Eléctrica Ibanez ART120</h3>
                <p class="precio">Q3,500.00</p>
                <a href="pages/IbanezART120.jsp" class="btn-detalle">Comprar</a>
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