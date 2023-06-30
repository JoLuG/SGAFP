<%-- 
    Document   : modificar-ingreso
    Created on : 27/05/2023, 11:06:56 PM
    Author     : wendy
--%>

<%@page import="modelo.ingreso"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Ingresos</title>    
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
                <div class="animation start-blog"></div>
            </nav>
        </center>

        <div class="Cuadro-blanco">
            <center>
                <span class="h1-titulo">Ingresos</span>
            </center> 
            <div class="div-derecho">                            
                <br>
                <form name="addingresos" action="addingresos.jsp?usuario=<%=us.getUsuario()%>" method="post" class="Form-Registro"> 
                <label for="Descripcion" class="etiqueta">Ingreso:</label> <br>
                <select name="Descripcion" id="Ingreso" class="inp-text">               
                    <option value="Tutores Legales">Tutores Legales</option>
                    <option value="Becas">Becas</option>
                    <option value="Trabajo">Trabajo</option>
                </select> <br><br>
                <label for="Monto" class="etiqueta">Monto:</label> <br>
                <input type="text" id="Monto" name="Monto" class="inp-text" placeholder="$" required> <br><br>
                <center>
                    <input type="submit" value="Agregar" class="btn-Registrar">
                </center>

            </form>
                <center>     
                    <table class="tb-btn-img1">
                        <tr>
                            <td style="width: 90px;"></td>
                            <td>
                                <a href="" class="a-btn-img"><i title="Grafico" class="fas fa-chart-bar icon-menu1"></i></a>
                            </td>                         
                            <td style="width: 40px;"></td>
                        </tr>
                    </table>
                </center>
            </div>
            <div class="div-izquierdo">
                <br><br><br>
                <center>                
                    <table class="tb-info-ingresos">
                        <thead class="thead-titulos">
                            <td>Descripción</td>
                            <td>Monto</td>
                            <td>Fecha</td>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<ingreso> in = new controlador.controlIngreso_impl().muestraingresos(idusuario);
                                for (int i = 0; i < in.size(); i++) {
                                
                            %>
                            <tr class="tr-tbody">
                                <td class="td-br-tbody1"><%=in.get(i).getDescripcion()%></td>
                                <td>$ <%=in.get(i).getMonto()%></td>
                                <td class="td-br-tbody2"><%=in.get(i).getFecha()%></td>
                                <td class="td-op-tbody"><a href="modificar-ingreso.jsp?usuario=<%=us.getUsuario()%>&&id=<%=in.get(i).getIdingresos()%>" class="a-btn-img"><i title="Modificar" class="fas fa-edit icon-menu2"></i></a></td>                                
                                <td class="td-op-tbody"><a href="eliminar-ingreso.jsp?usuario=<%=us.getUsuario()%>&&id=<%=in.get(i).getIdingresos()%>" class="a-btn-img"><i title="Eliminar" class="fas fa-trash-alt icon-menu2"></i></a></td>
                            </tr>                            
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </center>
            </div>
        </div>    
        <div class="overlay">
            <div class="popup">
                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    modelo.ingreso in2 = new controlador.controlIngreso_impl().muestraingreso(id);
                %>
                <center>
                    <a href="Ingresos.jsp?usuario=<%=us.getUsuario()%>" class="a-exit-ing"><i title="Salir" class="fas fa-times"></i></a>
                    <br><br>
                    <span style="color: #7972E6; font-weight: bold; font-size: 20pt">
                        Modificar Ingreso
                    </span>
                    <br><br>
                    <form name="addingresos" action="updateingresos.jsp?usuario=<%=us.getUsuario()%>&&id=<%=in2.getIdingresos()%>" method="post" class="Form-Registro-mod"> 
                        <label for="Descripcion" class="etiqueta">Ingreso:</label> <br>
                        <select name="Descripcion" id="Ingreso" class="inp-text">  
                            <option value="<%=in2.getDescripcion()%>"><%=in2.getDescripcion()%></option>
                            <option value="Tutores Legales">Tutores Legales</option>
                            <option value="Becas">Becas</option>
                            <option value="Trabajo">Trabajo</option>
                        </select> <br><br>
                        <label for="Monto" class="etiqueta">Monto:</label> <br>
                        <input type="text" id="Monto" name="Monto" class="inp-text" placeholder="$" value="<%=in2.getMonto()%>" required> <br><br>
                        <center>
                            <input type="submit" value="Modificar" class="btn-Registrar">
                        </center>

                    </form>
                </center>
            </div>
        </div>
    </body>
</html>
