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
                <h2>Editar Disciplinas <br></h2>
                <a href="../Maestros/Disciplina.jsp" align="right">Regresar</a>
            </ul>
        </nav>      
        <div >

            <%
                int idDisc = Integer.parseInt(request.getParameter("idDisc"));
                ResultSet rs = null;
                Logicadenegocios ln = new Logicadenegocios();
                try {
                    rs = ln.mostrarDisciplina(idDisc);
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
                            <td>Disciplina : </td>
                            <td><input type="text" name="txtDiscip" value="<%=rs.getString(2)%>"></td>
                        </tr>                     
                        <tr>
                            <td>Codigo disciplina</td>
                            <td><input type="text" name="txtCodDisc" value="<%=rs.getString(3)%>"></td>
                        </tr>
                        <tr>
                            <th colspan="2"><input type="submit" name="btnEditar"
                                                   value="Editar Disciplina"></td>                      
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
                String discip = request.getParameter("txtDiscip");
                String codDisc = request.getParameter("txtCodDisc");
                
                try {
                    ln.actualizarDisciplina(cod, discip, codDisc);
                    request.getRequestDispatcher("Disciplina.jsp").forward(request, response);
                } catch (Exception e) {
                    out.println(e + "");
                }
            }

        %>
    </body>
</html>
