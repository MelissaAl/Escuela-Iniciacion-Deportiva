<%@page import="Logicadenegocios.Logicadenegocios"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
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

                <h1> Maestros<br></h1>
                <h2> Asistencia <br></h2>
                <a href="../Maestros/Asistencia.jsp" align="right">Regresar</a>
            </ul>
        </nav>

        <%
            Logicadenegocios ln = new Logicadenegocios();
            ResultSet rs, rs2 = null;
            rs = ln.mostrarAlumnos();
            rs2 = ln.mostrarCursos();
        %>
        <div >
            <form action="" method="GET">
                <table border="1" width="250" align="center">
                    <thead>    

                        <tr>
                            <td>Dia : </td>
                            <td><input type="text" placeholder="Digite dia" name="txtDia"></td>
                        </tr>

                        <tr>
                            <td>Mes : </td>
                            <td>
                                <select name="selectMes">
                                    <option value="Enero">Enero</option>
                                    <option value="Febrero">Febrero</option>
                                    <option value="Marzo">Marzo</option>
                                    <option value="Abril">Abril</option>
                                    <option value="Mayo">Mayo</option>
                                    <option value="Junio">Junio</option>
                                    <option value="Julio">Julio</option>
                                    <option value="Agosto">Agosto</option>
                                    <option value="Septiembre">Septiembre</option>
                                    <option value="Octubre">Octubre</option>
                                    <option value="Noviembre">Noviembre</option>
                                    <option value="Diciembre">Diciembre</option>
                                </select> 
                            </td>
                        </tr>
                        <tr>
                            <td>Año :</td>
                            <td><input type="text" placeholder="Digite año" name="txtAnio"></td>
                        </tr>
                        <tr>
                            <td>Alumno </td>
                            <td>                 
                                <select name="selectAlum">
                                    <option> Seleccionar alumno</option> 
                                    <% while (rs.next()) {
                                    %>  
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%> <%=rs.getString(3)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Escuela </td>
                            <td>                 
                                <select name="selectEsc">
                                    <option> Seleccionar escuela</option> 
                                    <% while (rs2.next()) {
                                    %>  
                                    <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>                   
                        <tr>
                            <th colspan="2"><input type="submit" name="btnGrabar"
                                                   value="Grabar Asistencia"></td>                      
                        </tr>
                    </thead>
                </table>

            </form>
        </div>

        <%
            if (request.getParameter("btnGrabar") != null) {
                String dia = request.getParameter("txtDia");
                String mes = request.getParameter("selectMes");
                //String an=request.getParameter("txtAño");
                //int an1=Integer.parseInt(an);
                int anio = Integer.parseInt(request.getParameter("txtAnio"));
                String idA=request.getParameter("selectAlum");
                // int idAlum=Integer.parseInt(idA);
                //int idAlum = Integer.parseInt(request.getParameter("selectAlum"));
                // String idC=request.getParameter("txtidCurso");
                // int idCurs=Integer.parseInt(idC);
                int idCurs = Integer.parseInt(request.getParameter("selectEsc"));

                try {
                   ln.insertarAsistencia(dia, mes, anio, idA, idCurs);
                    request.getRequestDispatcher("Asistencia.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }
        %>


    </body>
</html>
