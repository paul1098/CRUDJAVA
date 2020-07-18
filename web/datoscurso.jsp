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
            String s_codigo;
            String s_nombre;
            String s_horas;
            String s_creditos;
            String s_estado;
        %>
    </head>
    <body>
        
        <form name="DatosCursoForm" action="datoscurso.jsp">
            
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Curso</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Codigo</td>
                        <td><input type="text" name="f_codigo" value="" /></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="f_nombre" value="" /></td>
                    </tr>
                    <tr>
                        <td>Horas</td>
                        <td><input type="text" name="f_horas" value="" /></td>
                    </tr>
                    <tr>
                        <td>Creditos</td>
                        <td><input type="text" name="f_creditos" value="" /></td>
                    </tr>
                    <tr>
                        <td>Estado</td>
                        <td><input type="text" name="f_estado" value="" /></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2"><input type="submit" value="Agregar" name="f_agregar" /></td>
                        <input type="hidden" name="f_accion" value="C" />
                    </tr>
                    
                </tbody>
            </table>
    
        </form>
        
        
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
                           
                          
                           pst=cn.prepareStatement(consulta);
                           pst.executeUpdate();
                       }
                   else if (s_accion.equals("C")) {
                         s_codigo=request.getParameter("f_codigo");
                         s_nombre=request.getParameter("f_nombre");
                         s_horas=request.getParameter("f_horas");
                         s_creditos=request.getParameter("f_creditos");
                         s_estado=request.getParameter("f_estado");  
                         
                         consulta = " insert into "
                                    + " curso (codigo,nombre,horas,creditos,estado)"
                                    + " values ('"+ s_codigo +"','"+ s_nombre +"','"+ s_horas +"','"+ s_creditos +"','"+s_estado+"');  ";
                         
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