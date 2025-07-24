<%-- 
    Document   : register
    Created on : 22/07/2025, 15:58:25
    Author     : josel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registro</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    </head>
    <body style="background-color: #f1f1f1;">

        <div class="container text-center mt-0">
            <div class="d-none d-lg-block">
                <img src="https://i.imgur.com/GUP9CG7.png" class="img-fluid mb-2" alt="ERROR" width="280" height="230"/>
                <div class="row mx-auto rounded-5 border border-dark p-3 w-50 shadow mb-5" 
                     style="background-color: white;">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12">    
                        <div class="text-uppercase fs-2 fw-bold mb-1 text-danger">
                            Crear cuenta
                        </div>
                        <div class="mb-4">
                            ¿Ya tienes una cuenta? <a href="#">Inicia Sesión</a>
                        </div>
                        <form action="${pageContext.request.contextPath}/registro" method="post">
                            <div class="row mb-3">
                                <div class="col form-floating pe-1">
                                    <input type="text" class="form-control rounded-end rounded-5  ps-4" id="floatingName" placeholder="Nombre" name="nombre" style="background-color: #f1f1f1;" required>
                                    <label class="ms-3 ps-4" for="floatingName">Nombre</label>
                                </div>
                                <div class="col form-floating ps-1">
                                    <input type="text" class="form-control rounded-start rounded-5  ps-4" id="floatingLastName" placeholder="Apellido" name="apellido" style="background-color: #f1f1f1;" required>
                                    <label class="ms-3" for="floatingLastName">Apellido</label>
                                </div>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control rounded-5 ps-4" id="floatingInput" placeholder="nombre@example.com" name="email" style="background-color: #f1f1f1;" required>
                                <label class="ps-4" for="floatingInput">Correo Electrónico</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control rounded-5 ps-4" id="floatingPhoneNum" placeholder="12345678" name="telefono" style="background-color: #f1f1f1;" required>
                                <label class="ps-4" for="floatingPhoneNum">Teléfono</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control rounded-5 ps-4" id="floatingAddres" placeholder="Guatemala" name="direccion" style="background-color: #f1f1f1;" required>
                                <label class="ps-4" for="floatingAddres">Dirección</label>
                            </div>
                            <div class="form-floating">
                                <input type="password" class="form-control rounded-5 ps-4" id="floatingPassword" placeholder="Password" name="contrasena" style="background-color: #f1f1f1 !important;" required>
                                <label class="ps-4" for="floatingPassword">Contraseña</label>
                            </div>
                            <div class="d-grid gap-2 col-6 mx-auto">
                                <button type="submit" class="btn btn-outline-success mt-4 mb-4 rounded-5">
                                    INGRESAR
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="d-block d-lg-none">
                <img src="https://i.imgur.com/GUP9CG7.png" class="img-fluid mb-2" alt="ERROR" width="280" height="230"/>
                <div class="row mx-0 rounded-5 p-3 w-100 mb-1" 
                     style="background-color: white;">
                    <div class="col-12 col-sm-12 col-md-12 col-lg-12">    
                        <div class="text-uppercase fs-2 fw-bold mb-1 text-danger">
                            Crear cuenta
                        </div>
                        <div class="mb-4">
                            ¿Ya tienes una cuenta? <a href="#">Inicia Sesión</a>
                        </div>
                        <form action="${pageContext.request.contextPath}/registro" method="post">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control rounded-5 ps-4" id="floatingName" placeholder="Nombre" name="nombre" style="background-color: #f1f1f1;" required>
                                <label class="ps-4" for="floatingName">Nombre</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control rounded-5 ps-4" id="floatingLastName" placeholder="Apellido" name="apellido" style="background-color: #f1f1f1;" required>
                                <label class=" ps-4" for="floatingLastName">Apellido</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control rounded-5 ps-4" id="floatingInput" placeholder="nombre@example.com" name="email" style="background-color: #f1f1f1;" required>
                                <label class="ps-4" for="floatingInput">Correo Electrónico</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control rounded-5 ps-4" id="floatingPhoneNum" placeholder="12345678" name="telefono" style="background-color: #f1f1f1;" required>
                                <label class="ps-4" for="floatingPhoneNum">Teléfono</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control rounded-5 ps-4" id="floatingAddres" placeholder="Guatemala" name="direccion" style="background-color: #f1f1f1;" required>
                                <label class="ps-4" for="floatingAddres">Dirección</label>
                            </div>
                            <div class="form-floating">
                                <input type="password" class="form-control rounded-5 ps-4" id="floatingPassword" placeholder="Password" name="contrasena" style="background-color: #f1f1f1 !important;" required>
                                <label class="ps-4" for="floatingPassword">Contraseña</label>
                            </div>
                            <div class="d-grid gap-2 col-8 mx-auto">
                                <button type="submit" class="btn btn-outline-success mt-4 mb-4 rounded-5">
                                    INGRESAR
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
    </body>
</html>
