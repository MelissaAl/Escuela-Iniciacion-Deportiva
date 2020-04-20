package Logicadenegocios;

public class Alumnos {

     private int idAlumno;
    private String nombreAlum;
    private String apellidos;
    private int edad;
    private int inactivo;
    private int enMora;

    public Alumnos() {
    }

    public Alumnos(int idAlumno, String nombreAlum, String apellidos, int edad, int inactivo, int enMora) {
        this.idAlumno = idAlumno;
        this.nombreAlum = nombreAlum;
        this.apellidos = apellidos;
        this.edad = edad;
        this.inactivo = inactivo;
        this.enMora = enMora;
    }
    
    /**
     * @return the idAlumno
     */
    public int getIdAlumno() {
        return idAlumno;
    }

    /**
     * @param idAlumno the idAlumno to set
     */
    public void setIdAlumno(int idAlumno) {
        this.idAlumno = idAlumno;
    }

    /**
     * @return the nombreAlum
     */
    public String getNombreAlum() {
        return nombreAlum;
    }

    /**
     * @param nombreAlum the nombreAlum to set
     */
    public void setNombreAlum(String nombreAlum) {
        this.nombreAlum = nombreAlum;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the edad
     */
    public int getEdad() {
        return edad;
    }

    /**
     * @param edad the edad to set
     */
    public void setEdad(int edad) {
        this.edad = edad;
    }

    /**
     * @return the inactivo
     */
    public int getInactivo() {
        return inactivo;
    }

    /**
     * @param inactivo the inactivo to set
     */
    public void setInactivo(int inactivo) {
        this.inactivo = inactivo;
    }

    /**
     * @return the enMora
     */
    public int getEnMora() {
        return enMora;
    }

    /**
     * @param enMora the enMora to set
     */
    public void setEnMora(int enMora) {
        this.enMora = enMora;
    }
    
   
    
    
}
