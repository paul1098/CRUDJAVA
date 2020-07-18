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
            String s_idcurso;
        %>
    </head>
    <body>
        <table border="1" cellspacing="0" cellpadding="" align = "center">
            <thead>
                
                <tr>
                   <th colspan="8">Datos Curso</th>  
                </tr>
                                 
                <th>#</th>
                <th>Codigo</th>
                <th>Nombre</th>
                <th>Horas</th>
                <th>Creditos</th>
                <th>Estado</th>
                <th>Eliminar</th>
                <th>Modificar</th>    
                
            </thead>

        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                s_accion = request.getParameter("f_accion");
                s_idcurso = request.getParameter("f_idcurso");
                
                if (s_accion!=null) {
                   if (s_accion.equals("E")) {
                           consulta = " delete from curso "
                                   +  " where "
                                   +  " idcurso = " + s_idcurso + "; ";
                           out.print(consulta);
                          
                           pst=cn.prepareStatement(consulta);
                           pst.executeUpdate();
                       }
                    }
                
                
                
                consulta= " Select idcurso, codigo, nombre, horas, creditos, estado "
                        + " from curso ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                
                String ide;
                int num=0;
                while (rs.next()) {  
                    ide = rs.getString(1);
                    num ++;
                    %>
                    <tr align="center">
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>
                        <td><%out.print(rs.getString(5));%></td>
                        <td><%out.print(rs.getString(6));%></td>
                        <td><a href="datoscurso.jsp?f_accion=E&f_idcurso=<%out.print(ide);%>">Eliminar</a></td>
                        <td>Modificar</td>
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