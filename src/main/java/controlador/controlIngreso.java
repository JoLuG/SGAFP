/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.util.ArrayList;
import modelo.ingreso;

/**
 *
 * @author wendy
 */
public interface controlIngreso {
    public void addingreso(ingreso ingreso);
    
    public void deleteingreso(int idIng);
    
    public void modificaingreso(int idIng, ingreso ingreso, String usuario);
    
    public ArrayList<ingreso> muestraingresos(String usuario);
    
    public ArrayList<ingreso> muestraingresoGrafico(String usuario);
    
    public ingreso muestraingreso(int idIng);
    
    public ArrayList<ingreso> muestraingresoGraficoTotales(String usuario);
}
