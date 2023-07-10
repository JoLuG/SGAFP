package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

@WebServlet("/INT/servlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // Tamaño máximo antes de almacenar en disco
        maxFileSize = 1024 * 1024 * 10,      // Tamaño máximo del archivo
        maxRequestSize = 1024 * 1024 * 50)   // Tamaño máximo de la solicitud
public class MiServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // Obtener el usuario del parámetro oculto
        String usuario = request.getParameter("usuario");

        // Obtener la parte del archivo enviado en la solicitud
        Part filePart = request.getPart("archivo");

        // Obtener el nombre del archivo
        String fileName = filePart.getSubmittedFileName();

        // Obtener el InputStream del archivo enviado
        InputStream inputStream = filePart.getInputStream();

        // Directorio de destino para guardar el archivo
        String directorioDestino = "C:\\Users\\jorge\\Documents\\Codigos\\Daniel\\SA\\src\\main\\webapp\\IMGPerfil\\";

        // Crear la ruta completa del archivo de destino
        String rutaArchivoDestino = directorioDestino + fileName;

        // Guardar el archivo en la ruta de destino
        try {
            Path rutaDestino = Path.of(rutaArchivoDestino);
            Files.copy(inputStream, rutaDestino, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Crear la instancia de usuario
        modelo.usuario us1 = new modelo.usuario("../IMGPerfil/" + fileName);

        // Llamar al método para modificar el usuario
        new controlador.control_impl().modificaUsuario(usuario, us1);

        // Redireccionar a la página de perfil con el parámetro de usuario
        response.sendRedirect("Perfil.jsp?usuario=" + usuario);
    }
}
