
<%@page import="Logicadenegocios.Logicadenegocios"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../EstilosLog_ing.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <h1> Politecnico Jaime Isaza Cadavid 
            <img src="../img/Poli_Transparente.png" alt="Logo Politecnico" align='right' width="180" height="74"/>
            <br clear =left >
            <br clear =left >
        </h1>
        <nav>
            <ul class="menusuperior">

                <h1>Maestros <br></h1>
                <h2> Listado de Asistencia <br></h2>
                <a href="../Maestros.html" align="right">Regresar</a>
            </ul>
        </nav>

        <table border="1" width="600" align="center">
            <thead>
                   <tr bgcolor="skyblue">
                      <th colspan="5">Listado de Asistencias</th>                      
                      <th>Agregar</th>
                      <th><a href="AsistenciaMnto.jsp"> <img src="../images/Agregar users.png" width="50" height="30"></a></th>                
                   </tr>
                <tr bgcolor="skyblue">
                    <th>Id</th>
                    <th>Dia</th>
                    <th>Mes</th>
                    <th>Año</th>
                    <th>Id Alumno</th>
                    <th>Id Curso</th>                 
                </tr>
                <%
                    ResultSet rs = null;
                    Logicadenegocios ln = new Logicadenegocios();
                    try {

                        rs = ln.mostrarAsistencias();

                        while (rs.next()) {
                %>
                <tr> 
                    <th><%=rs.getString(1)%></th>
                    <th><%=rs.getString(2)%></th>
                    <th><%=rs.getString(3)%></th>
                    <th><%=rs.getString(4)%></th>
                    <th><%=rs.getString(5)%></th>
                    <th><%=rs.getString(6)%></th>
                    <th>
                        <a href="EditarAsistencia.jsp?idAsist=<%=rs.getString(1)%>">
                            <img src="../images/Editar.png" width="50" height="30"></a> 
                        <a href="EliminarAsistencia.jsp?idAsist=<%=rs.getString(1)%>">
                                <img src="../images/Borrar.png" width="50" height="30"></a>
                    </th>

                </tr>
                <%

                        }
                        ln.cerrarConexion();

                    } catch (Exception e) {
                        out.println(e+"  ");
                    }
                %>

            </thead>

        </table>


    </body>
</html>
