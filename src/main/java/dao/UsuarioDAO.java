/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence; // Importa esto para crear el EMF

public class UsuarioDAO {

    // Se recomienda que el EntityManagerFactory sea estático o se inicialice una vez.
    // El nombre "PruebaWeb" debe coincidir con el <persistence-unit name="PruebaWeb"> en persistence.xml
    private static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("PruebaWeb");

    public void saveUsuario(Usuario usuario) {
        EntityManager em = null; // Declara el EntityManager
        try {
            em = EMF.createEntityManager(); // Crea tu propio EntityManager
            em.getTransaction().begin();    // INICIA la transacción local
            em.persist(usuario);
            em.getTransaction().commit();   // HACE COMMIT de la transacción
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback(); // HACE ROLLBACK en caso de error
            }
            System.err.println("Error al guardar usuario: " + e.getMessage());
            e.printStackTrace();
            // Puedes relanzar la excepción o manejarla de otra forma
            throw new RuntimeException("No se pudo guardar el usuario", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close(); // CIERRA el EntityManager
            }
        }
    }

    public Usuario findByEmail(String email) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.createQuery("SELECT u FROM Usuario u WHERE u.emailUsuario = :email", Usuario.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (javax.persistence.NoResultException e) {
            return null; // No se encontró ningún usuario
        } catch (Exception e) {
            System.err.println("Error al buscar usuario por email: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error buscando usuario", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close(); // CIERRA el EntityManager
            }
        }
    }

    // Otros métodos, si es necesario, con el mismo patrón de manejo de EM y transacciones
}