package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Questao;

public class QuestaoDAO {

    public List<Questao> listar() {
        List<Questao> lista = new ArrayList<Questao>();
        String sql = "select * from questao";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Questao questao = new Questao();
                questao.setId(res.getLong("idQuest"));
                questao.setEnunciado(res.getString("enunciadoQuest"));
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
    
    public List<Questao> listarTipo(String tipo) {
        List<Questao> lista = new ArrayList<Questao>();
        String sql = "select * from questao where tipoQuest = '"+tipo+"'";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Questao questao = new Questao();
                questao.setId(res.getLong("idQuest"));
                questao.setEnunciado(res.getString("enunciadoQuest"));
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
    
    public Questao findById(Long id) {
        Questao questao = new Questao();
        String sql = "select * from oferta where idQuest = " + id + "";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            res.next();
                questao.setId(res.getLong("idQuest"));
                questao.setEnunciado(res.getString("enunciadoQuest"));
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
