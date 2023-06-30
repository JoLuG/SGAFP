/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author wendy
 */
public class usuario {
    private String usuario;
    private String nombre;
    private String apaterno;
    private String amaterno;
    private String correo;
    private String password;
    private String foto;
    private String genero;
    private String telefono;

    public usuario() {
    }

    public usuario(String usuario, String nombre, String apaterno, String amaterno, String correo, String password, String foto, String genero, String telefono) {
        this.usuario = usuario;
        this.nombre = nombre;
        this.apaterno = apaterno;
        this.amaterno = amaterno;
        this.correo = correo;
        this.password = password;
        this.foto = foto;
        this.genero = genero;
        this.telefono = telefono;
    }

    public usuario(String foto) {
        this.foto = foto;
    }


    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApaterno() {
        return apaterno;
    }

    public void setApaterno(String apaterno) {
        this.apaterno = apaterno;
    }

    public String getAmaterno() {
        return amaterno;
    }

    public void setAmaterno(String amaterno) {
        this.amaterno = amaterno;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString() {
        return "usuario{" + "usuario=" + usuario + ", nombre=" + nombre + ", apaterno=" + apaterno + ", amaterno=" + amaterno + ", correo=" + correo + ", password=" + password + ", foto=" + foto + ", genero=" + genero + ", telefono=" + telefono + '}';
    }


}
