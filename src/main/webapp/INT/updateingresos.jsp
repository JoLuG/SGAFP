<%-- 
    Document   : updateingresos
    Created on : 27/05/2023, 11:41:37 PM
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
        <title>Ingresos</title>
    </head>
    <body>
        <%
            String usuario= request.getParameter("usuario");
            int id = Integer.parseInt(request.getParameter("id"));
            String descripcion= request.getParameter("Descripcion");
            int monto = Integer.parseInt(request.getParameter("Monto"));
            String fecha = ZonedDateTime.now(ZoneId.of("America/Mexico_City")).format(DateTimeFormatter.ofPattern("dd/MM/yyy"));
            
            modelo.ingreso in = new modelo.ingreso(descripcion, monto, fecha, usuario);
            new controlador.controlIngreso_impl().modificaingreso(id, in, usuario);        
            response.sendRedirect("Ingresos.jsp?usuario="+usuario);
        %>
    </body>
</html>
