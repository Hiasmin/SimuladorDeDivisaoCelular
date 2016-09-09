<%-- 
    Document   : turmas
    Created on : 21/08/2016, 20:33:45
    Author     : Hiasmin Acosta Alves
--%>
<%@page import="dao.TurmaDAO"%>
<%@page import="modelo.Turma"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Professor"%>
<%
    Professor prof = new Professor();
    if (session.getAttribute("Professor") != null) {
        prof = (Professor) session.getAttribute("Professor");
    } else {
        response.sendRedirect("index.jsp");
    }
    List<Turma> turmasProfX = new ArrayList<Turma>();
    TurmaDAO tDAO = new TurmaDAO();
    turmasProfX = tDAO.listarProfX(prof);    
    session.setAttribute("Prof", prof);
    Turma turma = new Turma();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divisão Celular</title>
    </head>
    <body>  
        <a href="cadastrarTurma.jsp" target="_self" style="text-align:right">Cadastrar Turma</a>
        <br/>                
        <table border="1">
            <td style="text-align:center">Turmas</td>            
                               
        <%
            for(int x = 0; x < turmasProfX.size(); x++){               
               turma = turmasProfX.get(x);
                String turmaDesc = turmasProfX.get(x).getCurso() + " - " + turmasProfX.get(x).getEscola() + " - " +
                        turmasProfX.get(x).getNivelEnsino() + " - " + turmasProfX.get(x).getDisciplina() + " - " +
                        turmasProfX.get(x).getNivelEnsino() + " - " + turmasProfX.get(x).getPeriodo();                
        %>
                <tr>
                    <td>
                 <a href="manterTurma.jsp?idTurma=<%=turma.getId()%>" target="_self" name="turmaClicada"><%=turmaDesc%></a>
                    </td>
                </tr>                 
                 <br/>
                 <br/>
        <%
            }
        %>        
                       
        </table>
    </body>
</html>
