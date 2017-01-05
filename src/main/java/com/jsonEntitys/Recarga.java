/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jsonEntitys;

/**
 *
 * @author intercitydev
 */
public class Recarga {

    private String monto;  //credit
    private String saldoAnterior; //after_balance
    private String saldoPosterior; //before_balance
    private String descripcion;  //descripcion
    private String horaRecarga;
    private String fechaRecarga;
    private String fecha;
    private int no;
    private int totalCount;

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }
    

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getMonto() {
        return monto;
    }

    public void setMonto(String monto) {
        this.monto = monto;
    }

    public String getSaldoAnterior() {
        return saldoAnterior;
    }

    public void setSaldoAnterior(String saldoAnterior) {
        this.saldoAnterior = saldoAnterior;
    }

    public String getSaldoPosterior() {
        return saldoPosterior;
    }

    public void setSaldoPosterior(String saldoPosterior) {
        this.saldoPosterior = saldoPosterior;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getHoraRecarga() {
        return horaRecarga;
    }

    public void setHoraRecarga(String horaRecarga) {
        this.horaRecarga = horaRecarga;
    }

    public String getFechaRecarga() {
        return fechaRecarga;
    }

    public void setFechaRecarga(String fechaRecarga) {
        this.fechaRecarga = fechaRecarga;
    }

}
