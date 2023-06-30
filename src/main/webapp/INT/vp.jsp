<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesión</title>
    </head>
    <body>
        <%
            String correo=request.getParameter("Correo");
            String password=request.getParameter("Password");
            modelo.usuario us = new controlador.control_impl().verificacorreo(correo, password); 
            if (correo.equals(us.getCorreo()) && password.equals(us.getPassword())) {
                     response.sendRedirect("Perfil.jsp?usuario="+us.getUsuario());
                }else{
        %>
        <script>
            alert('Contraseña incorrecta');
        </script>
        <%
                response.sendRedirect("InicioSesion.jsp");
            }           
                       
        %>
        <h1>Cargando...</h1>
        <p><%=correo%></p>
    </body>
</html>
