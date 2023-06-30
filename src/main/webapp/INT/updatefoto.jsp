<%-- 
    Document   : updatefoto
    Created on : 28/05/2023, 01:33:53 PM
    Author     : wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
    </head>
    <body>
        <%
            String usuario= request.getParameter("usuario");
            String foto = request.getParameter("foto");          
            modelo.usuario us1 = new modelo.usuario(foto);
            new controlador.control_impl().modificaUsuario(usuario, us1);
            response.sendRedirect("Perfil.jsp?usuario="+usuario);
        %>
    </body>
</html>
