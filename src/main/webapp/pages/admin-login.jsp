<%-- 
    Document   : admin-login
    Created on : 29/07/2025, 18:53:19
    Author     : Kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Acceso de Administrador - GuitarKinal</title>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&family=Open+Sans:wght@400;600&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Agregar iconos de Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            body {
                font-family: 'Open Sans', sans-serif;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
            }

            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
                background: rgba(255, 255, 255, 0.2);
                border: 2px solid rgba(255, 255, 255, 0.3);
                color: white;
                padding: 10px 20px;
                border-radius: 50px;
                text-decoration: none;
                font-weight: 600;
                transition: all 0.3s ease;
                backdrop-filter: blur(10px);
            }

            .back-button:hover {
                background: rgba(255, 255, 255, 0.3);
                color: white;
                transform: translateY(-2px);
            }

            .admin-container {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(20px);
                padding: 50px 60px;
                border-radius: 25px;
                box-shadow: 0px 15px 35px rgba(0, 0, 0, 0.3);
                width: 100%;
                max-width: 500px;
                text-align: center;
                border: 1px solid rgba(255, 255, 255, 0.2);
            }

            .admin-icon {
                font-size: 4rem;
                color: #667eea;
                margin-bottom: 20px;
                animation: pulse 2s infinite;
            }

            @keyframes pulse {
                0% { transform: scale(1); }
                50% { transform: scale(1.05); }
                100% { transform: scale(1); }
            }

            .admin-container h2 {
                color: #333;
                margin-bottom: 10px;
                font-family: 'Montserrat', sans-serif;
                font-weight: 700;
                font-size: 2rem;
            }

            .admin-subtitle {
                color: #666;
                margin-bottom: 30px;
                font-size: 1.1rem;
            }

            label {
                display: block;
                text-align: left;
                color: #333;
                margin-bottom: 8px;
                font-weight: 600;
                font-size: 0.95em;
            }

            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 16px 20px;
                margin: 8px 0 20px 0;
                border: 2px solid #e1e5e9;
                border-radius: 15px;
                font-size: 1.1em;
                color: #333;
                background-color: #f8f9fa;
                transition: all 0.3s ease;
            }

            input[type="email"]:focus,
            input[type="password"]:focus {
                border-color: #667eea;
                box-shadow: 0 0 15px rgba(102, 126, 234, 0.3);
                outline: none;
                background-color: white;
            }

            input[type="submit"] {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 16px;
                border: none;
                border-radius: 15px;
                cursor: pointer;
                width: 100%;
                font-size: 1.2em;
                font-weight: 700;
                letter-spacing: 1px;
                transition: all 0.3s ease;
                margin-top: 10px;
            }

            input[type="submit"]:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
            }

            input[type="submit"]:active {
                transform: translateY(-1px);
            }

            .warning-text {
                background: rgba(255, 193, 7, 0.1);
                border: 1px solid rgba(255, 193, 7, 0.3);
                color: #856404;
                padding: 15px;
                border-radius: 10px;
                margin-bottom: 25px;
                font-size: 0.9rem;
            }

            .logo-small {
                width: 80px;
                height: auto;
                margin-bottom: 20px;
                opacity: 0.8;
            }
        </style>
    </head>
    <body>
        <!-- Botón para regresar -->
        <a href="../index.jsp" class="back-button">
            <i class="bi bi-arrow-left"></i> Volver al Inicio
        </a>

        <div class="admin-container">
            <!-- Logo pequeño -->
            <img src="https://i.imgur.com/GUP9CG7.png" alt="Logo GuitarKinal" class="logo-small"/>
            
            <!-- Icono de administrador -->
            <div class="admin-icon">
                <i class="bi bi-shield-lock"></i>
            </div>

            <h2>Panel de Administración</h2>
            <p class="admin-subtitle">Acceso restringido para administradores</p>

            <!-- Mensaje de advertencia -->
            <div class="warning-text">
                <i class="bi bi-exclamation-triangle"></i>
                <strong>Área Restringida:</strong> Solo personal autorizado puede acceder a esta sección.
            </div>

            <%
                String error = request.getParameter("error");
                if (error != null) {
                    String mensaje = "";
                    if ("campos_vacios".equals(error)) {
                        mensaje = "Por favor complete todos los campos.";
                    } else if ("no_encontrado".equals(error)) {
                        mensaje = "Usuario no encontrado.";
                    } else if ("credenciales".equals(error)) {
                        mensaje = "Credenciales incorrectas.";
                    } else if ("no_autorizado".equals(error)) {
                        mensaje = "No tiene permisos de administrador.";
                    } else if ("acceso_denegado".equals(error)) {
                        mensaje = "Acceso denegado. Debe iniciar sesión.";
                    } else if ("error_servidor".equals(error)) {
                        mensaje = "Error interno del servidor.";
                    }
            %>
            <div class="alert alert-danger" role="alert">
                <i class="bi bi-exclamation-circle"></i> <%= mensaje %>
            </div>
            <%
                }
            %>

            <form method="post" action="${pageContext.request.contextPath}/admin-login">
                <label for="email">Correo de Administrador:</label>
                <input type="email" name="email" id="email" placeholder="admin@guitarkinal.com" required>

                <label for="contrasena">Contraseña:</label>
                <input type="password" name="contrasena" id="contrasena" placeholder="••••••••" required>

                <input type="submit" value="🔐 Acceder al Panel">
            </form>

            <div class="mt-4">
                <small class="text-muted">
                    <i class="bi bi-info-circle"></i>
                    Si no tienes credenciales de administrador, contacta al administrador del sistema.
                </small>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
