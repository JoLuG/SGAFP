/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import modelo.ingreso;

/**
 *
 * @author wendy
 */
public class controlIngreso_impl implements controlIngreso {

    @Override
    public void addingreso(ingreso ingreso) {
        try {
            PreparedStatement ps = (PreparedStatement) new dao().conecta().prepareStatement("INSERT INTO ingresos (descripcion, monto, fecha, usuario) VALUES(?,?,?,?)") ;
            ps.setString(1, ingreso.getDescripcion());
            ps.setInt(2, ingreso.getMonto());
            ps.setString(3, ingreso.getFecha()); 
            ps.setString(4, ingreso.getUsuario());
            ps.execute();
            ps.close();
            System.out.println("Ingreso insertado con exito :)");
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
    }

    @Override
    public void deleteingreso(int idIng) {
        try {
            PreparedStatement ps = (PreparedStatement) new dao().conecta().prepareStatement("DELETE FROM ingresos WHERE idingresos LIKE ?");
            ps.setInt(1, idIng);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
    }

    @Override
    public void modificaingreso(int idIng, ingreso ingreso, String usuario) {
        try {
            PreparedStatement ps = (PreparedStatement) new dao().conecta().prepareStatement("UPDATE ingresos SET descripcion=?, monto=?, fecha=?  WHERE idingresos LIKE ? AND usuario LIKE ?") ;
            ps.setString(1, ingreso.getDescripcion());
            ps.setInt(2, ingreso.getMonto());
            ps.setString(3, ingreso.getFecha());
            ps.setInt(4, idIng);
            ps.setString(5, usuario);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
    }

    @Override
    public ArrayList<ingreso> muestraingresos(String usuario) {
        ArrayList<ingreso> ingresos = new ArrayList();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT * FROM ingresos WHERE usuario LIKE '"+usuario+"'");
            while(rs.next()){
                ingreso in = new ingreso();
                in.setIdingresos(rs.getInt(1));
                in.setDescripcion(rs.getString(2));
                in.setMonto(rs.getInt(3));
                in.setFecha(rs.getString(4));
                in.setUsuario(rs.getString(5));
                ingresos.add(in);
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return ingresos;
    }

    @Override
    public ingreso muestraingreso(int idIng) {
        ingreso in = new ingreso();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT * FROM ingresos WHERE idingresos LIKE '"+idIng+"'");
            while(rs.next()){
                in.setIdingresos(rs.getInt(1));
                in.setDescripcion(rs.getString(2));
                in.setMonto(rs.getInt(3));
                in.setFecha(rs.getString(4));
                in.setUsuario(rs.getString(5));
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return in;
    }

    @Override
    public ArrayList<ingreso> muestraingresoGrafico(String usuario) {
        ArrayList<ingreso> ingresos = new ArrayList();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT fecha, SUM(monto) FROM ingresos WHERE usuario LIKE '"+usuario+"' GROUP BY fecha HAVING COUNT(*)>0 ORDER BY fecha DESC");
            while(rs.next()){
                ingreso in = new ingreso();
                in.setGroupfecha(rs.getString(1));
                in.setSUMmonto(rs.getInt(2));
                ingresos.add(in);
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return ingresos;
    }

    @Override
    public ArrayList<ingreso> muestraingresoGraficoTotales(String usuario) {
        ArrayList<ingreso> ingresos = new ArrayList();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT descripcion, SUM(monto) FROM ingresos WHERE usuario LIKE '"+usuario+"' GROUP BY descripcion HAVING COUNT(*)>0");
            while(rs.next()){
                ingreso in = new ingreso();
                in.setGroupDesc(rs.getString(1));
                in.setSUMmonto(rs.getInt(2));
                ingresos.add(in);
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return ingresos;
    }
    
}
