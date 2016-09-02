package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.QuestaoFoto;

public class QuestaoFotoDAO {

    public List<QuestaoFoto> listar() {
        List<QuestaoFoto> lista = new ArrayList<QuestaoFoto>();
        String sql = "select * from questaoFoto";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                QuestaoFoto questao = new QuestaoFoto();
                questao.setId(res.getLong("idQuestFoto"));
                questao.setEnunciado(res.getString("enunciado"));
                questao.setImagem(res.getBytes("imagemDesenho"));
                questao.setCorrecao(res.getString("correcaoProf"));
                questao.setTipo(res.getString("tipoQuest"));
                lista.add(questao);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    
    public QuestaoFoto findById(Long id) {
        QuestaoFoto questao = new QuestaoFoto();
        String sql = "select * from questaoFoto where idQuestFoto = " + id + "";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            res.next();
                questao.setId(res.getLong("idQuestFoto"));
                questao.setEnunciado(res.getString("enunciado"));
                questao.setImagem(res.getBytes("imagemDesenho"));
                questao.setCorrecao(res.getString("correcaoProf"));          
                questao.setTipo(res.getString("tipoQuest"));
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return questao;
    }
    
    public List<QuestaoFoto> listarTipo(String tipo) {
        List<QuestaoFoto> lista = new ArrayList<QuestaoFoto>();
        String sql = "select * from questaoFoto where tipoQuest = '"+tipo+"'";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                QuestaoFoto questao = new QuestaoFoto();
                questao.setId(res.getLong("idQuestFoto"));
                questao.setEnunciado(res.getString("enunciadoquestfoto"));
                questao.setImagem(res.getBytes("imagemDesenho"));
                questao.setCorrecao(res.getString("correcaoProf"));     
                questao.setTipo(res.getString("tipoQuest"));
                lista.add(questao);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
}
