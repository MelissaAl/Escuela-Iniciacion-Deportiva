
<%@page import="Logicadenegocios.Logicadenegocios"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             int cod =Integer.parseInt(request.getParameter("idPerm"));
                    ResultSet rs = null;
                    Logicadenegocios ln = new Logicadenegocios();                   
                  try {
                      ln.eliminarPermiso(cod);
                      request.getRequestDispatcher("Permisos.jsp").forward(request, response);
                      } catch (Exception e) {
                          out.println(e + " ");
                      }
                  ln.cerrarConexion();
                %>
    </body>
</html>
