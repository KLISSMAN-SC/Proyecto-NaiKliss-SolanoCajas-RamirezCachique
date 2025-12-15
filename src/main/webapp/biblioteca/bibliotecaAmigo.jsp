<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Beans.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<%
    String url = request.getContextPath() + "/";
    List<Biblioteca> listarBiblioteca = (List<Biblioteca>) request.getAttribute("listarBiblioteca");
    String nombre=(String) request.getAttribute("nombre");
%>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    .center-container {
        width: 90%;
        margin: 0 auto;
        margin-top: 40px;
    }
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/componente/Navbar.jsp" />
	
	<h1>BIBLIOTECA DE <%=nombre %> </h1>
	<div class="center-container">
	<table class="table table-striped table-bordered text-center">
		<thead class="table-dark">
			<tr>
				 	<th>ID</th>
                    <th>Nombre</th>          
                    <th>Descripción</th>
                    <th>Desarrollador</th>
                    <th>Categoría</th>
                    
                    			
			
			</tr>
		
		
		</thead>
		   <tbody>
            <%
            if(listarBiblioteca != null){
            	int i=0;
                for(Biblioteca b : listarBiblioteca){
                	i++;
            %>
                <tr>
                    <td><%=i%></td>
                    <td><%=b.getNombreVideojuego()%></td>
                    <td><%=b.getDescripcion()%></td>
                    <td><%=b.getDesarrollador()%></td>
                    <td><%=b.getCategoria()%></td>
                    

                    
                </tr>

            <%
                }
            } else {
            %>
                <tr>
                    <td colspan="8" >NO HAY DATOS</td>
                </tr>
            <%
            }
            %>
            </tbody>
	
	
	
	</table>
	</div>




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>