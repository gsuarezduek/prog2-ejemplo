// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ar.edu.um.programacion2.demo1.entidades;

import ar.edu.um.programacion2.demo1.entidades.Carta;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Carta_Roo_Finder {
    
    public static TypedQuery<Carta> Carta.findCartasByNumeroIsNull() {
        EntityManager em = Carta.entityManager();
        TypedQuery<Carta> q = em.createQuery("SELECT o FROM Carta AS o WHERE o.numero IS NULL", Carta.class);
        return q;
    }
    
    public static TypedQuery<Carta> Carta.findCartasByPaloLike(String palo) {
        if (palo == null || palo.length() == 0) throw new IllegalArgumentException("The palo argument is required");
        palo = palo.replace('*', '%');
        if (palo.charAt(0) != '%') {
            palo = "%" + palo;
        }
        if (palo.charAt(palo.length() - 1) != '%') {
            palo = palo + "%";
        }
        EntityManager em = Carta.entityManager();
        TypedQuery<Carta> q = em.createQuery("SELECT o FROM Carta AS o WHERE LOWER(o.palo) LIKE LOWER(:palo)", Carta.class);
        q.setParameter("palo", palo);
        return q;
    }
    
}
