<%-- 
    Document   : BuscarCliente
    Author     : Hnos. García
    Hernández García, Francisco Carnet: HG201802 LDPI 2021
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar Ciudad</title>
        <link href="css/estilo2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            Long id = (long)0;
            if (request.getParameter("id")!=null)
            {
                id = Long.parseLong(request.getParameter("id"));
            }
            CiudadManager um = new CiudadManager();
            Ciudad ciudad = null;
            if(id > 0)
            {
                ciudad = um.getCiudad(id);
            }
            else
            {
                ciudad = new Ciudad();
            }
            pageContext.setAttribute( "ciudad", ciudad );
        %>
        <h1>Buscar Ciudad</h1>
           <form action="CiudadController" method="post">
               <table frame="box">
                  <tr>
                      <th>Id:</th>
                      <td>
                          <c:if test="${ciudad.id != 0}"> ${ciudad.id} </c:if>
                          <c:if test="${ciudad.id == 0}"> n/a </c:if>
                          <input name="ciudadId" value="${ciudad.id}" type="hidden" />
                      </td>
                  </tr>
                  <tr>
                      <th>Nombre Ciudad:</th>
                      <td><input name="ciudadNombre" value="${ciudad.nombre}" type="text" /></td>
                  </tr>                 
              </table>
                  <input type="submit" value="Buscar" name="searchCiudades" />
          </form>
                  <table>
                    <tr>
                        <td><a href="index.jsp" > <- Regresar al menú principal</a> </td>
                    </tr>
                </table>
    </body>
</html>
