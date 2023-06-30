<%-- 
    Document   : GraficoIngresos
    Created on : 2/06/2023, 02:30:30 PM
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
        <link rel="stylesheet" href="../CSS/Estilos-Iextra.css">
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
            <div class="popup-graficos">
                
                <center>
                    <a href="Ingresos.jsp?usuario=<%=us.getUsuario()%>" class="a-exit-graficos"><i title="Salir" class="fas fa-times"></i></a>
                    <br><br>
                    <span style="color: #7972E6; font-weight: bold; font-size: 20pt">
                        Grafico Ingresos
                    </span>
                    <br><br>
                    <div class="graficas-tam">
                        <canvas id="myChart"></canvas>
                      </div>

                      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

                      <script>
                        const ctx = document.getElementById('myChart');

                        new Chart(ctx, {
                          type: 'line',
                          data: {
                              <%
                                  String fechas ="";
                                  String Sumamon="";
                                    ArrayList<ingreso> ingrafico = new controlador.controlIngreso_impl().muestraingresoGrafico(idusuario);
                                    for (int i = 0; i < ingrafico.size(); i++) {     
                                      fechas=ingrafico.get(i).getGroupfecha()+"','"+fechas;              
                                       Sumamon=ingrafico.get(i).getSUMmonto()+","+Sumamon;  
                                    }
                                %>
                            labels: ['<%=fechas  %>'],
                            datasets: [{
                              label: 'Monto',
                              data: [<%=Sumamon %>],
                            borderColor: '#7972E6',
                            backgroundColor: '#7972E6',
                              borderWidth: 4,
                               pointBorderColor: '#7972E6',
                                pointBackgroundColor: 'white',
                                pointRadius: 5,
                                pointHoverRadius: 10,
                                pointHitRadius: 30,
                                pointBorderWidth: 3,
                                pointStyle: 'rectRounded'
                            }]
                          },
                          options: {
                          plugins: {
                                legend: false // Hide legend
                            },
                            scales: {
                             x: {
                                    grid: {
                                      tickColor: "#A9A9A9",
                                      borderDash: [5, 2],
                                      tickWidth: 1,
                                      color: "#A9A9A9",
                                      borderColor: "#A9A9A9",
                                    },
                                    ticks: {
                                      color: "#34495e",
                                      font: {
                                        weight: "bold",
                                        size: 15
                                      }
                                    }
                                  },
                              y: {
                                beginAtZero: true,
                                grid: {
                                      tickColor: "#A9A9A9",
                                      borderDash: [5, 2],
                                      tickWidth: 1,
                                      color: "#A9A9A9",
                                      borderColor: "#A9A9A9",
                                    },
                                    ticks: {
                                      color: "#34495e",
                                      font: {
                                        weight: "bold",
                                        size: 15
                                      }
                                    }
                                
                              }
                            }
                          }
                        });
                      </script>
                </center>
            </div>
        </div>
    </body>
</html>
