<%--
    Document   : Crear-Cuenta2
    Created on : 19/05/2023, 09:17:14 AM
    Author     : wendy
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../CSS/EstiloP.css">
        <title>Crear-Cuenta</title>
    </head>
    <body>
        <%
            String foto="";
            String Usuario=request.getParameter("Usuario");
            String Nombre=request.getParameter("Nombre");
            String apaterno=request.getParameter("apaterno");
            String amaterno=request.getParameter("amaterno");
            String genero=request.getParameter("genero");
            if (genero.equals("Mujer")) {
                foto="../IMGPerfil/usuarioM.png";
            }else{
                foto="../IMGPerfil/usuarioH.png";
            }

        %>
        <div class="Cuadro-morado"></div>
        <div class="Cuadro-blanco-1">
            <img src="../IMG/logo.png" alt="Logotipo" title="Logotipo" class="Logo">
            <h1 class="titulo">Crear Cuenta</h1>
            <form name="registrarusuario1" action="Verificacion.jsp" method="post" class="Form-Registro">
                <input type="hidden" name="Usuario" value="<%=Usuario%>"/>
                <input type="hidden" name="Nombre" value="<%=Nombre%>"/>
                <input type="hidden" name="apaterno" value="<%=apaterno%>"/>
                <input type="hidden" name="amaterno" value="<%=amaterno%>"/>
                <input type="hidden" name="genero" value="<%=genero%>"/>
                <input type="hidden" name="foto" value="<%=foto%>"/>

                <label for="telefono" class="etiqueta">Teléfono:</label> <br>
                <input type="text" id="telefono" name="telefono" class="inp-text" placeholder="Teléfono" required> <br>

                <label for="correo" class="etiqueta">Correo:</label> <br>
                <input type="text" id="correo" name="correo" class="inp-text" placeholder="Correo" required> <br>

                <label for="password" class="etiqueta">Password:</label> <br>
                <input type="password" id="password" name="password" class="inp-text" placeholder="Password" required><br> <br>
                <center>
                    <input type="submit" value="Registrar" class="btn-Registrar">
                </center>

            </form>
        </div>
    </body>
</html>
