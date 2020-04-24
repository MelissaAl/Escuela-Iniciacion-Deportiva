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
                <h2> Permisos <br></h2>
                <a href="../Maestros/Permisos.jsp" align="right">Regresar</a>
            </ul>
        </nav>

        <div >
            <form action="" method="GET">
                <table border="1" width="350" align="center">
                    <thead>           
                        <tr>
                            <td>Nombre permiso : </td>
                            <td><input type="text" placeholder="Digite nombre" name="txtNom"></td>
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
                            <th colspan="2"><input type="submit" name="btnGrabar"
                                                   value="Grabar Permiso"></td>                      
                        </tr>
                    </thead>
                </table>

            </form>
        </div>

        <%

            if (request.getParameter("btnGrabar") != null) {
                String nomb = request.getParameter("txtNom");
                int act = Integer.parseInt(request.getParameter("selectAct"));

                try {
                    Logicadenegocios ln = new Logicadenegocios();

                    ln.insertarPermiso(nomb, act);
                    request.getRequestDispatcher("Permisos.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }
        %>


    </body>
</html>
