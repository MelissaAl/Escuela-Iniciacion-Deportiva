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
                <h2>Editar Perfil <br></h2>
                <a href="../Maestros/Perfil.jsp" align="right">Regresar</a>
            </ul>
        </nav>      
        <div >

            <%
                int idPerf = Integer.parseInt(request.getParameter("idPerf"));
                ResultSet rs = null;
                Logicadenegocios ln = new Logicadenegocios();
                try {
                    rs = ln.mostrarPerfil(idPerf);
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
                            <td><input type="text" name="txtNom" value="<%=rs.getString(2)%>"></td>
                        </tr>
                        <tr>
                            <td>Estado :</td>
                                <td>
                                      <select name="selectAct">
                                          <option value="1">Activo</option>
                                          <option value="0">Inactivo</option>                                
                                      </select>
                                  </td>
                        </tr>
                       
                        <tr>
                            <th colspan="2"><input type="submit" name="btnEditar"
                                                   value="Editar Perfil"></td>                      
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
                int act = Integer.parseInt(request.getParameter("selectAct"));
                System.out.println(nomb);
                try {
                    ln.actualizarPerfil(cod, nomb, act);
                    request.getRequestDispatcher("Perfil.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }

        %>
    </body>
</html>
