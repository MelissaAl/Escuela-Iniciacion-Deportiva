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
                <h2> Notas <br></h2>
                <a href="../Maestros/Nota.jsp" align="right">Regresar</a>
            </ul>
        </nav>
        <%
            Logicadenegocios ln = new Logicadenegocios();
            ResultSet rs = null;
            rs = ln.mostrarAlumnos();
        %>
        <div >
            <form action="">
                <table border="1" width="250" align="center">
                    <thead>           

                        <tr>
                            <td>Nota : </td>
                            <td><input type="text" placeholder="Digite nota" name="txtNota"></td>
                        </tr>
                        <tr>
                            <td>VI nota :</td>
                            <td><input type="text" placeholder="Digite nota" name="txtVnota"></td>
                        </tr>
                        <tr>
                            <td>Alumno :</td>
                            <td>                 
                                <select name="selectUsus">
                                    <option> Selecciona un alumno</option> 
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
                            <th colspan="2"><input type="submit" name="btnGrabar"
                                                   value="Grabar Nota"></td>                      
                        </tr>
                    </thead>
                </table>

            </form>
        </div>

        <%
            if (request.getParameter("btnGrabar") != null) {

                String nota = request.getParameter("txtNota");
                int Vnota = Integer.parseInt(request.getParameter("txtVnota"));
                int idAlum = Integer.parseInt(request.getParameter("selectUsus"));

                try {               
                    ln.insertarNotas(nota, Vnota, idAlum);
                    request.getRequestDispatcher("Nota.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }
        %>


    </body>
</html>
