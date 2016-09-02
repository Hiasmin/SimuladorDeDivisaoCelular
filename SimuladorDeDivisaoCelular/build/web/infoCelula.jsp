
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
            .fontes{text-align:justify;font-size:small;}
            .legenda{text-align:justify;font-size:medium;} 
     
        </style>
    </head>
    <body>
        informações de cada parte da célula
        
        <%
    Integer organela = 1;
      if(organela==1){
        %>
        <div class="titulo">Membrana plasmática:</div>
        <br/>
        <br/>
        <div class=subtitulo>O que é?</div>
        <br/>
        <div class="texto">Envoltório celular presente em todos os tipos de <a href="glossario.jsp" target="_blank">células</a></div>
        <br/>
        //ARRUMAR O PESQUISAR PARA PESQUISAR UMA PALAVRA QUE VAI SER MANDADA DAQUI COMO O NOME
        <br/>
        <div class=subtitulo>Do que é composta?</div> 
        <br/>
        <div class="texto">É formada por uma bicamada lipídica com <a href="glossario" target="_blank">proteínas</a> incrustadas. A bicamada lipídica é composta principalmente 
            por <a href="glossario" target="_blank">fosfolipídios</a>, sendo também encontrado o <a href="glossario" target="_blank">colesterol</a> nas células animais. Também estão presentes os glicídios
        ligados aos lipídios, formando os glicolipídios; ou às proteínas, constituindo as glicoproteínas.</div>
        <br/><br/>
        <div class=subtitulo>Para que serve?</div>
        <br/>
        <div class="texto">Delimita a célula do ambiente externo; mantém comunicação com as células adjacentes*;
        recebe os sinais provenientes do ambiente; atua como uma barreira seletivamente permeável, selecionando
        o que entra e sai da célula; suas proteínas podem se projetar para fora de seus limites, o que permite 
        a ligação e aderência a células adjacentes*.</div>
        <br/><br/>
        <div class="subtitulo">Fonte:</div>
        <br/>        
        <div class="fonte">SADAVA, D.; HELLER, H. C.; ORIANS, G. H.; PURVES, W. K.; HILLIS, D. M. Vida: 
         A Ciência da Biologia. Volume I: Célula e Hereditariedade. 8ª ed. Porto Alegre: Artmed, 
         2009.</div>
        <br/>
        <br/>
        <br/>
        <div class="fonte">AMABIS, J. M.; MARTHO, G. R. Biologia em contexto. Volume 1: Do universo às células
            vivas. 1ª ed. São Paulo: Ed. Moderna, 2013.</div>
        
        <div class="legenda">* Adjacente: colocado ou situado ao lado de; junto ou próximo (Disponível em: http://www.dicio.com.br/adjacente/. 
            Acesso em: 10 mai. 2016).</div>
        <%
      }
        %>
    </body>
</html>
