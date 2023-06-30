<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/EstiloP.css">
    <style>
        .Cuadro-blanco {
            text-align: center;
        }

        .Form-Registro1 {
            display: inline-block;
            text-align: left;
        }

        .mensaje-error {
            color: red;
            margin-top: -15px;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>
    <title>Inicio-Sesion</title>
</head>
<body>

<div class="Cuadro-morado"></div>

<div class="Cuadro-blanco">
    <img src="../IMG/logo.png" alt="Logotipo" title="Logotipo" class="Logo">
    <h1 class="titulo">Iniciar Sesión</h1>
    <p class="texto-plano">Gestione sus finanzas desde ahora</p>



    <form action="InicioSesionServlet" method="post" class="Form-Registro1">
        <%-- Mostrar el campo de correo --%>
            <%-- Mostrar mensaje de error si existe --%>
            <% String mensaje = (String) request.getAttribute("mensaje");
                if (mensaje != null && !mensaje.isEmpty()) { %>
            <div class="mensaje-error">
                <%= mensaje %>
            </div>
            <% } %>
        <label for="Correo" class="etiqueta">Correo:</label>
        <input type="text" class="inp-text" name="Correo" id="Correo" placeholder="Correo" required>

        <%-- Mostrar el campo de contraseña --%>
        <label for="Password" class="etiqueta">Contraseña:</label>
        <input type="password" class="inp-text" name="Password" id="Password" placeholder="Contraseña" required>

        <br><br>
        <div style="text-align: center;">
            <input type="submit" class="btn-Registrar" value="Iniciar"><br>
            <a href="Crear-Cuenta.jsp" class="a-regresar">¿No tienes una cuenta?</a>
        </div>
    </form>
    <span class="line1"></span>
    <span class="texto">SGAFP</span>
    <span class="line2"></span>
</div>
</body>
</html>
