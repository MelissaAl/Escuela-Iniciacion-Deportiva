<%@page import="Logicadenegocios.Logicadenegocios"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <title>Inicio</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../EstilosLog_ing.css" rel="stylesheet" type="text/css"/>
</head>


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

<%
    Logicadenegocios ln = new Logicadenegocios();
    ResultSet rs, rs2 = null;
    rs = ln.mostrarUsuarios();
    rs2= ln.mostrarPermiso();
%>

<form action="" method="post"  enctype="multipart/form-data">

    <div class="table-responsive">
        <table border="1" width="250" align="center">
            <thead>           
                <tr>
                    <td>Permiso : </td>
                    <td>                 
                        <select name="selectPerm">
                            <option> Selecciona un permiso</option> 
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
                    <td>Usuario :</td>                  
                    <td>                 
                        <select name="selectUsus">
                            <option> Selecciona un usuario</option> 
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
                    <td>Activo :</td>                  
                    <td>
                        <select name="selectAct">
                            <option value="1">Activo</option>
                            <option value="0">Inactivo</option>                                
                        </select>
                    </td>
                </tr>  
                <tr>
                    <th colspan="2"><input type="submit" name="btnGrabrar"
                                           value="Grabar permisoUs"></td>                      
                </tr>
            </thead>
        </table>



</form>
</div>
<%            if (request.getParameter("btnGrabar") != null) {
        int perm = Integer.parseInt(request.getParameter("selectPerm"));
        int usu = Integer.parseInt(request.getParameter("selectUsus"));
        int act = Integer.parseInt(request.getParameter("selectAct"));

        try {

            ln.insertarPermisoUs(perm, usu, act);
            request.getRequestDispatcher("Permisos.jsp").forward(request, response);
        } catch (Exception e) {
            out.println(e + "");
        }
    }
%>




