package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author informatica
 */
@Entity
@Table(name = "Proveedor")
public class Proveedor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idProveedor;
    @Column(name = "nombreProveedor", nullable = false)
    private String nombreProveedor;
    @Column(name = "contacto", nullable = false)
    private String contacto;
    @Column(name = "telefono", nullable = false)
    private String telefono;
    @Column(name = "email", nullable = false)
    private String email;
    @Column(name = "direccion", nullable = false)
    private String direccion;
    @Column(name = "paisOrigen", nullable = false)
    private String paisOrigen;
    @Column(name = "estado", nullable = false)
    private String estado;

    public Proveedor() {
    }

    public Proveedor(String nombreProveedor, String contacto, String telefono, String email, String direccion, String paisOrigen, String estado) {
        this.nombreProveedor = nombreProveedor;
        this.contacto = contacto;
        this.telefono = telefono;
        this.email = email;
        this.direccion = direccion;
        this.paisOrigen = paisOrigen;
        this.estado = estado;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getPaisOrigen() {
        return paisOrigen;
    }

    public void setPaisOrigen(String paisOrigen) {
        this.paisOrigen = paisOrigen;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "" + idProveedor + "";
    }
    
    
    
    
}
