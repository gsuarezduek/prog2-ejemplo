// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.demo1.entidades;

import ar.edu.um.programacion2.demo1.entidades.Carta;

privileged aspect Carta_Roo_JavaBean {
    
    public String Carta.getPalo() {
        return this.palo;
    }
    
    public void Carta.setPalo(String palo) {
        this.palo = palo;
    }
    
    public String Carta.getNumero() {
        return this.numero;
    }
    
    public void Carta.setNumero(String numero) {
        this.numero = numero;
    }
    
    public String Carta.getFondo() {
        return this.fondo;
    }
    
    public void Carta.setFondo(String fondo) {
        this.fondo = fondo;
    }
    
    public Long Carta.getValor2() {
        return this.valor2;
    }
    
    public void Carta.setValor2(Long valor2) {
        this.valor2 = valor2;
    }
    
}
