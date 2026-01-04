package Model;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Beans.Amistad;
import Beans.Biblioteca;
import Util.Conexion;

public class ReporteModel extends Conexion{
	CallableStatement cs;
	ResultSet rs;
	
	public int obtenerCantidadAmigos(int idUsuario) {
		int cantidad=0;
		try {
			
			String sql="CALL sp_contarAmigos(?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs=cs.executeQuery();
			if(rs.next()) {
				cantidad=rs.getInt("total");
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return cantidad;
	}
	
	public int obtenercantidadVideojuegos(int idUsuario) {
		
		int cantidad=0;
		try {
			
			String sql="CALL sp_contarVideojuegos(?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs=cs.executeQuery();
			if(rs.next()) {
				cantidad=rs.getInt("CANTIDAD");
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return cantidad;
	}
	public List<Amistad> listarJuegosAmigos(int idUsuario){
		ArrayList<Amistad> amistad=new ArrayList<Amistad>();
		try {
			String sql = "CALL sp_juegos_amigos(?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs = cs.executeQuery();
			while(rs.next()) {
				Amistad a = new Amistad();
				a.setNombreAmigo(rs.getString("AMIGO"));
				a.setCantidad(rs.getInt("CANTIDAD"));
				amistad.add(a);
			}
			this.cerrarConexion();	
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
			
		}
		return amistad;
	}
	public double obtenerTotalAcumulado(int idUsuario) {
		int total=0;
		try {
			
			String sql="CALL sp_saldoAcumulado(?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			rs=cs.executeQuery();
			if(rs.next()) {
				total=rs.getInt("TOTAL");
			}
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
		return total;
	}
}
