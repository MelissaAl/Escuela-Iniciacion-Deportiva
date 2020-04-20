package Logicadenegocios;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.sql.Date;

public class Datos {

    // Creamos la conexion a la Bases de Datos
    public static Connection conexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String strSql = "jdbc:mysql://localhost/escueladeportes";
            con = DriverManager.getConnection(strSql, "root", "");
            System.out.println("Conexión establecida");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error en la conexion");
        }
        return con;
    }

    // Cerramos la conexion a la BD.
    public static Connection cerrarConexion(Connection con) {
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Datos.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE USUARIO  ♠♠♠♠♠♠ ***********
    // Validamos el prefil del usuario
    public static ResultSet validarPerfil(Connection con, int usuario) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t1.nombre FROM usuario t0\n"
                    + "INNER JOIN perfil t1 ON t0.Perfiles=t1.idPerfil\n"
                    + "WHERE idUsuarios='" + usuario + "'";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error validando: " + ex);
        }
        return rs;
    }

    // Validamos el usuario al ingreso
    public static ResultSet validarUsuario(Connection con, int usuario, String clave) {
        ResultSet rs;
        try {
            String strSql = "SELECT idUsuarios FROM usuario WHERE idUsuarios ='"
                    + usuario + "' and Contraseña='" + clave + "'";
            Statement st = con.createStatement();
            return st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error validando: " + ex);
        }
        return null;
    }

    // Traer los datos de un usuario de la BD.
    public static ResultSet mostrarUsuario(Connection con, int id) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idUsuarios, t0.Nombres, t0.Apellidos, t1.nombre, t0.NomUsuario, t0.Contraseña\n"
                    + "       FROM usuario t0\n"
                    + "       INNER JOIN perfil t1 ON t0.Perfiles=t1.idPerfil\n"
                    + "       WHERE t0.idUsuarios='" + id + "'";

            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

     public static ResultSet consultarUsuarioPorNombre(Connection con, String nombres) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT  t0.Nombres, t0.Apellidos,  t0.NomUsuario, t0.Contraseña\n"
                    + "       FROM usuario t0\n"
                    + "       WHERE t0.Nombres='" + nombres + "'";

            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }
     
    // Listar los usuarios de la BD.
    public static ResultSet mostrarUsuarios(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idUsuarios, t0.Nombres, t0.Apellidos, t1.nombre, t0.NomUsuario,\n"
                    + "   case t0.Inactivo\n"
                    + "    when 0 then 'Inactivo'\n"
                    + "    when 1 then 'Activo'\n"
                    + "    END AS 'Estado'\n"
                    + "   FROM usuario t0\n"
                    + "   INNER JOIN perfil t1 ON t0.Perfiles=t1.idPerfil";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    // Insertamos los datos de un usuario
    public static int insertarUsuario(Connection con, int id, String nombres, String apellidos,
            int perfiles, String usuario, String pass, int activo) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO usuario(idUsuarios, Nombres,Apellidos,Perfiles, NomUsuario, Contraseña,Inactivo) VALUES (" + id + ",'" + nombres + "','" + apellidos + "'," + perfiles
                    + ",'" + usuario + "','" + pass + "'," + activo + ")";
            //   System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizamos un usuario ne la BD
    public static int actualizarUsuario(Connection con, int id, String nombres, String apellidos,
            int perfiles, String usuario, String pass, int activo) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE usuario " + "SET Nombres = '" + nombres + "', Apellidos = '" + apellidos + "', Perfiles = " + perfiles
                    + ", nomUsuario = '" + usuario
                    + "', Contraseña = '" + pass
                    + "', Inactivo = " + activo
                    + " WHERE idUsuarios = " + id;
            // System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminamos un usuario de la BD.
    public static int eliminarUsuario(Connection con, int id) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "DELETE FROM usuario WHERE idUsuarios = " + id;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE ALUMNO  ♠♠♠♠♠♠ ***********
// mostrar lista de alumnos
    public static ResultSet mostrarAlumnos(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idAlumno,t0.Nombres,t0.Apellidos,t0.`EdadAños`,t0.Sexo,\n"
                    + "case t0.Inactivo\n"
                    + "	 when 0 then 'Inactivo'\n"
                    + "	 when 1 then 'Activo'\n"
                    + " END AS 'Estado',\n"
                    + " case t0.EnMora\n"
                    + "  when 0 then 'En mora' \n"
                    + "  when 1 then 'No en mora'\n"
                    + "  END AS 'Mora'\n"
                    + "FROM alumno t0";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    public static ResultSet mostrarAlumno(Connection con, int idAlum) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idAlumno,t0.Nombres,t0.Apellidos,t0.`EdadAños`,t0.Sexo,\n"
                    + " t0.Inactivo, t0.EnMora\n"
                    + "    FROM alumno t0\n"
                    + "    WHERE t0.idAlumno ='" + idAlum + "'";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

// Validamos alumno
    public static ResultSet validarAlumno(Connection con, int alumno) {
        ResultSet rs;
        try {
            String strSql = "SELECT idAlumno FROM alumno WHERE idAlumno ='"
                    + alumno + "'";
            Statement st = con.createStatement();
            return st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error validando: " + ex);
        }
        return null;
    }

    // Insertar alumno
    public static int insertarAlumno(Connection con, int idAlumno, String nombreAlum, String apellidos,
            String sexo, int edad, int inactivo, int enMora) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO alumno(idAlumno,Nombres,Apellidos,Sexo,EdadAños,Inactivo,EnMora) "
                    + "VALUES (" + idAlumno + ",'" + nombreAlum + "','" + apellidos + "','" + sexo
                    + "'," + edad + "," + inactivo + "," + enMora + ")";
            // System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);

        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizar alumno en la BD.
    public static int actualizarAlumno(Connection con, int idAlumno, String nombreAlum, String apellidos,
            String sexo, int edad, int inactivo, int enMora) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE alumno " + "SET Nombres = '" + nombreAlum + "', Apellidos = '" + apellidos + "', "
                    + "EdadAños = " + edad + ", Inactivo = " + inactivo + ", EnMora = " + enMora + ", Sexo = '" + sexo + "' WHERE idAlumno = " + idAlumno;
            //   System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminar alumno en la BD.
    public static int eliminarAlumno(Connection con, int id) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "DELETE FROM alumno WHERE idAlumno = " + id;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE CATEGORIAS  ♠♠♠♠♠♠ ***********
    //Listar las categoria de la BD.
    public static ResultSet mostrarCategorias(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idCategorías, t0.Categoría, t0.CodCategoria,\n"
                    + "t1.Disciplina,t2.Nombres,t2.Apellidos\n"
                    + "FROM categoria t0\n"
                    + "INNER JOIN disciplina t1 ON t0.Disciplina_idDisciplina=t1.idDisciplina\n"
                    + "INNER JOIN usuario t2 ON t2.idUsuarios=t0.Usuario_idUsuarios";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    // Muestra una categoria de acuerdo a un codigo
    public static ResultSet mostrarCategoria(Connection con, int idCat) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idCategorías, t0.Categoría, t0.CodCategoria,t0.Usuario_idUsuarios,t0.Disciplina_idDisciplina\n"
                    + "     FROM categoria t0 \n"
                    + "WHERE t0.idCategorías='" + idCat + "'";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    // Validamos Categoria en la BD 
    public static ResultSet validarCategoria(Connection con, String categoria) {
        ResultSet rs;
        try {
            String strSql = "SELECT Categoría FROM categoria WHERE Categoría ='"
                    + categoria + "'";
            Statement st = con.createStatement();
            return st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error validando: " + ex);
        }
        return null;
    }

    // Insertar Categoria en la BD
    public static int insertarCategoria(Connection con, String categoría, String CodCategoria,
            int idUsuario, int idDisciplina) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO categoria (Categoría,CodCategoria,Usuario_idUsuarios,Disciplina_idDisciplina) "
                    + "VALUES ('" + categoría + "','" + CodCategoria + "'," + idUsuario
                    + "," + idDisciplina + ")";

            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizar categoria en la BD.
    public static int actualizarCategoria(Connection con, int idCategorías, String categoría, String CodCategoria,
            int idUsuario, int idDisciplina) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE categoria " + "SET Categoría = '" + categoría + "', CodCategoria = '" + CodCategoria + "', "
                    + "Usuario_idUsuarios = " + idUsuario + ", Disciplina_idDisciplina = " + idDisciplina + " "
                    + "WHERE idCategorías = " + idCategorías;
            System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminar Categoria en la BD.
    public static int eliminarCategoria(Connection con, int idCategorías) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "DELETE FROM categoria WHERE idCategorías = " + idCategorías;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE ASISTENCIA  ♠♠♠♠♠♠ ***********
    //Listar la asistencia de la BD.
    public static ResultSet mostrarAsistencias(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idAsistencia, t0.`Día`, t0.Mes, t0.`Año`, CONCAT(t1.Nombres, \" \", t1.Apellidos),t2.NombreCurso\n"
                    + "FROM asistencia t0\n"
                    + "INNER JOIN alumno t1 ON t0.Alumno_idAlumno=t1.idAlumno\n"
                    + "INNER JOIN curso t2 ON t0.Curso_idCurso=t2.idCurso";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

// Mostrar una asitencia de acuerdo a parametro.
    public static ResultSet mostrarAsistencia(Connection con, int idAsist) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT * from asistencia t0\n"
                    + "where t0.idAsistencia= '" + idAsist + "' ";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

// Validamos asistencia a la BD
    public static ResultSet validarAsistencia(Connection con, int idAsist) {
        ResultSet rs;
        try {
            String strSql = "SELECT idAsistencia  FROM asistencia WHERE idAsistencia ='"
                    + idAsist + "'";
            Statement st = con.createStatement();
            return st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error validando: " + ex);
        }
        return null;
    }

    // Insertar asistencia a la BD
    public static int insertarAsistencia(Connection con, String dia, String mes,
            int año, int idAlumno, int idCurso) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO asistencia(Día,Mes,Año,Alumno_idAlumno,Curso_idCurso) "
                    + "VALUES ('" + dia + "','" + mes + "'," + año + "," + idAlumno
                    + "," + idCurso + ")";
            //   System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizar asistencia en la BD.
    public static int actualizarAsistencia(Connection con, int idAsist, String dia, String mes,
            int año, int idAlumno, int idCurso) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE asistencia " + "SET Día = '" + dia + "', Mes = '" + mes + "', "
                    + "Año = " + año + ", Alumno_idAlumno = " + idAlumno + ", Curso_idCurso = " + idCurso + " "
                    + "WHERE idAsistencia = " + idAsist;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminar asistencia en la BD.
    public static int eliminarAsistencia(Connection con, int idAsist) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "DELETE FROM asistencia WHERE idAsistencia = " + idAsist;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE CURSOS  ♠♠♠♠♠♠ ***********
// mostrar lista de Cursos
    public static ResultSet mostrarCursos(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idCurso,t0.NombreCurso,t0.EdadMinima,t0.EdadMaxima,t0.CodCurso,\n"
                    + "t1.Nombres, t1.Apellidos,t2.Categoría,t3.Nota\n"
                    + "FROM curso t0\n"
                    + "INNER JOIN alumno t1 ON t0.Alumno_idAlumno=t1.idAlumno\n"
                    + "INNER JOIN categoria t2 ON t0.Categoria_idCategorías=t2.idCategorías\n"
                    + "INNER JOIN nota t3 ON t0.Nota_idNota=t3.idNota";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }
    // Muestra una escuela de aucerdo a parametro

    public static ResultSet mostrarCurso(Connection con, int idEsc) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT *\n"
                    + "FROM curso t0\n"
                    + "WHERE t0.idCurso=" + idEsc + " ";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }
// Validamos Curso en la BD

    public static ResultSet validarCurso(Connection con, String NombreCurso) {
        ResultSet rs;
        try {
            String strSql = "SELECT NombreCurso FROM curso WHERE NombreCurso ='"
                    + NombreCurso + "'";
            Statement st = con.createStatement();
            return st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error validando: " + ex);
        }
        return null;
    }

    // Insertar cursos en la BD.
    public static int insertarCurso(Connection con, String NombreCurso, int EdadMin, int EdadMax,
            String CodCurso, int idAlumno, int idCategorías, int idNota, int not_idAlumno) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO curso(NombreCurso,EdadMinima,EdadMaxima,CodCurso,Alumno_idAlumno,\n"
                    + "Categoria_idCategorías,Nota_idNota,Nota_Alumno_idAlumno)\n"
                    + "VALUES ('" + NombreCurso + "'," + EdadMin + "," + EdadMax
                    + ",'" + CodCurso + "'," + idAlumno + "," + idCategorías + "," + idNota + "," + not_idAlumno + ")";
            System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizar cursos en la BD.
    public static int actualizarCurso(Connection con, int idCurso, String NombreCurso, int EdadMin, int EdadMax,
            String CodCurso, int idAlumno, int idCategorías, int idNota, int not_idAlumno) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE curso " + "SET NombreCurso = '" + NombreCurso + ", EdadMinima = '" + EdadMin + ", "
                    + "EdadMaxima = '" + EdadMax + ", CodCurso = '" + CodCurso + ", Alumno_idAlumno = '" + idAlumno + ", "
                    + "Categoria_idCategorías = '" + idCategorías + ", Nota_idNota = '" + idNota + ", Nota_Alumno_idAlumno = '" + not_idAlumno + ", "
                    + "WHERE idCurso = " + idCurso;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminar cursos en la BD.
    public static int eliminarCurso(Connection con, int idCurso) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "DELETE FROM curso WHERE idCurso = " + idCurso;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE DISCIPLINA  ♠♠♠♠♠♠ ***********
    //Listar las disciplina de la BD.
    public static ResultSet mostrarDisciplinas(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT * FROM disciplina ";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    public static ResultSet mostrarDisciplina(Connection con, int idDiscip) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT * FROM disciplina "
                    + "WHERE idDisciplina=" + idDiscip + " ";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

// Validamos disciplinas en la BD.
    public static ResultSet validarDisciplina(Connection con, String Disciplina) {
        ResultSet rs;
        try {
            String strSql = "SELECT Disciplina FROM disciplina WHERE Disciplina ='"
                    + Disciplina + "'";
            Statement st = con.createStatement();
            return st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error validando: " + ex);
        }
        return null;
    }

    // Insertar diciplinas en la BD.
    public static int insertarDisciplina(Connection con, String Disciplina, String Codigo) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO disciplina (Disciplina,Código) "
                    + "VALUES ('" + Disciplina + "','" + Codigo + "')";

            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizar disciplinas en la BD.
    public static int actualizarDisciplina(Connection con, int idDisciplina, String Disciplina, String Codigo) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE disciplina " + "SET Disciplina = '" + Disciplina + ", Código = '" + Codigo + ", "
                    + "WHERE idDisciplina = " + idDisciplina;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminar Disciplinas en la BD.
    public static int eliminarDisciplina(Connection con, int idDisciplina) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "DELETE FROM disciplina WHERE idDisciplina = " + idDisciplina;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE NOTAS  ♠♠♠♠♠♠ ***********
    //Listar las notas de la BD.
    public static ResultSet mostrarNotas(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT * FROM nota ";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    // Mostrar nota segun parametro
    public static ResultSet mostrarNota(Connection con, int idNota) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT * FROM nota\n"
                    + "where idNota= " + idNota + " ";
            System.out.println(strSql);
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }
// Validamos notas en la BD.

    public static ResultSet validarNotas(Connection con, int idNota) {
        ResultSet rs;
        try {
            String strSql = "SELECT idNota FROM nota WHERE idNota ='"
                    + idNota + "'";
            Statement st = con.createStatement();
            return st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error validando: " + ex);
        }
        return null;
    }

    // Insertar notas en la BD.
    public static int insertarNotas(Connection con, String Nota, double Vl_Nota, int idAlumno) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO nota (Nota,Vl_Nota,Alumno_idAlumno) "
                    + "VALUES ('" + Nota + "'," + Vl_Nota + "," + idAlumno + ")";

            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizar notas en la BD.
    public static int actualizarNotas(Connection con, int idNota, String Nota, double Vl_Nota, int idAlumno) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE nota " + "SET Nota = '" + Nota + "', Vl_Nota = " + Vl_Nota + ", Alumno_idAlumno = " + idAlumno + " "
                    + "WHERE idNota = " + idNota;
            System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminar notas en la BD.
    public static int eliminarNota(Connection con, int idNota) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "DELETE FROM nota WHERE idNota = " + idNota;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE OBJETIVOS DEL CURSO  ♠♠♠♠♠♠ ***********
    //Listar las objetivos de la BD.
    public static ResultSet mostrarObjetivos(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idObjetivoCurso,t0.Objetivo,t0.PorcentajeBaseObjetivo,t1.NombreCurso\n"
                    + "FROM objetivocurso t0\n"
                    + "INNER JOIN curso t1 ON t0.Curso_idCurso=t1.idCurso";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    // mostrar un objetivo por un parametro
    public static ResultSet mostrarObjetivo(Connection con, int idObj) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT *\n"
                    + "FROM objetivocurso t0\n"
                    + "WHERE t0.idObjetivoCurso='" + idObj + "' ";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

// Validamos objetivos del curso en la BD.
    public static ResultSet validarObjetivos(Connection con, String ObjetivoCurso) {
        ResultSet rs;
        try {
            String strSql = "SELECT Objetivo FROM objetivocurso WHERE Objetivo ='"
                    + ObjetivoCurso + "'";
            Statement st = con.createStatement();
            return st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error validando: " + ex);
        }
        return null;
    }

    // Insertar objetivos del curso en la BD.
    public static int insertarObjetivos(Connection con, String Objetivo, double Porcentaje, int idCurso) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO objetivocurso (Objetivo,PorcentajeBaseObjetivo,Curso_idCurso) "
                    + "VALUES ('" + Objetivo + "'," + Porcentaje + "," + idCurso + ")";
            //System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizar objetivos del curso en la BD.
    public static int actualizarObjetivos(Connection con, int idObjetivoCurso, String Objetivo, double Porcentaje, int idCurso) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE objetivocurso " + "SET Objetivo = '" + Objetivo + "', PorcentajeBaseObjetivo = " + Porcentaje + ", Curso_idCurso = " + idCurso + " "
                    + "WHERE idObjetivoCurso = " + idObjetivoCurso;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminar objetivos del curso en la BD.
    public static int eliminarObjetivos(Connection con, int idObjetivoCurso) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "DELETE FROM objetivocurso WHERE idObjetivoCurso = " + idObjetivoCurso;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE PERFIL  ♠♠♠♠♠♠ ***********
    //Listar los perfiles de la BD.
    public static ResultSet mostrarPerfiles(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idPerfil, t0.nombre,\n"
                    + "CASE t0.activo\n"
                    + "   when 0 then 'Inactivo'\n"
                    + "   when 1 then 'Activo'\n"
                    + "   END AS 'Estado'\n"
                    + "FROM perfil t0";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    public static ResultSet mostrarPerfil(Connection con, int idPerf) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT *\n"
                    + "FROM perfil t0\n"
                    + "WHERE	t0.idPerfil='" + idPerf + "'  ";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    // Insertar perfiles en la BD.
    public static int insertarPerfil(Connection con, int idPerfil, String nombre, int activo) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO perfil (idPerfil,nombre,activo)"
                    + "VALUES (" + idPerfil + ",'" + nombre + "'," + activo + ")";
            System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizar perfiles en la BD.
    public static int actualizarPerfil(Connection con, int idPerfil, String nombre, int activo) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE perfil " + "SET nombre = '" + nombre + "', activo = " + activo + " "
                    + "WHERE idPerfil = " + idPerfil;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminar objetivos del curso en la BD.
    public static int eliminarPerfil(Connection con, int idPerfil) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "DELETE FROM perfil WHERE idPerfil = " + idPerfil;
            //  System.out.println(strSql);
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE PERMISOS  ♠♠♠♠♠♠ ***********
// mostrar lista de Permisos
    public static ResultSet mostrarPermisos(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t0.idPermisos,t0.nombre,\n"
                    + "CASE t0.activo\n"
                    + "  when 0 then 'Inactivo'\n"
                    + "  when 1 then 'Activo'\n"
                    + "  END AS 'Estado'\n"
                    + "FROM permiso t";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    // Insertar permisos en la BD.
    public static int insertarPermiso(Connection con, String nombre, int activo) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO permiso(nombre,activo)"
                    + "VALUES (" + nombre + "," + activo + ")";

            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizar permisos en la BD.
    public static int actualizarPermiso(Connection con, int idPermisos, String nombre, int activo) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE permiso " + "SET nombre = '" + nombre + ", activo = '" + activo + ", "
                    + "WHERE idPermisos = " + idPermisos;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminar cursos en la BD.
    public static int eliminarPermiso(Connection con, int idPermisos) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "DELETE FROM permiso WHERE idPermisos = " + idPermisos;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // *******************  ♠♠♠♠♠♠  METODOS DE ASIGNAR PERMISOS A USUARIOS  ♠♠♠♠♠♠ ***********
    // mostrar lista de Permisos
    public static ResultSet mostrarPermisosUs(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t1.idpermisos_us, CONCAT(t2.Nombres, \" \", t2.Apellidos), GROUP_CONCAT(DISTINCT t0.nombre SEPARATOR \" - \") , t2.NomUsuario,\n"
                    + " case t0.activo\n"
                    + "   when 0 then 'Inactivo'\n"
                    + "   when 1 then 'Activo'\n"
                    + "   END AS 'Estado permiso'\n"
                    + "FROM permiso t0\n"
                    + "INNER JOIN permisos_usuarios t1 ON t0.idPermisos=t1.idPermisos\n"
                    + "INNER JOIN usuario t2 ON t1.idUsuario=t2.idUsuarios\n"
                    + "GROUP BY t2.NomUsuario";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    //Lista la tabla de prmisos de la BD.
    public static ResultSet mostrarPermiso(Connection con) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT * FROM permiso t0\n";
                    
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }
    
    // mostrar lista de Permisos
    public static ResultSet mostrarPermisos(Connection con, int idPerm) {
        ResultSet rs = null;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "SELECT t1.idpermisos_us, t2.idUsuarios, t0.idPermisos\n"
                    + "FROM permiso t0\n"
                    + "INNER JOIN permisos_usuarios t1 ON t0.idPermisos=t1.idPermisos\n"
                    + "INNER JOIN usuario t2 ON t1.idUsuario=t2.idUsuarios\n"
                    + "WHERE t1.idpermisos_us ='"+idPerm+"' ";
            rs = st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error mostrando...: " + ex);
        }
        return rs;
    }

    // Validamos Permisos de usuario en la BD
    public static ResultSet validarPermiso(Connection con, int idUs, String Permisos) {
        ResultSet rs;
        int var = 1;
        try {
            String strSql = "SELECT t0.idpermisos_us FROM permisos_usuarios t0\n"
                    + "INNER JOIN permiso t1 ON t0.idPermisos=t1.idPermisos\n"
                    + "WHERE t0.idUsuario ='" + idUs + "' AND t1.nombre='" + Permisos + "' AND t1.activo='" + var + "'";
            Statement st = con.createStatement();
            return st.executeQuery(strSql);
        } catch (SQLException ex) {
            System.out.println("Error validando: " + ex);
        }
        return null;
    }

    // Insertar permisos en la BD.
    public static int insertarPermisoUsuario(Connection con, int idUs, int idPerm, int act) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "INSERT INTO permisos_usuarios(idPermisos,idUsuario,activo)"
                    + "VALUES (" + idUs + "," + idPerm + "," + act + ")";

            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Insertando...: " + ex);
        }
        return cantFilas;
    }

    // Actualizar permisos en la BD.
    public static int actualizarPermisoUs(Connection con, int idPermUs, int idUs, int idPerm) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE permisos_usuarios " + "SET idPermisos = '" + idPerm + ", idUsuario = '" + idUs + ", "
                    + "WHERE idpermisos_us = " + idPermUs;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }

    // Eliminar cursos en la BD.
    public static int quitarPermisoUs(Connection con, int idPermisos) {
        int cantFilas = 0;
        java.sql.Statement st;
        try {
            st = con.createStatement();
            String strSql = "UPDATE permisos_usuarios " + "SET activo = '" + 0 + ", "
                    + "WHERE idpermisos_us = " + idPermisos;
            cantFilas = st.executeUpdate(strSql);
        } catch (SQLException ex) {
            System.out.println("Error Actualizando...: " + ex);
        }
        return cantFilas;
    }


}
