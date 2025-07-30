/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author Emilio
 */
import model.DetalleCompra;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class DetalleCompraDAO {

    private static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("libreriaPU");

    public void saveDetalleCompra(DetalleCompra detalleCompra) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.persist(detalleCompra);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al guardar detalle de compra: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo guardar el detalle de compra", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public DetalleCompra getDetalleCompraById(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.find(DetalleCompra.class, id);
        } catch (Exception e) {
            System.err.println("Error al buscar detalle de compra por ID: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error buscando detalle de compra", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void updateDetalleCompra(DetalleCompra detalleCompra) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.merge(detalleCompra);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al actualizar detalle de compra: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo actualizar el detalle de compra", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void deleteDetalleCompra(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            DetalleCompra detalleCompra = em.find(DetalleCompra.class, id);
            if (detalleCompra != null) {
                em.remove(detalleCompra);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al eliminar detalle de compra: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo eliminar el detalle de compra", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public List<DetalleCompra> getAllDetallesCompra() {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.createQuery("SELECT dc FROM DetalleCompra dc", DetalleCompra.class).getResultList();
        } catch (Exception e) {
            System.err.println("Error al obtener todos los detalles de compra: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error obteniendo detalles de compra", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}