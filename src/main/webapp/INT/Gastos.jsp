<%-- 
    Document   : Gastos
    Created on : 25/05/2023, 12:11:58 PM
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
        <link rel="stylesheet" href="../CSS/Estilo-Gastos.css">
        <link rel="stylesheet" href="../CSS/Principal-Estilo-Menu-Principal.css">
        <title>Gastos</title>    
    </head>
    <body>
        <%
            String idusuario= request.getParameter("usuario");
                modelo.usuario us = new controlador.control_impl().muestraUsuario(idusuario);
        %>
        <div class="Cuadro-morado">
            <img src="../IMG/logo.png" alt="Logotipo" title="Logotipo" class="Logo">
            <span>SGAFP</span>
            <a class="CSesion" href="InicioSesion.jsp"><i title="Cerrar Sesión" class="fas fa-sign-out-alt icon-tam"></i></a>
        </div>
        <center>
            <nav>
                <a href="Perfil.jsp?usuario=<%=us.getUsuario()%>"><b>Perfil</b>  <br> <i class="far fa-address-card icon-menu"></i></a>
                <a href="Gastos.jsp?usuario=<%=us.getUsuario()%>"><b>Gastos</b> <br> <i class="fas fa-hand-holding-usd icon-menu"></i></a>
                <a href="Ingresos.jsp?usuario=<%=us.getUsuario()%>"><b>Ingresos</b> <br> <i class="fas fa-piggy-bank icon-menu"></i></a>
                <a href="Estadisticas.jsp?usuario=<%=us.getUsuario()%>"><b>Estadisticas</b><br> <i class="fas fa-chart-pie icon-menu"></i></a>
                <div class="animation start-about"></div>
            </nav>
        </center>

        <div class="Cuadro-blanco">
            <center>
            <table>
                <tr>
                    <td>
                        <form action="GastoAlimentos.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="1">
                            <button type="submit" class="btn-gas-menu btn-menu-1">Alimentos <br/> <i class="fas fa-utensils icon-menu3"></i> </button>
                        </form>
                    </td>
                    <td>
                        <form action="GastoRopa.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="2">
                            <button type="submit" class="btn-gas-menu btn-menu-2">Ropa <br/> <i class="fas fa-tshirt icon-menu3"></i> </button>
                        </form>
                    </td>
                    <td>
                        <form action="GastoTransporte.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="3">
                            <button type="submit" class="btn-gas-menu btn-menu-3">Transporte <br/> <i class="fas fa-car icon-menu3"></i> </button>
                        </form>
                    </td>
                    <td>
                        <form action="GastoVivienda.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="4">
                            <button type="submit" class="btn-gas-menu btn-menu-4">Vivienda <br/> <i class="fas fa-home icon-menu3"></i> </button>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action="GastoServicios.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="5">
                            <button type="submit" class="btn-gas-menu btn-menu-5">Servicios <br/> <i class="fas fa-globe icon-menu3"></i> </button>
                        </form>
                    </td>
                    <td>
                        <form action="GastoSalud.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="6">
                            <button type="submit" class="btn-gas-menu btn-menu-6">Salud <br/> <i class="fas fa-first-aid icon-menu3"></i> </button>
                        </form>
                    </td>
                    <td>
                        <form action="GastoEducacion.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="7">
                            <button type="submit" class="btn-gas-menu btn-menu-7">Educación <br/> <i class="fas fa-graduation-cap icon-menu3"></i> </button>
                        </form>
                    </td>
                    <td>
                        <form action="GastoAhorro.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="8">
                            <button type="submit" class="btn-gas-menu btn-menu-8">Ahorro<br> <i class="fas fa-donate icon-menu3"></i> </button>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <form action="GastoEntretenimiento.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="9">
                            <button type="submit" class="btn-gas-menu btn-menu-9">Entretenimiento <br/> <i class="fab fa-xbox icon-menu3"></i> </button>
                        </form>
                    </td>
                    <td>
                        <form action="GastoDeudas.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="10">
                            <button type="submit" class="btn-gas-menu btn-menu-10">Deudas <br/> <i class="far fa-credit-card icon-menu3"></i> </button>
                        </form>
                    </td>
                    <td>
                        <form action="GastoOtros.jsp?usuario=<%=us.getUsuario()%>" class="" method="post">
                            <input type="hidden" name="tgasto" value="11">
                            <button type="submit" class="btn-gas-menu btn-menu-11">Otros <br/> <i class="fas fa-clock icon-menu3"></i> </button>
                        </form>
                    </td>
                </tr>
            </table>
            </center>
        </div>    
    </body>
</html>
