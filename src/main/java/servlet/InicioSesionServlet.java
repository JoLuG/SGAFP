package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import controlador.Verificador;
import jakarta.servlet.http.HttpSession;
@WebServlet("/INT/InicioSesionServlet")
public class InicioSesionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("Correo");
        String password = request.getParameter("Password");

        boolean correoExiste = Verificador.correoExiste(correo);
        boolean contrasenaCorrecta = Verificador.verificarContrasena(correo, password);

        if (correoExiste && contrasenaCorrecta) {
            String usuario = Verificador.obtenerUsuario(correo);

            // Obtener la sesión actual o crear una nueva si no existe
            HttpSession session = request.getSession(true);

            // Almacenar el usuario en la sesión
            session.setAttribute("usuario", usuario);

            // Redirigir a la página de perfil con el parámetro del usuario
            String contextPath = request.getContextPath();
            response.sendRedirect(contextPath + "/INT/Perfil.jsp?usuario=" + usuario);
        } else {
            String mensaje = "Correo o contraseña incorrectos";
            request.setAttribute("mensaje", mensaje);
            request.getRequestDispatcher("InicioSesion.jsp").forward(request, response);
        }
    }
}
