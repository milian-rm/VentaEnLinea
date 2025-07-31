/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author informatica
 */
import model.Recibo;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;
import javax.persistence.NoResultException;

public class ReciboDAO {

    private static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("libreriaPU");

    public void saveRecibo(Recibo recibo) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.persist(recibo);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al guardar recibo: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo guardar el recibo", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public Recibo getReciboById(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.find(Recibo.class, id);
        } catch (Exception e) {
            System.err.println("Error al buscar recibo por ID: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error buscando recibo por ID", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void updateRecibo(Recibo recibo) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.merge(recibo);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al actualizar recibo: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo actualizar el recibo", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void deleteRecibo(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            Recibo recibo = em.find(Recibo.class, id);
            if (recibo != null) {
                em.remove(recibo);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al eliminar recibo: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo eliminar el recibo", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    // Obtiene TODOS los recibos de la base de datos
    public List<Recibo> getAllRecibos() {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.createQuery("SELECT r FROM Recibo r", Recibo.class).getResultList();
        } catch (Exception e) {
            System.err.println("Error al obtener todos los recibos: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error obteniendo recibos", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}