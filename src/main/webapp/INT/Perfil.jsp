<%-- 
    Document   : Perfil
    Created on : 24/05/2023, 02:44:08 AM
    Author     : wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/5ac1168347.js" crossorigin="anónimo"></script>
        <link rel="stylesheet" href="../CSS/Estilo-Perfil.css">
        <link rel="stylesheet" href="../CSS/Principal-Estilo-Menu-Principal.css">
        <link rel="stylesheet" href="../CSS/Estilos-Ingresos.css">
        <link rel="stylesheet" href="../CSS/estilos-extra1.css">
        <title>Perfil</title>    
    </head>
    <body>
        <%
            String idusuario= request.getParameter("usuario");
                modelo.usuario us = new controlador.control_impl().muestraUsuario(idusuario);
        %>
        <div class="Cuadro-morado">
            <img src="../IMG/logo.png" alt="Logotipo" title="Logotipo" class="Logo">
            <span>SGAFP</span>
            <a class="CSesion" href="CerrarSesionServlet"><i title="Cerrar Sesión" class="fas fa-sign-out-alt icon-tam"></i></a>
        </div>
        <center>
            <nav>
                <a href="Perfil.jsp?usuario=<%=us.getUsuario()%>"><b>Perfil</b>  <br> <i class="far fa-address-card icon-menu"></i></a>
                <a href="Gastos.jsp?usuario=<%=us.getUsuario()%>"><b>Gastos</b> <br> <i class="fas fa-hand-holding-usd icon-menu"></i></a>
                <a href="Ingresos.jsp?usuario=<%=us.getUsuario()%>"><b>Ingresos</b> <br> <i class="fas fa-piggy-bank icon-menu"></i></a>
                <a href="Estadisticas.jsp?usuario=<%=us.getUsuario()%>"><b>Estadisticas</b><br> <i class="fas fa-chart-pie icon-menu"></i></a>
                <div class="animation start-home"></div>
            </nav>
        </center>

        <div class="Cuadro-blanco">
            <div class="div-derecho"> 
                <center>
                    <span class="h1-titulo">Perfil</span>
                            
                <br>
                <p class="p-sub">Información personal</p>
                <table class="tb-info-perfil">
                    <tr class="tr-info-perfil">
                        <td class="td-info-perfil">Usuario: </td>
                        <td><%=us.getUsuario()%></td>
                    </tr>
                    <tr class="tr-info-perfil">
                        <td class="td-info-perfil">Nombre: </td>
                        <td><%=us.getNombre()%> <%=us.getApaterno()%> <%=us.getAmaterno()%></td>
                    </tr>
                    <tr class="tr-info-perfil">
                        <td class="td-info-perfil">Email: </td>
                        <td><%=us.getCorreo()%></td>
                    </tr>
                    <tr class="tr-info-perfil">
                        <td class="td-info-perfil">Teléfono: </td>
                        <td><%=us.getTelefono()%></td>
                    </tr>
                </table>
                    </center>
            </div>
            <div class="div-izquierdo">
                <br><br>
                <center>                
                    <img src="<%=us.getFoto()%>" alt="Foto" class="img-foto br-img-foto">                
                </center>
                <br><br>
                <table class="tb-btn-img">
                    <tr>
                        <td>
                            <a href="cambia-img.jsp?usuario=<%=us.getUsuario()%>" class="a-btn-img">
                                <i title="Cambiar Imagen" class="far fa-images icon-menu1"></i>
                            </a>
                        </td>
                        <td>
                            <a href="eliminar-foto.jsp?usuario=<%=us.getUsuario()%>" class="a-btn-img">
                                <i title="Quitar Imagen" class="far fa-eye-slash icon-menu1"></i>
                            </a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>    
    </body>
</html>
