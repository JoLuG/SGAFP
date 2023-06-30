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
import modelo.usuario;

/**
 *
 * @author wendy
 */
public class control_impl implements control{

    @Override
    public void altaUsuario(usuario usuario) {
        try {
            PreparedStatement ps = (PreparedStatement) new dao().conecta().prepareStatement("INSERT INTO usuario VALUES(?,?,?,?,?,?,?,?,?)") ;
            ps.setString(1, usuario.getUsuario());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getApaterno());
            ps.setString(4, usuario.getAmaterno());
            ps.setString(5, usuario.getCorreo());
            ps.setString(6, usuario.getPassword());
            ps.setString(7, usuario.getFoto());
            ps.setString(8, usuario.getGenero());
            ps.setString(9, usuario.getTelefono());
            ps.execute();
            ps.close();
            System.out.println("Usuario insertado con exito :)");
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
    }


    @Override
    public void modificaUsuario(String idusuario, usuario usuario) {
        try {
            PreparedStatement ps = (PreparedStatement) new dao().conecta().prepareStatement("UPDATE usuario SET foto=?  WHERE usuario LIKE ?") ;
            ps.setString(1, usuario.getFoto());
            ps.setString(2, idusuario);
            ps.execute();
            ps.close();
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
    }

    @Override
    public usuario muestraUsuario(String idusuario) {
        usuario al = new usuario();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT * FROM usuario WHERE usuario LIKE '"+idusuario+"'");
            while(rs.next()){
                al.setUsuario(rs.getString(1));
                al.setNombre(rs.getString(2));
                al.setApaterno(rs.getString(3));
                al.setAmaterno(rs.getString(4));
                al.setCorreo(rs.getString(5));
                al.setPassword(rs.getString(6));
                al.setFoto(rs.getString(7));
                al.setGenero(rs.getString(8));
                al.setTelefono(rs.getString(9));
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return al;

    }

    @Override
    public ArrayList<usuario> muestraUsuarios() {
        ArrayList<usuario> usuarios = new ArrayList();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT * FROM usuario");
            while(rs.next()){
                usuario us = new usuario();
                us.setUsuario(rs.getString(1));
                us.setNombre(rs.getString(2));
                us.setApaterno(rs.getString(3));
                us.setAmaterno(rs.getString(4));
                us.setCorreo(rs.getString(5));
                us.setPassword(rs.getString(6));
                us.setFoto(rs.getString(7));
                us.setGenero(rs.getString(8));
                us.setTelefono(rs.getString(9));
                usuarios.add(us);
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return usuarios;
    }

    @Override
    public usuario verificacorreo(String correo, String password) {
        usuario al = new usuario();
        try {
            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT * FROM usuario WHERE correo LIKE '"+correo+"' AND password LIKE '"+password+"'");
            while(rs.next()){
                al.setUsuario(rs.getString(1));
                al.setNombre(rs.getString(2));
                al.setApaterno(rs.getString(3));
                al.setAmaterno(rs.getString(4));
                al.setCorreo(rs.getString(5));
                al.setPassword(rs.getString(6));
                al.setFoto(rs.getString(7));
                al.setGenero(rs.getString(8));
                al.setTelefono(rs.getString(9));
            }
        } catch (SQLException ex) {
            System.out.println("Error al ingresar dato: "+ex.getMessage());
        }
        return al;
    }

    @Override
    public usuario modificarDatosUsuario(String idusuario, String nombre, String apaterno, String amaterno, String correo, String telefono) {
        usuario al = new usuario();
        try {
            PreparedStatement ps = (PreparedStatement) new dao().conecta().prepareStatement("UPDATE usuario SET nombre=?, apaterno=?, amaterno=?, correo=?, telefono=? WHERE usuario LIKE ?");
            ps.setString(1, nombre);
            ps.setString(2, apaterno);
            ps.setString(3, amaterno);
            ps.setString(4, correo);
            ps.setString(5, telefono);
            ps.setString(6, idusuario);
            ps.executeUpdate();
            ps.close();

            ResultSet rs = new dao().conecta().createStatement().executeQuery("SELECT * FROM usuario WHERE usuario LIKE '" + idusuario + "'");
            while (rs.next()) {
                al.setUsuario(rs.getString(1));
                al.setNombre(rs.getString(2));
                al.setApaterno(rs.getString(3));
                al.setAmaterno(rs.getString(4));
                al.setCorreo(rs.getString(5));
                al.setPassword(rs.getString(6));
                al.setFoto(rs.getString(7));
                al.setGenero(rs.getString(8));
                al.setTelefono(rs.getString(9));
            }
            rs.close();
        } catch (SQLException ex) {
            System.out.println("Error al modificar los datos del usuario: " + ex.getMessage());
        }
        return al;
    }

}
