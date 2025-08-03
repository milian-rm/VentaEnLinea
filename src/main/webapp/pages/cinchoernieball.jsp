<%-- 
    Document   : cinchoernieball
    Created on : 2/08/2025, 23:17:21
    Author     : Bradley Oliva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cincho Ernie Ball Jacquard | Tienda en Línea</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <style>
        * {
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
            <a class="navbar-brand" href="../index.jsp">
                <img src="../image/logo.png" alt="Logo" height="90">
            </a>
            <div class="container mt-1 text-center text-light text-start" style="margin-left: 6rem;">
                <p class="fs-4"><strong>
                        <h2>Bienvenido a tienda GuitarKinal</h2>
                    </strong></p>
            </div>
            <button class="btn btn-outline-light" type="button" data-bs-toggle="offcanvas"
                data-bs-target="#menuPrincipal" aria-controls="menuPrincipal">
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
            </ul>
        </div>
    </div>

    <div class="container mt-4">
        <a href="../menuPrincipal.jsp"><button class="btn btn-regresar">Regresar al menú</button></a>
    </div>

    <section class="producto-container">
        <div class="producto-imagen">
            <img src="../image/ernieballcincho.jpg" alt="Cincho Ernie Ball Jacquard">
        </div>
        <div class="producto-detalles">
            <div>
                <h1>Cincho Ernie Ball Jacquard</h1>
                <p class="descripcion">Correa para guitarra con diseño</p>
                <p class="proveedor">Proveedor: Ernie Ball</p>
                <p class="categoria">Categoría: Accesorios</p>
                <p class="precio">Q.250.00</p>
                <p class="stock">Stock disponible: 20 unidades</p>
            </div>

            <form class="compra-form">
                <label for="cantidad">Cantidad:</label>
                <input type="number" id="cantidad" name="cantidad" min="1" max="20" value="1">
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