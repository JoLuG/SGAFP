/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.ArrayList;
import modelo.usuario;

/**
 *
 * @author wendy
 */
public interface control {
    public void altaUsuario(usuario usuario);
    
    public void modificaUsuario(String idusuario, usuario usuario);
    
    public ArrayList<usuario> muestraUsuarios();
    
    public usuario muestraUsuario(String idusuario);
    
    public usuario verificacorreo(String correo, String password);
}
