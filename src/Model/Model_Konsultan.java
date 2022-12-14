/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author afifu
 */
public class Model_Konsultan {
    String id_konsultan,kode_konsultan, nama, jabatan, golongan, tingkatan;

    public String getId_konsultan() {
        return id_konsultan;
    }

    public void setId_konsultan(String id_konsultan) {
        this.id_konsultan = id_konsultan;
    }

    public String getKode_konsultan() {
        return kode_konsultan;
    }

    public void setKode_konsultan(String kode_konsultan) {
        this.kode_konsultan = kode_konsultan;
    }

    

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getJabatan() {
        return jabatan;
    }

    public void setJabatan(String jabatan) {
        this.jabatan = jabatan;
    }

    public String getGolongan() {
        return golongan;
    }

    public void setGolongan(String golongan) {
        if(golongan.equals(""))
            this.golongan = "-";
        else
            this.golongan = golongan;
    }

    public String getTingkatan() {
        return tingkatan;
    }

    public void setTingkatan(String tingkatan) {
        if(tingkatan.equals(""))
            this.tingkatan = "-";
        else
            this.tingkatan = tingkatan;
    }
}
