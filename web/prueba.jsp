<%-- 
    Document   : prueba
    Created on : 11/04/2020, 12:16:33 PM
    Author     : JAMPIER30
--%>

<%@page import="Logicadenegocios.Logicadenegocios"%>
<%@page import="Logicadenegocios.Datos"%>
<%@page import ="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <table border="1" width="600" align="center">
            <thead>
                <tr bgcolor="skyblue">
                    <th colspan="5">Listado de usuarios</th>      
                </tr>
                <tr bgcolor="skyblue">

                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Perfil</th>
                <th>pass</th>
                </tr>



                <%
                    
                    Logicadenegocios ln = new Logicadenegocios();
                    int ced =2125548;
                  
                    ResultSet rs = null;
                 
                    try {
                

                       rs=ln.mostrarUsuario(ced);
                       
                        while (rs.next()) {
                %>
                <tr>                     
                    <th><%=rs.getString(1)%></th>
                    <th><%=rs.getString(2)%></th>
                    <th><%=rs.getString(3)%></th>
                    <th><%=rs.getString(4)%></th>
                    <th><%=rs.getString(5)%></th>
                    <th>
                </tr>
                <%
                    }
                        ln.cerrarConexion();
                    }catch (Exception e) {

               }
                %>
            </thead>
        </table>              
    </body>
</html>
