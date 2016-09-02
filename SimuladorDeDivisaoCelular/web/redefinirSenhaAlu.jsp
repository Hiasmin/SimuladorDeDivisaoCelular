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
        msg = "Ainda n�o h� nenhum aluno cadastrado";
    } else {
        if (request.getParameter("login") != null) {
            for (int y = 0; y < alunos.size(); y++) {
                if (request.getParameter("login").equals(alunos.get(y).getLogin())) {
                    Aluno alu = aluDAO.findByLogin(request.getParameter("login"));
                    session.setAttribute("Aluno", alu);
                    response.sendRedirect("redefinirSenhaAlu2.jsp");
                } else {
                    msg = "Esse login n�o � de um aluno ou n�o existe";
                }
            }
        } else {
            msg = "Preencha o campo";
        }
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
        <form name="formRedefinirSenhaAlu" action="redefinirSenhaAlu.jsp" method="post">
            <h2>Redefini��o de Senha</h2>
            <br/><br/>
            Insira aqui seu login:
            <br/><br/>
            <input name="login" placeholder="insira aqui seu login" type="text" maxlength="50" size="50">
            <br/><br/>
            <input type="submit" value="Pr�ximo">
        </form>
    </body>
</html>
