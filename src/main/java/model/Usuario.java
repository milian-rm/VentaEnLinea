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
 * @author Roberto
 */
@Entity
@Table(name = "Usuarios")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idUsuario;

    @Column(name = "nombreUsuario", nullable = false)
    private String nombre;

    @Column(name = "apellidoUsuario", nullable = false)
    private String apellido;

    @Column(name = "emailUsuario", nullable = false, unique = true)
    private String emailUsuario;

    @Column(name = "telefonoUsuario")
    private String telefono;

    @Column(name = "direccionUsuario")
    private String direccion;

    @Column(name = "fechaRegistro", nullable = false, updatable = false)
    private Timestamp fechaRegistro;

    @Column(name = "contrasena", nullable = false)
    private String contrasena;

    @Column(name = "rol", columnDefinition = "ENUM('Cliente', 'Admin') DEFAULT 'Cliente'")
    private String rol;

    @Column(name = "nit", nullable = false)
    private String nit;

    public Usuario() {
    }

    public Usuario(String nombre, String apellido, String emailUsuario, String telefono, String direccion, String contrasena, String rol, String nit) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.emailUsuario = emailUsuario;
        this.telefono = telefono;
        this.direccion = direccion;
        this.contrasena = contrasena;
        this.rol = rol; 
        this.nit = nit;
    }

    public Usuario(int idUsuario, String nombre, String apellido, String emailUsuario, String telefono, String direccion, Timestamp fechaRegistro, String contrasena, String rol, String nit) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.emailUsuario = emailUsuario;
        this.telefono = telefono;
        this.direccion = direccion;
        this.fechaRegistro = fechaRegistro;
        this.contrasena = contrasena;
        this.rol = rol; 
        this.nit = nit;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Timestamp getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Timestamp fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getRol() { 
        return rol;
    }

    public void setRol(String rol) { 
        this.rol = rol;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }
}
