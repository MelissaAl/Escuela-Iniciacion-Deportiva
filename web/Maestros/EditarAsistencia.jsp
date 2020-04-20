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

                <h1> Maestros<br></h1>
                <h2>Editar Asistencia <br></h2>
                <a href="../Maestros/Asistencia.jsp" align="right">Regresar</a>
            </ul>
        </nav>      
        <div >

            <%
                int idAlum = Integer.parseInt(request.getParameter("idAsist"));
                ResultSet rs, rs2, rs3 = null;
                Logicadenegocios ln = new Logicadenegocios();
                try {
                    rs = ln.mostrarAsistencia(idAlum);
                    rs2=ln.mostrarAlumnos();
                    rs3=ln.mostrarCursos();
                    while (rs.next()) {
            %>

            <form action="">
                <table border="1" width="250" align="center">
                    <thead>           
                        <tr>
                            <th>Id : </th>
                            <th><input type="text" name="txtId" value="<%=rs.getString(1)%>" readonly="readonly"></th>
                        </tr>              
                        <tr>
                            <td>Dia : </td>
                            <td><input type="text" name="txtDiaEd" value="<%=rs.getString(2)%>"></td>
                        </tr>
                        <tr>
                            <td>Mes :</td>
                            <td><input type="text" name="txtMesEd" value="<%=rs.getString(3)%>"></td>
                        </tr>
                        <tr>
                            <td>Año :</td>
                            <td><input type="text" name="txtAñoEd" value="<%=rs.getString(4)%>"></td>
                        </tr>
                        <tr>
                            <td>Alumno </td>
                          <td>                 
                                <select name="selectAlum">
                                    <option> Seleccionar alumno</option> 
                                    <% while (rs2.next()) {
                                    %>  
                                    <option value="<%=rs2.getString(1)%>"><%=rs2.getString(2)%> <%=rs2.getString(3)%></option>
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
                                    <% while (rs3.next()) {
                                    %>  
                                    <option value="<%=rs3.getString(1)%>"><%=rs3.getString(2)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>                       
                        <tr>
                            <th colspan="2"><input type="submit" name="btnEditar"
                                                   value="Editar Asitencia"></td>                      
                        </tr>
                    </thead>
                </table>

            </form>
        </div>
        <%         }
            } catch (Exception e) {
                out.println(e);
            }
            if (request.getParameter("btnEditar") != null) {
                int cod = Integer.parseInt(request.getParameter("txtId"));
                String dia = request.getParameter("txtDiaEd");
                String mes = request.getParameter("txtMesEd");
                int año = Integer.parseInt(request.getParameter("txtAñoEd"));
                int idAlumEd = Integer.parseInt(request.getParameter("txtidAlumEd"));
                int idCurso = Integer.parseInt(request.getParameter("txtidCursEd"));         

                try {
                    ln.actualizarAsistencia(cod, dia, mes, año, idAlumEd, idCurso);
                    request.getRequestDispatcher("Asistencia.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }

        %>
    </body>
</html>
