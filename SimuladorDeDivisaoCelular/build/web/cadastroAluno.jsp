
<%@page import="dao.MatriculaDAO"%>
<%@page import="modelo.Matricula"%>
<%@page import="modelo.Turma"%>
<%@page import="dao.TurmaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Professor"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="modelo.Aluno"%>

<%    
    String msg = "";
    Boolean retornoAluno = false;
    Boolean retornoMatricula = false;
    
    Boolean usuarioExistente = false;
    Boolean emailExistente = false;
    Aluno alu = new Aluno();
    AlunoDAO aluDAO = new AlunoDAO();
    ProfessorDAO profDAO = new ProfessorDAO();
   
    if (request.getParameter("login") != null 
            && request.getParameter("senha") != null
            && request.getParameter("nome") != null           
            && request.getParameter("email") != null
            && request.getParameter("turma") != "Selecione") {      
        List<Aluno> alunos = aluDAO.listar();   
        List<Professor> profs = profDAO.listar();
    
            for (int y = 0; y < alunos.size(); y++) {
                for (int i = 0; i < profs.size(); i++) {
                    if (request.getParameter("login").equals(alunos.get(y).getLogin())
                            || request.getParameter("login").equals(profs.get(i).getLogin())) {
                        msg = "J� tem um usu�rio com esse login, por favor, tente outro";
                        usuarioExistente = true;
                    }
                }                
            }
            
            for (int y = 0; y < alunos.size(); y++) {
                for (int i = 0; i < profs.size(); i++) {
                    if (request.getParameter("email").equals(alunos.get(y).getEmail())
                            || request.getParameter("email").equals(profs.get(i).getEmail())) {
                        msg = "J� tem um usu�rio com esse login, por favor, tente outro";
                        emailExistente = true;
                    }
                }                
            }
                    
            if (usuarioExistente == false && emailExistente == false) {

                alu.setLogin(request.getParameter("login"));
                alu.setSenha(request.getParameter("senha"));
                alu.setNome(request.getParameter("nome"));
                alu.setEmail(request.getParameter("email"));

                retornoAluno = aluDAO.inserir(alu);
                
                if (retornoAluno == true){
                    //pegar a turma selecionada
                    
                    TurmaDAO turmaDAO = new TurmaDAO();
                    Turma turma = new Turma();
                    List<Turma> turmas = new ArrayList<Turma>();
                    turmas = turmaDAO.listar();

                for (int x = 0; x < turmas.size(); x++) {
                    if ((turmas.get(x).getId()) == Long.parseLong(request.getParameter("turma"))) {
                        turma = turmas.get(x);
                    }
                }
                    
                   //cadastrar o alunno atrav�s da matr�cula (turma+aluno)
                    
                    Matricula matricula = new Matricula();
                    MatriculaDAO matriculaDAO = new MatriculaDAO();
                    
                    matricula.setAluno(alu);
                    matricula.setTurma(turma);
                    
                    retornoMatricula = matriculaDAO.inserirMat(matricula);                    
                }                
            }
        
        if (retornoAluno == true && retornoMatricula == true) {
            msg = "Registro Cadastrado com Sucesso";

            session.setAttribute("Aluno", alu);
            response.sendRedirect("preTeste.jsp");

        } else {
            msg = "Erro ao Cadastrar";
        }
    } else {
        msg = "Preencha todos os campos";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divis�o Celular</title>
    </head>
    <body>
        <%=msg%>
        <br/>
        <h2>Cadastro - Aluno</h2>
        <div>
            <form name="formCadastroAlu" action="cadastroAluno.jsp" method="post">
                <div>  
                    Login:<input type="text" placeholder="insira aqui o login" name="login" maxlength="50" size="30">
                </div>
                <br/>
                <div>
                    Senha: <input type="password" placeholder="insira aqui a senha" name="senha" maxlength="16" size="30">
                </div>
                <br/>
                <div>                                                   
                    Nome:<input type="text" placeholder="insira aqui seu nome" name="nome" maxlength="150" size="50">
                </div>
                <br/>                                
                <div>
                    Email:<input type="email" placeholder="insira aqui seu email" name="email" maxlength="50" size="50">
                </div>
                <br/>                                
                <br/>              
                Turma:
                <select name="turma">                    
                    <option value="">Selecione</option>    
                    <%
                        List<Turma> turmas = new ArrayList<Turma>();
                        TurmaDAO turmaDAO = new TurmaDAO();
                        turmas = turmaDAO.listar();
                        if (turmas.isEmpty()) {
                            msg = "Ainda n�o h� nenhuma turma cadstrada, informe seu professor.";
                        } else {
                            int x;                                                            
                            Long idTurmaSelecionada = null;
                            String turma = "";
                            for (x = 0; x < turmas.size(); x++) {
                                idTurmaSelecionada = turmas.get(x).getId();
                                turma = turmas.get(x).getProfessor().getNome() + " - " + turmas.get(x).getEscola()
                                        + " - " +  turmas.get(x).getCurso() + " - " + turmas.get(x).getDisciplina()
                                         + " - " + turmas.get(x).getPeriodo() + " - " + turmas.get(x).getNivelEnsino();
                    %>  
                    <option value=<%=idTurmaSelecionada%>><%=turma%></option>    
                    <%
                            }
                        }
                    %>
                </select>
                <br/>               
                <br/>
                <div>
                    <input type="submit" value="Cadastrar" />
                    <input type="reset" value="Limpar" />
                </div>
            </form>  
        </div> 
    </body>
</html>
