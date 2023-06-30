package controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class Verificador {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Ingrese el correo o usuario a verificar: ");
        String input = scanner.nextLine();

        boolean existeCorreo = Verificador.correoExiste(input);
        boolean existeUsuario = Verificador.usuarioExiste(input);

        if (existeCorreo) {
            System.out.println("El correo " + input + " existe en la base de datos.");
        } else {
            System.out.println("El correo " + input + " no existe en la base de datos.");
        }

        if (existeUsuario) {
            System.out.println("El usuario " + input + " existe en la base de datos.");
        } else {
            System.out.println("El usuario " + input + " no existe en la base de datos.");
        }
    }

    public static boolean correoExiste(String correo) {
        boolean existe = false;
        dao dao = new dao(); // Instancia de la clase dao (ajusta el nombre según corresponda)

        try {
            Connection connection = dao.conecta(); // Obtener la conexión a la base de datos

            // Consulta SQL para verificar si el correo existe
            String query = "SELECT COUNT(*) AS count FROM usuario WHERE correo = ?";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, correo);

                try (ResultSet resultSet = statement.executeQuery()) {
                    resultSet.next();
                    int count = resultSet.getInt("count");

                    existe = count > 0;
                }
            }

            connection.close(); // Cerrar la conexión después de utilizarla
        } catch (Exception e) {
            e.printStackTrace();
        }

        return existe;
    }

    public static boolean usuarioExiste(String usuario) {
        boolean existe = false;
        dao dao = new dao(); // Instancia de la clase dao (ajusta el nombre según corresponda)

        try {
            Connection connection = dao.conecta(); // Obtener la conexión a la base de datos

            // Consulta SQL para verificar si el usuario existe
            String query = "SELECT COUNT(*) AS count FROM usuario WHERE usuario = ?";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, usuario);

                try (ResultSet resultSet = statement.executeQuery()) {
                    resultSet.next();
                    int count = resultSet.getInt("count");

                    existe = count > 0;
                }
            }

            connection.close(); // Cerrar la conexión después de utilizarla
        } catch (Exception e) {
            e.printStackTrace();
        }

        return existe;
    }
    public static boolean verificarContrasena(String correo, String password) {
        boolean correcta = false;
        dao dao = new dao(); // Instancia de la clase dao (ajusta el nombre según corresponda)

        try {
            Connection connection = dao.conecta(); // Obtener la conexión a la base de datos

            // Consulta SQL para verificar la contraseña
            String query = "SELECT COUNT(*) AS count FROM usuario WHERE correo = ? AND password = ?";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, correo);
                statement.setString(2, password);

                try (ResultSet resultSet = statement.executeQuery()) {
                    resultSet.next();
                    int count = resultSet.getInt("count");

                    correcta = count > 0;
                }
            }

            connection.close(); // Cerrar la conexión después de utilizarla
        } catch (Exception e) {
            e.printStackTrace();
        }

        return correcta;
    }
    public static String obtenerUsuario(String correo) {
        String usuario = "";
        dao dao = new dao(); // Instancia de la clase dao (ajusta el nombre según corresponda)

        try {
            Connection connection = dao.conecta(); // Obtener la conexión a la base de datos

            // Consulta SQL para obtener el usuario correspondiente al correo
            String query = "SELECT usuario FROM usuario WHERE correo = ?";

            try (PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, correo);

                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        usuario = resultSet.getString("usuario");
                    }
                }
            }

            connection.close(); // Cerrar la conexión después de utilizarla
        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }

}
