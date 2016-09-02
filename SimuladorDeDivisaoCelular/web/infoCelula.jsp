
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divis�o Celular</title>
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
        informa��es de cada parte da c�lula
        
        <%
    Integer organela = 1;
      if(organela==1){
        %>
        <div class="titulo">Membrana plasm�tica:</div>
        <br/>
        <br/>
        <div class=subtitulo>O que �?</div>
        <br/>
        <div class="texto">Envolt�rio celular presente em todos os tipos de <a href="glossario.jsp" target="_blank">c�lulas</a></div>
        <br/>
        //ARRUMAR O PESQUISAR PARA PESQUISAR UMA PALAVRA QUE VAI SER MANDADA DAQUI COMO O NOME
        <br/>
        <div class=subtitulo>Do que � composta?</div> 
        <br/>
        <div class="texto">� formada por uma bicamada lip�dica com <a href="glossario" target="_blank">prote�nas</a> incrustadas. A bicamada lip�dica � composta principalmente 
            por <a href="glossario" target="_blank">fosfolip�dios</a>, sendo tamb�m encontrado o <a href="glossario" target="_blank">colesterol</a> nas c�lulas animais. Tamb�m est�o presentes os glic�dios
        ligados aos lip�dios, formando os glicolip�dios; ou �s prote�nas, constituindo as glicoprote�nas.</div>
        <br/><br/>
        <div class=subtitulo>Para que serve?</div>
        <br/>
        <div class="texto">Delimita a c�lula do ambiente externo; mant�m comunica��o com as c�lulas adjacentes*;
        recebe os sinais provenientes do ambiente; atua como uma barreira seletivamente perme�vel, selecionando
        o que entra e sai da c�lula; suas prote�nas podem se projetar para fora de seus limites, o que permite 
        a liga��o e ader�ncia a c�lulas adjacentes*.</div>
        <br/><br/>
        <div class="subtitulo">Fonte:</div>
        <br/>        
        <div class="fonte">SADAVA, D.; HELLER, H. C.; ORIANS, G. H.; PURVES, W. K.; HILLIS, D. M. Vida: 
         A Ci�ncia da Biologia. Volume I: C�lula e Hereditariedade. 8� ed. Porto Alegre: Artmed, 
         2009.</div>
        <br/>
        <br/>
        <br/>
        <div class="fonte">AMABIS, J. M.; MARTHO, G. R. Biologia em contexto. Volume 1: Do universo �s c�lulas
            vivas. 1� ed. S�o Paulo: Ed. Moderna, 2013.</div>
        
        <div class="legenda">* Adjacente: colocado ou situado ao lado de; junto ou pr�ximo (Dispon�vel em: http://www.dicio.com.br/adjacente/. 
            Acesso em: 10 mai. 2016).</div>
        <%
      }
        %>
    </body>
</html>
