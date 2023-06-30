package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dao {
    final String user = "root";
    final String pass = "123456789";
    final String driver = "com.mysql.cj.jdbc.Driver";
    final String url = "jdbc:mysql://localhost:3306/safp?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

    public Connection conecta() {
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("Conexion exitosa");
        } catch (ClassNotFoundException ex) {
            System.out.println("Error de driver: " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println("Error de mysql: " + ex.getMessage());
        }
        return con;
    }

    public void closeConnection(Connection con) {
        if (con != null) {
            try {
                con.close();
                DriverManager.deregisterDriver(DriverManager.getDriver(url));
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }
}
