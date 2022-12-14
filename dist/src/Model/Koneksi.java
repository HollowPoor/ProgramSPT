/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Fahri Hanif
 */
public class Koneksi {
    public static Connection con;
    public static Statement st;
    
    public static void koneksi(){
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spt_plut","root","");
            st = con.createStatement();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Koneksi Gagal"+ e);
        }
    }
}
