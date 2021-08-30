package com.example.Artefactos.Model;
import com.example.Artefactos.Model.BeanDirect;

public class BeanArtefactos {
    private long idApa;
    private String nombreApa;
    private String diaApa;
    private BeanDirect idDirect;
    private int statusApa;

    public BeanArtefactos() {
    }

    public BeanArtefactos(long idApa, String nombreApa, String diaApa, BeanDirect idDirect, int statusApa) {
        this.idApa = idApa;
        this.nombreApa = nombreApa;
        this.diaApa = diaApa;
        this.idDirect = idDirect;
        this.statusApa = statusApa;
    }

    public long getIdApa() {
        return idApa;
    }

    public void setIdApa(long idApa) {
        this.idApa = idApa;
    }

    public String getNombreApa() {
        return nombreApa;
    }

    public void setNombreApa(String nombreApa) {
        this.nombreApa = nombreApa;
    }

    public String getDiaApa() {
        return diaApa;
    }

    public void setDiaApa(String diaApa) {
        this.diaApa = diaApa;
    }

    public BeanDirect getIdDirect() {
        return idDirect;
    }

    public void setIdDirect(BeanDirect idDirect) {
        this.idDirect = idDirect;
    }

    public int getStatusApa() {
        return statusApa;
    }

    public void setStatusApa(int statusApa) {
        this.statusApa = statusApa;
    }
}


