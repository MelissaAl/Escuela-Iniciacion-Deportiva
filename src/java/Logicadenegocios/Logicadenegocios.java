/**
 *
 *Clase para definir las conexiones a BD y CRUD
 */
package Logicadenegocios;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Logicadenegocios {

    private Connection con;
    Datos dat = new Datos();

    // Validar conexion
    public boolean setConnection() {
        con = dat.conexion();
        boolean b = true;
        if (con == null) {
            b = false;
        }
        return b;
    }

    //Crear conexion
    public Logicadenegocios() {
        con = dat.conexion();
    }

    // Cerrar conexion
    public void cerrarConexion() {
        Datos.cerrarConexion(con);
    }

    //     *****************  ♠♠♠♠♠♠  METODOS DE USUARIO  ♠♠♠♠♠♠ *********** 
    // Mostrar lista de usuarios
    public ResultSet mostrarUsuarios() {
        ResultSet rs = dat.mostrarUsuarios(con);
        return rs;
    }

    // Mostrar un usuario
    public ResultSet mostrarUsuario(int id) {
        ResultSet rs = dat.mostrarUsuario(con, id);
        return rs;
    }

    // Validar usuario en la BD
    public boolean validarUsuario(int usuario, String clave) {
        ResultSet rs;
        rs = dat.validarUsuario(con, usuario, clave);
        try {
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Logicadenegocios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Insertar usuario en la BD
    public int insertarUsuario(int id, String nombres, String apellidos,
            int perfiles, String usuario, String pass, int activo) {
        int cantRegs = dat.insertarUsuario(con, id, nombres, apellidos, perfiles,
                usuario, pass, activo);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }

    public int actualizarUsuario(int id, String nombres, String apellidos,
            int perfiles, String usuario, String pass, int activo) {

        int cantRegs = Datos.actualizarUsuario(con, id, nombres, apellidos, perfiles,
                usuario, pass, activo);
        System.out.println(cantRegs + "Actualizados");
        return cantRegs;
    }

    public int eliminarUsuario(int id) {
        int cantRegs = dat.eliminarUsuario(con, id);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }

    //     *****************  ♠♠♠♠♠♠  METODOS DE ALUMNOS  ♠♠♠♠♠♠ *********** 
    // Mostrar lista de usuarios
    public ResultSet mostrarAlumnos() {
        ResultSet rs = dat.mostrarAlumnos(con);
        return rs;
    }

    public ResultSet mostrarAlumno(int idAlum) {
        ResultSet rs = dat.mostrarAlumno(con, idAlum);
        return rs;
    }

    // Validar Alumno en la BD
    public boolean validarAlumno(int idAlumno) {
        ResultSet rs;
        rs = dat.validarAlumno(con, idAlumno);
        try {
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Logicadenegocios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Insertar Alumno en la BD
    public int insertarAlumno(int idAlumno, String nombreAlum, String apellidos,
            String sexo, int edad, int inactivo, int enMora) {
        int cantRegs = dat.insertarAlumno(con, idAlumno, nombreAlum, apellidos, sexo, edad,
                inactivo, enMora);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }

    // Actualizar alumno en la BD.
    public int actualizarAlumno(int idAlumno, String nombreAlum, String apellidos,
            String sexo, int edad, int inactivo, int enMora) {

        int cantRegs = dat.actualizarAlumno(con, idAlumno, nombreAlum, apellidos, sexo, edad,
                inactivo, enMora);
        System.out.println(cantRegs + "Actualizados");
        return cantRegs;
    }

    // Eliminar alumno de la BD.
    public int eliminarAlumno(int id) {
        int cantRegs = dat.eliminarAlumno(con, id);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }

    //     *****************  ♠♠♠♠♠♠  METODOS DE CATEGORIA  ♠♠♠♠♠♠ *********** 
    // Mostrar lista de categorias
    public ResultSet mostrarCategorias() {
        ResultSet rs = dat.mostrarCategorias(con);
        return rs;
    }

    // Mostrar categoria 
    public ResultSet mostrarCategoria(int idCat) {
        ResultSet rs = dat.mostrarCategoria(con, idCat);
        return rs;
    }

    // Validar Alumno en la BD
    public boolean validarCategoria(String categoria) {
        ResultSet rs;
        rs = dat.validarCategoria(con, categoria);
        try {
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Logicadenegocios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Insertar Categoria en la BD
    public int insertarCategoria(String categoría, String CodCategoria,
            int idUsuario, int idDisciplina) {
        int cantRegs = dat.insertarCategoria(con, categoría, CodCategoria, idUsuario, idDisciplina);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }

    // Actualizar alumno en la BD.
    public int actualizarCategoria(int idCategorías, String categoría, String CodCategoria,
            int idUsuario, int idDisciplina) {

        int cantRegs = dat.actualizarCategoria(con, idCategorías, categoría, CodCategoria, idUsuario, idDisciplina);
        System.out.println(cantRegs + "Actualizados");
        return cantRegs;
    }

    // Eliminar alumno de la BD.
    public int eliminarCategoria(int idCategoria) {
        int cantRegs = dat.eliminarCategoria(con, idCategoria);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }

    //     *****************  ♠♠♠♠♠♠  METODOS DE ASISTENCIA  ♠♠♠♠♠♠ *********** 
    // Mostrar lista de usuarios
     public ResultSet mostrarAsistencias() {
        ResultSet rs = dat.mostrarAsistencias(con);
        return rs;
    }

    // Mostrar categoria 
    public ResultSet mostrarAsistencia(int idAsist) {
        ResultSet rs = dat.mostrarAsistencia(con, idAsist);
        return rs;
    }

    // Validar Alumno en la BD
    public boolean validarAsistencia(int asistencia) {
        ResultSet rs;
        rs = dat.validarAsistencia(con, asistencia);
        try {
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Logicadenegocios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Insertar Categoria en la BD
    public int insertarAsistencia(String dia, String mes,
            int año, String idAlumno, int idCurso) {
        int cantRegs = dat.insertarAsistencia(con, dia, mes, año, idAlumno,idCurso);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }

    // Actualizar alumno en la BD.
    public int actualizarAsistencia(int idCat, String dia, String mes,
            int año, int idAlumno, int idCurso) {

        int cantRegs = dat.actualizarAsistencia(con, idCat, dia, mes, año, idAlumno,idCurso);
        System.out.println(cantRegs + "Actualizados");
        return cantRegs;
    }

    // Eliminar alumno de la BD.
    public int eliminarAsistencia(int idAsist) {
        int cantRegs = dat.eliminarAsistencia(con, idAsist);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }

    //     *****************  ♠♠♠♠♠♠  METODOS DE CURSOS  ♠♠♠♠♠♠ *********** 
    // Mostrar lista de cursos
    public ResultSet mostrarCursos() {
        ResultSet rs = dat.mostrarCursos(con);
        return rs;
    }

    // mostrar una escuela de acuerdo a parámetro
    public ResultSet mostrarCurso(int idEsc) {
        ResultSet rs = dat.mostrarCurso(con, idEsc);
        return rs;
    }

    // Validar curso en la BD
    public boolean validarCurso(String curso) {
        ResultSet rs;
        rs = dat.validarCurso(con, curso);
        try {
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Logicadenegocios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Insertar Categoria en la BD
    public int insertarCurso(String NombreCurso, int EdadMin, int EdadMax,
            String CodCurso, int idAlumno, int idCategorías, int idNota, int not_idAlumno) {
        int cantRegs = dat.insertarCurso(con, NombreCurso, EdadMin, EdadMax, CodCurso, idAlumno, idCategorías, idNota, not_idAlumno);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }

    // Actualizar alumno en la BD.
    public int actualizarCurso(int idCurso, String NombreCurso, int EdadMin, int EdadMax,
            String CodCurso, int idAlumno, int idCategorías, int idNota, int not_idAlumno) {

        int cantRegs = dat.actualizarCurso(con, idCurso, NombreCurso, EdadMin, EdadMax, CodCurso, idAlumno, idCategorías, idNota, not_idAlumno);
        System.out.println(cantRegs + "Actualizados");
        return cantRegs;
    }

    // Eliminar alumno de la BD.
    public int eliminarCurso(int idCurso) {
        int cantRegs = dat.eliminarCurso(con, idCurso);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }

    //     *****************  ♠♠♠♠♠♠  METODOS DE DISCIPLINA  ♠♠♠♠♠♠ *********** 
    // Mostrar lista de disciplinas
    public ResultSet mostrarDisciplinas() {
        ResultSet rs = dat.mostrarDisciplinas(con);
        return rs;
    }

    // Mostrar una disciplina de acuerdo a paraámetro
    public ResultSet mostrarDisciplina(int idDiscip) {
        ResultSet rs = dat.mostrarDisciplina(con, idDiscip);
        return rs;
    }

    // Validar Alumno en la BD
    public boolean validarDisciplina(String disciplina) {
        ResultSet rs;
        rs = dat.validarCategoria(con, disciplina);
        try {
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Logicadenegocios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Insertar Categoria en la BD
    public int insertarDisciplina(String Disciplina, String Codigo) {
        int cantRegs = dat.insertarDisciplina(con, Disciplina, Codigo);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }

    // Actualizar alumno en la BD.
    public int actualizarDisciplina(int idDisciplina, String Disciplina, String Codigo) {

        int cantRegs = dat.actualizarDisciplina(con, idDisciplina, Disciplina, Codigo);
        System.out.println(cantRegs + "Actualizados");
        return cantRegs;
    }

    // Eliminar alumno de la BD.
    public int eliminarDisciplina(int idDisciplina) {
        int cantRegs = dat.eliminarDisciplina(con, idDisciplina);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }

    //     *****************  ♠♠♠♠♠♠  METODOS DE NOTAS  ♠♠♠♠♠♠ *********** 
    // Mostrar lista de notas
    public ResultSet mostrarNotas() {
        ResultSet rs = dat.mostrarNotas(con);
        return rs;
    }

    // Mostrar nota de acuerdo a parametro
    public ResultSet mostrarNota(int idNota) {
        ResultSet rs = dat.mostrarNota(con, idNota);
        return rs;
    }

    // Validar nota en la BD
    public boolean validarNotas(int disciplina) {
        ResultSet rs;
        rs = dat.validarNotas(con, disciplina);
        try {
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Logicadenegocios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Insertar nota en la BD
    public int insertarNotas(String Nota, double Vl_Nota, int idAlumno) {
        int cantRegs = dat.insertarNotas(con, Nota, Vl_Nota, idAlumno);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }

    // Actualizar nota en la BD.
    public int actualizarNotas(int idNota, String Nota, double Vl_Nota, int idAlumno) {
        int cantRegs = dat.actualizarNotas(con, idNota, Nota, Vl_Nota, idAlumno);
        System.out.println(cantRegs + "Actualizados");
        return cantRegs;
    }

    // Eliminar nota de la BD.
    public int eliminarNota(int idNota) {
        int cantRegs = dat.eliminarNota(con, idNota);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }

    //     *****************  ♠♠♠♠♠♠  METODOS DE OBJETIVOS DEL CURSO ♠♠♠♠♠♠ *********** 
    // Mostrar lista de objetivos del curso
    public ResultSet mostrarObjetivos() {
        ResultSet rs = dat.mostrarObjetivos(con);
        return rs;
    }
    
    // Mostrar un objetivo de aucerdo a un parametro
       public ResultSet mostrarObjetivo(int idObj) {
        ResultSet rs = dat.mostrarObjetivo(con,idObj
        );
        return rs;
    }

    // Validar nota en la BD
    public boolean validarObjetivos(String objetivos) {
        ResultSet rs;
        rs = dat.validarObjetivos(con, objetivos);
        try {
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Logicadenegocios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Insertar nota en la BD
    public int insertarObjetivos(String Objetivo, double Porcentaje, int idCurso) {
        int cantRegs = dat.insertarObjetivos(con, Objetivo, Porcentaje, idCurso);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }

    // Actualizar nota en la BD.
    public int actualizarObjetivos(int idObjetivoCurso, String Objetivo, double Porcentaje, int idCurso) {
        int cantRegs = dat.actualizarObjetivos(con, idObjetivoCurso, Objetivo, Porcentaje, idCurso);
        System.out.println(cantRegs + "Actualizados");
        return cantRegs;
    }

    // Eliminar nota de la BD.
    public int eliminarObjetivo(int idObjetivo) {
        int cantRegs = dat.eliminarObjetivos(con, idObjetivo);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }

    //     *****************  ♠♠♠♠♠♠  METODOS DE PERFIL ♠♠♠♠♠♠ *********** 
    // Mostrar lista de perfiles del curso
    public ResultSet mostrarPerfiles() {
        ResultSet rs = dat.mostrarPerfiles(con);
        return rs;
    }

    public ResultSet mostrarPerfil(int idPer) {
        ResultSet rs = dat.mostrarPerfil(con, idPer);
        return rs;
    }

    // Insertar perfil en la BD
    public int insertarPerfil(int idPerfil, String nombre, int activo) {
        int cantRegs = dat.insertarPerfil(con, idPerfil, nombre, activo);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }

    // Actualizar nota en la BD.
    public int actualizarPerfil(int idPerfil, String nombre, int activo) {
        int cantRegs = dat.actualizarPerfil(con, idPerfil, nombre, activo);
        System.out.println(cantRegs + "Actualizados");
        return cantRegs;
    }

    // Eliminar nota de la BD.
    public int eliminarPerfil(int idPerfil) {
        int cantRegs = dat.eliminarPerfil(con, idPerfil);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }

    //     *****************  ♠♠♠♠♠♠  METODOS DE PERMISOS ♠♠♠♠♠♠ *********** 
    // Mostrar lista de permisos del curso
    public ResultSet mostrarPermisosUs() {
        ResultSet rs = dat.mostrarPermisosUs(con);
        return rs;
    }
    
    // mostrar permiso de acuerdo a un parametro
     public ResultSet mostrarPermiso(int idPerm) {
        ResultSet rs = dat.mostrarPermiso(con, idPerm);
        return rs;
    }
    
    // mostrar permiso de acuerdo a un parametro
     public ResultSet mostrarPermisos() {
        ResultSet rs = dat.mostrarPermisos(con);
        return rs;
    }

     public int insertarPermiso(String nombre, int activo) {
        int cantRegs = dat.insertarPermiso(con, nombre, activo);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }
     
     // Eliminar permiso de la BD.
    public int eliminarPermiso(int idPerm) {
        int cantRegs = dat.eliminarPermiso(con, idPerm);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }


    // Validar permiso en la BD
    public boolean validarPermiso(int idUs, String Permisos) {
        ResultSet rs;
        rs = dat.validarPermiso(con, idUs, Permisos);
        try {
            while (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Logicadenegocios.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    // Insertar permisos a usuarios en la BD
    public int insertarPermisoUs(int idUs, int idPerm) {
        int cantRegs = dat.insertarPermisoUsuario(con, idUs, idPerm);
        System.out.println(cantRegs + " Insertados");
        return cantRegs;
    }

    // Actualizar permisos a usuario en la BD.
    public int actualizarPermisoUs(int idPermUs, int idUs, int idPerm) {

        int cantRegs = dat.actualizarPermisoUs(con, idPermUs, idUs, idPerm);
        System.out.println(cantRegs + "Actualizados");
        return cantRegs;
    }

    // Eliminar permiso a usuario de la BD.
    public int CambiarPermisosUs(int idPermUs) {
        int cantRegs = dat.quitarPermisoUs(con, idPermUs);
        System.out.println(cantRegs + " Borrados");
        return cantRegs;
    }

}
