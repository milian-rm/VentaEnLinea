package web;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import model.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.EntityTransaction;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {

    private EntityManagerFactory entityManagerFactory;

    @Override
    public void init() throws ServletException {
        entityManagerFactory = Persistence.createEntityManagerFactory("libreriaPU");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().println("El servlet está funcionando.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Obtener parámetros del formulario
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String emailUsuario = request.getParameter("email");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String contrasena = request.getParameter("contrasena");

            // Validación básica de campos obligatorios
            if (nombre == null || nombre.isEmpty() ||
                apellido == null || apellido.isEmpty() ||
                emailUsuario == null || emailUsuario.isEmpty() ||
                contrasena == null || contrasena.isEmpty()) {
                response.sendRedirect("pages/register.jsp?error=campos_incompletos");
                return;
            }

            // Validación del formato de correo electrónico
//            if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
//                response.sendRedirect("pages/register.jsp?error=email_invalido");
//                return;
//            }

            entityManager = entityManagerFactory.createEntityManager();
            transaction = entityManager.getTransaction();
            transaction.begin();

            // Verificar si el correo ya está registrado
            Long count = (Long) entityManager.createQuery("SELECT COUNT(u) FROM Usuario u WHERE u.emailUsuario = :email")
                    .setParameter("email", emailUsuario)
                    .getSingleResult();
            
            if (count > 0) {
                response.sendRedirect("pages/register.jsp?error=ya_existe");
                return;
            }

            // Crear nuevo usuario
            Usuario usuario = new Usuario();
            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setCorreo(emailUsuario);
            usuario.setTelefono(telefono);
            usuario.setDireccion(direccion);
            usuario.setFechaRegistro(Timestamp.valueOf(LocalDateTime.now()));
            usuario.setContrasena(contrasena); // ¡En producción deberías cifrarla!

            // Persistir usuario
            entityManager.persist(usuario);
            transaction.commit();

            // Redirigir con éxito
            response.sendRedirect("pages/login.jsp?register=exitoso");

        } catch (Exception e) {
            e.printStackTrace(); // Mantenerlo para logs del servidor
            System.out.println("ERROR EN SERVLET: " + e.getMessage()); 
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            response.sendRedirect("pages/register.jsp?error=servidor");
        } finally {
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }
   

    @Override
    public void destroy() {
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
        }
    }
}
