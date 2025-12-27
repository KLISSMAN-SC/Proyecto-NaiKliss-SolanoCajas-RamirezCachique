<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String url = request.getContextPath() + "/";
%>

<html>
<head>
<meta charset="UTF-8">
<title>Registrarse</title>
<link rel="stylesheet" href="<%=url%>ScriptCss/css/register.css">
</head>

<body>

<div class="register-wrapper">

    <!-- INFO -->
    <div class="info-panel">
        <div>
            <h1>CREAR CUENTA</h1>
            <p>
                Únete a nuestra comunidad y disfruta<br>
                de todas las funcionalidades disponibles.
            </p>
        </div>
    </div>

    <!-- FORMULARIO -->
    <div class="form-panel">
        <h2>Registrarse</h2>

        <form action="<%=url%>LoginController" method="POST">
            <input type="hidden" name="op" value="register">

            <div class="row2">
                <div class="col">
                    <label>Nombre</label>
                    <input type="text" name="nombre" id="nombre" required>
                </div>

                <div class="col">
                    <label>Apellido</label>
                    <input type="text" name="apellido" id="apellido" required>
                </div>
            </div>

            <label>Usuario</label>
            <div class="col1">
            <input type="text" name="usuario" id="usuario" required>
			</div>
            <label>Email</label>
            <div class="col1">
            <input type="email" name="email" id="email" required>
			</div>
            <div class="row2">
                <div class="col">
                    <label>Contraseña</label>
                    <input type="password" name="password" id="password" required>
                </div>

                <div class="col">
                    <label>Repetir contraseña</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" required>
                </div>
            </div>

            <div id="errorRegister" class="error">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
            </div>

            <button type="submit" class="btn-register">
                Crear Cuenta
            </button>
        </form>

        <div class="login">
            ¿Ya tienes cuenta?
            <a href="<%=url%>LoginController?op=mostrarLogin">Iniciar Sesión</a>
        </div>
    </div>

</div>

</body>
</html>
