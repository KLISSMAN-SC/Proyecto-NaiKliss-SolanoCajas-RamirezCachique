package Beans;

public class Tarjeta {
	private int idTarjeta;
	private String numeroTarjeta;
	private String titular;
	private String fechaVencimiento;
	private double saldo;
	private String ultimos4;
	private int idUsuario;
	
	public Tarjeta() {
		
	}
	
	public Tarjeta(int idTarjeta, String numeroTarjeta, String titular, String fechaVencimiento, double saldo,
			String ultimos4, int idUsuario) {
		super();
		this.idTarjeta = idTarjeta;
		this.numeroTarjeta = numeroTarjeta;
		this.titular = titular;
		this.fechaVencimiento = fechaVencimiento;
		this.saldo = saldo;
		this.ultimos4 = ultimos4;
		this.idUsuario = idUsuario;
	}
	public int getIdTarjeta() {
		return idTarjeta;
	}
	public void setIdTarjeta(int idTarjeta) {
		this.idTarjeta = idTarjeta;
	}
	public String getNumeroTarjeta() {
		return numeroTarjeta;
	}
	public void setNumeroTarjeta(String numeroTarjeta) {
		this.numeroTarjeta = numeroTarjeta;
	}
	public String getTitular() {
		return titular;
	}
	public void setTitular(String titular) {
		this.titular = titular;
	}
	public String getFechaVencimiento() {
		return fechaVencimiento;
	}
	public void setFechaVencimiento(String fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}
	public double getSaldo() {
		return saldo;
	}
	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}
	public String getUltimos4() {
		return ultimos4;
	}
	public void setUltimos4(String ultimos4) {
		this.ultimos4 = ultimos4;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	
}
