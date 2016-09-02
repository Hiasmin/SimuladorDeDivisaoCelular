<%@page import="modelo.Glossario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GlossarioDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divisão Celular</title>
        <style>
            .texto{margin-right:200px;                
                   margin-left:200px;
                   font-size:17px;
                   //font-family:Arial;
                   text-align:justify;
            }
            .titulo{                
                font-size:30px;                
                //font-family:Arial;
                text-align:center; 
            }
            .subtitulo{
                font-size:20px;
                text-align:center;
            }
        </style>
    </head>
    <body>
        <div class="titulo" style="color:red">
            <u><b>GLOSSÁRIO:</b></u>
        </div>
        <br/>
        <br/>
        <%
            Boolean some = false;
        %>
        <form name="formPesquisa" action="glossario.jsp" method="post">
        <div class="subtitulo"><u><b>Pesquisar:</b></u></div>
        <br/>
        <div style="text-align:center">
        <input width="200px" height="800px" type="text" name="pesquisa" maxlenght="200" 
               placeholder="insira aqui a palavra a ser pesquisada" size="50"> 
        <input type="submit" value="Pesquisar">
        <%
            //APARECE A PESQUISA
            GlossarioDAO gd = new GlossarioDAO();
            List<Glossario> pesquisa = new ArrayList<Glossario>();            
            pesquisa = gd.pesquisar(request.getParameter("pesquisa"));
            for (int y = 0; y < pesquisa.size(); y++) {
            String p = pesquisa.get(y).getPalavra();
            String s = pesquisa.get(y).getSignificado();
        %>        
        <br/>
        <br/>
        <div class="subtitulo"><u><b><%=p%>:</b></u></div>
        <br/>
        <div class="texto"><%=s%></div>
        <br/>        
        <%
            some = true;
            }
        %>
        
        </div>
        </form>
        <br/>
        <br/>
        <br/>
        <br/>

        <%
            if(some==true){
                
            } else if(some==false){            
            
            //APARECE TODOS QUE EU TENHO
            gd = new GlossarioDAO();
            List<Glossario> palavras = new ArrayList<Glossario>();
            palavras = gd.listar();

            for (int x = 0; x < palavras.size(); x++) {
            String p = palavras.get(x).getPalavra();
            String s = palavras.get(x).getSignificado();
        %>
        <div class="subtitulo"><u><b><%=p%>:</b></u></div>
        <br/>
        <div class="texto"><%=s%></div>
        <br/>
        <br/>
        <%
            }
        %>        
        <br/>
        <br/>
        <div class="subtitulo"><u><b>Fontes:</b></u></div>
        <br/>
        <div class="texto">
            AMABIS, JOSÉ MARIANO; MARTHO, GILBERTO RODRIGUES. <b>Fundamentos da Biologia Moderna</b>. 4ª ed. São Paulo: Editora Moderna, 839 p., 2006.
            <br/>
            <br/>
            ** AMABIS, JOSÉ MARIANO; MARTHO, GILBERTO RODRIGUES. <b>Biologia em contexto: 1 do universo às células vivas</b>. São Paulo: Editora Moderna, 360 p., 2013.
            <br/>
            <br/>
            * MADIGAN, MICHAEL T.; MARTINKO, JOHN M.; DUNLAP, PAUL V.; CLARK, DAVID P. <b>Microbiologia de Brock</b>. Porto Alegre: Artmed, 1128 p., 2010.       	
        </div>
        <%
            }
        %>
    </body>
</html>
