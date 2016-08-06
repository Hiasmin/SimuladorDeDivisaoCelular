
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Professor;

public class ProfessorDAO {    

    public Professor findByLogin(String login) {
        Professor professor = new Professor();
        String sql = "select * from professor where loginProf = '" + login + "'";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            res.next();
                professor.setLogin(res.getString("loginProf"));
                professor.setSenha(res.getString("senhaProf"));
                professor.setNome(res.getString("nomeProf"));             
                professor.setFormacao(res.getString("formacaoProf"));              
                professor.setEmail(res.getString("emailProf"));
                professor.setMouD(res.getString("MouDProf"));
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return professor;
    }
    
     public Boolean inserir(Professor professor) {
        Boolean retorno = false;
        String sql = "insert into professor (loginProf,senhaProf,nomeProf,emailProf,formacaoProf,MouDProf)" 
                + "values (?,?,?,?,?,?)";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setString(1, professor.getLogin());
            pst.setString(2, professor.getSenha());
            pst.setString(3, professor.getNome());           
            pst.setString(4, professor.getEmail());
            pst.setString(5, professor.getFormacao());
            pst.setString(6, professor.getMouD());
            pst.executeUpdate();
            retorno = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            retorno = false;
        }
        return retorno;
    }

    public List<Professor> listar() {
        List<Professor> lista = new ArrayList<Professor>();
        String sql = "select * from professor";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Professor professor = new Professor();
                professor.setLogin(res.getString("loginProf"));
                professor.setSenha(res.getString("senhaProf"));
                professor.setNome(res.getString("nomeProf"));                
                professor.setFormacao(res.getString("formacaoProf"));             
                professor.setEmail(res.getString("emailProf"));
                professor.setMouD(res.getString("MouDProf"));
                lista.add(professor);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public Professor login(Professor prof) {
        Professor professor = null;
        String sql = "select * from professor where loginProf = ? and senhaProf = ?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setString(1, prof.getLogin());
            pst.setString(2, prof.getSenha());
            ResultSet res = pst.executeQuery();
            if (res.next()) {
                professor = new Professor();
                professor.setLogin(res.getString("loginProf"));
                professor.setSenha(res.getString("senhaProf"));
                professor.setNome(res.getString("nomeProf"));               
                professor.setFormacao(res.getString("formacaoProf"));             
                professor.setEmail(res.getString("emailProf"));
                professor.setMouD(res.getString("MouDProf"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return professor;
    }        

}

