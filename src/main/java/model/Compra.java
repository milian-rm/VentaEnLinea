package model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

/**
 *
 * @author Angel Rodriguez
 */
@Entity
@Table(name = "Compras")
public class Compra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idOrden;

    @ManyToOne
    @JoinColumn(name = "idUsuario", nullable = false)
    private Usuario usuario;

    @Column(name = "fechaOrden", nullable = false)
    private Timestamp fechaOrden;

    @Column(name = "totalOrden", nullable = false)
    private double totalOrden;

    @Column(name = "estadoOrden", nullable = false)
    private String estadoOrden;

    public Compra() {
    }

    public Compra(Usuario usuario, double totalOrden, String estadoOrden) {
        this.usuario = usuario;
        this.totalOrden = totalOrden;
        this.estadoOrden = estadoOrden;
        // fechaOrden se establecerá automáticamente por la base de datos o en la lógica de negocio
    }

    public Compra(int idOrden, Usuario usuario, Timestamp fechaOrden, double totalOrden, String estadoOrden) {
        this.idOrden = idOrden;
        this.usuario = usuario;
        this.fechaOrden = fechaOrden;
        this.totalOrden = totalOrden;
        this.estadoOrden = estadoOrden;
    }

    // --- Getters y Setters ---
    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Timestamp getFechaOrden() {
        return fechaOrden;
    }

    public void setFechaOrden(Timestamp fechaOrden) {
        this.fechaOrden = fechaOrden;
    }

    public double getTotalOrden() {
        return totalOrden;
    }

    public void setTotalOrden(double totalOrden) {
        this.totalOrden = totalOrden;
    }

    public String getEstadoOrden() {
        return estadoOrden;
    }

    public void setEstadoOrden(String estadoOrden) {
        this.estadoOrden = estadoOrden;
    }
}
