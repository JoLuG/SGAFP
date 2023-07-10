<%@ page import="java.io.IOException" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Path" %>
<%@ page import="java.nio.file.StandardCopyOption" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Perfil</title>
</head>
<body>
<%
    String usuario = request.getParameter("usuario");

    // Obtener la URL del servlet
    String servletURL = request.getContextPath() + "/INT/servlet";

%>
<form action="<%= servletURL %>" method="post" enctype="multipart/form-data">
    <input type="file" name="archivo" required>
    <input type="hidden" name="usuario" value="<%= usuario %>">
    <input type="submit" value="Subir foto">
</form>
<%
    // Resto del código del JSP
%>
</body>
</html>
