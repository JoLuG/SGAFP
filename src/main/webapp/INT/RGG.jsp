<%-- 
    Document   : RI
    Created on : 20/06/2023, 08:37:52 PM
    Author     : wendy
--%>

<%@page import="modelo.gasto"%>
<%@page import="modelo.ingreso"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <%
    String idusuario= request.getParameter("usuario");     
                modelo.usuario us = new controlador.control_impl().muestraUsuario(idusuario);
    String Nombre = "RG-"+ idusuario;
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
                String Foto = "C:\\Users\\wendy\\Documents\\NetBeansProjects\\SAFP\\web\\IMGPerfil\\"+nombreArchivo;
                int Tingresos = 0;
                int Tgastos = 0;
                int SubTotal = 0;
                String Total;
                String TG;
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
                TG = ""+Tgastos;
                if (SubTotal < 0) {
                    Mensaje = "hay ingresos que no agregaste.";
                }else{
                    if (SubTotal >= 0 && SubTotal <20) {
                        Mensaje = "no ahorres lo que te queda después de gastar, gasta lo que te queda después de ahorrar.";    
                    }else{
                        if (SubTotal >= 20 && SubTotal <150) {
                            Mensaje = "la economía consiste en saber gastar, y el ahorro en saber guardar.";    
                        }else{
                            if (SubTotal >= 150 && SubTotal <2000) {
                              Mensaje = "en la vida hay que escoger entre ganar dinero o gastarlo. No hay tiempo suficiente para ambas cosas.";      
                            }else{
                                if (SubTotal >= 2000) {
                                      Mensaje = "la persona que sabe gastar y ahorrar es el más feliz, porque disfruta de ambas cosas.";  
                                }
                            }
                        }
                    }
                }
                                 
                new controlador.PDF().creaPDF2(Nombre, idusuario, TG, Total, Mensaje, Foto);
            %>
            <span class="line1"></span>
            <span class="texto">SGAFP</span>
            <span class="line2"></span>
        </div>
    </body>
</html>
