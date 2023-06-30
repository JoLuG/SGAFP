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
public class gasto {
    private int idgastos;
    private String descripcion;
    private int monto;
    private String fecha;
    private String usuario;    
    private int categoria;
    
    private int SUMmonto;
    private String Groupfecha;
        
    private String Groupcategoria;
    
    public gasto() {
    }

    public gasto(int idgastos, String descripcion, int monto, String fecha, String usuario, int categoria) {
        this.idgastos = idgastos;
        this.descripcion = descripcion;
        this.monto = monto;
        this.fecha = fecha;
        this.usuario = usuario;
        this.categoria = categoria;
    }

    public gasto(String descripcion, int monto, String fecha, String usuario, int categoria) {
        this.descripcion = descripcion;
        this.monto = monto;
        this.fecha = fecha;
        this.usuario = usuario;
        this.categoria = categoria;
    }

    public String getGroupcategoria() {
        return Groupcategoria;
    }

    public void setGroupcategoria(String Groupcategoria) {
        this.Groupcategoria = Groupcategoria;
    }

    public int getSUMmonto() {
        return SUMmonto;
    }

    public void setSUMmonto(int SUMmonto) {
        this.SUMmonto = SUMmonto;
    }

    public String getGroupfecha() {
        return Groupfecha;
    }

    public void setGroupfecha(String Groupfecha) {
        this.Groupfecha = Groupfecha;
    }
    
    public int getIdgastos() {
        return idgastos;
    }

    public void setIdgastos(int idgastos) {
        this.idgastos = idgastos;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    @Override
    public String toString() {
        return "gasto{" + "idgastos=" + idgastos + ", descripcion=" + descripcion + ", monto=" + monto + ", fecha=" + fecha + ", usuario=" + usuario + ", categoria=" + categoria + '}';
    }
    
    
}
