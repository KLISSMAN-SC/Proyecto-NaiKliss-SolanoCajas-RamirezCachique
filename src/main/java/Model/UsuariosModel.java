package Model;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Beans.Usuario;

import Util.Conexion;

public class UsuariosModel extends Conexion{
	CallableStatement cs;
	ResultSet rs;
	
	public void crearUsuario(Usuario usuario) {
		try {
			String sql = "CALL sp_insertarUsuario(?,?,?,?)";
			this.abrirConexion();
			cs = conexion.prepareCall(sql);
			cs.setString(1, usuario.getNombreUsuario());
			cs.setString(2, usuario.getPassword());
			cs.setString(3, usuario.getNombreCompleto());
			cs.setString(4, usuario.getEmail());
			cs.executeUpdate();
			this.cerrarConexion();
		} catch (Exception e) {
			e.printStackTrace();
            this.cerrarConexion();
		}
	}
	
	public Usuario autenticarUsuario(String nombreUsuario, String password) {
        Usuario usuario = null;
        try {
            String sql = "CALL sp_autenticarUsuario(?,?)";
            this.abrirConexion();
            cs = conexion.prepareCall(sql);
            cs.setString(1, nombreUsuario);
            cs.setString(2, password);
            rs = cs.executeQuery();
            
            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("idUsuario"));
                usuario.setNombreUsuario(rs.getString("nombre_usuario"));
                usuario.setFechaCreacion(rs.getDate("fecha_creacion"));
                usuario.setNombreCompleto(rs.getString("nombre_completo"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSaldo(rs.getDouble("saldo"));
                usuario.setRol(rs.getString("rol"));
                usuario.setEstado(rs.getString("estado"));
            }
            
            this.cerrarConexion();
        } catch (SQLException e) {
            e.printStackTrace();
            this.cerrarConexion();
        }
        return usuario;
    }
}
