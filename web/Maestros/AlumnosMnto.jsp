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
                <h2> Alumnos <br></h2>
                 <a href="../Maestros/Alumnos.jsp" align="right">Regresar</a>
            </ul>
        </nav>
        
        <div >
      <form action="">
            <table border="1" width="250" align="center">
                <thead>           
                    <tr>
                        <th>Id : </th>
                        <th><input type="text" placeholder="Digite id" name="txtId"></th>
                    </tr>              
                    <tr>
                        <td>Nombre : </td>
                        <td><input type="text" placeholder="Digite nombres" name="txtNom"></td>
                    </tr>
                    <tr>
                        <td>Apellidos :</td>
                        <td><input type="text" placeholder="Digite apellidos" name="txtApelli"></td>
                    </tr>
                    <tr>
                        <td>Sexo :</td>
                        <td><input type="text" placeholder="Digite sexo F/M" name="txtSex"></td>
                    </tr>
                    <tr>
                        <td>Edad </td>
                        <td><input type="text" placeholder="Digite edad" name="txtEdad"></td>
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
                        <th colspan="2"><input type="submit" name="btnGrabrar"
                                               value="Grabar Alumno"></td>                      
                    </tr>
                </thead>
            </table>
                   
        </form>
        </div>

         <%
         
            if (request.getParameter("btnGrabar") != null) {          
                int cod =Integer.parseInt(request.getParameter("txtId"));
                String nomb = request.getParameter("txtNom");
                String apell = request.getParameter("txtApelli");
                String sexo = request.getParameter("txtSex");
                int edad = Integer.parseInt(request.getParameter("txtEdad"));
                int activo = Integer.parseInt(request.getParameter("selectAct"));
                int mora = Integer.parseInt(request.getParameter("selectMora"));
                try {
                   Logicadenegocios ln = new Logicadenegocios();   
                   
                     ln.insertarAlumno(cod, nomb, apell, sexo, edad, activo, mora);
                    request.getRequestDispatcher("Alumnos.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }
        %>
        
        
    </body>
</html>
