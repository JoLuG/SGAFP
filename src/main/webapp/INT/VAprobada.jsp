<%-- 
    Document   : VAprobada
    Created on : 23/05/2023, 09:04:09 PM
    Author     : wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../CSS/EstiloP.css">
        <link rel="stylesheet" href="../CSS/Estilo-Verificacion.css">
        <title>Verificacion</title>
    </head>
    <body>
        <div class="Cuadro-morado"></div>
        <div class="Cuadro-blanco-1">
            <img src="../IMG/logo.png" alt="Logotipo" title="Logotipo" class="Logo">
            <h1 class="titulo">Crear Cuenta</h1>
            <form action="" method="post" class="Form-Registro">       

                <label for="telefono" class="etiqueta">Teléfono:</label> <br>
                <input type="text" id="telefono" name="telefono" class="inp-text" placeholder="Teléfono"> <br>

                <label for="correo" class="etiqueta">Correo:</label> <br>
                <input type="text" id="correo" name="correo" class="inp-text" placeholder="Correo"> <br>

                <label for="password" class="etiqueta">Password:</label> <br>
                <input type="password" id="password" name="password" class="inp-text" placeholder="Password"> 

                <label for="passwordC" class="etiqueta">Confirmar Password:</label> <br>
                <input type="password" id="passwordC" name="passwordC" class="inp-text" placeholder="Confirmar Password"> <br> <br>
                <center>
                    <input type="submit" value="Registrar" class="btn-Registrar">
                </center>

            </form>
        </div>
        <div class="overlay">
            <div class="popup1">
                <center>
                    <br>
                    <span class="subtitulo" style="color: #7972E6 ;">Felicidades!!</span><br><br>
                    <span class="p-txt">Tu cuenta se a creado exitosamente</span><br><br>
                    <img src="../IMG/aprobacion.jpg" alt="Aprobacion" class="img-ver"><br><br>
                    <a href="InicioSesion.jsp" class="btn-terminar">Terminar</a>
                </center>
            </div>
        </div>
    </body>
</html>
