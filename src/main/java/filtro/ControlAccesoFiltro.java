package filtro;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/INT/*")
public class ControlAccesoFiltro implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialización del filtro
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String requestURI = request.getRequestURI();
        String contextoPath = request.getContextPath();
        String ruta = requestURI.substring(contextoPath.length());

        // Verificar si la ruta es pública o requiere inicio de sesión
        if (esRutaPublica(ruta) || ruta.equals("/INT/CerrarSesionServlet")) {
            // Ruta pública o cerrar sesión, permite el acceso sin verificar el inicio de sesión
            filterChain.doFilter(request, response);
        } else {
            // Ruta protegida, verificar el inicio de sesión
            HttpSession session = request.getSession(false);

            if (session != null && session.getAttribute("usuario") != null) {
                // El usuario ha iniciado sesión, obtener el usuario de la sesión
                String usuarioSesion = (String) session.getAttribute("usuario");

                // Obtener el usuario de la URL (si existe)
                String usuarioURL = request.getParameter("usuario");

                // Si el usuario de la URL no es válido o es diferente al de la sesión, redireccionar a la página con el usuario válido en la URL
                if (usuarioURL == null || usuarioURL.isEmpty() || !usuarioURL.equals(usuarioSesion)) {
                    String redirectURL = contextoPath + "/INT/Perfil.jsp?usuario=" + usuarioSesion;
                    response.sendRedirect(redirectURL);
                    return;
                }
            } else {
                // El usuario no ha iniciado sesión, redirige al formulario de inicio de sesión
                String redirectURL = contextoPath + "/INT/InicioSesion.jsp";
                response.sendRedirect(redirectURL);
                return;
            }

            // El usuario ha iniciado sesión y el usuario de la URL es válido, permite el acceso
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // Liberación de recursos del filtro
    }

    private boolean esRutaPublica(String ruta) {
        // Define aquí las rutas públicas que no requieren inicio de sesión
        return ruta.equals("/INT/InicioSesion.jsp") || ruta.equals("/INT/Crear-Cuenta.jsp") || ruta.equals("/index.jsp")
                || ruta.equals("/INT/index.jsp") || ruta.equals("/INT/InicioSesionServlet") || ruta.equals("/INT/prueba.jsp");
    }
}
