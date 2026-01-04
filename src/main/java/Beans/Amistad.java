package Beans;

import java.sql.Date;

public class Amistad {
	private int idAmistad;
	private int idUsuario;
	private int idAmigo;
	private Date fecha;
	
	private String nombreUsuario;
	private String nombreAmigo;
	
	private String avatar;
	
	public Amistad() {
		
	}
	public Amistad(int idAmistad, int idUsuario, int idAmigo, Date fecha, String avatar) {
		super();
		this.idAmistad = idAmistad;
		this.idUsuario = idUsuario;
		this.idAmigo = idAmigo;
		this.fecha = fecha;
		this.avatar=avatar;
	}
	public int getIdAmistad() {
		return idAmistad;
	}
	public void setIdAmistad(int idAmistad) {
		this.idAmistad = idAmistad;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdAmigo() {
		return idAmigo;
	}
	public void setIdAmigo(int idAmigo) {
		this.idAmigo = idAmigo;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getNombreUsuario() {
		return nombreUsuario;
	}
	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}
	public String getNombreAmigo() {
		return nombreAmigo;
	}
	public void setNombreAmigo(String nombreAmigo) {
		this.nombreAmigo = nombreAmigo;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	
	
}
