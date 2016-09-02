<%-- 
    Document   : manterTurma
    Created on : 21/08/2016, 20:58:59
    Author     : Hiasmin Acosta Alves
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="modelo.Professor"%>
<%@page import="dao.TurmaDAO"%>
<%@page import="modelo.Turma"%>
<%
    String periodo, msg = "";
    Boolean excluido = false;
    TurmaDAO tDAO = new TurmaDAO();

    Turma turma = new Turma();

    if (request.getParameter("excluirId") != null) {

        turma = (Turma) tDAO.findById(Long.parseLong(request.getParameter("excluirId").toString()));

        excluido = tDAO.excluir(turma);
        if (excluido == true) {    
        response.sendRedirect("turmas.jsp");
        return;
    }
    }

    
    
    
    
    
    if (request.getParameter("idTurma") != null) {
        turma = (Turma) tDAO.findById(Long.parseLong(request.getParameter("idTurma").toString()));
    } else {
        response.sendRedirect("index.jsp");
    }

    periodo = turma.getPeriodo();

    if (request.getParameter("periodoTur") != null) {
        if (request.getParameter("periodoTur") == turma.getPeriodo()) {
            //habilitar botão somente quando tem algo diferente
        } else {
            turma.setPeriodo(request.getParameter("periodoTur"));
            turma = tDAO.atualizar(turma);
            periodo = turma.getPeriodo();
        }
    } else {
        msg = "Preencha todos os campos";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divisão Celular</title>        
    </head>        
    <body>    
        <form name="formAlterarTurmas" action="manterTurma.jsp" method="post">
            <%=msg%><br/>
            <h2>Alterar turma</h2>   
            <input name="id" type="text" value="<%=turma.getId()%>" readonly> 
            <br/>
            Período:
            <input name="periodoTur" type="text" value="<%=periodo%>" maxlength="150" size="50"> 
            <br/> 
            <br/>                                      
            <input type="submit" value="Alterar">           
            <br/>            
            <br/>
        </form>
        <button><a href="manterTurma.jsp?excluirId=<%=turma.getId()%>">Excluir</a></button>
    </body>
</html>
