package web;

import dao.CompraDAO;
import dao.ReciboDAO;
import dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Compra;
import model.Recibo;
import model.Usuario;

/**
 *
 * @author josel
 */
@WebServlet(name = "ServletFactura", urlPatterns = {"/ServletFactura"})
public class ServletFactura extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idUsuario = (int) request.getSession().getAttribute("idUsuario");
        UsuarioDAO usuDao = new UsuarioDAO();
        Usuario usu = usuDao.getUsuarioById(idUsuario);

        double subtotal = Double.parseDouble(request.getParameter("subtotal"));
        double envio = Double.parseDouble(request.getParameter("envio"));
        String metodoPago = request.getParameter("metodo");
        

        double total = subtotal + envio;
        
        request.setAttribute("total", total);
        request.setAttribute("usuario", usu);

        actualizarCompra(request, total, idUsuario);
        crearRecibo(request, total, metodoPago);
        
        request.getRequestDispatcher("/pages/Factura.jsp").forward(request, response);
    }

    private void actualizarCompra(HttpServletRequest request, double total, int idUsuario) {
        CompraDAO compDao = new CompraDAO();
        int idCompra = compDao.getUltimoIdCompra();
        Compra comp = compDao.getCompraById(idCompra);
        
        UsuarioDAO usuDao = new UsuarioDAO();
        Usuario usu = usuDao.getUsuarioById(idUsuario);
        
        comp.setUsuario(usu);
        comp.setTotalOrden(total);
        comp.setEstadoOrden("Completado");
        
        compDao.updateCompra(comp);
        
    }

    private void crearRecibo(HttpServletRequest request, double total, String metodoPago) {
        CompraDAO compDao = new CompraDAO();
        int idCompra = compDao.getUltimoIdCompra();

        Recibo recibo = new Recibo(idCompra, total, metodoPago);
        ReciboDAO dao = new ReciboDAO();
        dao.saveRecibo(recibo);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
