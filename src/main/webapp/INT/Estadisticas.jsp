<%-- 
    Document   : Estadisticas
    Created on : 25/05/2023, 12:22:57 PM
    Author     : wendy
--%>

<%@page import="modelo.ingreso"%>
<%@page import="modelo.gasto"%>
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
        <link rel="stylesheet" href="../CSS/Estilo-Estadisticas.css">
        <title>Estadisticas</title>    
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
                <div class="animation start-portefolio"></div>
            </nav>
        </center>

        <div class="Cuadro-blanco">
            <div class="div-GIngresos">
                <br>
                <center>
                    <span style="color: #7972E6; font-weight: bold; font-size: 20pt">
                        Ingresos
                    </span>
                </center>
                    <br>
                <div class="graficas-tam">
                        <canvas id="myChart"></canvas>
                      </div>

                      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

                      <script>
                        const ctx = document.getElementById('myChart');

                        new Chart(ctx, {
                          type: 'bar',
                          data: {
                              <%
                                  String descrip ="";
                                  String Sumamon="";
                                  ArrayList<ingreso> inTGraf = new controlador.controlIngreso_impl().muestraingresoGraficoTotales(idusuario);
                                    for (int i = 0; i < inTGraf.size(); i++) {     
                                      descrip=inTGraf.get(i).getGroupDesc()+"','"+descrip;              
                                       Sumamon=inTGraf.get(i).getSUMmonto()+","+Sumamon;  
                                    }
                                %>
                            labels: ['<%=descrip  %>'],
                            datasets: [{
                              label: 'Monto',
                              data: [<%=Sumamon %>],
                            borderColor: '#7972E6',
                            backgroundColor: 'rgb(121, 114, 230, 0.8)',
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
            </div>
            <div class="div-GGastos">
                <br>
                <center>
                    <span style="color: rgb(157, 52, 184); font-weight: bold; font-size: 20pt">
                        Gastos
                    </span>
                </center>
                    <br>
                <div class="graficas-tam">
                        <canvas id="myChart1"></canvas>
                      </div>

                      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

                      <script>
                        const ctx1 = document.getElementById('myChart1');

                        new Chart(ctx1, {
                          type: 'line',
                          data: {
                              <%
                                  String descripG ="";
                                  String SumamonG="";
                                  ArrayList<gasto> gasTGraf = new controlador.controlgasto_impl().muestragastoGraficoTotales(idusuario);
                                    for (int i = 0; i < gasTGraf.size(); i++) {     
                                      descripG=gasTGraf.get(i).getGroupcategoria()+"','"+descripG;              
                                       SumamonG=gasTGraf.get(i).getSUMmonto()+","+SumamonG;  
                                    }
                                %>
                            labels: ['<%=descripG  %>'],
                            datasets: [{
                              label: 'Monto',
                              data: [<%=SumamonG %>],
                            borderColor: 'rgb(157, 52, 184)',
                            backgroundColor: 'rgb(157, 52, 184)',
                              borderWidth: 4,
                               pointBorderColor: 'rgb(157, 52, 184)',
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
            </div>
            <div class="div-button-PDF">
                <center>
                    <table style="width: 80%">
                        <tr>
                            <td><a href="Reportes.jsp?usuario=<%=us.getUsuario()%>" class="a-btn-RI">Reporte Ingresos</a> </td>  
                            <td><a href="RGG.jsp?usuario=<%=us.getUsuario()%>" class="a-btn-RGas">Reporte Gastos</a> </td>  
                        </tr>
                    </table>
                </center>
            </div>
        </div>    
    </body>
</html>
