package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import controlador.control_impl;
import modelo.usuario;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/INT/ActualizarPerfilServlet")
public class ActualizarPerfilServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idusuario = request.getParameter("usuario");
        String nombre = request.getParameter("nombre");
        String apaterno = request.getParameter("apaterno");
        String amaterno = request.getParameter("amaterno");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");

        // Crear un objeto usuario con los nuevos datos
        usuario usuario = new usuario();
        usuario.setUsuario(idusuario);
        usuario.setNombre(nombre);
        usuario.setApaterno(apaterno);
        usuario.setAmaterno(amaterno);
        usuario.setCorreo(correo);
        usuario.setTelefono(telefono);

        // Actualizar la información del usuario en la base de datos
        control_impl controlador = new control_impl();
        controlador.modificarDatosUsuario(idusuario, nombre, apaterno, amaterno, correo, telefono);

        // Redireccionar a la página de perfil después de guardar los cambios
        response.sendRedirect("Perfil.jsp?usuario=" + idusuario);
    }
}
