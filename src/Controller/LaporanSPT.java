/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Koneksi;
import Model.ModelLaporanSPT;
import java.util.HashMap;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author Fahri Hanif
 */
public class LaporanSPT {
    

    public String idSpt, paramSpt;
    
    public void cetakSPT() {
            String Rs = "src/Laporan/reportSPT.jrxml";
            HashMap param = new HashMap();
            param.put(paramSpt,idSpt);
        try {
            JasperReport jasperReport = JasperCompileManager.compileReport(Rs);
            JasperPrint JasperPrint = JasperFillManager.fillReport(jasperReport,param, Koneksi.con);
            JasperViewer.viewReport(JasperPrint, false);
        } catch (JRException ex) {
            System.out.println(ex);
        }
    }//cetak

}
