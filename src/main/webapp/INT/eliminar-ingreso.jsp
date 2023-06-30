<%-- 
    Document   : eliminar-ingreso
    Created on : 27/05/2023, 10:58:33 PM
    Author     : wendy
--%>

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
            new controlador.controlIngreso_impl().deleteingreso(id);            
            response.sendRedirect("Ingresos.jsp?usuario="+usuario);
        %>
    </body>
</html>
