/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class UsuarioDAO {


    private static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("libreriaPU");

    public void saveUsuario(Usuario usuario) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager(); 
            em.getTransaction().begin();    
            em.persist(usuario);
            em.getTransaction().commit();  
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback(); 
            }
            System.err.println("Error al guardar usuario: " + e.getMessage());
            e.printStackTrace();
            
            throw new RuntimeException("No se pudo guardar el usuario", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close(); 
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
            return null;
        } catch (Exception e) {
            System.err.println("Error al buscar usuario por email: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error buscando usuario", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

  
}