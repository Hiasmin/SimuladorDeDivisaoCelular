package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Glossario;
import java.util.List;
import java.util.List;
import java.util.ArrayList;
import java.util.ArrayList;
import dao.GlossarioDAO;

public final class glossario_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Simulador de Divisão Celular</title>\n");
      out.write("        <style>\n");
      out.write("            .texto{margin-right:200px;                \n");
      out.write("                   margin-left:200px;\n");
      out.write("                   font-size:17px;\n");
      out.write("                   //font-family:Arial;\n");
      out.write("                   text-align:justify;\n");
      out.write("            }\n");
      out.write("            .titulo{                \n");
      out.write("                font-size:30px;                \n");
      out.write("                //font-family:Arial;\n");
      out.write("                text-align:center; \n");
      out.write("            }\n");
      out.write("            .subtitulo{\n");
      out.write("                font-size:20px;\n");
      out.write("                text-align:center;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"titulo\" style=\"color:red\">\n");
      out.write("            <u><b>GLOSSÁRIO:</b></u>\n");
      out.write("        </div>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        ");

            Boolean some = false;
        
      out.write("\n");
      out.write("        <form name=\"formPesquisa\" action=\"glossario.jsp\" method=\"post\">\n");
      out.write("        <div class=\"subtitulo\"><u><b>Pesquisar:</b></u></div>\n");
      out.write("        <br/>\n");
      out.write("        <div style=\"text-align:center\">\n");
      out.write("        <input width=\"200px\" height=\"800px\" type=\"text\" name=\"pesquisa\" maxlenght=\"200\" \n");
      out.write("               placeholder=\"insira aqui a palavra a ser pesquisada\" size=\"50\"> \n");
      out.write("        <input type=\"submit\" value=\"Pesquisar\">\n");
      out.write("        ");

            //APARECE A PESQUISA
            GlossarioDAO gd = new GlossarioDAO();
            List<Glossario> pesquisa = new ArrayList<Glossario>();            
            pesquisa = gd.pesquisar(request.getParameter("pesquisa"));
            for (int y = 0; y < pesquisa.size(); y++) {
            String p = pesquisa.get(y).getPalavra();
            String s = pesquisa.get(y).getSignificado();
        
      out.write("        \n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <div class=\"subtitulo\"><u><b>");
      out.print(p);
      out.write(":</b></u></div>\n");
      out.write("        <br/>\n");
      out.write("        <div class=\"texto\">");
      out.print(s);
      out.write("</div>\n");
      out.write("        <br/>        \n");
      out.write("        ");

            some = true;
            }
        
      out.write("\n");
      out.write("        \n");
      out.write("        </div>\n");
      out.write("        </form>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("\n");
      out.write("        ");

            if(some==true){
                
            } else if(some==false){            
            
            //APARECE TODOS QUE EU TENHO
            gd = new GlossarioDAO();
            List<Glossario> palavras = new ArrayList<Glossario>();
            palavras = gd.listar();

            for (int x = 0; x < palavras.size(); x++) {
            String p = palavras.get(x).getPalavra();
            String s = palavras.get(x).getSignificado();
        
      out.write("\n");
      out.write("        <div class=\"subtitulo\"><u><b>");
      out.print(p);
      out.write(":</b></u></div>\n");
      out.write("        <br/>\n");
      out.write("        <div class=\"texto\">");
      out.print(s);
      out.write("</div>\n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        ");

            }
        
      out.write("        \n");
      out.write("        <br/>\n");
      out.write("        <br/>\n");
      out.write("        <div class=\"subtitulo\"><u><b>Fontes:</b></u></div>\n");
      out.write("        <br/>\n");
      out.write("        <div class=\"texto\">\n");
      out.write("            AMABIS, JOSÉ MARIANO; MARTHO, GILBERTO RODRIGUES. <b>Fundamentos da Biologia Moderna</b>. 4ª ed. São Paulo: Editora Moderna, 839 p., 2006.\n");
      out.write("            <br/>\n");
      out.write("            <br/>\n");
      out.write("            ** AMABIS, JOSÉ MARIANO; MARTHO, GILBERTO RODRIGUES. <b>Biologia em contexto: 1 do universo às células vivas</b>. São Paulo: Editora Moderna, 360 p., 2013.\n");
      out.write("            <br/>\n");
      out.write("            <br/>\n");
      out.write("            * MADIGAN, MICHAEL T.; MARTINKO, JOHN M.; DUNLAP, PAUL V.; CLARK, DAVID P. <b>Microbiologia de Brock</b>. Porto Alegre: Artmed, 1128 p., 2010.       \t\n");
      out.write("        </div>\n");
      out.write("        ");

            }
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
