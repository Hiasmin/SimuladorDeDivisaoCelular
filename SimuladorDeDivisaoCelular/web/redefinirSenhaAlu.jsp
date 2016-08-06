<%@page import="modelo.Professor"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="dao.AlunoDAO"%>
<%
    String msg = "";
    AlunoDAO aluDAO = new AlunoDAO();
    List<Aluno> alunos = aluDAO.listar();
    if (alunos.isEmpty()) {
        msg = "Ainda não há nenhum aluno cadastrado";
    } else {
        if (request.getParameter("login") != null) {
            for (int y = 0; y < alunos.size(); y++) {
                if (request.getParameter("login").equals(alunos.get(y).getLogin())) {
                    Aluno alu = aluDAO.findByLogin(request.getParameter("login"));
                    session.setAttribute("Aluno", alu);
                    response.sendRedirect("redefinirSenhaAlu2.jsp");
                } else {
                    msg = "Esse login não é de um aluno ou não existe";
                }
            }
        } else {
            msg = "Preencha o campo";
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simulador de Divisão Celular</title>
    </head>
    <body>
        <%=msg%>
        <br/>
        <form name="formRedefinirSenhaAlu" action="redefinirSenhaAlu.jsp" method="post">
            <h2>Redefinição de Senha</h2>
            <br/><br/>
            Insira aqui seu login:
            <br/><br/>
            <input name="login" placeholder="insira aqui seu login" type="text" maxlength="50" size="50">
            <br/><br/>
            <input type="submit" value="Próximo">
        </form>
    </body>
</html>
