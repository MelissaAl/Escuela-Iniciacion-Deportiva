
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
             int cod =Integer.parseInt(request.getParameter("idUsuario"));
                    ResultSet rs = null;
                    Logicadenegocios ln = new Logicadenegocios();
                    
                  try {
                      ln.eliminarUsuario(cod);
                       request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
                      } catch (Exception e) {
                          out.println(e + " ");
                      }
                  ln.cerrarConexion();
                %>
    </body>
</html>
