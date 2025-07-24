package web;

import java.io.IOException;
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

    // El EntityManagerFactory es pesado de crear, debe ser una única instancia y es thread-safe.
    // Lo hacemos estático o lo inicializamos solo una vez en init().
    private EntityManagerFactory entityManagerFactory;

    @Override
    public void init() throws ServletException {
        // Creamos el EntityManagerFactory una sola vez al iniciar el servlet.
        entityManagerFactory = Persistence.createEntityManagerFactory("PruebaWeb");
    }

    // Manejo de la solicitud POST del formulario de registro.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // CADA SOLICITUD DEBE TENER SU PROPIO EntityManager
        EntityManager entityManager = null; // Declaramos aquí para asegurar que se cierre en finally
        EntityTransaction transaction = null; // Declaramos aquí para asegurar que se haga rollback

        try {
            // Recuperar los datos del formulario.
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email = request.getParameter("email");
            String telefono = request.getParameter("telefono");
            String direccion = request.getParameter("direccion");
            String contraseña = request.getParameter("contraseña");

            // Validación de campos vacíos.
            if (nombre == null || nombre.isEmpty() || apellido == null || apellido.isEmpty() ||
                email == null || email.isEmpty() || contraseña == null || contraseña.isEmpty()) {
                response.sendRedirect("registro.jsp?error=campos_vacios");
                return;
            }

            // Validación de formato de email.
            if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                response.sendRedirect("registro.jsp?error=email_invalido");
                return;
            }

            // **IMPORTANTE:** Crear el EntityManager para ESTA solicitud dentro del método de servicio.
            entityManager = entityManagerFactory.createEntityManager();
            transaction = entityManager.getTransaction();

            // Iniciar la transacción.
            transaction.begin();

            // Verificar si el usuario ya existe.
            Long count = (Long) entityManager.createQuery("SELECT COUNT(u) FROM Usuario u WHERE u.correo = :email") // Asumo que el campo es 'correo' en tu entidad Usuario
                    .setParameter("email", email)
                    .getSingleResult();

            if (count > 0) {
                // Si el usuario existe, hacemos rollback de la transacción actual
                // (aunque no se haya persistido nada, es buena práctica si ya se inició)
                transaction.rollback();
                response.sendRedirect("registro.jsp?error=ya_existe");
                return;
            }

            // Crear un nuevo usuario.
            Usuario usuario = new Usuario();
            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setCorreo(email);
            usuario.setTelefono(telefono);
            usuario.setDireccion(direccion);
            usuario.setContrasena(contraseña);

            // Persistir el nuevo usuario en la base de datos.
            entityManager.persist(usuario);

            // Confirmar la transacción.
            transaction.commit();

            // Redirigir a la página de login con el mensaje de éxito.
            response.sendRedirect("login.jsp?registro=exitoso");

        } catch (Exception e) {
            e.printStackTrace();
            // Asegurarse de que la transacción se haga rollback si está activa
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            response.sendRedirect("registro.jsp?error=servidor");
        } finally {
            // **IMPORTANTE:** Cerrar el EntityManager al final de cada solicitud.
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public void destroy() {
        // Cerrar EntityManagerFactory cuando el servlet se destruya.
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
        }
    }
}