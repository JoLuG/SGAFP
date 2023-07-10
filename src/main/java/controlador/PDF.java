/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.File;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;


public class PDF {

    public void creaPDF2(String nom, String usuario, String Tgastos, String Total, String Mensaje, String Foto){
        try {
            File file = new File("C:\\Users\\jorge\\Documents\\Codigos\\Daniel\\SA\\src\\main\\webapp\\Jasper\\report1.jasper");
            JasperReport jp = (JasperReport) JRLoader.loadObject(file) ;
            HashMap param = new HashMap();
            param.put("parameter1", usuario);
            param.put("Tgastos", Tgastos);
            param.put("Total", Total);
            param.put("Mensaje", Mensaje);
            param.put("Foto", Foto);
            JasperPrint jas = JasperFillManager.fillReport(jp, param, new dao().conecta());
            JasperExportManager.exportReportToPdfFile(jas, "C:\\Users\\jorge\\Documents\\Codigos\\Daniel\\SA\\src\\main\\webapp\\PDF\\"+nom+".pdf");
        } catch (JRException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public void creaPDF3(String nom, String usuario, String Tingresos, String Total, String Mensaje, String Foto){
        try {
            File file = new File("C:\\Users\\jorge\\Documents\\Codigos\\Daniel\\SA\\src\\main\\webapp\\Jasper\\report2.jasper");
            JasperReport jp = (JasperReport) JRLoader.loadObject(file) ;
            HashMap param = new HashMap();
            param.put("parameter1", usuario);
            param.put("Tingresos", Tingresos);
            param.put("Total", Total);
            param.put("Mensaje", Mensaje);
            param.put("Foto", Foto);
            JasperPrint jas = JasperFillManager.fillReport(jp, param, new dao().conecta());
            JasperExportManager.exportReportToPdfFile(jas, "C:\\Users\\jorge\\Documents\\Codigos\\Daniel\\SA\\src\\main\\webapp\\PDF\\"+nom+".pdf");
        } catch (JRException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
