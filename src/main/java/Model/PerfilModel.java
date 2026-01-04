package Model;

import java.sql.CallableStatement;
import java.sql.ResultSet;

import Util.Conexion;

public class PerfilModel extends Conexion {
	CallableStatement cs;
	ResultSet rs;
	public void modificarPerfil(int idUsuario, String usuario, String pais, String estado, String descripcion) {
		try {
			String sql="call sp_modificarPerfil(?,?,?,?,?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			cs.setString(2, usuario);
			cs.setString(3, pais);
			cs.setString(4, estado);
			cs.setString(5, descripcion);
		
			cs.executeUpdate();
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
	}
	public void modificarAvatar(int idUsuario, String avatar) {
		try {
			String sql="call new_modificarAvatar(?,?)";
			this.abrirConexion();
			cs=conexion.prepareCall(sql);
			cs.setInt(1, idUsuario);
			cs.setString(2, avatar);
			cs.executeUpdate();
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
			this.cerrarConexion();
		}
	}
}
