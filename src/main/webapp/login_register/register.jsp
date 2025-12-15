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
<div class="container">

    <!-- TEXTO A LA IZQUIERDA -->
    <div class="left">
        <h1>CREAR CUENTA</h1>
        <p>Únete a nosotros y disfruta de la experiencia.<br>
           Completa tus datos para crear tu usuario.</p>
    </div>

    <!-- FORMULARIO A LA DERECHA -->
    <div class="right">
        <h2>Registrarse</h2>

        <form action="<%=url%>LoginController" method="POST">
        	<input type="hidden" name="op" value="register">

		    <!-- FILA NOMBRE + APELLIDO -->
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
		
		    <!-- USUARIO -->
		    <label>Usuario</label>
		    <input type="text" name="usuario" id="usuario" required>
		
		    <!-- EMAIL -->
		    <label>Email</label>
		    <input type="email" name="email" id="email" required>
		
		    <!-- FILA CONTRASEÑA + REPETIR -->
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
		
		    <button type="submit" class="btn-register">Crear Cuenta</button>
		
		</form>


        <div class="login">
            ¿Ya tienes cuenta?
            <a href="<%=url%>LoginController?op=mostrarLogin">Iniciar Sesión</a>
        </div>
    </div>

</div>

</body>
</html>