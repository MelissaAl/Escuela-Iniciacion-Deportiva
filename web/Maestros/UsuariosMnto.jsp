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
                <h2> Insertar Usuarios <br></h2>
                <a href="../Maestros/Usuarios.jsp" align="right">Regresar</a>
            </ul>
        </nav>
        <%
            Logicadenegocios ln = new Logicadenegocios();
            ResultSet rs = null;
            rs = ln.mostrarPerfiles();
        %>
        <div >
            <form action="">
                <table border="1" width="350" align="center">
                    <thead>           
                        <tr>
                            <th>Id : </th>
                            <th><input type="text" name="txtId"></th>
                        </tr>              
                        <tr>
                            <td>Nombres : </td>
                            <td><input type="text" name="txtNom"></td>
                        </tr>
                        <tr>
                            <td>Apellidos :</td>
                            <td><input type="text" name="txtApelli"></td>
                        </tr>
                        <tr>                                                      
                            <td>Perfil :</td>
                            <td>                 
                                <select name="selectPerf">
                                    <option> Selecciona un perfil</option> 
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
                            <td>Nombre usuario </td>
                            <td><input type="text" name="txtUsua"></td>
                        </tr>
                        <tr>
                            <td>Contraseña </td>
                            <td><input type="text" name="txtPas"></td>
                        </tr>
                        <tr>
                            <th colspan="2"><input type="submit" name="btnGrabrar" 
                                                   value="Grabar Usuario"></td>                      
                        </tr>
                    </thead>
                </table>
            </form>
        </div>

        <%
            if (request.getParameter("btnGrabar") != null) {
                int cod = Integer.parseInt(request.getParameter("txtId"));
                String nomb = request.getParameter("txtNom");
                String apell = request.getParameter("txtApelli");
                int perfil = Integer.parseInt(request.getParameter("selectPerf"));
                String usuar = request.getParameter("txtUsua");
                String pass = request.getParameter("txtPas");

                try {
                    int var = 1;
                    ln.insertarUsuario(cod, nomb, apell, perfil, usuar, pass, var);
                    request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }

        %>
    </body>
</html>
