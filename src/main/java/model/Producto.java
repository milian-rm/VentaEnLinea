package model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Angel Rodriguez
 */
@Entity
@Table(name = "Productos")
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idProducto;

    @Column(name = "nombreProducto", nullable = false)
    private String nombreProducto;

    @Column(name = "descripcionProducto")
    private String descripcionProducto;

    @Column(name = "precio", nullable = false)
    private double precio;

    @Column(name = "stock", nullable = false)
    private int stock;

    @Column(name = "categoria")
    private String categoria;

    @Column(name = "marca")
    private String marca;

    @Column(name = "fechaCreacion", nullable = false, updatable = false)
    private Timestamp fechaCreacion;

    public Producto() {
    }

    public Producto(String nombreProducto, String descripcionProducto, double precio, int stock, String categoria, String marca) {
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.precio = precio;
        this.stock = stock;
        this.categoria = categoria;
        this.marca = marca;
    }

    public Producto(int idProducto, String nombreProducto, String descripcionProducto, double precio, int stock, String categoria, String marca, Timestamp fechaCreacion) {
        this.idProducto = idProducto;
        this.nombreProducto = nombreProducto;
        this.descripcionProducto = descripcionProducto;
        this.precio = precio;
        this.stock = stock;
        this.categoria = categoria;
        this.marca = marca;
        this.fechaCreacion = fechaCreacion;
    }

    // --- Getters y Setters ---
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public Timestamp getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Timestamp fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
}
