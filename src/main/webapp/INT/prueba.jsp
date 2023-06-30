<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Página protegida</title>
</head>
<body>
<h1>Página protegida</h1>

<%-- Verificar si el usuario ha iniciado sesión --%>
<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario != null && !usuario.isEmpty()) {
        // El usuario ha iniciado sesión
%>
<p>Bienvenido, <%= usuario %>!</p>
<a href="CerrarSesionServlet">Cerrar sesión</a>
<%
} else {
    // Nadie ha iniciado sesión
%>
<p>Nadie ha iniciado sesión.</p>
<%
    }
%>
</body>
</html>
