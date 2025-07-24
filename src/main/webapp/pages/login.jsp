<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login de Usuario</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Open Sans', sans-serif;
                background-color: #f1f1f1;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
            }

            .logo-container {
                text-align: center;
                margin-bottom: 20px;
            }

            .logo-container img {
                max-width: 500px;
                height: auto;
                display: block;
                margin: 0 auto;
            }

            .login-container {
                background: white;
                padding: 40px 50px;
                border-radius: 60px;
                box-shadow: 0px 8px 25px rgba(0, 0, 0, 0.7);
                width: 100%;
                max-width: 800px;
                text-align: center;
                margin-top: 50px;
            }

            .login-container h2 {
                color: red;
                margin-bottom: 15px;
                font-family: 'Montserrat', sans-serif;
                font-weight: 700;
                letter-spacing: 1.5px;
                text-transform: uppercase;
                text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
            }

            label {
                display: block;
                text-align: left;
                color: black;
                margin-bottom: 8px;
                font-weight: 600;
                font-size: 0.95em;
                transition: color 0.3s ease;
            }
            label:hover {
                color: #7C0000;
            }

            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 14px;
                margin: 8px 0 20px 0;
                border: 1px solid #c05151;
                border-radius: 60px;
                font-size: 1.1em;
                color: #333;
                background-color: #fffafa;
                transition: border-color 0.3s ease, box-shadow 0.3s ease;
            }
            input[type="email"]:focus,
            input[type="password"]:focus {
                border-color: #7C0000;
                box-shadow: 0 0 8px rgba(124, 0, 0, 0.5);
                outline: none;
            }

            input[type="submit"] {
                background-color: #7C0000;
                color: white;
                padding: 15px;
                border: none;
                border-radius: 60px;
                cursor: pointer;
                width: 50%;
                font-size: 1.2em;
                font-weight: 700;
                letter-spacing: 1px;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }
            input[type="submit"]:hover {
                background-color: #5a0000;
                transform: translateY(-2px);
            }
            input[type="submit"]:active {
                transform: translateY(0);
            }

            .btn-registrarse {
                margin-top: 20px;
                border-radius: 60px;
                padding: 12px 30px;
                font-size: 1.1em;
                font-weight: 600;
                letter-spacing: 1px;
                text-decoration: none;
                color: #7C0000;
                border: 2px solid #7C0000;
                transition: background-color 0.3s ease, transform 0.2s ease;
                display: inline-block;
            }

            .btn-registrarse:hover {
                background-color: #7C0000;
                color: white;
                transform: translateY(-2px);
            }
        </style>
    </head>
    <body>
        <div class="d-none d-lg-block">
            <div class="logo-container">
                <img src="https://i.imgur.com/GUP9CG7.png" alt="Logo de la Aplicación"/>
            </div>

            <div class="login-container">
                <h2>Iniciar Sesión</h2>
                <%
                    String error = request.getParameter("error");
                    if (error != null) {
                        String mensaje = "";
                        if ("campos_vacios".equals(error)) {
                            mensaje = "Por favor complete todos los campos.";
                        } else if ("no_encontrado".equals(error)) {
                            mensaje = "Usuario no encontrado.";
                        } else if ("credenciales".equals(error)) {
                            mensaje = "Correo o contraseña incorrectos.";
                        } else if ("error_servidor".equals(error)) {
                            mensaje = "Error interno del servidor.";
                        }
                %>
                <div class="alert alert-danger" role="alert">
                    <%= mensaje%>
                </div>
                <%
                    }
                %>

                <form method="post" action="${pageContext.request.contextPath}/login">
                    <label for="email">Correo Electrónico:</label>
                    <input type="email" name="email" id="email" required>

                    <label for="contrasena">Contraseña:</label>
                    <input type="password" name="contrasena" id="contrasena" required>

                    <input type="submit" value="Ingresar">

                    <a href="../pages/register.jsp" class="btn-registrarse">Registrarse</a>
                </form>
            </div>
        </div>

        <div class="container">
            <div class="d-block d-lg-none">
                <div class="logo-container">
                    <img src="https://i.imgur.com/GUP9CG7.png" alt="Logo de la Aplicación"/>
                </div>
                <div class="login-container">
                    <h2>Iniciar Sesión</h2>
                    <%
                        if (error != null) {
                            String mensaje = "";
                            if ("campos_vacios".equals(error)) {
                                mensaje = "Por favor complete todos los campos.";
                            } else if ("no_encontrado".equals(error)) {
                                mensaje = "Usuario no encontrado.";
                            } else if ("credenciales".equals(error)) {
                                mensaje = "Correo o contraseña incorrectos.";
                            } else if ("error_servidor".equals(error)) {
                                mensaje = "Error interno del servidor.";
                            }
                    %>
                    <div class="alert alert-danger" role="alert">
                        <%= mensaje%>
                    </div>
                    <%
                        }
                    %>

                    <form method="post" action="${pageContext.request.contextPath}/login">
                        <label for="email">Correo Electrónico:</label>
                        <input type="email" name="email" id="email" required>

                        <label for="contrasena">Contraseña:</label>
                        <input type="password" name="contrasena" id="contrasena" required>

                        <input type="submit" value="Ingresar">

                        <a href="../pages/register.jsp" class="btn-registrarse">Registrarse</a>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
