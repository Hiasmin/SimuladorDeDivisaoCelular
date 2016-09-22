
<%@page import="modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="dao.AlunoDAO"%>
<%@page import="dao.ProfessorDAO"%>
<%@page import="modelo.Professor"%>
<%

    String msg = "";

    Professor professor = new Professor();
    ProfessorDAO pDAO = new ProfessorDAO();

    if (request.getParameter("excluirLogin") != null) {

        Boolean excluido = pDAO.excluir(request.getParameter("excluirLogin"));

        if (excluido == true) {
            response.sendRedirect("index.jsp");
            return;
        }
    }

    if (session.getAttribute("Professor") != null) {
        professor = (Professor) session.getAttribute("Professor");
    } else {
        response.sendRedirect("index.jsp");
    }

    String loginProf = professor.getLogin();
    String nomeProf = professor.getNome();
    String senhaProf = professor.getSenha();
    String emailProf = professor.getEmail();
    String formacaoProf = professor.getFormacao();
    String MouDProf = professor.getMouD();

    String checkedCBB="", checkedCBL="", checkedM="", checkedD="";
    String modoLABELeCAIXA = "";
    if (formacaoProf.equals("Doutorado")) {
        checkedD = "checked";
        modoLABELeCAIXA = "block";
    } else if (formacaoProf.equals("Ciências Biológicas-Licenciatura")) {
        checkedCBL = "checked";
        modoLABELeCAIXA = "none";
    } else if (formacaoProf.equals("Mestrado")) {
        checkedM = "checked";
        modoLABELeCAIXA = "block";
    } else if (formacaoProf.equals("Ciências Biológicas-Bacharelado")) {
        checkedCBB = "checked";
        modoLABELeCAIXA = "none";
    }

    //atualizar Prof       
    //aqui deve-se colocar um teste para verificar se algum campo mudou, se não, não há necessidade de executar o código abaixo
    if (request.getParameter("senha") != null
            && request.getParameter("nome") != null
            && request.getParameter("email") != null
            && request.getParameter("formacao") != null) {

        if (request.getParameter("formacao").equals("Mestrado") || request.getParameter("formacao").equals("Doutorado")) {
            if (request.getParameter("MouD") != null) {
                professor.setMouD(request.getParameter("MouD"));
            } else {
                msg = "Preencha todos os campos.";
                return;
            }
        } else {
            professor.setMouD("");
        }

        ProfessorDAO profDAO = new ProfessorDAO();
        professor.setNome(request.getParameter("nome"));

        if (Long.parseLong(request.getParameter("senha")) == Long.parseLong(request.getParameter("confSenha"))) {
            professor.setSenha(request.getParameter("senha"));
        } else {
            msg = "Senhas não conferem.";
        }

        AlunoDAO aluDAO = new AlunoDAO();
        List<Professor> profs = profDAO.listar();
        List<Aluno> alus = aluDAO.listar();
        Boolean emailExistente = false;
        for (int y = 0; y < alus.size(); y++) {
            for (int i = 0; i < profs.size(); i++) {
                if (request.getParameter("email").equals(alus.get(y).getEmail())
                        || request.getParameter("email").equals(profs.get(i).getEmail())) {
                    if (request.getParameter("email").equals(professor.getEmail())) {
                        emailExistente = false;
                    } else {
                        emailExistente = true;
                    }
                }
            }
        }
        if (emailExistente == false) {
            professor.setEmail(request.getParameter("email"));
        } else {
            msg = "Já tem um usuário com esse email, por favor, tente outro";
        }

        professor.setFormacao(request.getParameter("formacao"));

        Professor prof = profDAO.atualizar(professor);
        session.setAttribute("Professor", prof);

        checkedCBB = "";
        checkedCBL = "";
        checkedM = "";
        checkedD = "";

        if (prof != null) {

            loginProf = prof.getLogin();
            nomeProf = prof.getNome();
            senhaProf = prof.getSenha();
            emailProf = prof.getEmail();
            formacaoProf = prof.getFormacao();

            modoLABELeCAIXA = "";
            if (formacaoProf.equals("Doutorado")) {
                checkedD = "checked";
                modoLABELeCAIXA = "block";
            } else if (formacaoProf.equals("Ciências Biológicas-Licenciatura")) {
                checkedCBL = "checked";
                modoLABELeCAIXA = "none";
            } else if (formacaoProf.equals("Mestrado")) {
                checkedM = "checked";
                modoLABELeCAIXA = "block";
            } else if (formacaoProf.equals("Ciências Biológicas-Bacharelado")) {
                checkedCBB = "checked";
                modoLABELeCAIXA = "none";
            }

            MouDProf = prof.getMouD();

            msg = "Professor atualizado com sucesso!";
        }
    } else {
        msg = "Preencha todos os campos.";
    }


