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
import modelo.gasto;

/**
 *
 * @author wendy
 */
public class controlgasto_impl implements controlgasto{

    @Override
    public void addgasto(gasto gasto) {
        try {
            PreparedStatement ps = (PreparedStatement) new dao().conecta().prepareStatement("INSERT INTO gastos (descripcion, monto, fecha, usuario, categoria) VALUES(?,?,?,?,?)") ;
            ps.setString(1, gasto.getDescripcion());
            ps.setInt(2, gasto.getMonto());
            ps.setString(3, gasto.getFecha()); 
            ps.setString(4, gasto.getUsuario());
            ps.setInt(5, gasto.getCategoria());
            ps.execute();
            ps.close();
            System.out.println("Ingreso insertado con exito :)");
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
    }

    @Override
    public void deletegasto(int idgas) {
        try {
            PreparedStatement ps = (PreparedStatement) new dao().conecta().prepareStatement("DELETE FROM gastos WHERE idgastos LIKE ?");
            ps.setInt(1, idgas);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
    }

    @Override
    public void modificagasto(int idgas, gasto gasto, String usuario) {
        try {
            PreparedStatement ps = (PreparedStatement) new dao().conecta().prepareStatement("UPDATE gastos SET descripcion=?, monto=?, fecha=?  WHERE idgastos LIKE ? AND usuario LIKE ?") ;
            ps.setString(1, gasto.getDescripcion());
            ps.setInt(2, gasto.getMonto());
            ps.setString(3, gasto.getFecha());
            ps.setInt(4, idgas);
            ps.setString(5, usuario);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
    }

    @Override
    public ArrayList<gasto> muestragastos(String usuario, int categoria) {
        ArrayList<gasto> gastos = new ArrayList();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT * FROM gastos WHERE usuario LIKE '"+usuario+"' AND categoria LIKE '"+categoria+"'");
            while(rs.next()){
                gasto gas = new gasto();
                gas.setIdgastos(rs.getInt(1));
                gas.setDescripcion(rs.getString(2));
                gas.setMonto(rs.getInt(3));
                gas.setFecha(rs.getString(4));
                gas.setUsuario(rs.getString(5));
                gas.setCategoria(rs.getInt(6));
                gastos.add(gas);
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return gastos;
    }

    @Override
    public ArrayList<gasto> muestragastoGrafico(String usuario, int categoria) {
        ArrayList<gasto> gastos = new ArrayList();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT fecha, SUM(monto) FROM gastos WHERE usuario LIKE '"+usuario+"' AND categoria LIKE '"+categoria+"' GROUP BY fecha HAVING COUNT(*)>0 ORDER BY fecha DESC");
            while(rs.next()){
                gasto gas = new gasto();
                gas.setGroupfecha(rs.getString(1));
                gas.setSUMmonto(rs.getInt(2));
                gastos.add(gas);
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return gastos;
    }

    @Override
    public gasto muestragasto(int idgas) {
        gasto gas = new gasto();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT * FROM gastos WHERE idgastos LIKE '"+idgas+"'");
            while(rs.next()){
                gas.setIdgastos(rs.getInt(1));
                gas.setDescripcion(rs.getString(2));
                gas.setMonto(rs.getInt(3));
                gas.setFecha(rs.getString(4));
                gas.setUsuario(rs.getString(5));
                gas.setCategoria(rs.getInt(6));
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return gas;
    }

    @Override
    public ArrayList<gasto> muestragastoGraficoTotales(String usuario) {
        ArrayList<gasto> gastos = new ArrayList();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT nombre, SUM(monto) FROM gastos, categorias WHERE usuario LIKE '"+usuario+"' AND categoria=idcategoria GROUP BY nombre HAVING COUNT(*)>0 ORDER BY nombre DESC");
            while(rs.next()){
                gasto gas = new gasto();
                gas.setGroupcategoria(rs.getString(1));
                gas.setSUMmonto(rs.getInt(2));
                gastos.add(gas);
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return gastos;
    }

    @Override
    public ArrayList<gasto> muestragastoGeneral(String usuario) {
        ArrayList<gasto> gastos = new ArrayList();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT * FROM gastos WHERE usuario LIKE '"+usuario+"'");
            while(rs.next()){
                gasto gas = new gasto();
                gas.setIdgastos(rs.getInt(1));
                gas.setDescripcion(rs.getString(2));
                gas.setMonto(rs.getInt(3));
                gas.setFecha(rs.getString(4));
                gas.setUsuario(rs.getString(5));
                gas.setCategoria(rs.getInt(6));
                gastos.add(gas);
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return gastos;
    }

    
    
}
