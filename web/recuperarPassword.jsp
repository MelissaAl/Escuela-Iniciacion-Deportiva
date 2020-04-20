<%-- 
    Document   : recuperarPassword
    Created on : 18/04/2020, 04:02:04 PM
    Author     : melissa.aldana
--%>
<%@page import="Logicadenegocios.Log_in"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%
    System.out.print("Prueba");
    String destino = request.getParameter("correoDestino");
    Log_in login = new Log_in();
    try {
        login.enviarCorreoRecordacion(destino, "", "");
    } catch (Exception e) {
        out.println(e + "  ");
    }

    request.getRequestDispatcher("Log_in.html").forward(request, response);
%>



