/*
* Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
* Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
*/
package web;
 
import dao.CompraDAO;
import dao.DetalleCompraDAO;
import dao.DetalleCompraDAO;
import dao.ProductoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Compra;
import model.DetalleCompra;
import model.Producto;
 
/**
*
* @author informatica
*/
@WebServlet(name = "DetalleServlet", urlPatterns = {"/DetalleServlet"})
public class DetalleServlet extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "agregar":
                agregarDetalle(request, response);
                break;
            case "editar":
                formularioEditar(request, response);
                break;
            case "actualizar":
                editarDetalle(request, response);
                break;
            case "eliminar":
                eliminarDetalle(request, response);
                break;
            case "listar":
                listarDetalle(request, response);
                break;
            default:
                System.out.println("hola");
        }
    }
    //Metodo para agregar Detalles
    protected void agregarDetalle(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        int idOrden = Integer.parseInt(solicitud.getParameter("idOrden"));
        int idProducto = Integer.parseInt(solicitud.getParameter("idProducto"));
        int cantidad = Integer.parseInt(solicitud.getParameter("cantidad"));
        double precio = Double.parseDouble(solicitud.getParameter("precioUnitario"));

        CompraDAO compraDao = new CompraDAO();
        Compra compra = compraDao.getCompraById(idOrden);

        ProductoDAO productoDao = new ProductoDAO();
        Producto producto = productoDao.getProductoById(idProducto);

        DetalleCompraDAO dao = new DetalleCompraDAO();

        if (cantidad <= producto.getStock()) {
            DetalleCompra dc = new DetalleCompra(compra, producto, cantidad, precio);
            dao.saveDetalleCompra(dc);
        } else {
            System.out.println("Se quisieron comprar más productos de los que hay");
        }

        respuesta.sendRedirect("DetalleServlet?accion=listar");
    }
    //Metodo para enviar a formulario de edición de Usuarios
    protected void formularioEditar(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        DetalleCompraDAO dao = new DetalleCompraDAO();
        int idEditar = Integer.parseInt(solicitud.getParameter("id"));
        //Este metedo en el dao no existe, añadanlo
        DetalleCompra dc = dao.getDetalleCompraById(idEditar);

        solicitud.setAttribute("listaDetalle", dc);
        solicitud.getRequestDispatcher("/pages/editarDetalleCompra.jsp").forward(solicitud, respuesta);
    }
    //Metodo para editar Usuario
    protected void editarDetalle(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
        DetalleCompraDAO dao = new DetalleCompraDAO();
        CompraDAO compraDAO = new CompraDAO();
        ProductoDAO productoDAO = new ProductoDAO();

        int idActualizar = Integer.parseInt(solicitud.getParameter("id"));
        int idOrden = Integer.parseInt(solicitud.getParameter("idOrden"));
        int idProducto = Integer.parseInt(solicitud.getParameter("idProducto"));
        int cantidad = Integer.parseInt(solicitud.getParameter("cantidad"));
        double precioUnitario = Double.parseDouble(solicitud.getParameter("precioUnitario"));

        Compra compra = compraDAO.getCompraById(idOrden);
        Producto producto = productoDAO.getProductoById(idProducto);

        DetalleCompra detalle = dao.getDetalleCompraById(idActualizar);
        detalle.setCompra(compra);
        detalle.setProducto(producto);
        detalle.setCantidad(cantidad);
        detalle.setPrecioUnitario(precioUnitario);

        dao.updateDetalleCompra(detalle);

        respuesta.sendRedirect("DetalleServlet?accion=listar");

    }
    protected void eliminarDetalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEliminar = Integer.parseInt(request.getParameter("id"));
        DetalleCompraDAO dao = new DetalleCompraDAO();
        dao.deleteDetalleCompra(idEliminar);
        response.sendRedirect("DetalleServlet?accion=listar");
    }
    protected void listarDetalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Dao -> ListarTodos -> List<Clientes> ---------> Atributo(ListaClientes) -enviarlo-listarClientes
        DetalleCompraDAO dao = new DetalleCompraDAO();
        List<DetalleCompra> listaDetalle = dao.getAllDetallesCompra();
        request.setAttribute("listaDetalle", listaDetalle);
        request.getRequestDispatcher("/pages/administracionDetalleCompra.jsp").forward(request, response);
    }
 
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