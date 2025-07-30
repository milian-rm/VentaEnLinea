/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Producto;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;
/**
 *
 * @author Emilio
 */
public class ProductoDAO {

    private static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("libreriaPU");

    public void saveProducto(Producto producto) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.persist(producto);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al guardar producto: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo guardar el producto", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public Producto getProductoById(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.find(Producto.class, id);
        } catch (Exception e) {
            System.err.println("Error al buscar producto por ID: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error buscando producto", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void updateProducto(Producto producto) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.merge(producto);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al actualizar producto: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo actualizar el producto", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void deleteProducto(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            Producto producto = em.find(Producto.class, id);
            if (producto != null) {
                em.remove(producto);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al eliminar producto: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo eliminar el producto", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    // muestra o obtiene todos los productos de la base de datos
    public List<Producto> getAllProductos() {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            // JPQL para seleccionar todos los productos
            return em.createQuery("SELECT p FROM Producto p", Producto.class).getResultList();
        } catch (Exception e) {
            System.err.println("Error al obtener todos los productos: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error obteniendo productos", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
    
    
}
