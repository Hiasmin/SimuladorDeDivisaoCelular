<%@page import="dao.ProfessorDAO"%>
<%@page import="modelo.Professor"%>
<%@page import="modelo.Matricula"%>
<%@page import="dao.MatriculaDAO"%>
<%@page import="modelo.Turma"%>
<%@page import="dao.TurmaDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="modelo.Aluno"%>

<%

    String msg = "";
    //JUNTAR OS CADASTRAR/ALTERAR/EXCLUIR DO PROF E DO ALUNO
    
    //mostar dados
    Aluno aluno = new Aluno();
    if (session.getAttribute("Aluno") != null) {
        aluno = (Aluno) session.getAttribute("Aluno");
    } else {
        response.sendRedirect("index.jsp");
    }

    String loginAluno = aluno.getLogin();
    String nomeAluno = aluno.getNome();
    String senhaAluno = aluno.getSenha();
    String emailAluno = aluno.getEmail();

    MatriculaDAO matriculaDAO = new MatriculaDAO();
    List<Matricula> matriculas = new ArrayList<Matricula>();
    matriculas = matriculaDAO.listar();
    Matricula matricula = new Matricula();
    
    Long idTurmaSelecionada = null;

    for (int x = 0; x < matriculas.size(); x++) {
        if (aluno.getLogin().equals(matriculas.get(x).getAluno().getLogin())) {
            idTurmaSelecionada = matriculas.get(x).getTurma().getId();
            matricula = matriculas.get(x);
        }
    }

    List<Turma> turmas = new ArrayList<Turma>();
    TurmaDAO turmaDAO = new TurmaDAO();
    turmas = turmaDAO.listar();

    String turmaSel = "";
    for (int x = 0; x < turmas.size(); x++) {
        if (idTurmaSelecionada == turmas.get(x).getId()) {
            turmaSel = turmas.get(x).getProfessor().getNome() + " - " + turmas.get(x).getEscola()
                    + " - " + turmas.get(x).getCurso() + " - " + turmas.get(x).getDisciplina()
                    + " - " + turmas.get(x).getPeriodo() + " - " + turmas.get(x).getNivelEnsino();
        }
    }
    
    
    
    

    //atualizar ALUNO
    
    if(
            request.getParameter("senha") == aluno.getSenha()
            && request.getParameter("nome") == aluno.getNome()           
            && request.getParameter("email") == aluno.getEmail()
            && Long.parseLong(request.getParameter("turma")) == matricula.getTurma().getId()){
        // n faz nada
    } else {
    
    if (request.getParameter("senha") != null
            && request.getParameter("nome") != null           
            && request.getParameter("email") != null
            && request.getParameter("turma") != "Selecione") {  
        
    
    AlunoDAO aluDAO = new AlunoDAO();
    aluno.setNome(request.getParameter("nome"));
    
    if (Long.parseLong(request.getParameter("senha")) == Long.parseLong(request.getParameter("confSenha"))) {
        aluno.setSenha(request.getParameter("senha"));
    } else {
        msg = "Senhas não conferem.";
    }
   
    ProfessorDAO profDAO = new ProfessorDAO();
    List<Aluno> alunos = aluDAO.listar();
    List<Professor> profs = profDAO.listar();
    Boolean emailExistente=false;
    for (int y = 0; y < alunos.size(); y++) {
        for (int i = 0; i < profs.size(); i++) {
            if (request.getParameter("email").equals(alunos.get(y).getEmail())
                    || request.getParameter("email").equals(profs.get(i).getEmail())) {  
                if(request.getParameter("email").equals(aluno.getEmail())){
                    emailExistente = false;
                } else {                  
                    emailExistente = true;
                }
            }
        }
    }
    if(emailExistente==false){
        aluno.setEmail(request.getParameter("email"));
    } else {
        msg = "Já tem um usuário com esse email, por favor, tente outro";
    }
    
    Aluno alu = aluDAO.atualizar(aluno);
    session.setAttribute("Aluno", alu);
   
    
    
    
    //atualizar MATRICULA / mandar TURMA ATUALIZADA
    // ele sempre será diferente
    Boolean turAtualizada = false;
    
    Long idTurmaS = Long.parseLong(request.getParameter("turma"));
    
    if(idTurmaS == matricula.getTurma().getId()){
        
    } else {       
        TurmaDAO tDAO = new TurmaDAO();
        Turma t = tDAO.findById(Long.parseLong(request.getParameter("turma")));
        matricula.setTurma(t);
             
        matricula = matriculaDAO.atualizarTur(matricula);
        idTurmaSelecionada = idTurmaS;
        turmaSel = matricula.getTurma().getProfessor().getNome() + " - " + matricula.getTurma().getEscola()
                    + " - " + matricula.getTurma().getCurso() + " - " + matricula.getTurma().getDisciplina()
                    + " - " + matricula.getTurma().getPeriodo() + " - " + matricula.getTurma().getNivelEnsino();
        turAtualizada = true;
    }    
    
    if(alu!=null && turAtualizada!=false){
        
        loginAluno = alu.getLogin();
        nomeAluno = alu.getNome();
        senhaAluno = alu.getSenha();
        emailAluno = alu.getEmail();
        
        msg = "Aluno atualizado com sucesso!";
    }     
    
    } else {
        msg = "Preencha todos os campos.";
    }             

    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divisão Celular</title>
        <script language="javascript">
            
            function excluir(){
                
                <%
                    AlunoDAO aluDAO = new AlunoDAO();
                    Boolean excluiu = aluDAO.excluir(aluno);
                    if(excluiu == true){
                %>
                        //mudar para confirm
                        alert("Sua conta foi deletada com sucesso.");                        
                <%
                        response.sendRedirect("index.jsp");
                    } else {      
                %>
                    alert("Erro ao deletar conta.");
                <%
                    }
                %>
            }
    
        </script>
        
        
    </head>
    <body>
        <div><%=msg%><br/><br/>
            <div style="text-align:right"><a href="glossario.jsp" target="_blank">Glossário</a></div> 
            <h3>MINHA CONTA - ALUNO</h3>            
            <form name="formAlterarAlu" action="minhaContaAlu.jsp" method="post">
                <div>                      
                    <br/>
                    Login: <%=loginAluno%>
                </div>
                <br/>
                <div>                    
                    Senha: <input type="password" value="<%=senhaAluno%>" name="senha" maxlength="16" size="30">
                </div>
                <br/>
                <div>                    
                    Confirmação de senha: <input type="password" value="<%=senhaAluno%>" name="confSenha" maxlength="16" size="30">
                </div>
                <br/>
                <div>                                                   
                    Nome:<input type="text" value="<%=nomeAluno%>" name="nome" maxlength="150" size="50">
                </div>
                <br/>                                
                <div>            
                    Email:<input type="email"  value="<%=emailAluno%>" name="email" maxlength="50" size="50">
                </div>              
                <br/>
                Turma:
                <select name="turma">                                      
                    <br/>
                    <option value="<%=idTurmaSelecionada%>"><%=turmaSel%></option>                                       
                    <%
                        for (int x = 0; x < turmas.size(); x++) {
                            if (idTurmaSelecionada != turmas.get(x).getId()) {
                                Long idTurma = turmas.get(x).getId();
                                String turma = "";
                                turma = turmas.get(x).getProfessor().getNome() + " - " + turmas.get(x).getEscola()
                                        + " - " + turmas.get(x).getCurso() + " - " + turmas.get(x).getDisciplina()
                                        + " - " + turmas.get(x).getPeriodo() + " - " + turmas.get(x).getNivelEnsino();
                    %>  
                    <option value="<%=idTurma%>"><%=turma%></option> 
                    <%
                            }
                        }
                    %>
                </select>
                <br/>
                <br/>
                <div>
                    <input type="submit" value="Atualizar"/><tr/>              
                    <input type="button" value="Excluir Conta" onClick="excluir()"/>
                </div>
            </form>
        </div>
    </body>
</html>
