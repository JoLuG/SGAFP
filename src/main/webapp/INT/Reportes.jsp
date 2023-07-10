
<%@page import="modelo.gasto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.ingreso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
    String idusuario= request.getParameter("usuario"); 
                modelo.usuario us = new controlador.control_impl().muestraUsuario(idusuario);
    String Nombre = "R-"+ idusuario;
    %>
     <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="5; url=../PDF/<%=Nombre%>.pdf">
        <link rel="stylesheet" href="../CSS/EstiloP.css">
        <title>Reporte</title>    
    </head>
    <body>
        
        <div class="Cuadro-morado"></div>

        <div class="Cuadro-blanco">
            
            <br><br>
            <center>
                <h1 style="font-size: 40pt; font-weight: bold;">Generando Reporte...</h1>
                
            </center>
            <% 
                String FotoCadena =us.getFoto();
                String nombreArchivo = FotoCadena.substring(FotoCadena.lastIndexOf("/") + 1);
                String Foto = "C:\\Users\\jorge\\Documents\\Codigos\\Daniel\\SA\\src\\main\\webapp\\IMGPerfil\\"+nombreArchivo;
                int Tingresos = 0;
                int Tgastos = 0;
                int SubTotal = 0;
                String Total;
                String TI;
                String Mensaje = "";
                ArrayList<ingreso> MI = new controlador.controlIngreso_impl().muestraingresos(idusuario);
                for (int i = 0; i <MI.size(); i++) {   
                    Tingresos = Tingresos + MI.get(i).getMonto();
                }  
                ArrayList<gasto> MG = new controlador.controlgasto_impl().muestragastoGeneral(idusuario);
                for (int i = 0; i <MG.size(); i++) {   
                    Tgastos = Tgastos + MG.get(i).getMonto();
                }                        
                SubTotal = Tingresos - Tgastos;
                Total = ""+SubTotal;
                TI = ""+Tingresos;
                if (SubTotal < 0) {
                    Mensaje = "hay ingresos que no agregaste.";
                }else{
                    if (SubTotal >= 0 && SubTotal <20) {
                        Mensaje = "el camino hacia la riqueza depende fundamentalmente de dos palabras: trabajo y ahorro.";    
                    }else{
                        if (SubTotal >= 20 && SubTotal <150) {
                            Mensaje = "quién vive con más desahogo no es el que tiene más, sino el que administra bien lo mucho o poco que tiene.";    
                        }else{
                            if (SubTotal >= 150 && SubTotal <2000) {
                              Mensaje = "si estás ahorrando, estás teniendo éxito.";      
                            }else{
                                if (SubTotal >= 2000) {
                                      Mensaje = "hay una diferencia enorme entre ganar mucho dinero y ser rico. Ahorrar.";  
                                }
                            }
                        }
                    }
                }
                                 
                new controlador.PDF().creaPDF3(Nombre, idusuario, TI, Total, Mensaje, Foto);
            %>
            <span class="line1"></span>
            <span class="texto">SGAFP</span>
            <span class="line2"></span>
        </div>
    </body>
</html>
