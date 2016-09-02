package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import java.util.ArrayList;
import java.util.ArrayList;
import dao.ProfessorDAO;
import modelo.Professor;
import dao.TurmaDAO;
import modelo.Turma;

public final class manterTurma_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");

    String periodo, msg = "";
    Boolean excluido = false;
    TurmaDAO tDAO = new TurmaDAO();

    Turma turma = new Turma();
    
    if (request.getParameter("excluirId") != null) {

        turma = (Turma) tDAO.findById(Long.parseLong(request.getParameter("excluirId").toString()));

        excluido = tDAO.excluir(turma);
        if (excluido == true) {
    
      out.write("\n");
      out.write("        <script>\n");
      out.write("            alert(\"Turma excluída com sucesso\");\n");
      out.write("        </script>\n");
      out.write("    ");

            response.sendRedirect("turmas.jsp");
            return;
        }

    }

    
    
    
    if (request.getParameter("idTurma") != null) {
        turma = (Turma) tDAO.findById(Long.parseLong(request.getParameter("idTurma").toString()));
    } else {
        response.sendRedirect("index.jsp");
    }

    periodo = turma.getPeriodo();

    if (request.getParameter("periodoTur") != null) {
        if (request.getParameter("periodoTur") == turma.getPeriodo()) {
            //habilitar botão somente quando tem algo diferente
        } else {
            turma.setPeriodo(request.getParameter("periodoTur"));
            turma = tDAO.atualizar(turma);
            periodo = turma.getPeriodo();
        }
    } else {
        msg = "Preencha todos os campos";
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Simulador de Divisão Celular</title>        \n");
      out.write("    </head>        \n");
      out.write("    <body>    \n");
      out.write("        <form name=\"formAlterarTurmas\" action=\"manterTurma.jsp\" method=\"post\">\n");
      out.write("            ");
      out.print(msg);
      out.write("<br/>\n");
      out.write("            <h2>Alterar turma</h2>   \n");
      out.write("            <input name=\"id\" type=\"text\" value=\"");
      out.print(turma.getId());
      out.write("\" readonly> \n");
      out.write("            <br/>\n");
      out.write("            Período:\n");
      out.write("            <input name=\"periodoTur\" type=\"text\" value=\"");
      out.print(periodo);
      out.write("\" maxlength=\"150\" size=\"50\"> \n");
      out.write("            <br/> \n");
      out.write("            <br/>                                      \n");
      out.write("            <input type=\"submit\" value=\"Alterar\">           \n");
      out.write("            <br/>            \n");
      out.write("            <br/>\n");
      out.write("        </form>\n");
      out.write("            <button><a href=\"manterTurma.jsp?excluirId=");
      out.print(turma.getId());
      out.write("\">Excluir</a></button>\n");
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
