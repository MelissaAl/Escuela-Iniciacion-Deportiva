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
                <a href="../Maestros/Alumnos.jsp" align="right">Regresar</a>
            </ul>
        </nav>      
        <div >

            <%
                int idAlum = Integer.parseInt(request.getParameter("idAlumn"));
                ResultSet rs = null;
                Logicadenegocios ln = new Logicadenegocios();
                try {
                    rs = ln.mostrarAlumno(idAlum);
                    while (rs.next()) {
            %>

            <form action="">
                <table border="1" width="250" align="center">
                    <thead>           
                        <tr>
                            <th>Id : </th>
                            <th><input type="text" name="txtId" placeholder="Enter id" value="<%=rs.getString(1)%>" readonly="readonly"></th>
                        </tr>              
                        <tr>
                            <td>Nombre : </td>
                            <td><input type="text" name="txtNom" placeholder="Enter nombre" value="<%=rs.getString(2)%>"></td>
                        </tr>
                        <tr>
                            <td>Apellidos :</td>
                            <td><input type="text" name="txtApelli" placeholder="Enter apellidos" value="<%=rs.getString(3)%>"></td>
                        </tr>
                        <tr>
                            <td>Sexo :</td>
                            <td><input type="text" name="txtSex"  placeholder="Enter sexo F/M"value="<%=rs.getString(4)%>"></td>
                        </tr>
                        <tr>
                            <td>Edad </td>
                            <td><input type="text" name="txtEdad" placeholder="Enter Edad" value="<%=rs.getString(5)%>"></td>
                        </tr>
                        <tr>
                            <td>Activo </td>
                            <td>
                                <select name="selectAct">
                                    <option value="1">Activo</option>
                                    <option value="0">Inactivo</option>                                
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>En Mora </td>
                            <td>
                                <select name="selectMora">
                                    <option value="1">No mora</option>
                                    <option value="0">Mora</option>                                
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
                String nomb = request.getParameter("txtNom");
                String apell = request.getParameter("txtApelli");
                String sexo = request.getParameter("txtSex");
                int edad = Integer.parseInt(request.getParameter("txtEdad"));
                int activo = Integer.parseInt(request.getParameter("selectAct"));
                int mora = Integer.parseInt(request.getParameter("selectMora"));

                try {
                    ln.actualizarAlumno(cod, nomb, apell, sexo, edad, activo, mora);
                    request.getRequestDispatcher("Alumnos.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }

        %>
    </body>
</html>