%>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divisão Celular</title>
    </head>
    <body>
        <div><%=msg%><br/><br/>           
            <h3>MINHA CONTA - PROFESSOR</h3>            
            <form name="formAlterarProf" action="minhaContaProf.jsp" method="post">
                <div>                      
                    <br/>                    
                    Login:<input type="text" value="<%=loginProf%>" readonly>
                </div>
                <br/>
                <div>                    
                    Senha: <input type="password" value="<%=senhaProf%>" name="senha" maxlength="16" size="30">
                </div>
                <br/>
                <div>                    
                    Confirmação de senha: <input type="password" value="<%=senhaProf%>" name="confSenha" maxlength="16" size="30">
                </div>
                <br/>
                <div>                                                   
                    Nome:<input type="text" value="<%=nomeProf%>" name="nome" maxlength="150" size="50">
                </div>
                <br/>                                
                <div>            
                    Email:<input type="email"  value="<%=emailProf%>" name="email" maxlength="50" size="50">
                </div>
                <br/>
                <div> 
                    Formação:
                    <br/>     

                    <input type="radio" name="formacao" value="Ciências Biológicas-Bacharelado" onclick="
                        if (document.getElementById('caixa').style.display == 'block') {
                        document.getElementById('caixa').style.display = 'none';
                        }
                        if (document.getElementById('lab').style.display == 'block') {

                        document.getElementById('lab').style.display = 'none'
                        }" <%=checkedCBB%>/> Ciências Biológicas - Bacharelado<br/>                                                

                    <input type="radio" name="formacao" value="Ciências Biológicas-Licenciatura" onclick="
                                if (document.getElementById('caixa').style.display == 'block') {
                                document.getElementById('caixa').style.display = 'none';
                                }

                                if (document.getElementById('lab').style.display == 'block') {
                                document.getElementById('lab').style.display = 'none'
                                }" <%=checkedCBL%>/>  Ciências Biológicas - Licenciatura<br/>

                    <input type="radio" name="formacao" value="Mestrado" onclick="if (document.getElementById('caixa').style.display == 'none') {
                                document.getElementById('caixa').style.display = 'block';
                                }

                                if (document.getElementById('lab').style.display == 'none') {
                                document.getElementById('lab').style.display = 'block'
                                }" <%=checkedM%>/> Mestrado<br/>                                

                    <input type="radio" name="formacao" value="Doutorado" onclick="
                                if (document.getElementById('caixa').style.display == 'none') {
                                document.getElementById('caixa').style.display = 'block';
                                }
                                if (document.getElementById('lab').style.display == 'none') {
                                document.getElementById('lab').style.display = 'block'
                                }" <%=checkedD%>/> Doutorado<br/>

                </div>
                <br/>
                <br/> 
                <label id="lab" style="display:<%=modoLABELeCAIXA%>;">Qual seu mestrado ou doutorado:</label>
                <input value="<%=MouDProf%>" style="display:<%=modoLABELeCAIXA%>;" id="caixa" type="text" placeholder="insira aqui seu mestrado ou doutorado" name="MouD" maxlength="150" size="50">

                <br/>                       
                <div>
                    <input type="submit" value="Atualizar"/>                                  
                </div>
            </form>
            <br/>
            <button><a href="minhaContaProf.jsp?excluirLogin=<%=professor.getLogin()%>">Excluir</a></button>
        </div>
    </body>
</html>
