package Model;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Beans.Categoria;
import Beans.Creador;
import Beans.VideoJuego;
import Beans.Tarjeta;
import Util.Conexion;

public class TiendaModel extends Conexion {
	
	CallableStatement cs;
	ResultSet rs;
	
	public void carritoBiblioteca(int idUsuario) {
		try {
			String sql = "CALL sp_carritoBiblioteca(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			cs.executeUpdate();
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
	}
	
	public void registrarCompra(int idUsuario, String metodoPago, double total) {
		try {
			String sql = "CALL sp_registrarCompra(?,?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			cs.setString(2, metodoPago);
			cs.setDouble(3, total);
			cs.executeUpdate();
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
	}
	
	public void eliminarJuegoCarrito(int idVideojuego, int idUsuario) {
		try {
			String sql = "CALL sp_eliminarJuegoCarrito(?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idVideojuego);
			cs.setInt(2, idUsuario);
			cs.executeUpdate();
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
	}
	
	public List<VideoJuego> listarCarrito(int id){
		ArrayList<VideoJuego> videojuegos = new ArrayList<VideoJuego>();
		try {
			String sql = "CALL sp_listarCarrito(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, id);
			rs = cs.executeQuery();
			while(rs.next()) {
				VideoJuego videojuego = new VideoJuego();
				videojuego.setIdVideoJuego(rs.getInt("id"));
				videojuego.setNombre(rs.getString("nombre"));
				videojuego.setPrecio(rs.getDouble("precio"));
				videojuego.setDesarrollador(rs.getString("desarrollador"));
				videojuego.setCategoria(rs.getString("categoria"));
				videojuego.setDescripcion(rs.getString("descripcion"));
				videojuegos.add(videojuego);
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return videojuegos;
	}
	
	public List<VideoJuego> añadirCarrito(int idVideojuego, int idCarrito){
		ArrayList<VideoJuego> videojuegos = new ArrayList<VideoJuego>();
		try {
			String sql = "CALL sp_añadirCarrito(?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idVideojuego);
			cs.setInt(2,idCarrito);
			cs.executeUpdate();
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return videojuegos;
	}
	
	public List<Creador> listarCreador(){
		ArrayList<Creador> creadores = new ArrayList<Creador>();
		try {
			String sql = "CALL sp_listarCreador()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while(rs.next()) {
				Creador creador = new Creador();
				creador.setIdCreador(rs.getInt("IdCreador"));
				creador.setDesarrollador(rs.getString("desarrollador"));
				creador.setNacionalidad(rs.getString("nacionalidad"));
				creadores.add(creador);
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return creadores;
	}
	
	public List<VideoJuego> filtrar(int idUsuario,String categoria, Double preciomin, Double precioMax, String creador){
	    ArrayList<VideoJuego> videojuegos = new ArrayList<>();
	    try {
	        String sql = "CALL sp_filtrar(?,?,?,?,?)";
	        this.abrirConexion();
	        cs = conexion.prepareCall(sql);
	        cs.setInt(1, idUsuario);
	        // parametro categoria
	        cs.setString(2, categoria);
	        // parametro precioMin
	        if (preciomin == null) {
	            cs.setNull(3, java.sql.Types.DECIMAL);
	        } else {
	            cs.setDouble(3, preciomin);
	        }
	        // parametro precioMax
	        if (precioMax == null) {
	            cs.setNull(4, java.sql.Types.DECIMAL);
	        } else {
	            cs.setDouble(4, precioMax);
	        }
	        // parametro creador
	        cs.setString(5, creador);
	        rs = cs.executeQuery();
	        while(rs.next()) {
	            VideoJuego videojuego = new VideoJuego();
	            videojuego.setIdVideoJuego(rs.getInt("IdVideojuego"));
	            videojuego.setNombre(rs.getString("nombre"));
	            videojuego.setPrecio(rs.getDouble("precio"));
	            videojuego.setDesarrollador(rs.getString("desarrollador"));
	            videojuego.setCategoria(rs.getString("categoria"));
	            videojuego.setEstado(rs.getString("estado"));
	            videojuego.setDescripcion(rs.getString("descripcion"));
	            videojuegos.add(videojuego);
	        }
	        this.cerrarConexion();
	    } catch (Exception e) {
	        e.printStackTrace();
	        this.cerrarConexion();
	    }
	    return videojuegos;
	}

	
	public List<VideoJuego> buscarPorNombre(String nombre,int idUsuario){
		ArrayList<VideoJuego> videojuegos = new ArrayList<VideoJuego>();
		try {
			String sql = "CALL sp_buscarPorNombre(?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, nombre);
			cs.setInt(2, idUsuario);
			rs = cs.executeQuery();
			while(rs.next()) {
				VideoJuego videojuego = new VideoJuego();
				videojuego.setIdVideoJuego(rs.getInt("IdVideojuego"));
				videojuego.setNombre(rs.getString("nombre"));
				videojuego.setPrecio(rs.getDouble("precio"));
				videojuego.setDesarrollador(rs.getString("desarrollador"));
				videojuego.setCategoria(rs.getString("categoria"));
				videojuego.setEstado(rs.getString("estado"));
				videojuego.setDescripcion(rs.getString("descripcion"));
				videojuegos.add(videojuego);
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return videojuegos;
	}
	
	public List<Categoria> listarCategoria(){
		ArrayList<Categoria> categorias = new ArrayList<Categoria>();
		try {
			String sql = "CALL sp_ListarCategorias()";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while(rs.next()) {
				Categoria categoria = new Categoria();
				categoria.setIdCategoria(rs.getInt("IdCategoria"));
				categoria.setCategoria(rs.getString("nombre_categoria"));
				categoria.setAbreviatura(rs.getString("abreviatura"));
				categorias.add(categoria);
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return categorias;
	}
	
	public List<VideoJuego> listarVideojuegos(int id){
		ArrayList<VideoJuego> videojuegos = new ArrayList<VideoJuego>();
		try {
			String sql = "CALL sp_listarVideoJuegos(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, id);
			rs = cs.executeQuery();
			while(rs.next()) {
				VideoJuego videojuego = new VideoJuego();
				videojuego.setIdVideoJuego(rs.getInt("IdVideojuego"));
				videojuego.setNombre(rs.getString("nombre"));
				videojuego.setPrecio(rs.getDouble("precio"));
				videojuego.setDesarrollador(rs.getString("desarrollador"));
				videojuego.setCategoria(rs.getString("categoria"));
				videojuego.setEstado(rs.getString("estado"));
				videojuego.setDescripcion(rs.getString("descripcion"));
				videojuegos.add(videojuego);
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return videojuegos;
	}
	public void guardarTarjeta(Tarjeta tarjeta,int idUsuario) {
		try {
			String sql="call sp_guardarTarjeta(?,?,?,?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setString(1, tarjeta.getNumeroTarjeta());
			cs.setString(2, tarjeta.getTitular());
			cs.setString(3, tarjeta.getFechaVencimiento());
			cs.setInt(4, idUsuario);
			cs.executeUpdate();
			this.cerrarConexion();
			
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
	}
	public Tarjeta obtenerTarjeta(int idUsuario) {
		Tarjeta tarjeta=null;
		try {
			String sql="call sp_obtenerTarjeta(?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs=cs.executeQuery();
			if(rs.next()) {
				tarjeta=new Tarjeta();
				tarjeta.setIdTarjeta(rs.getInt("idTarjeta"));
				tarjeta.setTitular(rs.getString("titular"));
				tarjeta.setUltimos4(rs.getString("ultimos4"));
				tarjeta.setFechaVencimiento(rs.getString("fechaVencimiento"));
			}
			this.cerrarConexion();
			
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return tarjeta;
	}
	
}
