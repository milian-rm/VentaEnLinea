    /*
    * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
    * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
    */
    package web;

    import dao.CategoriaDAO;
    import dao.CategoriaDAO;
    import dao.ProductoDAO;
    import dao.ProductoDAO;
    import dao.ProveedorDAO;
    import java.io.IOException;
    import java.io.PrintWriter;
    import java.sql.Timestamp;
    import java.time.Instant;
    import java.util.List;
    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;
    import model.Categoria;
    import model.Categoria;
    import model.Producto;
    import model.Proveedor;

    /**
    *
    * @author informatica
    */
    @WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
    public class ProductoServlet extends HttpServlet {

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            String accion = request.getParameter("accion");
            switch (accion) {
                case "agregar":
                    agregarProducto(request, response);
                    break;
                case "editar":
                    formularioEditar(request, response);
                    break;
                case "actualizar":
                    editarProducto(request, response);
                    break;
                case "eliminar":
                    eliminarProducto(request, response);
                    break;
                case "listar":
                    listarProducto(request, response);
                    break;
                default:
                    System.out.println("hola");
            }
        }
        //Metodo para agregar Productos
        protected void agregarProducto(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
            int idCategoria = Integer.parseInt(solicitud.getParameter("idCategoria"));
            int idProveedor = Integer.parseInt(solicitud.getParameter("idProveedor"));
            String nombre = solicitud.getParameter("nombreProducto");
            String descripcion = solicitud.getParameter("descripcionProducto");
            double precio = Double.parseDouble(solicitud.getParameter("precio"));
            int stock = Integer.parseInt(solicitud.getParameter("stock"));
    //        Timestamp fechaCreacion = Timestamp.from(Instant.now());

            CategoriaDAO categoriaDAO = new CategoriaDAO();
            Categoria categoria = categoriaDAO.getCategoriaById(idCategoria);

            ProveedorDAO proveedorDao = new ProveedorDAO();
            Proveedor proveedor = proveedorDao.getProveedorById(idProveedor);

            ProductoDAO dao = new ProductoDAO();

            Producto dc = new Producto(categoria, proveedor, nombre, descripcion, precio, stock);
            dao.saveProducto(dc);


            respuesta.sendRedirect("ProductoServlet?accion=listar");
        }
        //Metodo para enviar a formulario de edición de Usuarios
        protected void formularioEditar(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
            ProductoDAO dao = new ProductoDAO();
            int idEditar = Integer.parseInt(solicitud.getParameter("id"));
            //Este metedo en el dao no existe, añadanlo
            Producto dc = dao.getProductoById(idEditar);

            solicitud.setAttribute("listaProducto", dc);
            solicitud.getRequestDispatcher("/pages/editarProducto.jsp").forward(solicitud, respuesta);
        }
        //Metodo para editar Usuario
        protected void editarProducto(HttpServletRequest solicitud, HttpServletResponse respuesta) throws ServletException, IOException {
            ProductoDAO dao = new ProductoDAO();
            CategoriaDAO categoriaDAO = new CategoriaDAO();
            ProveedorDAO proveedorDAO = new ProveedorDAO();

            int idActualizar = Integer.parseInt(solicitud.getParameter("id"));
            int idCategoria = Integer.parseInt(solicitud.getParameter("idCategoria"));
            int idProveedor = Integer.parseInt(solicitud.getParameter("idProveedor"));
            String nombre = solicitud.getParameter("nombreProducto");
            String descripcion = solicitud.getParameter("descripcionProducto");
            double precio = Double.parseDouble(solicitud.getParameter("precio"));
            int stock = Integer.parseInt(solicitud.getParameter("stock"));

            Categoria categoria = categoriaDAO.getCategoriaById(idCategoria);
            Proveedor proveedor = proveedorDAO.getProveedorById(idProveedor);

            Producto producto = dao.getProductoById(idActualizar);
            producto.setCategoria(categoria);
            producto.setProveedor(proveedor);
            producto.setNombreProducto(nombre);
            producto.setDescripcionProducto(descripcion);
            producto.setPrecio(precio);
            producto.setStock(stock);

            dao.updateProducto(producto);

            respuesta.sendRedirect("ProductoServlet?accion=listar");

        }
        protected void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            int idEliminar = Integer.parseInt(request.getParameter("id"));
            ProductoDAO dao = new ProductoDAO();
            dao.deleteProducto(idEliminar);
            response.sendRedirect("ProductoServlet?accion=listar");
        }
        protected void listarProducto(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            //Dao -> ListarTodos -> List<Clientes> ---------> Atributo(ListaClientes) -enviarlo-listarClientes
            ProductoDAO dao = new ProductoDAO();
            List<Producto> listaProducto = dao.getAllProductos();
            request.setAttribute("listaProducto", listaProducto);
            request.getRequestDispatcher("/pages/administracionProductos.jsp").forward(request, response);
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