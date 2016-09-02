<%
    String foto1 = "", foto2 = "", foto3 = "", sim1 = "", sim2 = "",sim3 = "",sim4 = "",sim5 = "",sim6 = "",sim7 = "";
    String nc = request.getParameter("numCrom");
    if (nc == null) {
    } else {
        if (nc == "Selecione") {
        } else {
            if (nc.equals("2")) {      
                foto1 = "imagens/2-1.jpg";
                foto2 = "imagens/2-2.jpg";
                sim1 = "imagens/sim1-2.png";
                sim2 = "imagens/sim2-2.png";
                sim3 = "imagens/sim3-2.png";
                sim4 = "imagens/sim4-2.png";
                sim5 = "imagens/sim5-2.png";
                sim6 = "imagens/sim6-2.png";
                sim7 = "imagens/sim7-2.png";
            } else if(nc.equals("4")){
                foto1="imagens/4-1.jpg";
                foto2="imagens/4-2.jpg";
                foto3="imagens/4-3.jpeg";
            }else if(nc.equals("6")){
                foto1="imagens/6-1.jpg";
                foto2="imagens/6-2.jpg";
                foto3="imagens/6-3.jpg";
            }else if(nc.equals("8")){
                foto1="imagens/8-1.jpg";
                foto2="imagens/8-2.jpg";
            }else if(nc.equals("10")){
                foto1="imagens/10-1.jpg";
                foto2="imagens/10-2.jpg";
                foto3="imagens/10-3.jpg";
            }else if(nc.equals("20")){
                foto1="imagens/20-1.JPG";
                foto2="imagens/20-2.jpg";
                foto3="imagens/20-3.jpg";
            }else if(nc.equals("30")){
                foto1="imagens/30-1.jpg";
                foto2="imagens/30-2.JPG";
                foto3="imagens/30-3.jpg";
            }else if(nc.equals("40")){
                foto1="imagens/40-1.JPG";
                foto2="imagens/40-2.jpg";
                foto3="imagens/40-3.jpg";
            }else if(nc.equals("46")){
                foto1="imagens/46-1.jpg";
                foto2="imagens/46-2.jpg";
                foto3="imagens/46-3.jpg";
            }
        }
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Simulador de Divisão Celular</title>

        <style type="text/css">
            .fotos{width:500px}		
            .fontes{margin-right:410px;margin-left:410px;text-align:justify;font-size:small;}
            .legenda{margin-right:550px;margin-left:550px;text-align:justify;font-size:medium;} 
        </style>

    </head>
    <body>
        <div style="text-align:right"><a href="glossario.jsp" target="_blank">Glossário</a></div>    
        <br/>
        <div style="text-align:right"><a href="biblioteca.jsp" target="_blank">Biblioteca</a></div>  
        <div style="text-align:center;">
        <form name="formCro" action="simulador.jsp" method="post" >
            <h1><u>Simulador de divisão celular:</u></h1>            
            <h6 style="font-size:20px;"><u>Número de cromossomos: 2, 4, 6, 8, 10, 20, 30, 40 e 46.</u></h6>
            <div style="font-size:20px;">Selecione o número de cromossomos desejado e veja algumas espécies que o possuem:</div>
            <br/>
            <select name="numCrom">
                <option value="Selecione">Selecione</option>  
                <option value="2">2</option>
                <option value="4">4</option>
                <option value="6">6</option>
                <option value="8">8</option>
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="40">40</option>
                <option value="46">46</option>
            </select>
            <br/><br/>
            <input type="submit" value="Ver espécies">
            <br/><br/>        
        </form>
        <%  
    
    if (nc == null) {
    } else {
        if (nc == "Selecione") {
        } else {
            if (nc.equals("2")) {
                %>
                <h3>Algumas espécies com 2 cromossomos: </h3>
                <h4>Ácaro haploide <i>(Brevipalpus phoenicis)</i></h4>
                <img class="fotos" src="<%=foto1%>" >
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b> NOVELLI, V. M.; FREITAS-ASTÚA, J.; ARRIVABEM, F.; LOCALI, E. C.; HILF, M. E.; 
                    GOTTWALD, T. R.; MACHADO, M. A. O ácaro vetor da leprose dos citros e a interação com 
                    endossimbiontes. <i>Laranja</i>, Cordeirópolis, v. 26, n. 2, p. 273-289, 2005. 
                <br/>
                <b>Disponível em: </b> <a target="_blank" href="http://revistalaranja.centrodecitricultura.br/edicoes/8/13/v26%20n2%20art06%20O%20%E1caro.pdf">
                    < http://revistalaranja.centrodecitricultura.br/edicoes/8/13/v26%20n2%20art06%20O%20%E1caro.pdf ></a>.
                Acesso em: 24 fev. 2016. 
                <br/>
                <b>Fonte imagem: </b><a href="https://en.wikipedia.org/wiki/Brevipalpus_phoenicis" target="_blank">
                    < https://en.wikipedia.org/wiki/Brevipalpus_phoenicis ></a>. Acesso em: 06 mar. 2016.
                </div>
                <br/><br/>
                
                <h4>Formiga australiana (fêmea diploide - <i>Myrmecia pilosula)</i></h4>
                <img class="fotos" src="<%=foto2%>">
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>ROSLAND, M. W. J.; CROZIER, R. H. <i>Myrmecia pilosula</i>, an Ant with Only One Pair of Chromosomes. 
                    <i>Science</i>, v. 231, n. 4743, p. 1278, 1986.
                <b> Disponível em: </b> <a target="_blank" href="http://science.sciencemag.org/content/231/4743/1278">
                    < http://science.sciencemag.org/content/231/4743/1278 ></a>. Acesso em: 24 fev. 2016. 
                <br/>
                <b>Fonte imagem: </b><a href="http://topicstock.pantip.com/wahkor/topicstock/2009/04/X7709860/X7709860.html" target="_blank">
                    < http://topicstock.pantip.com/wahkor/topicstock/2009/04/X7709860/X7709860.html ></a>. Acesso em: 06 mar. 2016.
                </div>
                <br/><br/>
                
                <div style="text-align:center;">
                    <h3>SIMULADOR DE DIVISÃO CELULAR:</h3>
                    <img class="fotos" src="<%=sim1%>">
                    <div class="legenda">
                        Final da Intérfase e Início da Prófase
                    </div>
                    <br/><br/>
                    <img class="fotos" src="<%=sim2%>">
                    <div class="legenda">
                        Prófase
                    </div>
                    <br/><br/>
                    <img class="fotos" src="<%=sim3%>">
                    <div class="legenda">
                        Metáfase
                    </div>
                    <br/><br/>
                    <img class="fotos" src="<%=sim4%>">
                    <div class="legenda">
                        Anáfase
                    </div>
                    <br/><br/>
                    <img class="fotos" src="<%=sim5%>">
                    <div class="legenda">
                        Telófase
                    </div>
                    <br/><br/>
                    <img class="fotos" src="<%=sim6%>">
                    <div class="legenda">
                        Citocinese
                    </div>
                    <br/><br/>
                    <img class="fotos" src="<%=sim7%>">
                    <div class="legenda">
                        Final da Divisão Celular
                    </div>                    
                    <br/><br/>
                </div>
                
                
                <%
            } else if (nc.equals("4")){
                %>
                <h3>Algumas espécies com 4 cromossomos: </h3>
                <h4>Planta <i>(Haplopappus gracilis)</i> </h4>
                <img class="fotos" src="<%=foto1%>" >
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>TANAKA, R. A Comparative Karyotype Analysis in <i>Haplopappus gracilis</i> (2n=4) and H. ravenii (2n=8).  
                    <i>Cytologia</i>, v. 32, n. 3-4, p 542-552, 1967. 
                <b> Disponível em: </b> <a target="_blank" href="https://www.jstage.jst.go.jp/article/cytologia1929/32/3-4/32_3-4_542/_pdf">
                   < https://www.jstage.jst.go.jp/article/cytologia1929/32/3-4/32_3-4_542/_pdf ></a>. Acesso em: 24 fev. 2016.
                <br/>
                <b>Fonte imagem: </b><a href="https://www.flickr.com/photos/39039456@N07/17334384843" target="_blank">
                    < https://www.flickr.com/photos/39039456@N07/17334384843 ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Fungo <i>(Penicillium sp.)</i></h4>
                <img class="fotos" src="<%=foto2%>" >
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>FÄRBER, P, GEISEN, R. Karyotype of <i>Penicillium nalgiovense</i> and assignment of the penicillin biosynthetic 
                    genes to chromosome IV. <i>International Journal of Food Microbiology</i>, v. 58, n. 1?2, p. 59?63, 2000.
                <b> Disponível em: </b> <a target="_blank" href="http://www.sciencedirect.com/science/article/pii/S0168160500002798">
                   < http://www.sciencedirect.com/science/article/pii/S0168160500002798 ></a>. Acesso em: 24 fev. 2016.
                <br/>
                <b>Fonte imagem: </b><a href="https://de.wikipedia.org/wiki/Trichocomaceae" target="_blank">
                    < https://de.wikipedia.org/wiki/Trichocomaceae ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Verme do cavalo <i>(Ascaris megalocephala)</i></h4>
                <img class="fotos" src="<%=foto3%>" >
                
                <br/>
                <div class="fontes">
                    Disponível em: </b> <a target="_blank" href="http://www.cienciamao.usp.br/tudo/exibir.php?midia=3bsc&cod=_divisaocelularmitoseemei&action=print">
                   < http://www.cienciamao.usp.br/tudo/exibir.php?midia=3bsc&cod=_divisaocelularmitoseemei&action=print ></a>  Acesso em: 01 mar. 2016.
                <br/>
                <b>Fonte imagem: </b><a href="https://en.wikipedia.org/wiki/Ascaris" target="_blank">
                    < https://en.wikipedia.org/wiki/Ascaris ></a>. Acesso em: 06 mar. 2016.
                </div>
                               
                <%
            } else if (nc.equals("6")){
                %>
                <h3>Algumas espécies com 6 cromossomos: </h3>
                <h4>Pernilongo <i>(Culex pipiens)</i> </h4>
                <img class="fotos" src="<%=foto1%>" >
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>SADAVA, D.; HELLER, H. C.; DRIANS, G. H.; PURVES, W. K.; HILLIS, D. M. <i>Vida: 
                    A Ciência da Biologia</i>. Volume I: Célula e Hereditariedade. 8ª ed. Porto Alegre: Artmed, 2009. 461 p. 
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:CulexPipiensCloseup.jpg" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:CulexPipiensCloseup.jpg ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Mosquito transmissor da malária <i>(Anopheles gambiae)</i></h4>
                <img class="fotos" src="<%=foto2%>" >
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>CONSOLI, R. A. G. B; OLIVEIRA, R. L. de. Principais mosquitos de importância sanitária no Brasil. Rio de Janeiro: Editora FIOCRUZ, 1994, 228 p.
                <b> Disponível em: </b> <a target="_blank" href="http://www.sciencedirect.com/science/article/pii/S0168160500002798">
                   < http://www.sciencedirect.com/science/article/pii/S0168160500002798 ></a>. Acesso em: 24 fev. 2016.
                <br/>
                <b>Fonte imagem: </b><a href="http://static.scielo.org/scielobooks/th/pdf/consoli-9788575412909.pdf" target="_blank">
                    < http://static.scielo.org/scielobooks/th/pdf/consoli-9788575412909.pdf ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Mosquito transmissor da dengue <i>(Aedes aegypti)</i></h4>
                <img class="fotos" src="<%=foto3%>" >
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>CONSOLI, R. A. G. B; OLIVEIRA, R. L. de. Principais mosquitos de importância sanitária no Brasil. 
                    Rio de Janeiro: Editora FIOCRUZ, 1994, 228 p.
                <b> Disponível em: </b> <a target="_blank" href="http://static.scielo.org/scielobooks/th/pdf/consoli-9788575412909.pdf">
                   < http://static.scielo.org/scielobooks/th/pdf/consoli-9788575412909.pdf ></a>. Acesso em: 24 fev. 2016.
                <br/>
                <b>Fonte imagem: </b><a href="https://pt.wikipedia.org/wiki/V%C3%ADrus_Zika" target="_blank">
                    < https://pt.wikipedia.org/wiki/V%C3%ADrus_Zika ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <%
            }else if (nc.equals("8")){
                %>
                <h3>Algumas espécies com 8 cromossomos: </h3>
                <h4>Drosófila ou mosca da fruta <i>(Drosophila melanogaster)</i> </h4>
                <img class="fotos" src="<%=foto1%>" >
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>AMABIS, J. M.; MARTHO, G. R. <i>Biologia em contexto</i>: 1 do universo às células vivas. 1ª ed. São Paulo: Moderna, 2013. 360 p.
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:Drosophila_melanogaster_%E2%99%80_Melgen,_1830,_Drosera_capensis_Linnaeus,_1753_1100.1.2175.jpg" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:Drosophila_melanogaster_%E2%99%80_Melgen,_
                    1830,_Drosera_capensis_Linnaeus,_1753_1100.1.2175.jpg ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Levedura <i>(Candida albicans)</i></h4>
                <img class="fotos" src="<%=foto2%>" >
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>Nascimento, A. C. M. de O. B. Susceptibilidade antifúngica, produção de biofilme e caracterização do
                    gene ALS3 em isolados de <i>Candida albicans</i> e não-<i>albicans</i> do Hospital das Clínicas, UNESP, Botucatu. 2009. 54p. Dissertação 
                    (Mestrado em Biologia Geral e Aplicada) ? Instituto de Biociências, Universidade Estadual Paulista, São Paulo. 2009.
                <b> Disponível em: </b> <a target="_blank" href="http://www.ibb.unesp.br/posgrad/teses/bga_me_2009_ariane_nascimento.pdf">
                   < http://www.ibb.unesp.br/posgrad/teses/bga_me_2009_ariane_nascimento.pdf ></a>. Acesso em: 24 fev. 2016.
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:Candida_albicans_(248_35).jpg" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:Candida_albicans_(248_35).jpg ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Mosquito <i>(Chagasia bathana)</i> - Imagem ainda não encontrada</h4>
                <%
            }else if (nc.equals("10")){
                %>
                <h3>Algumas espécies com 10 cromossomos: </h3>
                <h4>Mostarda <i>(Arabidopsis thaliana)</i> </h4>
                <img class="fotos" src="<%=foto1%>" >
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>KLUG, W. S.; CUMMINGS, M. R.; SPENCER, C. A.; PALLADINO, M. A. <i>Conceitos de Genética</i>. 9ª ed. Porto Alegre: Artemed, 2010. p. 23.
                <b> Disponível em: </b> <a target="_blank" href="https://books.google.com.br/books?id=4LAp7ih7_rcC&pg=PA23&dq=musca+domestica+numero+de+cromossomos&hl=pt-BR&sa=X&ei=4ZsMVZzOJs2xsATO5IHwDg&ved=0CB0Q6AEwAA#v=onepage&q=musca%20domestica%20numero%20de%20cromossomos&f=false">
                   < https://books.google.com.br/books?id=4LAp7ih7_rcC&pg=PA23&dq=musca+domestica+
                   numero+de+cromossomos&hl=pt-BR&sa=X&ei=4ZsMVZzOJs2xsATO5IHwDg&ved=0CB0Q6AEwAA#v=
                   onepage&q=musca%20domestica%20numero%20de%20cromossomos&f=false ></a>. Acesso em: 01 mar. 2016.
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:Arabidopsis_thaliana_inflorescencias.jpg" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:Arabidopsis_thaliana_inflorescencias.jpg ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Canguru fêmea <i>(Wallabia bicolor)</i></h4>
                <img class="fotos" src="<%=foto2%>" >
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>METCALFE, CJ; ELDRIDGE, MD; JOHNSTON, PG. Mapping the distribution of the telomeric sequence
                    (T2AG3)n in the Macropodoidea (Marsupialia) by fluorescence in situ hybridization. I. The swamp wallaby, <i>Wallabia bicolor. 
                        Chromosome Research</i>, v. 6, n. 8, 603-610, 1998.               
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:Wallabia_bicolor_Jenolan_Caves.jpg" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:Wallabia_bicolor_Jenolan_Caves.jpg ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Protozoário <i>(Giardia lamblia)</i></h4>
                <img class="fotos" src="<%=foto3%>" >                
                
                <br/>
                <div class="fontes">
                    <b>Fonte texto: </b>MADIGAN, M. T.; MARTINKO, J. M.; DUNLAP, P. V.; CLARK, D. P. <i>Microbiologia de Brock</i>. 12ª ed. Porto Alegre: Artmed, 2010. p. 353.              
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:Giardia_lamblia_cytology.jpg" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:Giardia_lamblia_cytology.jpg ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <%
            }else if (nc.equals("20")){
                %>
                <h3>Algumas espécies com 20 cromossomos: </h3>
                <h4>Milho <i>(Zea mays)</i> </h4>
                <img class="fotos" src="<%=foto1%>" >                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>AMABIS, J. M.; MARTHO, G. R. <i>Biologia em 
                contexto</i>: 1 do universo às células vivas. 1ª ed. São Paulo: Moderna, 2013. 360 p.
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/Zea_mays" target="_blank">
                    < https://commons.wikimedia.org/wiki/Zea_mays ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Camundongo <i>(Mus musculus)</i></h4>
                <img class="fotos" src="<%=foto2%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>YANO, C. Pesquisa facilitada: Chineses
                descobrem técnica mais eficiente para produzir camundongos de 
                laboratório geneticamente modificados. O método, que usa uma 
                célula-tronco embrionária em vez de um espermatozoide para
                fertilizar o óvulo, vai facilitar o estudo de várias doenças.
                <b> Disponível em: </b> <a target="_blank" href="http://cienciahoje.uol.com.br/noticias/2012/04/pesquisa-facilitada">
                   < http://cienciahoje.uol.com.br/noticias/2012/04/pesquisa-facilitada ></a>. Acesso em: 01 mar. 2016. 
                <br/>
                <b>Fonte imagem: </b><a href="https://en.wikipedia.org/wiki/Mouse" target="_blank">
                    < https://en.wikipedia.org/wiki/Mouse ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Cacau <i>(Theobroma cacao)</i></h4>
                <img class="fotos" src="<%=foto3%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>PAVESE, F.; KARSBURG, I. V. Caracterização 
                morfométrica dos cromossomos de quatro espécies do gênero <i>Theobroma</i> L. 
                In: 2ª Jornada Científica da Unemat, 2009. Barra dos Bugres. <i>Anais</i>...
                Barra dos Bugres, 2009.                 
                <br/>
                <b>Fonte imagem: </b><a href="https://en.wikipedia.org/wiki/Theobroma_cacao" target="_blank">
                    < https://en.wikipedia.org/wiki/Theobroma_cacao ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <%
            }else if (nc.equals("30")){
                %>
                <h3>Algumas espécies com 30 cromossomos: </h3>
                <h4>Perereca <i>(Dendropsophus sanborni)</i> </h4>
                <img class="fotos" src="<%=foto1%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>MEDEIROS, L. R. Citogenética de Dendropsophus 
                (Anura, Hylidae) : caracterizações e comparações cromossômicas entre 
                espécies relacionadas. 2005. 102 f. Tese (Doutorado em Biologia Celular
                e Estrutural) ? Instituto de Biologia, Universidade Estadual de São Paulo, São Paulo. 2005. 
                <b> Disponível em: </b> <a target="_blank" href="http://www.bibliotecadigital.unicamp.br/document/?code=vtls000374916&fd=y">
                   < http://www.bibliotecadigital.unicamp.br/document/?code=vtls000374916&fd=y ></a>. Acesso em: 01 mar. 2016. 
                <br/>
                <b>Fonte imagem: </b><a href="https://ca.wikipedia.org/wiki/Dendropsophus" target="_blank">
                    < https://ca.wikipedia.org/wiki/Dendropsophus ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Linhaça <i>(Linum usitatissimum)</i></h4>
                <img class="fotos" src="<%=foto2%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>SAMADI, A.; MAHMODZADEH, A.; GORTTAPEH, 
                A. H.; TORKAMANI, M. R. Cytogenetic Studies in Four Species of 
                Flax (<i>Linum</i> spp.). <i>Journal of Applied Sciences</i>, v. 7, n. 19, p.2832-2839, 2007. 
                <b> Disponível em: </b> <a target="_blank" href="http://scialert.net/fulltext/?doi=jas.2007.2832.2839&org=11">
                   < http://scialert.net/fulltext/?doi=jas.2007.2832.2839&org=11 ></a>. cesso em: 01 mar. 2016. 
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:Linum_usitatissimum_003.JPG" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:Linum_usitatissimum_003.JPG ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Girafa <i>(Giraffa camelopardalis)</i></h4>
                <img class="fotos" src="<%=foto3%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>?Kingdon, J.; Happold, D.; Butynski, T.; Hoffmann, M.; Happold, M.; Kalina, Jan. 
                <i>Mammals of Africa</i>. Volume I: Introductory Chapters and Afrotheria. Published by London, New Delhi,
                New York, Sydney: Bloomsbury, 2013. 352 p. 

                <b> Disponível em: </b> <a target="_blank" href="https://books.google.com.br/books?id=B_07noCPc4kC&pg=RA5-PA98&lpg=RA5-PA98&dq=giraffa+camelopardalis+tippelskirchi+number+chromosome&source=bl&ots=u2a6SJ_5eF&sig=vNVeAyno3pLMkBqQU9JX0Sm_rDE&hl=pt-BR&sa=X&ved=0ahUKEwj50L3w0qDLAhVKl5AKHVvnA6MQ6AEIHDAA#v=onepage&q=giraffa%20camelopardalis%20tippelskirchi%20number%20chromosome&f=false">
                   < https://books.google.com.br/books?id=B_07noCPc4kC&pg=RA5-PA98&lpg=RA5-PA98&dq=giraffa+camelopardalis+tippelskirchi+number+chromosome&source=bl&ots=u2a6SJ_5eF&sig=vNVeAyno3pLMkBqQU9JX0Sm_rDE&hl=pt-BR&sa=X&ved=0ahUKEwj50L3w0qDLAhVKl5AKHVvnA6MQ6AEIHDAA#v=onepage&q=giraffa%20camelopardalis%20tippelskirchi%20number%20chromosome&f=false ></a>. Acesso em: 02 mar. 2016. 
                <br/>
                <b>Fonte imagem: </b><a href="https://www.flickr.com/photos/berniedup/7068054987" target="_blank">
                    < https://www.flickr.com/photos/berniedup/7068054987 ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <%
            }else if (nc.equals("40")){
                %>
                <h3>Algumas espécies com 40 cromossomos: </h3>
                <h4>Soja <i>(Glycine max)</i> </h4>
                <img class="fotos" src="<%=foto1%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>AMABIS, J. M.; MARTHO, G. R. <i>Biologia em contexto</i>:
                1 do universo às células vivas. 1ª ed. São Paulo: Moderna, 2013. 360 p.                
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:Glycine_max-jd_plt_P1160032.JPG" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:Glycine_max-jd_plt_P1160032.JPG ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Cobra coral <i>(Micrurus corallinus)</i></h4>
                <img class="fotos" src="<%=foto2%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>SERAFIM, H.; PECCININI-SEALE, D. M.; BATISTIC, 
                R. F. Estudo cariotípico de duas espécies brasileiras do gênero <i>Micrurus</i>
                (Ophidia: Elapidae). <i>Biota Neotrópica</i>, v. 7, n. 1, p. 75-80, 2007.
                <b> Disponível em: </b> <a target="_blank" href="http://www.scielo.br/pdf/bn/v7n1/09.pdf">
                   < http://www.scielo.br/pdf/bn/v7n1/09.pdf ></a>. Acesso em: 01 mar. 2016. 
                <br/>
                <b>Fonte imagem: </b><a href="https://en.wikipedia.org/wiki/Coral_snake" target="_blank">
                    < https://en.wikipedia.org/wiki/Coral_snake ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Manga <i>(Mangifera indica)</i></h4>
                <img class="fotos" src="<%=foto3%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>PIEROZZII, N. I.; ROSSETTO, C. J. Caracterização 
                cromossômica de duas variedades de manga. <I>Revista Brasileira de Fruticultura</i>,
                Jaboticabal, v. E, p. 546-551, 2001.
                <b> Disponível em: </b> <a target="_blank" href="http://www.scielo.br/scielo.php?script=sci_arttext&pid=S0100-29452011000500074">
                   < http://www.scielo.br/scielo.php?script=sci_arttext&pid=S0100-29452011000500074 ></a>. Acesso em: 01 mar. 2016. 
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:Starr_071024-0216_Mangifera_indica.jpg" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:Starr_071024-0216_Mangifera_indica.jpg ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <%
            }else if (nc.equals("46")){
                %>
                <h3>Algumas espécies com 46 cromossomos: </h3>
                <h4>Humanos <i>(Homo sapiens)</i> </h4>
                <img class="fotos" src="<%=foto1%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>AMABIS, J. M.; MARTHO, G. R. <i>Biologia 
                em contexto</i>: 1 do universo às células vivas. 1ª ed. São Paulo: Moderna, 2013. 360 p.                
                <br/>
                <b>Fonte imagem: </b><a href="https://www.flickr.com/photos/93963757@N05/8551937456" target="_blank">
                    < https://www.flickr.com/photos/93963757@N05/8551937456 ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Cervo indiano <i>(Muntiacus reevesi)</i></h4>
                <img class="fotos" src="<%=foto2%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>Wurster, D. H.; Benirschke, K. Indian muntjac, 
                <i>Muntiacus muntjak</i>: a deer with a low diploid chromosome number. <i>Science</i>,
                v. 168, n. 3937, p. 1364-1366,1970.
                <b> Disponível em: </b> <a target="_blank" href="http://www.ncbi.nlm.nih.gov/pubmed/5444269">
                   < http://www.ncbi.nlm.nih.gov/pubmed/5444269 ></a>. Acesso em: 01 mar. 2016. 
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:Muntiacus_reevesi_Zoo_Praha_2011-4.jpg" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:Muntiacus_reevesi_Zoo_Praha_2011-4.jpg ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <br/><br/>
                <h4>Morcego-de-peluche <i>(Miniopterus schreibersii)</i></h4>
                <img class="fotos" src="<%=foto3%>" >
                
                <br/>
                <div class="fontes">
                <b>Fonte texto: </b>?	Karata?a, A.; Sözenb, M. Contribution to
                karyology, distribution and taxonomic status of the Long-winged Bat, 
                <i>Miniopterus schreibersii</i> (Chiroptera: Vespertilionidae), in Turkey. 
                <i>Chiroptera</i>, p. 51-65, 2013.
                <b> Disponível em: </b> <a target="_blank" href="http://www.tandfonline.com/doi/pdf/10.1080/09397140.2004.10638063">
                   < http://www.tandfonline.com/doi/pdf/10.1080/09397140.2004.10638063 ></a>. Acesso em: 01 mar. 2016. 
                <br/>
                <b>Fonte imagem: </b><a href="https://commons.wikimedia.org/wiki/File:Miniopterus_scheibersii_01-cropped.jpg" target="_blank">
                    < https://commons.wikimedia.org/wiki/File:Miniopterus_scheibersii_01-cropped.jpg ></a>. Acesso em: 06 mar. 2016.
                </div>
                
                <%
            }
        }
    }
    %>
        </div>
    </body>
</html>
