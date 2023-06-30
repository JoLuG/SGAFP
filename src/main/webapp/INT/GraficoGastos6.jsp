<%-- 
    Document   : GraficoGastos6
    Created on : 11/06/2023, 02:31:02 PM
    Author     : wendy
--%>

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
        <link rel="stylesheet" href="../CSS/Estilo-Gastos.css">
        <link rel="stylesheet" href="../CSS/Principal-Estilo-Menu-Principal.css">
        <link rel="stylesheet" href="../CSS/Gastos-Estilo-ALL6.css">
        <title>Gastos</title>    
    </head>
    <body>
        <%
            String idusuario= request.getParameter("usuario");
            int categoria=Integer.parseInt(request.getParameter("tgasto")) ;
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
            
            <div class="div-derecho">                            
                <br>
                <center>
                    <span class="h1-titulo">Salud</span>
                </center> 
                <form name="addgastos" action="addgastos.jsp?usuario=<%=us.getUsuario()%>&&tgasto=<%=categoria%>" method="post" class="Form-Registro"> 
                <label for="Descripcion" class="etiqueta">Gasto:</label> <br>
                <select name="Descripcion" id="gasto" class="inp-text">               
                    <option value="Gastos Medicos Menores">Gastos Medicos Menores</option>
                    <option value="Gastos Medicos Mayores">Gastos Medicos Mayores</option>
                    <option value="Estudios Clinicos">Estudios Clinicos</option>
                    <option value="Medicamentos">Medicamentos</option>
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
                                <a href="GraficoGastos6.jsp?usuario=<%=us.getUsuario()%>&&tgasto=<%=categoria%>" class="a-btn-img"><i title="Grafico" class="fa-solid fa-chart-column icon-menu1"></i></a>
                            </td>                         
                            <td style="width: 40px;"></td>
                        </tr>
                    </table>
                </center>
            </div>
            <div class="div-izquierdo">
                <br>
                <center>                
                    <table class="tb-info-ingresos">
                        <thead class="thead-titulos">
                            <td>Descripción</td>
                            <td>Monto</td>
                            <td>Fecha</td>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<gasto> in = new controlador.controlgasto_impl().muestragastos(idusuario, categoria);
                                for (int i = 0; i < in.size(); i++) {
                                
                            %>
                            <tr class="tr-tbody">
                                <td class="td-br-tbody1"><%=in.get(i).getDescripcion()%></td>
                                <td>$ <%=in.get(i).getMonto()%></td>
                                <td class="td-br-tbody2"><%=in.get(i).getFecha()%></td>
                                <td class="td-op-tbody"><a href="modificar-gasto6.jsp?usuario=<%=us.getUsuario()%>&&id=<%=in.get(i).getIdgastos()%>&&tgasto=<%=categoria%>" class="a-btn-img"><i title="Modificar" class="fas fa-edit icon-menu2"></i></a></td>                                
                                <td class="td-op-tbody"><a href="eliminar-gasto.jsp?usuario=<%=us.getUsuario()%>&&id=<%=in.get(i).getIdgastos()%>&&tgasto=<%=categoria%>" class="a-btn-img"><i title="Eliminar" class="fas fa-trash-alt icon-menu2"></i></a></td>
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
                    <a href="GastoSalud.jsp?usuario=<%=us.getUsuario()%>&&tgasto=<%=categoria%>" class="a-exit-graficos"><i title="Salir" class="fas fa-times"></i></a>
                    <br><br>
                    <span style="color: #FF0000; font-weight: bold; font-size: 20pt">
                        Grafico Salud
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
                                    ArrayList<gasto> gasgrafico = new controlador.controlgasto_impl().muestragastoGrafico(idusuario, categoria);
                                    for (int i = 0; i < gasgrafico.size(); i++) {     
                                      fechas=gasgrafico.get(i).getGroupfecha()+"','"+fechas;              
                                       Sumamon=gasgrafico.get(i).getSUMmonto()+","+Sumamon;  
                                    }
                                %>
                            labels: ['<%=fechas  %>'],
                            datasets: [{
                              label: 'Monto',
                              data: [<%=Sumamon %>],
                            borderColor: '#FF0000',
                            backgroundColor: '#FF0000',
                              borderWidth: 4,
                               pointBorderColor: '#FF0000',
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
