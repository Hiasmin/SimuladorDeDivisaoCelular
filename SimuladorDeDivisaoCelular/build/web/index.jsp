
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="modelo.Aluno"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="modelo.Professor"%>

<%
    String mensagem = "";
    boolean existeAlu = true, existeProf = true;
    if (request.getParameter("login") != null && request.getParameter("senha") != null) {

        AlunoDAO aluDAO = new AlunoDAO();
        List<Aluno> listaAlu = aluDAO.listar();

        ProfessorDAO profDAO = new ProfessorDAO();
        List<Professor> listaProf = profDAO.listar();

        if (listaProf.isEmpty() && listaAlu.isEmpty()) {
            mensagem = "Ainda não há nenhum usuário cadastrado.";
        } else {
            
            if (listaProf.size() == 0) {
                existeProf=false;
            } else {
                for (int y = 0; y < listaProf.size(); y++) {
                    if (request.getParameter("login").equals(listaProf.get(y).getLogin())) {
                        Professor prof = new Professor();
                        
                        prof.setLogin(request.getParameter("login"));
                        prof.setSenha(request.getParameter("senha"));
                        
                        prof = profDAO.login(prof);
                        if (prof == null) {
                            mensagem = "Login e/ou senha incorretos.";
                        } else {
                            mensagem = "Login efetuado com sucesso.";
                            response.sendRedirect("tabelaAlunos.jsp");
                            session.setAttribute("Prof", prof);
                        }
                    } else { 
                        existeProf=false;
                    }
                }
            }

            if (listaAlu.size() == 0) {
                existeAlu=false;
            } else {
                for (int x = 0; x < listaAlu.size(); x++) {

                    if (request.getParameter("login").equals(listaAlu.get(x).getLogin())) {
                        Aluno alu = new Aluno();
                        
                        alu.setLogin(request.getParameter("login"));
                        alu.setSenha(request.getParameter("senha"));
                        
                        alu = aluDAO.login(alu);
                        
                        if (alu == null) {
                            mensagem = "Login e/ou senha incorretos.";
                        } else {
                            mensagem = "Login efetuado com sucesso.";    
                            response.sendRedirect("preTeste.jsp");
                            session.setAttribute("Aluno", alu);
                        }
                    } else {
                        existeAlu=false;
                    }
                }
            }
            
            if(existeAlu == false && existeProf == false){
                mensagem = "Esse login não existe. Cadastre-se já.";
            }
            
        }

    } else {
        mensagem = "Preencha todos os campos.";
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
        <div style="text-align:center">
        <br><br/>
        <label><%=mensagem%></label>
        <br><br/>
        <h1>Login</h1>
        <div>
            <form name="formularioLogin" action="index.jsp" method="post">
                <div>                                                   
                    <input type="text" placeholder="Login" name="login">
                </div>
                <br/>
                <div>
                    <input type="password" placeholder="Senha" name="senha">
                </div>
                <br/>
                <div>
                    <input type="submit" value="Entrar" />
                    <input type="reset" value="Limpar" />
                </div>
            </form>  
        </div>
        <br/>
        <a href="redefinirSenha.jsp" target="_self">Esqueceu sua senha?</a>
        <br/>
        <br/>
        <a href="cadastros.jsp" target="_self">Cadastro</a>
        </div>
    </body>
</html>
