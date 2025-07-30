/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Emilio
 */
import model.Compra;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class CompraDAO {

    private static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("libreriaPU");

    public void saveCompra(Compra compra) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.persist(compra);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al guardar compra: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo guardar la compra", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public Compra getCompraById(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.find(Compra.class, id);
        } catch (Exception e) {
            System.err.println("Error al buscar compra por ID: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error buscando compra", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void updateCompra(Compra compra) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.merge(compra);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al actualizar compra: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo actualizar la compra", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void deleteCompra(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            Compra compra = em.find(Compra.class, id);
            if (compra != null) {
                em.remove(compra);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al eliminar compra: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo eliminar la compra", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public List<Compra> getAllCompras() {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.createQuery("SELECT c FROM Compras c", Compra.class).getResultList();
        } catch (Exception e) {
            System.err.println("Error al obtener todas las compras: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error obteniendo compras", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}