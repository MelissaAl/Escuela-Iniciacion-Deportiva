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
                <h2>Editar Categorias <br></h2>
                <a href="../Maestros/Categorias.jsp" align="right">Regresar</a>
            </ul>
        </nav>      
        <div >

            <%
                int idAlum = Integer.parseInt(request.getParameter("idCateg"));
                ResultSet rs, rs2, rs3 = null;
                Logicadenegocios ln = new Logicadenegocios();
                try {
                    rs = ln.mostrarCategoria(idAlum);
                    rs2=ln.mostrarDisciplinas();
                    rs3=ln.mostrarUsuarios();
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
                            <td>Categoria : </td>
                            <td><input type="text" name="txtNom" value="<%=rs.getString(2)%>"></td>
                        </tr>
                        <tr>
                            <td>Codigo categoria :</td>
                            <td><input type="text" name="txtCoCat" value="<%=rs.getString(3)%>"></td>
                        </tr>
                       
                         <tr>
                            <td>Usuario :</td>
                            <td>                 
                                <select name="selectUsu">
                                    <option> Seleccionar usuario</option> 
                                    <% while (rs3.next()) {

                                    %>  
                                    <option value="<%=rs3.getString(1)%>"><%=rs3.getString(2)%> <%=rs3.getString(3)%></option>
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
                            <th colspan="2"><input type="submit" name="btnEditar"
                                                   value="Editar categoria"></td>                      
                        </tr>
                    </thead>
                </table>

            </form>
        </div>
        <%         }
            } catch (Exception e) {
                out.println(e + "Error inicial");
            }
            if (request.getParameter("btnEditar") != null) {
                int cod = Integer.parseInt(request.getParameter("txtId"));
                String nomb = request.getParameter("txtNom");
                String apell = request.getParameter("txtCoCat");
                int sexo =Integer.parseInt(request.getParameter("txtUs"));
                int edad = Integer.parseInt(request.getParameter("txtDisc"));
                try {
                    ln.actualizarCategoria(cod, nomb, apell, sexo, edad);
                    request.getRequestDispatcher("Categorias.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }

        %>
    </body>
</html>
