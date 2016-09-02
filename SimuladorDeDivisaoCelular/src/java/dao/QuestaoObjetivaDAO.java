package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.QuestaoObjetiva;

public class QuestaoObjetivaDAO {

    public List<QuestaoObjetiva> listar() {
        List<QuestaoObjetiva> lista = new ArrayList<QuestaoObjetiva>();
        String sql = "select * from questaoObjetiva";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                QuestaoObjetiva questao = new QuestaoObjetiva();
                questao.setId(res.getLong("idQuestObj"));
                questao.setEnunciado(res.getString("enunciado"));
                questao.setA(res.getString("a"));
                questao.setB(res.getString("b"));
                questao.setC(res.getString("c"));
                questao.setD(res.getString("d"));
                questao.setE(res.getString("e"));
                questao.setCerta(res.getString("certaQuest"));
                questao.setAjust(res.getString("ajust"));
                questao.setBjust(res.getString("bjust"));
                questao.setCjust(res.getString("cjust"));
                questao.setDjust(res.getString("djust"));
                questao.setEjust(res.getString("ejust"));
                questao.setTipo(res.getString("tipoQuest"));
                lista.add(questao);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    
    public List<QuestaoObjetiva> listarTipo(String tipo) {
        List<QuestaoObjetiva> lista = new ArrayList<QuestaoObjetiva>();
        String sql = "select * from questaoObjetiva where tipoQuest = '"+tipo+"'";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                QuestaoObjetiva questao = new QuestaoObjetiva();
                questao.setId(res.getLong("idQuestObj"));
                questao.setEnunciado(res.getString("enunciado"));
                questao.setA(res.getString("a"));
                questao.setB(res.getString("b"));
                questao.setC(res.getString("c"));
                questao.setD(res.getString("d"));
                questao.setE(res.getString("e"));
                questao.setCerta(res.getString("certaQuest"));
                questao.setAjust(res.getString("ajust"));
                questao.setBjust(res.getString("bjust"));
                questao.setCjust(res.getString("cjust"));
                questao.setDjust(res.getString("djust"));
                questao.setEjust(res.getString("ejust"));
                questao.setTipo(res.getString("tipoQuest"));
                lista.add(questao);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    
    public QuestaoObjetiva findById(Long id) {
        QuestaoObjetiva questao = new QuestaoObjetiva();
        String sql = "select * from questaoObjetiva where idQuestObj = " + id + "";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            res.next();
                questao.setId(res.getLong("idQuestObj"));
                questao.setEnunciado(res.getString("enunciado"));
                questao.setA(res.getString("a"));
                questao.setB(res.getString("b"));
                questao.setC(res.getString("c"));
                questao.setD(res.getString("d"));
                questao.setE(res.getString("e"));
                questao.setCerta(res.getString("certaQuest"));
                questao.setAjust(res.getString("ajust"));
                questao.setBjust(res.getString("bjust"));
                questao.setCjust(res.getString("cjust"));
                questao.setDjust(res.getString("djust"));
                questao.setEjust(res.getString("ejust"));
                questao.setTipo(res.getString("tipoQuest"));
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questao;
    }
}
