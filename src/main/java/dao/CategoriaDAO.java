/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author informatica
 */
import model.Categoria;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;
import javax.persistence.NoResultException;

public class CategoriaDAO {

    private static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("libreriaPU");

    public void saveCategoria(Categoria categoria) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.persist(categoria);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al guardar categoría: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo guardar la categoría", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public Categoria getCategoriaById(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.find(Categoria.class, id);
        } catch (Exception e) {
            System.err.println("Error al buscar categoría por ID: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error buscando categoría por ID", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void updateCategoria(Categoria categoria) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            em.merge(categoria);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al actualizar categoría: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo actualizar la categoría", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    public void deleteCategoria(Integer id) {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            em.getTransaction().begin();
            Categoria categoria = em.find(Categoria.class, id);
            if (categoria != null) {
                em.remove(categoria);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em != null && em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            System.err.println("Error al eliminar categoría: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("No se pudo eliminar la categoría", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }

    // Obtiene TODAS las categorias de la base de datos
    public List<Categoria> getAllCategorias() {
        EntityManager em = null;
        try {
            em = EMF.createEntityManager();
            return em.createQuery("SELECT c FROM Categoria c", Categoria.class).getResultList();
        } catch (Exception e) {
            System.err.println("Error al obtener todas las categorías: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Error obteniendo categorías", e);
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}