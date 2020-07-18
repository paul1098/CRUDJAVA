<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Estudiante</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idpersona;
        %>
    </head>
    <body>
        <table border="1" cellspacing="0" cellpadding="" align = "center">
            <thead >
                <th>IDCURSO</th>
                <th>Codigo</th>
                <th>Nombre</th>
                <th>Horas</th>
                <th>Creditos</th>
                <th>Estado</th>
                
            </thead>

        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                consulta= " Select idcurso, codigo, nombre, horas, creditos, estado "
                        + " from curso ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                
                while (rs.next()) {    
                    %>
                    <tr>
                        <td><%out.print(rs.getString(1));%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>
                        <td><%out.print(rs.getString(5));%></td>
                        <td><%out.print(rs.getString(6));%></td>
                        
                    </tr>                    
                    <%
                    }
            }catch(Exception e){
                out.print("Error SQL");
            }
        
        %>
        </table>
    </body>
</html>