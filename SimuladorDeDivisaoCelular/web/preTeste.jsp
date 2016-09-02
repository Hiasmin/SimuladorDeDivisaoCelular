<%@page import="dao.QuestaoFotoDAO"%>
<%@page import="modelo.QuestaoFoto"%>
<%@page import="dao.QuestaoObjetivaDAO"%>
<%@page import="modelo.QuestaoObjetiva"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Aluno"%>
<%
    Integer n = 1;
    //n++;
//quando clicar em responder mandar nova questão --- até o número da lista
//depois que conferiu a resposta -> CRIAR UMA QUESTÃO OBJETIVA ACERTO    OU     QUESTÃO FOTO ACERTO    

    Aluno aluno = new Aluno();
    if (session.getAttribute("Aluno") != null) {
        aluno = (Aluno) session.getAttribute("Aluno");
    } else {
        response.sendRedirect("index.jsp");
    }

    /*CRIAR UMA ORDEM: EXEMPLO -> 1 - OBJETIVA 
     2 - FOTO
     3 - OBJETIVA
            
     */
    List<QuestaoObjetiva> questoesObjetivas = new ArrayList<QuestaoObjetiva>();
    QuestaoObjetivaDAO qod = new QuestaoObjetivaDAO();
    questoesObjetivas = qod.listarTipo("pt");

    List<QuestaoFoto> questoesFotos = new ArrayList<QuestaoFoto>();
    QuestaoFotoDAO qfd = new QuestaoFotoDAO();
    questoesFotos = qfd.listarTipo("pt");

    String enunciadoFt = "", enunciadoObj = "",alternativaA = "", alternativaB = "", alternativaC = "", alternativaD = "", alternativaE = "";
    // as primeiras questão serão as da foto


%>   


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divisão Celular</title>
    </head>
    <body>
        <div style="text-align:center"><a href="divisaoCelular.jsp" target="_self">Divisão Celular</a></div> 
        <div style="text-align:right"><a href="glossario.jsp" target="_blank">Glossário</a></div> 
        <br/>
        <div style="text-align:right"><a href="biblioteca.jsp" target="_blank">Biblioteca</a></div>  
        <br/>
        <div style="text-align:right"><a href="minhaContaAlu.jsp" target="_self">Minha conta</a></div>  
        QUESTÃO <%=n%><br/>
        <%   
            //ver quantos tem e fazer cada um até o mais mais desse tamanho
            Boolean qFacabou = false;
            for (int x = 0; x < questoesFotos.size(); x++) {

                enunciadoFt = questoesFotos.get(x).getEnunciado();
                
                if(x==questoesFotos.size()){
                    qFacabou = true;
                }
            }
        %>
        <label><%=enunciadoObj%></label><br/><br/><br/>
        
        <%
            if(qFacabou==true){
                
            }
        %>
        <label><%=enunciadoObj%></label><br/><br/><br/>
        <input type="radio" name="resposta" value="a"/><label><%=alternativaA%></label><br/><br/>
        <input type="radio" name="resposta" value="b"/><label><%=alternativaB%></label><br/><br/>
        <input type="radio" name="resposta" value="c"/><label><%=alternativaC%></label><br/><br/>
        <input type="radio" name="resposta" value="d"/><label><%=alternativaD%></label><br/><br/>
        <input type="radio" name="resposta" value="e"/><label><%=alternativaE%></label><br/><br/>
        <%
        %>
        <input type="submit" value="Responder"/>
    </body>
</html>
