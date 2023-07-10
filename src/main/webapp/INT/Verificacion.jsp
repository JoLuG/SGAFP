<%@ page import="controlador.Verificador" %>
<%--
    Document   : Verificacion
    Created on : 22/05/2023, 11:51:02 AM
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
<%
    String Usuario=request.getParameter("Usuario");
    String Nombre=request.getParameter("Nombre");
    String apaterno=request.getParameter("apaterno");
    String amaterno=request.getParameter("amaterno");
    String genero=request.getParameter("genero");
    String telefono=request.getParameter("telefono");
    String correo=request.getParameter("correo");
    String password=request.getParameter("password");
    String foto=request.getParameter("foto");



    if (Verificador.correoExiste(correo)) {
%>
<div class="Cuadro-morado"></div>
<div class="Cuadro-blanco-1">
    <img src="../IMG/logo.png" alt="Logotipo" title="Logotipo" class="Logo">
    <h1 class="titulo">Crear Cuenta</h1>
    <form action="" method="post" class="Form-Registro">

    </form>
</div>
<div class="overlay">
    <div class="popup">
        <center>
            <br>
            <style>

                .boton-container {
                    text-align: center; /* Centramos los botones */
                }

                .boton {
                    display: inline-block;
                    width: 200px; /* Ancho fijo para todos los botones */
                    margin: 10px; /* Margen para separar los botones */
                    padding: 10px 20px;
                    font-size: 14px;
                    text-align: center;
                    text-decoration: none;
                    background-color: #337ab7;
                    color: #fff;
                    border-radius: 4px;
                    border: none;
                    transition: background-color 0.3s ease;
                }

                .boton:hover {
                    background-color: #23527c;
                }
            </style>
            <span class="subtitulo">Correo Existente</span><br>
            <span class="p-txt">El correo <%=correo%> ya está registrado.</span><br><br>
            <div class="boton-container">
            <a href="InicioSesion.jsp" class="boton">Iniciar Sesion</a><br>

          <!--  <a href="#" class="boton">Recuperar Contraseña</a><br>-->
            </div>

        </center>
    </div>
</div>
<%
} else {
    int RI,RF,Can;
    String cad="";
    RI=0;
    RF=9;
    Can=4;
    for(int i=0;i<Can;i++){
        int NumA=(int)(Math.random()*(RF-RI+1)+RI);
        cad=cad+NumA+"";
    }
    new controlador.Email().transfer_to_email(correo, cad);
%>
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
    <div class="popup">
        <center>
            <br>
            <span class="subtitulo">Verificación de Correo</span><br>
            <span class="p-txt">Por favor revise la bandeja de entrada o spam del gmail <b><%=correo%></b></span><br><br>
            <form action="v.jsp" method="post" class="form-ver">
                <input type="hidden" name="Usuario" value="<%=Usuario%>"/>
                <input type="hidden" name="Nombre" value="<%=Nombre%>"/>
                <input type="hidden" name="apaterno" value="<%=apaterno%>"/>
                <input type="hidden" name="amaterno" value="<%=amaterno%>"/>
                <input type="hidden" name="genero" value="<%=genero%>"/>
                <input type="hidden" name="foto" value="<%=foto%>"/>
                <input type="hidden" name="correo" value="<%=correo%>"/>
                <input type="hidden" name="codigo" value="<%=cad%>"/>
                <input type="hidden" name="telefono" value="<%=telefono%>"/>
                <input type="hidden" name="password" value="<%=password%>"/>
                <input type="number" name="numeros" id="n1" class="int-ver" placeholder="# # # #"><br><br>
                <input type="submit" value="Verificar" class="btn-Registrar"><br>
            </form>
        </center>
    </div>
</div>
<%
    }
%>
</body>
</html>
