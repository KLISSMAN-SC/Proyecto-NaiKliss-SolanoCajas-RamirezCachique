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


@WebServlet("/PagoController")
public class PagoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TiendaModel modelo=new TiendaModel();
    public PagoController() {
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
       
        case "formularioComprar":
        	formularioComprar(request, response);
        	break;
        case "realizarCompraBilletera":
        	realizarCompraBilletera(request, response);
        	break;
        case "realizarCompraTarjeta":
        	realizarCompraTarjeta(request, response);
        	break;
        case "formularioBilletera":
        	formularioBilletera(request, response);
        	break;
        case "formularioTarjeta":
        	formularioTarjeta(request, response);
        	break;
        case "listar":
        	listar(request, response);
        	break;
		}

		
	}
	protected void realizarCompraBilletera(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	try {
	    		HttpSession session = request.getSession(false);
	        	int idUsuario = (int) session.getAttribute("idUsuario");
	        	String metodo = (String) request.getParameter("metodo");
	        	double precioApagar = Double.parseDouble(request.getParameter("totalPago"));
	        	modelo.registrarCompra(idUsuario, metodo, precioApagar);
	        	modelo.carritoBiblioteca(idUsuario);
	        	double saldoSesion = (double) session.getAttribute("saldo");
	        	double saldoNuevo = saldoSesion -precioApagar;

	        	
	        	session.setAttribute("saldo", saldoNuevo);
	        	
	        	 request.setAttribute("precioTotal", precioApagar);
	        	    request.setAttribute("idUsuario", idUsuario);

	        	   
	        	    request.getRequestDispatcher("tienda/confirmacion.jsp")
	        	           .forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	 protected void realizarCompraTarjeta(HttpServletRequest request, HttpServletResponse response) 
	    		throws ServletException, IOException{
	    	 	HttpSession session = request.getSession(false);
	    	    int idUsuario = (int) session.getAttribute("idUsuario");
	    	    
	    	    String metodoPago =(String) request.getParameter("metodo"); 
	    	    double total = Double.parseDouble(request.getParameter("total"));
	   	   
	    	    if ("SI".equals(request.getParameter("guardarTarjeta")) 
	    	        && "TARJETA".equals(metodoPago)) {
	    	    	Tarjeta tarjeta=new Tarjeta();
	    	    	
	    	    	String numeroTarjeta =(String) request.getParameter("numeroTarjeta");
	    	    	numeroTarjeta = numeroTarjeta.replace(" ", "");
	    	    	String fecha =(String) request.getParameter("mes")+"/"+request.getParameter("anio");
	    	    	String titular=(String)request.getParameter("nombre")+" "+request.getParameter("apellido");
	    	    	  
	    	    	tarjeta.setNumeroTarjeta(numeroTarjeta);
	    	    	tarjeta.setTitular(titular);
	    	    	tarjeta.setFechaVencimiento(fecha);
	    	        modelo.guardarTarjeta(tarjeta,idUsuario);
	    	    }
	    	    modelo.registrarCompra(idUsuario, metodoPago, total);
	        	modelo.carritoBiblioteca(idUsuario);

	        	request.setAttribute("precioTotal", total);
        	    request.setAttribute("idUsuario", idUsuario);

        	   
        	    request.getRequestDispatcher("tienda/confirmacion.jsp")
 	           .forward(request, response);
	    }
	    
	    
	 protected void formularioBilletera(HttpServletRequest request, HttpServletResponse response)
	    		throws ServletException, IOException{
	    	try {
	    		response.setContentType("text/html; charset=UTF-8");
	        	double monto=Double.parseDouble(request.getParameter("precioTotal"));
	        	System.out.println("PRECIO TOTAL RECIBIDO: " + request.getParameter("precioTotal"));
	        	request.setAttribute("precioTotal", monto);
	        	request.getRequestDispatcher("tienda/fragmentos/Fragbilletera.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    	
	    }
	protected void formularioTarjeta(HttpServletRequest request, HttpServletResponse response)
	    		throws ServletException, IOException{
	    	try {
	    		response.setContentType("text/html; charset=UTF-8");
	        	double monto=Double.parseDouble(request.getParameter("precioTotal"));
	        	HttpSession session = request.getSession(false);
	    	    int idUsuario = (int) session.getAttribute("idUsuario");
	        	Tarjeta tarjeta=new Tarjeta();
	        	tarjeta=modelo.obtenerTarjeta(idUsuario);
	        	
	        	request.setAttribute("tarjeta", tarjeta);
	        	request.setAttribute("precioTotal", monto);
	        	request.getRequestDispatcher("tienda/fragmentos/tarjeta.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    	
	    }
	    
	protected void formularioComprar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	try {
	    		
	    		double precio = Double.parseDouble(request.getParameter("precio"));
	    		HttpSession session = request.getSession(false);
	     	    int idUsuario = (int) session.getAttribute("idUsuario");
	    		request.setAttribute("idUsuario", idUsuario);
	    		request.setAttribute("precioTotal", precio);
	        	request.getRequestDispatcher("tienda/comprar.jsp").forward(request, response);
	        	
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
