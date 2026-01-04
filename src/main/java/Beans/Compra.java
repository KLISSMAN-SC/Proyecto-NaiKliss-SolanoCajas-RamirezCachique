package Beans;

import java.time.LocalDate;

public class Compra {
	private int idCompra;
	private int idUsuario;
	private LocalDate fecha_registro;
	private double total;
	private String metodo_pago;
	
	private double totalAcumulado;
	
	public Compra() {
		
	}
	public Compra(int idCompra, int idUsuario, LocalDate fecha_registro, double total, String metodo_pago,
			double totalAcumulado) {
		super();
		this.idCompra = idCompra;
		this.idUsuario = idUsuario;
		this.fecha_registro = fecha_registro;
		this.total = total;
		this.metodo_pago = metodo_pago;
		this.totalAcumulado = totalAcumulado;
	}
	public int getIdCompra() {
		return idCompra;
	}
	public void setIdCompra(int idCompra) {
		this.idCompra = idCompra;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public double getTotalAcumulado() {
		return totalAcumulado;
	}
	public void setTotalAcumulado(double totalAcumulado) {
		this.totalAcumulado = totalAcumulado;
	}
	public LocalDate getFecha_registro() {
		return fecha_registro;
	}
	public void setFecha_registro(LocalDate fecha_registro) {
		this.fecha_registro = fecha_registro;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getMetodo_pago() {
		return metodo_pago;
	}
	public void setMetodo_pago(String metodo_pago) {
		this.metodo_pago = metodo_pago;
	}
	
	
}
