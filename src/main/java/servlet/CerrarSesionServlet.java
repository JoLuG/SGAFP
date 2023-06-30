package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/INT/CerrarSesionServlet")
public class CerrarSesionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtener la sesión actual o crear una nueva si no existe
            HttpSession session = request.getSession(false);

            if (session != null) {
                // Invalidar la sesión
                session.invalidate();
            }

            // Redirigir al formulario de inicio de sesión
            response.sendRedirect("InicioSesion.jsp");
        } catch (Exception e) {
            // Manejo de errores
            e.printStackTrace();
            response.sendRedirect("Error.jsp");
        }
    }
}
