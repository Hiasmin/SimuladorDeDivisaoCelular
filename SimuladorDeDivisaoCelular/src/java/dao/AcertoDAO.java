
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Acerto;

public class AcertoDAO {
    //UPDATE NO ALUNO PRA ADD OS ACERTOS...
    public Boolean inserir(Acerto a) {
        Boolean retorno = false;
        String sql = "insert into acerto (loginAlu,idQuest,acertouAcer,dataHora) values (?,?,?,?)";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setString(1, a.getAluno().getLogin());
            pst.setLong(2, a.getQuestao().getId());
            pst.setBoolean(3, a.getAcertou());
            pst.setDate(4, a.getDataHora());
            pst.executeUpdate();
            retorno = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            retorno = false;
        }
        return retorno;
    }

    AlunoDAO ad = new AlunoDAO();
    QuestaoDAO qd = new QuestaoDAO();
    
    public List<Acerto> listar() {
        List<Acerto> lista = new ArrayList<Acerto>();
        String sql = "select * from acerto";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Acerto a = new Acerto();
                a.setId(res.getLong("idAcer"));
                a.setAluno(ad.findByLogin(res.getString("loginAlu")));
                a.setQuestao(qd.findById(res.getLong("idQuest")));
                a.setAcertou(res.getBoolean("acertouAcer"));
                a.setDataHora(res.getDate("dataHora"));
                lista.add(a);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
}
