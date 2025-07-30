/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author informatica
 */
import model.Proveedor;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;
import javax.persistence.NoResultException;

public class ProveedorDAO {

    private static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("libreriaPU");

    public void saveProveedor(Proveedor proveedor) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.persist(proveedor);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al guardar proveedor: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo guardar el proveedor", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public Proveedor getProveedorById(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.find(Proveedor.class, id);
        } catch (Exception e) {
            System.err.println("Error al buscar proveedor por ID: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error buscando proveedor por ID", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void updateProveedor(Proveedor proveedor) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.merge(proveedor);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al actualizar proveedor: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo actualizar el proveedor", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void deleteProveedor(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            Proveedor proveedor = em.find(Proveedor.class, id);
            if (proveedor != null) {
                em.remove(proveedor);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al eliminar proveedor: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo eliminar el proveedor", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
    
    //Obtiene TODOS los provedores de la base de datos
    public List<Proveedor> getAllProveedores() {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.createQuery("SELECT p FROM Proveedor p", Proveedor.class).getResultList();
        } catch (Exception e) {
            System.err.println("Error al obtener todos los proveedores: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error obteniendo proveedores", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}