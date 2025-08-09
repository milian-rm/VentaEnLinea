/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package web;

import dao.CompraDAO;
import dao.DetalleCompraDAO;
import dao.ProductoDAO;
import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.DispatcherType;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Compra;
import model.DetalleCompra;
import model.Producto;
import model.Usuario;

/**
 *
 * @author Roberto
 */
@WebServlet(name = "ServletCarrito", urlPatterns = {"/ServletCarrito"})
public class ServletCarrito extends HttpServlet {
    
    private double totalin = 0;
    private int idCompraActiva = 0;
    private boolean carritoVacio = true;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if(accion.equals("eliminar")){
            int idDetalle = Integer.parseInt(request.getParameter("idDetalle"));
            eliminarDetalleAgregado(idDetalle);
        } else if(accion.equals("agregar")){
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));

            // Si no hay compra activa, se crea
            if (carritoVacio) {
                agregarCompra(1);
            }
                request.setAttribute("compraActiva", carritoVacio);

            agregarDetalleCompra(idCompraActiva, idProducto, cantidad);

        }
            response.sendRedirect("pages/CarritoCompra.jsp");
        
        
    }
    
    private void eliminarDetalleAgregado(int id){
        DetalleCompraDAO dao = new DetalleCompraDAO();
        dao.deleteDetalleCompra(id);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        carritoVacio = true;       
        request.getRequestDispatcher("/ServletFactura").forward(request, response);
    }
    
    private void agregarDetalleCompra(int idCompra, int idProduct, int cuantity){
        int idOrden = idCompra;
        int idProducto = idProduct;
        int cantidad = cuantity;

        CompraDAO compraDao = new CompraDAO();
        Compra compra = compraDao.getCompraById(idOrden);

        ProductoDAO productoDao = new ProductoDAO();
        Producto producto = productoDao.getProductoById(idProducto);
        double precio = producto.getPrecio();
        double subTotal = precio*cantidad;
        totalin = totalin + subTotal;

        DetalleCompraDAO dao = new DetalleCompraDAO();
        
        if (cantidad <= producto.getStock()) {

            try {
                DetalleCompra dc = new DetalleCompra(compra, producto, cantidad, subTotal);
                dao.saveDetalleCompra(dc);
            } catch (Exception e) {
                
            }
        }
    }
    
    
    private void agregarCompra (int idUser){
        //Si no hay una compra la voy a crear
        if(carritoVacio){
            int idUsuario = idUser; //Con otro método voy a mandar a traer el id del Usuario Activo
            int totalOrden = 0;
            String estadoOrden = "Creada";
            CompraDAO dao = new CompraDAO();

            //Busca la id de usuario, para comprobar que la id exista
            UsuarioDAO usuDao = new UsuarioDAO();
            Usuario usu = usuDao.getUsuarioById(idUsuario);

            Compra comp = new Compra(usu, totalOrden, estadoOrden);

            dao.saveCompra(comp);
            
            //Cree el método que manda a traer la última compra que se registro
            idCompraActiva = dao.getUltimoIdCompra();
            carritoVacio = false;
        } else {
            CompraDAO dao = new CompraDAO();
            //Con el id que se registro cuando se creo la compra, entonces se irá editando
            int idActualizar = idCompraActiva;
            Compra comp = dao.getCompraById(idActualizar);

            //se guarda en integer el texto del parametro
            int idUsu = idUser;

            //Con la variable idUsu se busca en Usuario para poder usarlo, también
            //Verifica que exista el id
            UsuarioDAO usuDao = new UsuarioDAO();
            Usuario usu = usuDao.getUsuarioById(idUsu);

            comp.setUsuario(usu);
            comp.setTotalOrden(totalin);
            comp.setEstadoOrden("Procesando...");

            dao.updateCompra(comp);
        }
        
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
    //ESO TILIN
    //BAILA TILIN
}
