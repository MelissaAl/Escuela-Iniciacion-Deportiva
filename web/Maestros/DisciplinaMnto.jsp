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
                <h2> Disciplinas <br></h2>
                <a href="../Maestros/Disciplina.jsp" align="right">Regresar</a>
            </ul>
        </nav>
        
        <div >
      <form action="">
            <table border="1" width="250" align="center">
                <thead>                       
                    <tr>
                        <td>Disciplina : </td>
                        <td><input type="text" placeholder="Digite Disciplina" name="txtDisc"></td>
                    </tr>
                    <tr>
                        <td>Codigo : </td>
                        <td><input type="text" placeholder="Digite Digite codigo" name="txtCodDisc"></td>
                    </tr>
                    <tr>
                        <th colspan="2"><input type="submit" name="btnGrabrar"
                                               value="Grabar Disciplina"></td>                      
                    </tr>
                </thead>
            </table>
                   
        </form>
        </div>

         <%
         
            if (request.getParameter("btnGrabar") != null) {                        
                String discip = request.getParameter("txtDisc");
                String codDisc = request.getParameter("txtCodDisc");
                
                try {
                   Logicadenegocios ln = new Logicadenegocios();   
                   
                     ln.insertarDisciplina(discip, codDisc);
                    request.getRequestDispatcher("Disciplina.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }
        %>
        
        
    </body>
</html>
