<%-- 
    Document   : v
    Created on : 24/05/2023, 12:02:50 AM
    Author     : wendy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verificacion</title>
    </head>
    <body>
        <%
            String Usuario=request.getParameter("Usuario");
            String Nombre=request.getParameter("Nombre");
            String apaterno=request.getParameter("apaterno");
            String amaterno=request.getParameter("amaterno");
            String genero=request.getParameter("genero");      
            String telefono=request.getParameter("telefono");
            String correo=request.getParameter("correo");
            String password=request.getParameter("password");
            String foto=request.getParameter("foto");
            String numeros=request.getParameter("numeros");
            String codigo=request.getParameter("codigo");
            
            if (numeros.equals(codigo)) {
                modelo.usuario usu =new modelo.usuario(Usuario, Nombre, apaterno, amaterno, correo, password, foto, genero, telefono);
                new controlador.control_impl().altaUsuario(usu);
                response.sendRedirect("VAprobada.jsp");
            }else{
                response.sendRedirect("VDesaprobada.jsp");
            }
        %>
        <h1>Cargando...</h1>
    </body>
</html>
