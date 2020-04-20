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
                <h2>Editar Alumnos <br></h2>
                <a href="../Maestros/Nota.jsp" align="right">Regresar</a>
            </ul>
        </nav>      
        <div >

            <%
                int idNota = Integer.parseInt(request.getParameter("idNota"));
                ResultSet rs, rs2 = null;
                Logicadenegocios ln = new Logicadenegocios();

                try {
                    rs = ln.mostrarNota(idNota);
                    rs2 = ln.mostrarAlumnos();
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
                            <td>Nota : </td>
                            <td><input type="text" name="txtNotaEd" value="<%=rs.getString(2)%>"></td>
                        </tr>
                        <tr>
                            <td>VI nota :</td>
                            <td><input type="text" name="txtVNotaEd" value="<%=rs.getString(3)%>"></td>
                        </tr>
                        <tr>
                            <td>Alumno :</td>
                            <td>                 
                                <select name="selectUsus">
                                    <option> Selecciona un alumno</option> 
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
                            <th colspan="2"><input type="submit" name="btnEditar"
                                                   value="Editar Alumno"></td>                      
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
                String nota = request.getParameter("txtNotaEd");
                int Vnota = Integer.parseInt(request.getParameter("txtVNotaEd"));
                int idAlum = Integer.parseInt(request.getParameter("txtIdAlum"));

                try {
                    ln.actualizarNotas(cod, nota, Vnota, idAlum);
                    request.getRequestDispatcher("Nota.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }

        %>
    </body>
</html>
