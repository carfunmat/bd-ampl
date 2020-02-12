package objetoscrm;

public class Usuario {
	
	private Integer idUsuario;
	private String usuario, password, nombre, apellidos;
	
	public Usuario(Integer idUsuario, String usuario, String password, String nombre, String apellidos) {
		super();
		this.idUsuario = idUsuario;
		this.usuario = usuario;
		this.password = password;
		this.nombre = nombre;
		this.apellidos = apellidos;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public Integer getIdUsuario() {
		return idUsuario;
	}

	public String getUsuario() {
		return usuario;
	}

	public String getPassword() {
		return password;
	}

}
