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
                <h2> Categorias <br></h2>
                <a href="../Maestros/Categorias.jsp" align="right">Regresar</a>
            </ul>
        </nav>   

        <%
            Logicadenegocios ln = new Logicadenegocios();
            ResultSet rs, rs2 = null;
            rs = ln.mostrarUsuarios();
            rs2 = ln.mostrarDisciplinas();
        %>
        <div >

            <h3 align ="center"> Agregar categoria</h3>
            <form action="">
                <table border="1" width="250" align="center">
                    <thead>           
                        <tr>
                            <td>Categoria : </td>
                            <td><input type="text" placeholder="Digite categoria" name="txtNom"></td>
                        </tr>
                        <tr>
                            <td>Codigo categoria :</td>
                            <td><input type="text" placeholder="Digite codigo categoria" name="txtCodCat"></td>
                        </tr>
                        <tr>
                            <td>Usuario :</td>
                            <td>                 
                                <select name="selectUsu">
                                    <option> Seleccionar usuario</option> 
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
                            <td>Disciplina </td>
                            <td>                 
                                <select name="selectDisc">
                                    <option> Seleccionar disciplina</option> 
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
                                                   value="Grabar Categoria"></td>                      
                        </tr>
                    </thead>
                </table>

            </form>
        </div>

        <%
            if (request.getParameter("btnGrabar") != null) {
                String nomb = request.getParameter("txtNom");
                String codCat = request.getParameter("txtCodCat");
                int usu = Integer.parseInt(request.getParameter("selectUsu"));
                int disc = Integer.parseInt(request.getParameter("selectDisc"));
                try {
                    ln.insertarCategoria(nomb, codCat, usu, disc);
                    request.getRequestDispatcher("Categorias.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }
        %>

    </body>
</html>
