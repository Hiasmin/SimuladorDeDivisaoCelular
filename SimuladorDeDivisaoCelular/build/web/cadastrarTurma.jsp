
<%@page import="dao.TurmaDAO"%>
<%@page import="modelo.Turma"%>
<%@page import="modelo.Professor"%>

<%
    String msg = "";    
    Professor prof = new Professor();
    
    if (session.getAttribute("Prof") != null) {
        prof = (Professor) session.getAttribute("Prof");
    } else {
        response.sendRedirect("index.jsp");
    }      

    if (request.getParameter("nivelEnsinoTur") != null 
            && request.getParameter("periodoTur") != null
            && request.getParameter("cursoTur") != null           
            && request.getParameter("disciplinaTur") != null
            && request.getParameter("escolaTur") != null) {  
        
        String nivelEnsino = request.getParameter("nivelEnsinoTur");
        String periodo = request.getParameter("periodoTur");
        String curso = request.getParameter("cursoTur");
        String disciplina = request.getParameter("disciplinaTur");
        String escola = request.getParameter("escolaTur");    
        
        Turma turma = new Turma();
        turma.setProfessor(prof);
        turma.setCurso(curso);
        turma.setDisciplina(disciplina);
        turma.setEscola(escola);
        turma.setNivelEnsino(nivelEnsino);
        turma.setPeriodo(periodo);
            
        TurmaDAO turmaDAO = new TurmaDAO();
        Boolean retorno = turmaDAO.inserir(turma);
        
        if (retorno == true) {
                msg = "Turma cadastrada com sucesso";       
                response.sendRedirect("tabelaAlunos.jsp");
            } else {
                msg = "Erro ao cadastrar turma";
            }
        } else {
            msg = "Preencha o campo";
        }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divisão Celular</title>
        <style type="text/css">
            a{	
                text-decoration:none;
                color:#000000;	
            }
            a:link{} 
            a:visited{}
            a:active{} 
            a:hover{	
                color:#32CD32;
                text-decoration:underline;
            }
        </style>
    </head>
    <body>
        <%=msg%>
        <br/>
        <br/> 
        <form name="formCadastroTurmas" action="cadastrarTurma.jsp" method="post">
            <h2>Cadastrar Turma</h2>
            Curso:
            <input name="cursoTur" type="text" placeholder="insira aqui o curso" maxlength="150" size="50"> 
            <br/> 
            <br/> 
            Período:
            <input name="periodoTur" type="text" placeholder="insira aqui o período" maxlength="150" size="50"> 
            <br/> 
            <br/> 
            Disciplina:
            <input name="disciplinaTur" type="text" placeholder="insira aqui a disciplina" maxlength="150" size="50"> 
            <br/> 
            <br/>             
            Escola:
            <input name="escolaTur" type="text" placeholder="insira aqui a escola" maxlength="150" size="50"> 
            <br/> 
            <br/>
            <div> 
            Nível de ensino:
            <br/>
            <input type="radio" name="nivelEnsinoTur" value="Ensino Médio"/>  Ensino Médio<br/>
            <input type="radio" name="nivelEnsinoTur" value="Ensino Técnico Integrado"/> Ensino Técnico Integrado<br/>
            <input type="radio" name="nivelEnsinoTur" value="Ensino Técnico Subsequente"/> Ensino Técnico Subsequente<br/>
            <input type="radio" name="nivelEnsinoTur" value="Ensino Superior"/> Ensino Superior<br/>
            </div>
            <br/>
            <br/>                        
            <div>
                <input type="submit" value="Cadastrar">
            </div>
            <br/>
            <br/>                         
            <div>
                <a href="tabelaAlunos.jsp" target="_self">Área do Professor</a>
            </div>
            <br/>
        </form>
    </body>
</html>
