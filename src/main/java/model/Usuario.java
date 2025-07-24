    /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
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
    @Column(name = "emailUsuario", nullable = false)
    private String emailUsuario;
    @Column(name = "telefonoUsuario", nullable = false)
    private String telefono;
    @Column(name = "direccionUsuario", nullable = false)
    private String direccion;
    @Column(name = "fechaRegistro", nullable = false,
             updatable = false)
    private Timestamp fechaRegistro;
    @Column(name = "contrasena", nullable = false)
    private String contrasena;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nombre, String apellido, String emailUsuario, String telefono, String direccion, String contrasena) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.emailUsuario = emailUsuario;
        this.telefono = telefono;
        this.direccion = direccion;
        this.contrasena = contrasena;
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

    public String getCorreo() {
        return emailUsuario;
    }

    public void setCorreo(String emailUsuario) {
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
    
    
}
