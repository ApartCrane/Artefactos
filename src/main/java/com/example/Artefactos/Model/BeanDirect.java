package com.example.Artefactos.Model;

public class BeanDirect {
    private long idDirect;
    private String direccion;

    public BeanDirect(long idDirect, String direccion, String urb, int postal, String estado, String pais) {
        this.idDirect = idDirect;
        this.direccion = direccion;
        this.urb = urb;
        this.postal = postal;
        this.estado = estado;
        this.pais = pais;
    }
    public BeanDirect(){

    }

    private String urb;
    private int postal;
    private String estado;
    private String pais;

    public long getIdDirect() {
        return idDirect;
    }

    public void setIdDirect(long idDirect) {
        this.idDirect = idDirect;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getUrb() {
        return urb;
    }

    public void setUrb(String urb) {
        this.urb = urb;
    }

    public int getPostal() {
        return postal;
    }

    public void setPostal(int postal) {
        this.postal = postal;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }




}
