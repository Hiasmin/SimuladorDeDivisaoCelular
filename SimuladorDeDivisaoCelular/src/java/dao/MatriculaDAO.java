
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Matricula;

public class MatriculaDAO {   
    
    public Boolean inserirMat(Matricula m) {
        Boolean retorno = false;
        String sql = "INSERT INTO MATRICULA (loginAlu,idTurma) VALUES (?,?)";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {                  
            pst.setString(1, m.getAluno().getLogin());
            pst.setLong(2, m.getTurma().getId());            
            pst.executeUpdate();
            retorno = true;
        } catch (Exception ex) {
            ex.printStackTrace();
            retorno = false;
        }
        return retorno;
    }

    AlunoDAO aluDAO = new AlunoDAO();
    TurmaDAO ofeDAO = new TurmaDAO();
    
    public List<Matricula> listar() {
        List<Matricula> lista = new ArrayList<Matricula>();
        try {
            String sql = "select * from matricula";
            PreparedStatement pst = Conexao.getPreparedStatement(sql);
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Matricula mat = new Matricula();
                mat.setId(res.getLong("idMat"));
                mat.setAluno(aluDAO.findByLogin(res.getString("loginAlu")));
                mat.setTurma(ofeDAO.findById(res.getLong("idTurma")));
                lista.add(mat);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public Matricula findById(Long id) {
        Matricula mat = new Matricula();
        String sql = "select * from matricula where idMat = " + id + "";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            res.next();
                mat.setId(res.getLong("idMat"));
                mat.setAluno(aluDAO.findByLogin(res.getString("loginAlu")));
                mat.setTurma(ofeDAO.findById(res.getLong("idTurma")));
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return mat;
    }
    
    public Matricula atualizarTur(Matricula matricula) {        
        String sql = "UPDATE matricula SET idTurma = ? WHERE idMat = ?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setLong(1, matricula.getTurma().getId());
            pst.setLong(2, matricula.getId());
            pst.executeUpdate();           
        } catch (Exception ex) {
            ex.printStackTrace();     
            matricula = null;
        }
        return matricula;
    }
    
}
