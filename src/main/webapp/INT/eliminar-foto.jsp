<%-- 
    Document   : eliminar-foto
    Created on : 28/05/2023, 12:15:35 AM
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
            modelo.usuario us = new controlador.control_impl().muestraUsuario(usuario);
            String genero= "Hombre";
            String foto="";
            if (us.getGenero().equals(genero)) {
                foto="../IMGPerfil/usuarioH.png";
            }else{
                foto="../IMGPerfil/usuarioM.png";
            }
            modelo.usuario us1 = new modelo.usuario(foto);
            new controlador.control_impl().modificaUsuario(usuario, us1);
            response.sendRedirect("Perfil.jsp?usuario="+usuario);
        %>
    </body>
</html>
