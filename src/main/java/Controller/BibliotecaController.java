package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import Beans.Amistad;
import Beans.Biblioteca;
import Model.*;

@WebServlet("/BibliotecaController")
public class BibliotecaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BibliotecaModel modelo=new BibliotecaModel();   
    ReporteModel modelo2=new ReporteModel();
    public BibliotecaController() {
        super();
        
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
		String opcion = request.getParameter("op");
		if(opcion==null) {
			listarBibliotecaPersonal(request, response);
			return;
		}
		switch (opcion) {
		case "listarBibliotecaPersonal":
			listarBibliotecaPersonal(request, response);
			break;
		case "listarBibliotecaAmigo":
			listarBibliotecaAmigo(request, response);
			break;
		case "formularioReportes":
			formularioReportes(request, response);
			break;
		default:
			listarBibliotecaPersonal(request, response);
			break;
		}
		
	}
    private void listarBibliotecaPersonal(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
    	response.setContentType("text/html; charset=UTF-8");
    
    	HttpSession session = request.getSession(false);
    	
    
    	int id=(int) session.getAttribute("idUsuario");
    	String nombreUsuario=(String) session.getAttribute("nombreUsuario");
    	request.setAttribute("nombre", nombreUsuario);
    	request.setAttribute("listarBiblioteca", modelo.listarBiblioteca(id));
    	request.getRequestDispatcher("/biblioteca/biblioteca.jsp").forward(request, response);
    }
    private void listarBibliotecaAmigo(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
    	try {
			int idAmigo=Integer.parseInt(request.getParameter("idAmigo"));
			String nombreAmigo=request.getParameter("nombre");
			request.setAttribute("listarBiblioteca",modelo.listarBiblioteca(idAmigo));
			request.setAttribute("nombre", nombreAmigo);
			request.getRequestDispatcher("biblioteca/bibliotecaAmigo.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    private void formularioReportes(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
    	response.setContentType("text/html; charset=UTF-8");
        
    	HttpSession session = request.getSession(false);   
    	int id=(int) session.getAttribute("idUsuario");
    	
    	int cantidadJuegos=modelo2.obtenercantidadVideojuegos(id);
    	int cantidadAmigos=modelo2.obtenerCantidadAmigos(id);
    	List<Biblioteca> datosCategoria=modelo.listarPorCategoria(id);
    	Biblioteca categoria=modelo.categoriaFavorita(id);
    	List<Amistad> datosAmigos=modelo2.listarJuegosAmigos(id);
    	double totalAcumulado=modelo2.obtenerTotalAcumulado(id);
    		
    	
    	request.setAttribute("cantidadJuegos", cantidadJuegos);
    	request.setAttribute("cantidadAmigos", cantidadAmigos);
    	request.setAttribute("lista", datosCategoria);
    	request.setAttribute("categoriaFav", categoria);
    	request.setAttribute("lista2", datosAmigos);
    	request.setAttribute("totalAcumulado", totalAcumulado);
    	request.getRequestDispatcher("usuario/reportes.jsp").forward(request, response);
    	
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
