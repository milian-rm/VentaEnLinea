/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package web;

import java.io.IOException;
import model.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.NoResultException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    // El EntityManagerFactory es thread-safe y debe crearse una única vez.
    private EntityManagerFactory entityManagerFactory;

    @Override
    public void init() throws ServletException {
        // Inicializar el EntityManagerFactory una sola vez cuando el servlet se inicia.
        entityManagerFactory = Persistence.createEntityManagerFactory("PruebaWeb");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        // Declara EntityManager y EntityTransaction localmente para cada solicitud
        EntityManager entityManager = null;
        EntityTransaction transaction = null;

        try {
            // Recuperar los datos del formulario.
            String email = request.getParameter("email");
            String contraseña = request.getParameter("contraseña");

            // Validación básica de campos (puedes agregar más validaciones aquí si es necesario)
            if (email == null || email.isEmpty() || contraseña == null || contraseña.isEmpty()) {
                response.sendRedirect("login.jsp?error=campos_vacios");
                return;
            }

            // **IMPORTANTE:** Crear un nuevo EntityManager para cada solicitud
            entityManager = entityManagerFactory.createEntityManager();
            transaction = entityManager.getTransaction();

            // Iniciar la transacción para la operación de búsqueda/validación
            transaction.begin();

            Usuario usuario = null;
            try {
                // Usamos JPQL para buscar el usuario por email
                // Asegúrate que 'emailUsuario' sea el nombre correcto del campo en tu entidad Usuario
                usuario = entityManager.createQuery("SELECT u FROM Usuario u WHERE u.emailUsuario = :email", Usuario.class)
                                     .setParameter("email", email)
                                     .getSingleResult();
            } catch (NoResultException e) {
                // Usuario no encontrado
                // No se necesita rollback si solo fue una consulta de lectura fallida
                response.sendRedirect("login.jsp?error=no_encontrado");
                return; // Importante retornar para no continuar el flujo
            }

            // Si el usuario fue encontrado, verificar la contraseña
            if (usuario != null && usuario.getContrasena().equals(contraseña)) {
                // Si las credenciales son correctas, se crea la sesión
                HttpSession session = request.getSession();
                session.setAttribute("idUsuario", usuario.getIdUsuario());
                session.setAttribute("nombre", usuario.getNombre());

                // No hay cambios en la base de datos aquí, pero hacemos commit de la transacción de lectura
                // para completar el ciclo. Es una consulta de lectura, el commit no "guarda" nada.
                transaction.commit();

                // Redirigir al inicio
                response.sendRedirect("inicio.jsp");
            } else {
                // Si las credenciales son incorrectas (contraseña no coincide)
            // Hacemos rollback aunque no haya habido cambios, para cerrar la transacción iniciada.
                transaction.rollback();
                response.sendRedirect("login.jsp?error=credenciales");
            }

        } catch (Exception e) {
            e.printStackTrace(); 
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            response.sendRedirect("login.jsp?error=error_servidor");
        } finally {
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }

    @Override
    public void destroy() {
        // Cerrar el EntityManagerFactory cuando el servlet se destruya.
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
        }
    }
}