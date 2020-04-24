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
                <h2> Insertar Escuelas <br></h2>
                <a href="../Maestros/Escuelas.jsp" align="right">Regresar</a>
            </ul>
        </nav>
        <%
            Logicadenegocios ln = new Logicadenegocios();
            ResultSet rs, rs2, rs3, rs4 = null;
          //  rs = ln.mostrarCursos();
            rs2 = ln.mostrarAlumnos();
            rs3=ln.mostrarCategorias();
            rs4=ln.mostrarNotas();
            
        %>    
        <div >
            <form action="" method="GET">
                <table border="1" width="350" align="center">
                    <thead>                                            
                        <tr>
                            <td>Escuela : </td>
                            <td><input type="text" placeholder="Digite Escuela" name="txtNom"></td>
                        </tr>
                        <tr>
                            <td>Edad minima :</td>
                            <td><input type="text" placeholder="Digite edad minima" name="txtEdadMin"></td>
                        </tr>
                        <tr>
                            <td>Edad máxima :</td>
                            <td><input type="text" placeholder="Digite edad maxima" name="txtEdadMax"></td>
                        </tr>
                        <tr>
                            <td>Codigo Escuela :</td>
                             <td><input type="text" placeholder="Digite cod Escuela" name="txtCodEsc"></td>
                        </tr>
                        <tr>
                            <td>Alumno : </td>
                            <td>                 
                                <select name="selectAlum">
                                    <option> Selecciona un Alumno</option> 
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
                            <td>Categoría : </td>
                            <td>                 
                                <select name="selectCat">
                                    <option> Seleccionar Categoria</option> 
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
                            <td>Nota : </td>
                            <td>                 
                                <select name="selectNota">
                                    <option> Seleccionar Nota</option> 
                                    <% while (rs4.next()) {
                                    %>  
                                    <option value="<%=rs4.getString(1)%>"><%=rs4.getString(2)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td>Nota Alumno : </td>
                            <td>                 
                                <select name="selectNotaUsus">
                                    <option> Selecciona nota usuario</option> 
                                    <% while (rs4.next()) {
                                    %>  
                                    <option value="<%=rs4.getString(1)%>"><%=rs4.getString(4)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <th colspan="2"><input type="submit" name="btnGrabar"
                                                   value="Grabar Escuela"></td>                      
                        </tr>
                    </thead>
                </table>

            </form>
        </div>

        <%
            if (request.getParameter("btnGrabar") != null) {
                String nomb = request.getParameter("txtNom");
                int edadMin = Integer.parseInt(request.getParameter("txtEdadMin"));
                int edadMax = Integer.parseInt(request.getParameter("txtEdadMax"));
                String codEsc = request.getParameter("txtCodEsc");
                int codAlum = Integer.parseInt(request.getParameter("selectAlum"));
                int codCat = Integer.parseInt(request.getParameter("selectCat"));
                int idNota = Integer.parseInt(request.getParameter("selectNota"));
                int idNotAlum = Integer.parseInt("4");
                try {
                    ln.insertarCurso(nomb, edadMin, edadMax, codEsc, codAlum, codCat, idNota, idNotAlum);
                    request.getRequestDispatcher("Escuelas.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }
        %>


    </body>
</html>
