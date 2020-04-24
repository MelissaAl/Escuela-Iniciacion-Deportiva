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
                <h2> Objetivos <br></h2>
                <a href="../Maestros/Objetivos.jsp" align="right">Regresar</a>
            </ul>
        </nav>
        <%
            Logicadenegocios ln = new Logicadenegocios();
            ResultSet rs = null;
            rs = ln.mostrarCursos();

        %>
        <div >
            <form action="">
                <table border="1" width="350" align="center">
                    <thead>                     
                        <tr>
                            <td>Objetivos : </td>
                            <td><input type="text" placeholder="Digite objetivos" name="txtNom"></td>
                        </tr>
                        <tr>
                            <td>Porcentaje :</td>
                            <td><input type="text" placeholder="Digite porcentaje" name="txtPorcen"></td>
                        </tr>
                        <tr>
                            <td>Escuela :</td>
                            <td>                 
                                <select name="selectUsus">
                                    <option> Selecciona una Escuela</option> 
                                    <% while (rs.next()) {
                                    %>  
                                    <option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </td>
                        </tr>                  
                        <tr>
                            <th colspan="2"><input type="submit" name="btnGrabar"
                                                   value="Grabar Objetivo"></td>                      
                        </tr>
                    </thead>
                </table>                   
            </form>
        </div>

        <%
            if (request.getParameter("btnGrabar") != null) {
                String nomb = request.getParameter("txtNom");
                int Porcen = Integer.parseInt(request.getParameter("txtPorcen"));
                int idUsua = Integer.parseInt(request.getParameter("selectUsus"));
                try {                
                    ln.insertarObjetivos(nomb, Porcen, idUsua);
                    request.getRequestDispatcher("Objetivos.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }
        %>

    </body>
</html>
