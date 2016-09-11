
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Professor;
import modelo.Turma;

public class TurmaDAO {
    
    ProfessorDAO profDAO = new ProfessorDAO();
    
    public Turma findById(Long id) {
        Turma turma = new Turma();
        String sql = "select * from turma where idTurma = " + id + "";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            res.next();
                turma.setId(res.getLong("idTurma"));                
                turma.setProfessor(profDAO.findByLogin(res.getString("loginProf")));
                turma.setCurso(res.getString("cursoTur"));
                turma.setPeriodo(res.getString("periodoTur"));
                turma.setDisciplina(res.getString("disciplinaTur"));
                turma.setEscola(res.getString("escolaTur"));
                turma.setNivelEnsino(res.getString("nivelEnsinoTur"));
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return turma;
    }
    
    public Boolean inserir(Turma turma) {
        Boolean retorno = false;
        String sql = "insert into turma (loginProf,cursoTur,periodoTur,disciplinaTur,escolaTur,nivelEnsinoTur) values (?,?,?,?,?,?)";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {            
            
            pst.setString(1, turma.getProfessor().getLogin());
            pst.setString(2, turma.getCurso());
            pst.setString(3, turma.getPeriodo());
            pst.setString(4, turma.getDisciplina());
            pst.setString(5, turma.getEscola());
            pst.setString(6, turma.getNivelEnsino());
            
            pst.executeUpdate();
            retorno = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            retorno = false;
        }
        return retorno;
    }

    public List<Turma> listar() {
        List<Turma> lista = new ArrayList<Turma>();
        String sql = "select * from turma";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Turma turma = new Turma();
                turma.setId(res.getLong("idTurma"));               
                turma.setProfessor(profDAO.findByLogin(res.getString("loginProf")));
                turma.setCurso(res.getString("cursoTur"));
                turma.setPeriodo(res.getString("periodoTur"));
                turma.setDisciplina(res.getString("disciplinaTur"));
                turma.setEscola(res.getString("escolaTur"));
                turma.setNivelEnsino(res.getString("nivelEnsinoTur"));
                lista.add(turma);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    
    public List<Turma> listarProfX(Professor prof) {
        List<Turma> lista = new ArrayList<Turma>();
        String sql = "select * from turma where loginProf = ?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setString(1, prof.getLogin());
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Turma turma = new Turma();
                turma.setId(res.getLong("idTurma"));               
                turma.setProfessor(profDAO.findByLogin(res.getString("loginProf")));
                turma.setCurso(res.getString("cursoTur"));
                turma.setPeriodo(res.getString("periodoTur"));
                turma.setDisciplina(res.getString("disciplinaTur"));
                turma.setEscola(res.getString("escolaTur"));
                turma.setNivelEnsino(res.getString("nivelEnsinoTur"));
                lista.add(turma);
            }            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    
    public Turma atualizar(Turma turma) {        
        String sql = "UPDATE turma SET periodoTur = ? WHERE idTurma = ?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setString(1, turma.getPeriodo());
            pst.setLong(2, turma.getId());
            pst.executeUpdate();           
        } catch (Exception ex) {
            ex.printStackTrace();     
            turma = null;
        }
        return turma;
    }
    
      public Boolean excluir(Long id) {
        Boolean retorno;
        String sql = "DELETE FROM turma WHERE idTurma = "+id+"";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {            
            pst.executeUpdate();
            retorno = true;
        } catch (Exception ex) {
            ex.printStackTrace();
            retorno = false;
        }
        return retorno;
    }
      
       
    public List<Turma> listarTurmasProf(Professor prof) {
        List<Turma> lista = new ArrayList<Turma>();
        String sql = "select * from turma where loginProf = '"+prof.getLogin()+"'";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Turma turma = new Turma();
                turma.setId(res.getLong("idTurma"));               
                turma.setProfessor(prof);
                turma.setCurso(res.getString("cursoTur"));
                turma.setPeriodo(res.getString("periodoTur"));
                turma.setDisciplina(res.getString("disciplinaTur"));
                turma.setEscola(res.getString("escolaTur"));
                turma.setNivelEnsino(res.getString("nivelEnsinoTur"));
                lista.add(turma);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
}
