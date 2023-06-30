/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.ArrayList;
import modelo.gasto;

/**
 *
 * @author wendy
 */
public interface controlgasto {
    public void addgasto(gasto gasto);
    
    public void deletegasto(int idgas);
    
    public void modificagasto(int idgas, gasto gasto, String usuario);
    
    public ArrayList<gasto> muestragastos(String usuario, int categoria);
    
    public ArrayList<gasto> muestragastoGrafico(String usuario, int categoria);
    
    public gasto muestragasto(int idgas);
    
    public ArrayList<gasto> muestragastoGraficoTotales(String usuario);
    
    
    public ArrayList<gasto> muestragastoGeneral(String usuario);
}
