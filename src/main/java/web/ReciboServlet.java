package web;

import dao.ReciboDAO;
import model.Recibo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author informatica
 */
@WebServlet(name = "ReciboServlet", urlPatterns = {"/ReciboServlet"})
public class ReciboServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "agregar":
                agregarRecibo(request, response);
                break;
            case "editar":
                formularioEditar(request, response);
                break;
            case "actualizar":
                editarRecibo(request, response);
                break;
            case "eliminar":
                eliminarRecibo(request, response);
                break;
            case "listar":
                listarRecibo(request, response);
                break;
            default:
                System.out.println("Acción no reconocida");
        }
    }

    protected void agregarRecibo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idOrden = Integer.parseInt(request.getParameter("idOrden"));
        double total = Double.parseDouble(request.getParameter("total"));
        String metodoPago = request.getParameter("metodoPago");

        Recibo recibo = new Recibo(idOrden, total, metodoPago);
        ReciboDAO dao = new ReciboDAO();
        dao.saveRecibo(recibo);

        response.sendRedirect("ReciboServlet?accion=listar");
    }

    protected void formularioEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idRecibo = Integer.parseInt(request.getParameter("id"));
        ReciboDAO dao = new ReciboDAO();
        Recibo recibo = dao.getReciboById(idRecibo);

        request.setAttribute("listaRecibo", recibo);
        request.getRequestDispatcher("/pages/editarRecibo.jsp").forward(request, response);
    }

    protected void editarRecibo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idActualizar = Integer.parseInt(request.getParameter("id"));
        int idOrden = Integer.parseInt(request.getParameter("idOrden"));
        double total = Double.parseDouble(request.getParameter("total"));
        String metodoPago = request.getParameter("metodoPago");

        ReciboDAO dao = new ReciboDAO();
        Recibo recibo = dao.getReciboById(idActualizar);

        recibo.setIdOrden(idOrden);
        recibo.setTotal(total);
        recibo.setMetodoPago(metodoPago);

        dao.updateRecibo(recibo);
        response.sendRedirect("ReciboServlet?accion=listar");
    }

    protected void eliminarRecibo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idRecibo = Integer.parseInt(request.getParameter("id"));
        ReciboDAO dao = new ReciboDAO();
        dao.deleteRecibo(idRecibo);
        response.sendRedirect("ReciboServlet?accion=listar");
    }

    protected void listarRecibo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ReciboDAO dao = new ReciboDAO();
        List<Recibo> listaRecibo = dao.getAllRecibos();
        request.setAttribute("listaRecibo", listaRecibo);
        request.getRequestDispatcher("/pages/administracionRecibo.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador para la entidad Recibo";
    }
}
