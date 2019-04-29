package objetoscrm;

public class Espectadores {

	private String idEspectador;
	private String nombre;
	private String apellidos;
	private String fechaNac;
	
	
	public Espectadores(String idEspectador, String nombre, String apellidos, String fechaNac) {
		super();
		this.idEspectador = idEspectador;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNac = fechaNac;
	}

	
	public Espectadores(String idEspectador, String nombre, String apellidos) {
		super();
		this.idEspectador = idEspectador;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNac = "01/01/1991";
	}

	public String getIdEspectador() {
		return idEspectador;
	}


	public void setIdEspectador(String idEspectador) {
		this.idEspectador = idEspectador;
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


	public String getFechaNac() {
		return fechaNac;
	}


	public void setFechaNac(String fechaNac) {
		this.fechaNac = fechaNac;
	}
	
	
}
