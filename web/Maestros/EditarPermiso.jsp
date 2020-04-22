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
                <h2>Editar Permisos <br></h2>
                <a href="../Maestros/Permisos.jsp" align="right">Regresar</a>
            </ul>
        </nav>      
        <div >

            <%
                //int idPerm = Integer.parseInt(request.getParameter("idPerm"));
                String idPerm =request.getParameter("idPerm");
                Logicadenegocios ln = new Logicadenegocios();
                
                if(idPerm !=null)
                {
                    int idPer = Integer.parseInt(idPerm);
                    ResultSet rs = null;
                    
                     try {
                         
                            rs = ln.mostrarPermiso(idPer);
                            while (rs.next()) {
            %>

            <form action="" method="GET">
                <table border="1" width="250" align="center">
                    <thead>           
                        <tr>
                            <th>Id Permiso usuario : </th>
                            <th><input type="text" name="txtId" value="<%=rs.getString(1)%>" readonly="readonly"></th>
                        </tr>              
                        <tr>
                            <td>id Usuario : </td>
                            <td><input type="text" name="txtidUs" value="<%=rs.getString(2)%>"></td>
                        </tr>
                        <tr>
                            <td>id Permiso :</td>
                            <td><input type="text" name="txtidPerm" value="<%=rs.getString(3)%>"></td>
                        </tr>
                       
                        <tr>
                            <th colspan="2"><input type="submit" name="btnEditar"
                                                   value="Editar Permiso"></td>                      
                        </tr>
                    </thead>
                </table>

            </form>
        </div>
        <%         }
            } catch (Exception e) {
                out.println(e);
            }
}
            if (request.getParameter("btnEditar") != null) {
                int cod = Integer.parseInt(request.getParameter("txtId"));
                int idUs = Integer.parseInt(request.getParameter("txtidUs"));
                int idPermi = Integer.parseInt(request.getParameter("txtidPerm"));              
                try {
                    ln.actualizarPermisoUs(cod, idUs, idPermi);
                    request.getRequestDispatcher("Permisos.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }

        %>
    </body>
</html>
