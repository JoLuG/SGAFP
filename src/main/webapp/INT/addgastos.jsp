<%-- 
    Document   : addgastos
    Created on : 2/06/2023, 08:50:24 PM
    Author     : wendy
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.ZonedDateTime"%>
<%@page import="java.time.ZoneId"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gasto-Alimentos</title>
    </head>
    <body>
        <%
            int categoria=Integer.parseInt(request.getParameter("tgasto")) ;
            String usuario= request.getParameter("usuario");
            String descripcion= request.getParameter("Descripcion");
            int monto = Integer.parseInt(request.getParameter("Monto"));
            String fecha = ZonedDateTime.now(ZoneId.of("America/Mexico_City")).format(DateTimeFormatter.ofPattern("dd/MM/yyy"));
            modelo.gasto gas = new modelo.gasto(descripcion, monto, fecha, usuario, categoria);
            new controlador.controlgasto_impl().addgasto(gas);
            switch(categoria){
                case 1:
                    response.sendRedirect("GastoAlimentos.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                case 2:
                    response.sendRedirect("GastoRopa.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                case 3:
                    response.sendRedirect("GastoTransporte.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                case 4:
                    response.sendRedirect("GastoVivienda.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                case 5:
                    response.sendRedirect("GastoServicios.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                case 6:
                    response.sendRedirect("GastoSalud.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                case 7:
                    response.sendRedirect("GastoEducacion.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                case 8:
                    response.sendRedirect("GastoAhorro.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                case 9:
                    response.sendRedirect("GastoEntretenimiento.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                case 10:
                    response.sendRedirect("GastoDeudas.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                case 11:
                    response.sendRedirect("GastoOtros.jsp?usuario="+usuario+"&&tgasto="+categoria);
                break;
                default:
                    out.print("<script>alert('Error');</script>");
                break;
            }           
            
        %>
    </body>
</html>
