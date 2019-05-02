package objetoscrm;

public class Espectador {

	private Integer idEspectador;
	private String nombre;
	private String apellidos;
	private String fechaNac;
	
	
	public Espectador(String idEspectador, String nombre, String apellidos, String fechaNac) {
		super();
		int idEspc;
		try {
			idEspc=Integer.parseInt(idEspectador);
		} catch (Exception e) { idEspc=-1; }
		this.idEspectador = idEspc;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNac = fechaNac;
	}
	
	public Espectador(Integer idEspectador, String nombre, String apellidos, String fechaNac) {
		super();
		this.idEspectador = idEspectador;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNac = fechaNac;
	}

	
	public Espectador(Integer idEspectador, String nombre, String apellidos) {
		super();
		this.idEspectador = idEspectador;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNac = "01/01/1991";
	}

	public Integer getIdEspectador() {
		return idEspectador;
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
