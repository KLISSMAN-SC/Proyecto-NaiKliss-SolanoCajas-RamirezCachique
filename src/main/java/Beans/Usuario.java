package Beans;

import java.sql.Date;

public class Usuario {
	private int id;
	private String nombreUsuario;
	private Date fechaCreacion;
	private String password;
	private String nombreCompleto;
	private String email;
	private double saldo;
	private String rol;
	private String estado;
	
	public Usuario(int id, String nombreUsuario, Date fechaCreacion, String password, String nombreCompleto,
			String email, double saldo, String rol, String estado) {
		this.id = id;
		this.nombreUsuario = nombreUsuario;
		this.fechaCreacion = fechaCreacion;
		this.password = password;
		this.nombreCompleto = nombreCompleto;
		this.email = email;
		this.saldo = saldo;
		this.rol = rol;
		this.estado = estado;
	}

	public Usuario() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombreUsuario() {
		return nombreUsuario;
	}

	public void setNombreUsuario(String nombreUsuario) {
		this.nombreUsuario = nombreUsuario;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNombreCompleto() {
		return nombreCompleto;
	}

	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getSaldo() {
		return saldo;
	}

	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
	
}
