package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import Beans.Tarjeta;
import Model.TiendaModel;

@WebServlet("/TiendaController")
public class TiendaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	TiendaModel modelo = new TiendaModel();
	
    public TiendaController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = request.getParameter("op");
		if(opcion==null) {
			listar(request, response);
			return;
		}
		switch (opcion) {
        case "mostrarFiltro":
        	mostrarFiltro(request, response);
            break;
        case "buscar":
        	buscar(request, response);
        	break;
        case "filtro":
        	filtro(request, response);
        	break;
        case "tabla":
            tabla(request, response);
            break;
        case "añadirCarrito":
            añadirCarrito(request, response);
            break;
        case "verCarrito":
        	verCarrito(request, response);
        	break;
        case "eliminar":
        	eliminarJuegoCarrito(request, response);
        	break;
        
        default:
            listar(request, response);
            break;
		}
		
	}

    protected void eliminarJuegoCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		HttpSession session = request.getSession(false);
        	int idUsuario = (int) session.getAttribute("idUsuario");
        	int idVideojuego = Integer.parseInt(request.getParameter("id"));
        	modelo.eliminarJuegoCarrito(idVideojuego,idUsuario);
        	verCarrito(request, response);
        	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    protected void verCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		response.setContentType("text/html; charset=UTF-8");
    		HttpSession session = request.getSession(false);
        	int idUsuario = (int) session.getAttribute("idUsuario");
        	double saldo = (double) session.getAttribute("saldo");
        	
        	request.setAttribute("lista", modelo.listarCarrito(idUsuario));
        	request.setAttribute("saldo", saldo);
    	    request.getRequestDispatcher("tienda/carrito.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    protected void añadirCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		HttpSession session = request.getSession(false);
        	int idVideojuego = Integer.parseInt(request.getParameter("id"));
        	int idUsuario = (int) session.getAttribute("idUsuario");
        	modelo.añadirCarrito(idVideojuego, idUsuario);
        	listar(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    protected void filtro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		HttpSession session = request.getSession(false);
        	int idUsuario = (int) session.getAttribute("idUsuario");
    		
    		response.setContentType("text/html; charset=UTF-8");
    		String categoria = request.getParameter("categoria");
    		String desarrollador = request.getParameter("creador");
    		 
    		String preciominstring = request.getParameter("precioMin");
    		String preciomaxstring = request.getParameter("precioMax");
    		if(!preciomaxstring.equals("")||!preciominstring.equals("")) {
    			double preciomin = Double.parseDouble(request.getParameter("precioMin"));
    			double preciomax = Double.parseDouble(request.getParameter("precioMax"));
    			request.setAttribute("lista", modelo.filtrar(idUsuario,categoria, preciomin, preciomax, desarrollador));
        		request.getRequestDispatcher("tienda/fragmentos/tabla.jsp").forward(request, response);
    		}else {
    			request.setAttribute("lista", modelo.filtrar(idUsuario,categoria, null, null , desarrollador));
        		request.getRequestDispatcher("tienda/fragmentos/tabla.jsp").forward(request, response);
    		}
		} catch (Exception e) {
			e.printStackTrace();
		}
    
	}
    
    protected void tabla(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		response.setContentType("text/html; charset=UTF-8");
    		HttpSession session = request.getSession(false);
        	int idUsuario = (int) session.getAttribute("idUsuario");
        	request.setAttribute("lista",modelo.listarVideojuegos(idUsuario));
    	    request.getRequestDispatcher("tienda/fragmentos/tabla.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    protected void buscar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		HttpSession session = request.getSession(false);
        	int idUsuario = (int) session.getAttribute("idUsuario");
    		response.setContentType("text/html; charset=UTF-8");
    		String texto = request.getParameter("texto");
    	    request.setAttribute("lista", modelo.buscarPorNombre(texto,idUsuario));
    	    request.getRequestDispatcher("tienda/fragmentos/tabla.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
    
	}
    
    protected void mostrarFiltro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
    		response.setContentType("text/html; charset=UTF-8");
        	request.setAttribute("listarCategoria",modelo.listarCategoria());
        	request.setAttribute("listarCreador",modelo.listarCreador());
            request.getRequestDispatcher("tienda/fragmentos/filtro.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
    
	}
    
    protected void listar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html; charset=UTF-8");
    	HttpSession session = request.getSession(false);
    	int idUsuario = (int) session.getAttribute("idUsuario");
    	request.setAttribute("listarVideojuegos",modelo.listarVideojuegos(idUsuario));
        request.getRequestDispatcher("/tienda/tienda.jsp").forward(request, response);
	}
    
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
