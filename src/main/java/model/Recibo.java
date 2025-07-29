
package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;

/**
 *
 * @author informatica
 */
@Entity
@Table (name = "Recibo")
public class Recibo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idProveedor;
    @Column(name = "idOrden", nullable = false)
    private int idOrden;
    @Column(name = "fechaRecibo", nullable = false)
    private Date fechaRecibo;
    @Column(name = "total", nullable = false)
    private double total;
    @Column(name = "metodoPago", nullable = false)
    private String metodoPago;

    public Recibo() {
    }

    public Recibo(int idProveedor, int idOrden, Date fechaRecibo, double total, String metodoPago) {
        this.idProveedor = idProveedor;
        this.idOrden = idOrden;
        this.fechaRecibo = fechaRecibo;
        this.total = total;
        this.metodoPago = metodoPago;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public int getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(int idOrden) {
        this.idOrden = idOrden;
    }

    public Date getFechaRecibo() {
        return fechaRecibo;
    }

    public void setFechaRecibo(Date fechaRecibo) {
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
    
    
}
