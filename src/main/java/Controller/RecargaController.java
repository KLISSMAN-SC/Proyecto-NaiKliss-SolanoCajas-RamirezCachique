package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Model.RecargaModel;

/**
 * Servlet implementation class RecargaController
 */
@WebServlet("/RecargaController")
public class RecargaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    RecargaModel modelo=new RecargaModel();
    public RecargaController() {
        super();
       
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String opcion = request.getParameter("op");
		if(opcion==null) {
			añadirFondos(request, response);
		}
		switch (opcion) {
		case "añadirFondos":
			añadirFondos(request, response);
			break;
		case "recargarSaldo":
			recargarSaldo(request, response);
			break;
		 case "pagoTarjeta":
	        	pagoTarjeta(request, response);
	        	break;
        default:
            añadirFondos(request, response);
		}
		
	}
    protected void añadirFondos(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
    	response.setContentType("text/html; charset=UTF-8");
    	HttpSession session = request.getSession(false);
    	
    	double saldoSesion = (double) session.getAttribute("saldo");
    	
    	request.setAttribute("saldo", saldoSesion);
    	request.getRequestDispatcher("/usuario/recargarFondos.jsp").forward(request, response);
    
    }
    protected void pagoTarjeta(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
    	response.setContentType("text/html; charset=UTF-8");
    	double monto=Double.parseDouble(request.getParameter("monto"));
    	request.setAttribute("monto", monto);
    	request.getRequestDispatcher("/usuario/pagoTarjeta.jsp").forward(request, response);
    }
    protected void recargarSaldo(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
    	response.setContentType("text/html; charset=UTF-8");
    	HttpSession session = request.getSession(false);
    	int idUsuario = (int) session.getAttribute("idUsuario");
    	double monto=Double.parseDouble(request.getParameter("monto"));
    	modelo.recargarSaldo(idUsuario, monto);
    	
    	double saldoSesion = (double) session.getAttribute("saldo");
    	double saldoNuevo = saldoSesion + monto;
    	session.setAttribute("saldo", saldoNuevo);
    	añadirFondos(request, response);
    	
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
