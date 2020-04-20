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
                <h2> Editar usuarios <br></h2>
                <a href="../Maestros/Usuarios.jsp" align="right">Regresar</a>
            </ul>
        </nav>
        <div >
            <%
                String idUsuario=request.getParameter("idUsuario");
                Logicadenegocios ln = new Logicadenegocios();
                if(idUsuario!=null)
                {                
                    int idUsu = Integer.parseInt(idUsuario);
                    ResultSet rs = null;
                    
                    try {

                         rs = ln.mostrarUsuario(idUsu);

                         while (rs.next()) {

            %>
            <form action="" method="GET">
                <table border="1" width="250" align="center">
                    <thead>           
                        <tr>
                            <th>Id : </th>
                            <th><input type="text" name="txtId" value="<%=rs.getString(1)%>" readonly="readonly"></th>
                        </tr>              
                        <tr>
                            <td>Nombres : </td>
                            <td><input type="text" name="txtNom" value="<%=rs.getString(2)%>"></td>
                        </tr>
                        <tr>
                            <td>Apellidos :</td>
                            <td><input type="text" name="txtApelli" value="<%=rs.getString(3)%>"></td>
                        </tr>
                        <tr>
                            
                            
                            <td>Perfil :</td>
                            <td><input type="text" name="selectPerfil" value="<%=rs.getString(7)%>"></td>
                            
                            
                        </tr>
                        <tr>
                            <td>Nombre usuario </td>
                            <td><input type="text" name="txtUsua" value="<%=rs.getString(5)%>"></td>
                        </tr>
                        <tr>
                            <td>Contraseña </td>
                            <td><input type="text" name="txtPas" value="<%=rs.getString(6)%>"></td>
                        </tr>
                        <tr>
                            <th colspan="2"><input type="submit" name="btnEditar" value="Editar Usuario"></td>                      
                        </tr>
                    </thead>
                </table>
            </form>
        </div>
        <%                }
            } catch (Exception e) {
                out.println(e);
            }
        }
            if (request.getParameter("btnEditar") != null) {
                int cod = Integer.parseInt(request.getParameter("txtId"));
                String nomb = request.getParameter("txtNom");
                String apell = request.getParameter("txtApelli");
                int perfil = Integer.parseInt(request.getParameter("selectPerfil"));
                String usuar = request.getParameter("txtUsua");
                String pass = request.getParameter("txtPas");

                try {

                    int var = 1;
                    ln.actualizarUsuario(cod, nomb, apell, perfil, usuar, pass, var);
                    request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }

            }

        %>


    </body>
</html>
