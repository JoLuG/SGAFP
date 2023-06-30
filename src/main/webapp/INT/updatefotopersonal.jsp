<%-- 
    Document   : updatefotopersonal
    Created on : 28/05/2023, 03:42:53 PM
    Author     : wendy
--%>

<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.util.List"%>
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
            
            
            FileItemFactory file = new DiskFileItemFactory();
            ServletFileUpload fileUpload = new ServletFileUpload(file);
            List items = fileUpload.parseRequest((HttpServletRequest) request);
            for (int i = 0; i < items.size(); i++) {
                    FileItem fileItem = (FileItem) items.get(i);
                    if (!fileItem.isFormField()) {
                        File f = new File("C:\\Users\\jorge\\Documents\\Codigos\\Daniel\\SA\\src\\main\\webapp\\IMGPerfil\\"+fileItem.getName());
                        fileItem.write(f);
                        modelo.usuario us1 = new modelo.usuario("../IMGPerfil/"+fileItem.getName());
                        new controlador.control_impl().modificaUsuario(usuario, us1);
                        response.sendRedirect("Perfil.jsp?usuario="+usuario);    
                        }
                }
        %>
    </body>
</html>
