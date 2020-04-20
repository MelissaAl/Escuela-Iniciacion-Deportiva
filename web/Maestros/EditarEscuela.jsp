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
                <h2>Editar Escuela <br></h2>
                <a href="../Maestros/Escuelas.jsp" align="right">Regresar</a>
            </ul>
        </nav>      
        <div >

            <%
                int idEsc = Integer.parseInt(request.getParameter("idEsc"));
                ResultSet rs, rs2, rs3, rs4, rs5 = null;
                Logicadenegocios ln = new Logicadenegocios();
             //   rs5 = ln.mostrarCursos();
                rs2 = ln.mostrarAlumnos();
                rs3 = ln.mostrarCategorias();
                rs4 = ln.mostrarNotas();
                try {
                    rs = ln.mostrarCurso(idEsc);
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
                            <td>Nombre : </td>
                            <td><input type="text" name="txtNomEd" value="<%=rs.getString(2)%>"></td>
                        </tr>
                        <tr>
                            <td>Edad minima :</td>
                            <td><input type="text" name="txtEdadMinEd" value="<%=rs.getString(3)%>"></td>
                        </tr>
                        <tr>
                            <td>Edad Máxima :</td>
                            <td><input type="text" name="txtEdadMaxEd" value="<%=rs.getString(4)%>"></td>
                        </tr>

                        <tr>
                            <td>Codigo Escuela :</td>
                             <td><input type="text" name="txtCodEsc" value="<%=rs.getString(5)%>"></td>
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
                            <th colspan="2"><input type="submit" name="btnEditar"
                                                   value="Editar Escuela"></td>                      
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
                String nomb = request.getParameter("txtNomEd");
                int edadMin = Integer.parseInt(request.getParameter("txtEdadMinEd"));
                int edadMax = Integer.parseInt(request.getParameter("txtEdadMaxEd"));
                String codEsc = request.getParameter("txtCodEsc");
                int idAlum = Integer.parseInt(request.getParameter("selectAlum"));
                int IdCateg = Integer.parseInt(request.getParameter("selectCat"));
                int idNota = Integer.parseInt(request.getParameter("selectNota"));
                int idNotaAl = Integer.parseInt(request.getParameter("selectNotaUsus"));
                try {
                    ln.actualizarCurso(cod, nomb, edadMin, edadMax, codEsc, idAlum, IdCateg, idNota, idNotaAl);
                    request.getRequestDispatcher("Escuelas.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }

        %>
    </body>
</html>
