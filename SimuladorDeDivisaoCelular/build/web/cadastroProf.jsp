 
<%@page import="modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="modelo.Professor"%>
<%@page import="modelo.Turma"%>

<%
    String msg = "";
    Boolean retorno = false;
    Professor prof = new Professor();
    Boolean usuarioExistente = false;
    if (request.getParameter("login") != null 
            && request.getParameter("senha") != null
            && request.getParameter("nome") != null           
            && request.getParameter("formacao") != null
            && request.getParameter("email") != null
            && request.getParameter("formacao") != null) {
        String form;
        form = request.getParameter("formacao");
        if (form.equals("Mestrado") || form.equals("Doutorado") && request.getParameter("MouD") == null) {
            
        } else {
            AlunoDAO aluDAO = new AlunoDAO();
            ProfessorDAO profDAO = new ProfessorDAO();

            List<Aluno> alunos = aluDAO.listar();
            List<Professor> profs = profDAO.listar();

            for (int y = 0; y < alunos.size(); y++) {
                for (int i = 0; i < profs.size(); i++) {
                    if (request.getParameter("login").equals(alunos.get(y).getLogin())
                            || request.getParameter("login").equals(profs.get(i).getLogin())) {
                        msg = "Já tem um usuário com esse login, por favor, tente outro.";
                        usuarioExistente = true;
                    }
                }
            }

            if (usuarioExistente == false) {

                prof = new Professor();
                prof.setLogin(request.getParameter("login"));
                prof.setSenha(request.getParameter("senha"));
                prof.setNome(request.getParameter("nome"));                
                prof.setFormacao(request.getParameter("formacao"));
                prof.setMouD(request.getParameter("MouD"));
                prof.setEmail(request.getParameter("email"));

                profDAO = new ProfessorDAO();
                retorno = profDAO.inserir(prof);               

                if (retorno == true) {
                    msg = "Registro realizados com sucesso";
                    session.setAttribute("Professor", prof);
                    response.sendRedirect("tabelaAlunos.jsp"); // link para cadastrar TURMA nessa página
                } else {
                    msg = "Erro";
                }

            }
        }

    } else {
        msg = "Preencha todos os campos.";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simulador de Divisão Celular</title>
    </head>
    <body>
        <%=msg%>
        <br/>
        <h2>Cadastro - Professor</h2>
        <form name="formCadastroProf" action="cadastroProf.jsp" method="post">
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
            <div> 
                Formação:
                <br/>
                <input type="radio" name="formacao" value="Ciências Biológicas-Licenciatura" onclick="
                        if (document.getElementById('caixa').style.display == 'block') {
                            document.getElementById('caixa').style.display = 'none';
                        }
                        if (document.getElementById('lab').style.display == 'block') {
                            document.getElementById('lab').style.display = 'none'
                        }"/>  Ciências Biológicas - Licenciatura<br/>
                <input type="radio" name="formacao" value="Ciências Biológicas-Bacharelado" onclick="
                        if (document.getElementById('caixa').style.display == 'block') {
                            document.getElementById('caixa').style.display = 'none';
                        }
                        if (document.getElementById('lab').style.display == 'block') {
                            document.getElementById('lab').style.display = 'none'
                        }"/> Ciências Biológicas - Bacharelado<br/>
                <input type="radio" name="formacao" value="Mestrado" onclick="
                        if (document.getElementById('caixa').style.display == 'none') {
                            document.getElementById('caixa').style.display = 'block';
                        }
                        if (document.getElementById('lab').style.display == 'none') {
                            document.getElementById('lab').style.display = 'block'
                        }"/> Mestrado<br/>
                <input type="radio" name="formacao" value="Doutorado" onclick="
                        if (document.getElementById('caixa').style.display == 'none') {
                            document.getElementById('caixa').style.display = 'block';
                        }
                        if (document.getElementById('lab').style.display == 'none') {
                            document.getElementById('lab').style.display = 'block'
                        }"/> Doutorado<br/>
            </div>
            <br/>
            <div> 
                <label id="lab" style="display:none;">Qual seu mestrado ou doutorado:</label>
                <input style="display:none;" id="caixa" type="text" placeholder="insira aqui seu mestrado ou doutorado" name="MouD" maxlength="150" size="50">
            </div>
            <br/>        
            <div>
                <input type="submit" value="Cadastrar" />
                <input type="reset" value="Limpar" />
            </div>
        </form>  
    </body>
</html>
