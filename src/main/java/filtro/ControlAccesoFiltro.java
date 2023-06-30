package filtro;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@WebFilter("/INT/*")
public class ControlAccesoFiltro implements Filter {

    private Set<String> rutasPublicas;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialización del filtro
        rutasPublicas = new HashSet<>();
        rutasPublicas.add("/INT/InicioSesion.jsp");
        rutasPublicas.add("/INT/Crear-Cuenta.jsp");
        rutasPublicas.add("/index.jsp");
        rutasPublicas.add("/INT/index.jsp");
        rutasPublicas.add("/INT/InicioSesionServlet");
        rutasPublicas.add("/INT/prueba.jsp");
        rutasPublicas.add("/INT/Crear-Cuenta2.jsp");
        rutasPublicas.add("/INT/Verificacion.jsp");
        rutasPublicas.add("/INT/v.jsp");
        rutasPublicas.add("/INT/VAprobada.jsp");
        rutasPublicas.add("/INT/VDesaprobada.jsp");
        rutasPublicas.add("/INT/vp.jsp");
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
            return;
        }

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

    @Override
    public void destroy() {
        // Liberación de recursos del filtro
    }

    private boolean esRutaPublica(String ruta) {
        return rutasPublicas.contains(ruta);
    }
}
