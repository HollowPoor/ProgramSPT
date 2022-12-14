/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.sql.ResultSet;
import Model.Koneksi;
import Model.Model_Konsultan;
import javax.swing.JOptionPane;

/**
 *
 * @author afifu
 */
public class Controller_Konsultan {
    ControllerTBL_Konsultan ctk = new ControllerTBL_Konsultan();
     public static String idPenggguna="k-01";
     
     public void reload(){
    Koneksi.koneksi();
        try{
            ResultSet rst=Koneksi.st.executeQuery("select * from tbl_konsultan");
            while(rst.next()){
                Model_Konsultan mdk=new Model_Konsultan();
                mdk.setId_konsultan(rst.getString(1));
                mdk.setKode_konsultan(rst.getString(2));
                mdk.setNama(rst.getString(3));
                mdk.setJabatan(rst.getString(4));
                mdk.setGolongan(rst.getString(5));
                mdk.setTingkatan(rst.getString(5));                
                ctk.insert(mdk);
            }
            rst.close();
        }
         catch(Exception z){
            System.out.print(z.getMessage());
         }
    }
     
     public boolean insert(Model_Konsultan mdk){
        boolean cek=true;
            
                try{
                String query="insert into tbl_konsultan values ('"+mdk.getId_konsultan()+"','"+mdk.getKode_konsultan()+"','"+mdk.getNama()+"','"+mdk.getJabatan()+"','"+mdk.getGolongan()+"','"+mdk.getTingkatan()+"')";
                Koneksi.st.executeUpdate(query);
            }
            catch(Exception z){
                JOptionPane.showMessageDialog(null,"Pengisian Data Gagal ??? \n"+ z.getMessage());
                cek=false;
            }        
        
       return cek; 
    }//blok insert
     
     
     public boolean update(Model_Konsultan mdk){
        boolean cek=true;
        try{
            String query="update tbl_pengguna set kode_konsultan='"+mdk.getKode_konsultan()+"',nama='"+mdk.getNama()+"',jabatan='"+mdk.getJabatan()+"',golongan='"+mdk.getGolongan()+"',tingkatan='"+mdk.getTingkatan()+"where id_konsultan='"+mdk.getId_konsultan()+"'";
            Koneksi.st.executeUpdate(query);
        }
        catch(Exception z){
            JOptionPane.showMessageDialog(null,"Ubah Data Gagal ??? \n"+ z.getMessage());
            cek=false;
        }
        return cek;
    }//blok update
     
      public boolean delete(String id){
        boolean cek=true;
        try{
            String query="delete from tbl_konsultan where id_konsultan='"+id+"'";
            Koneksi.st.executeUpdate(query);
        }
        catch(Exception z){
            JOptionPane.showMessageDialog(null,"Hapus Data Gagal ??? \n"+ z.getMessage());
            cek=false;
        }
        return cek;
    }//blok Delete
      
      
}
