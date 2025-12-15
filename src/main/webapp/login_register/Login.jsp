<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String url = request.getContextPath() + "/";
%>

<html>
<head>
<meta charset="UTF-8">

<title>Iniciar Sesión</title>
<link rel="stylesheet" href="<%=url%>ScriptCss/css/login.css">
</head>

<body>
<div class="container">

    <!-- LADO DEL LOGIN -->
    <div class="left">
        <h2>Iniciar Sesión</h2>
        
        
        <form action="<%=url%>LoginController" method="POST">
        	<input type="hidden" name="op" value="login">
            <label>Usuario</label>
            <input type="text" name="usuario" required>

            <label>Contraseña</label>
            <input type="password" name="password" required>
			
			<div id="errorLogin" class="error">
    			<%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
			</div>
			
            <button type="submit" class="btn-login">Iniciar Sesión</button>
        </form>

        <div class="signup">
            ¿No tienes una cuenta?
            <a href="<%=url%>LoginController?op=mostrarRegister">Registrarse</a>
        </div>
    </div>

    <!-- LADO DE BIENVENIDA -->
    <div class="right">
        <div>
            <h1>BIENVENIDO!</h1>
            <p>Nos alegra tenerte de nuevo con nosotros.<br>
               Si necesitas algo, estamos aquí para ayudarte.</p>
        </div>
    </div>

</div>
</body>
</html>