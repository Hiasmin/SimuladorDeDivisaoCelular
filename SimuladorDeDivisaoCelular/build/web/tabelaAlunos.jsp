<%@page import="modelo.Aluno"%>
<%@page import="dao.MatriculaDAO"%>
<%@page import="modelo.Turma"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dao.TurmaDAO"%>
<%@page import="modelo.Professor"%>

<%
    Professor prof = new Professor();
    if (session.getAttribute("Professor") != null) {
        prof = (Professor) session.getAttribute("Professor");
    } else {
        response.sendRedirect("index.jsp");
    }
    TurmaDAO tDAO = new TurmaDAO();
    List<Turma> turmas = tDAO.listarTurmasProf(prof);

    MatriculaDAO mDAO = new MatriculaDAO();    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divisão Celular</title>
    </head>
    <body>
        <div style="text-align:right"><a href="minhaContaProf.jsp" target="_self">Minha conta</a></div>  
        <br/>
        <div style="text-align:right"><a href="turmas.jsp" target="_self">Turmas</a></div> 
        
       
        <%
            if(turmas.isEmpty()){
                %>
                <tr>Você ainda não possui nenhuma turma cadastrada.</tr>
                <%
            } else { 
        %>
         <table border="1">
            <tr>
                <th>Alunos</th>            
            </tr>
        <%            
            for(int x = 0; x < turmas.size(); x++){   
                String turmaDesc = " " + turmas.get(x).getEscola() + " - " + turmas.get(x).getCurso() + " - " + turmas.get(x).getDisciplina()
                        + " - " + turmas.get(x).getNivelEnsino() + " - " + turmas.get(x).getPeriodo();
                %>    
                    <tr>
                        <th style="text-align:center">Turma:<%=turmaDesc%></th>                
                    </tr>
                    <tr>
                        <th>Nome</th>
                        <th>Acertos Pré-Teste</th>
                        <th>Acertos Bloco Exercícios 1</th>
                        <th>Acertos Bloco Exercícios 2</th>
                    </tr>
                <%
                List<Aluno> alunos = mDAO.listarAlunosDaTurma(turmas.get(x));
                if(alunos.isEmpty()){
                    %>
                    <tr><td>Você ainda não possui nenhum aluno cadastrado.</td></tr>
                    <%
                } else {
                for(int y = 0; y < alunos.size(); y++){
                    String nome = alunos.get(y).getNome();
                    Integer ac1 = alunos.get(y).getAcertosTotPt();
                    Integer ac2 = alunos.get(y).getAcertosTotAt();
                    Integer ac3 = alunos.get(y).getAcertosTotAt2();
                    %>                                        
                    <tr>
                        <td><%=nome%></td>
                        <td><%=ac1%></td>
                        <td><%=ac2%></td>
                        <td><%=ac3%></td>
                    </tr>                    
                <%
                }
                }
            }
            }
        %>
        </table>
    </body>
</html>
