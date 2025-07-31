
package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Timestamp;
import java.sql.Timestamp;
import java.time.Instant;

/**
 *
 * @author informatica
 */
@Entity
@Table (name = "Recibo")
public class Recibo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idRecibo;
    @Column(name = "idOrden", nullable = false)
    private int idOrden;
    @Column(name = "fechaRecibo", nullable = false)
    private Timestamp fechaRecibo;
    @Column(name = "total", nullable = false)
    private double total;
    @Column(name = "metodoPago", nullable = false)
    private String metodoPago;

    public Recibo() {
    }

    public Recibo(int idRecibo, int idOrden, Timestamp fechaRecibo, double total, String metodoPago) {
        this.idRecibo = idRecibo;
        this.idOrden = idOrden;
        this.fechaRecibo = fechaRecibo;
        this.total = total;
        this.metodoPago = metodoPago;
    }

    public Recibo(int idOrden, double total, String metodoPago) {
        this.idOrden = idOrden;
        this.total = total;
        this.metodoPago = metodoPago;
        fechaRecibo = Timestamp.from(Instant.now());
    }
    
    
    
    

    public int getIdProveedor() {
        return idRecibo;
    }

    public void setIdProveedor(int idRecibo) {
        this.idRecibo = idRecibo;
    }

    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public Timestamp getFechaRecibo() {
        return fechaRecibo;
    }

    public void setFechaRecibo(Timestamp fechaRecibo) {
        this.fechaRecibo = fechaRecibo;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    @Override
    public String toString() {
        return "" + idRecibo + "";
    }
    
    
    
    
}
