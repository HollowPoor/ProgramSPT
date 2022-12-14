/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.Vector;
import javax.swing.table.AbstractTableModel;
import Model.Model_Konsultan;
import javax.swing.JTable;

/**
 *
 * @author afifu
 */
public class ControllerTBL_Konsultan extends AbstractTableModel{

    private String[] kolom={"kode","Nama","Jabatan","Golongan","Tingkatan"};
    public static Vector<Model_Konsultan> feldData=new Vector<Model_Konsultan>();
    
    
    @Override
    public int getRowCount() {
        return feldData.size();  
    }

    @Override
    public int getColumnCount() {
           return kolom.length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {
        switch(columnIndex){
            case 0: return feldData.get(rowIndex).getId_konsultan();
            case 1: return feldData.get(rowIndex).getKode_konsultan();
            case 2: return feldData.get(rowIndex).getNama();
            case 3: return feldData.get(rowIndex).getJabatan();
            case 4: return feldData.get(rowIndex).getGolongan();
            case 5: return feldData.get(rowIndex).getTingkatan();                
            default: return null;
        }
    }
    
        @Override
public String getColumnName(int column) {
        return this.kolom[column];
    }

      public void insert(Model_Konsultan mdp) {
        feldData.add(mdp);
        fireTableRowsInserted(getRowCount(), getRowCount());          
      }

    public void update(int index, Model_Konsultan mdp){
        feldData.set(index, mdp);
        fireTableRowsUpdated(index, index);
    }
      public void delete(int index){
        feldData.remove(index);
        fireTableRowsDeleted(index - 1, index - 1);
      }

      public void removeAllData(){
        feldData.removeAllElements();
        fireTableRowsDeleted(getRowCount(), getRowCount());
      }
      
      public void lebarKolomTabel(JTable namaTable){
        namaTable.getColumnModel().getColumn(0).setPreferredWidth(30);
        namaTable.getColumnModel().getColumn(1).setPreferredWidth(100);
        namaTable.getColumnModel().getColumn(2).setPreferredWidth(70);
        namaTable.getColumnModel().getColumn(3).setPreferredWidth(100);
        namaTable.getColumnModel().getColumn(4).setPreferredWidth(100);
        namaTable.getColumnModel().getColumn(5).setPreferredWidth(100);
    }//lebar kolom
      public int search(String id){
        int n=0;
        int ketemu=-1;
        while(n<feldData.size() && ketemu==-1){
            if(id.equals(feldData.get(n).getId_konsultan()))
                ketemu=n;
            n++;
        }
        return ketemu;
    }
    
}
