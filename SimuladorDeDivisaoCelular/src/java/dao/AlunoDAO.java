package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Aluno;

public class AlunoDAO {

    public Aluno findByLogin(String login) {
        Aluno aluno = new Aluno();
        String sql = "select * from aluno where loginAlu = '" + login + "'";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            res.next();
            aluno.setLogin(res.getString("loginAlu"));
            aluno.setSenha(res.getString("senhaAlu"));
            aluno.setNome(res.getString("nomeAlu"));
            aluno.setEmail(res.getString("emailAlu"));
            aluno.setAcertosTotPt(res.getInt("acertostotpt"));
            aluno.setAcertosTotAt(res.getInt("acertostotat"));
            aluno.setAcertosTotAt2(res.getInt("acertostotAt2"));
        } catch (SQLException ex) {
            Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return aluno;
    }

    public Boolean inserir(Aluno aluno) {
        Boolean retorno = false;
        String sql = "insert into aluno (loginAlu,senhaAlu,nomeAlu,emailAlu) values (?,?,?,?)";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setString(1, aluno.getLogin());
            pst.setString(2, aluno.getSenha());
            pst.setString(3, aluno.getNome());           
            pst.setString(4, aluno.getEmail());
            pst.executeUpdate();
            retorno = true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            retorno = false;
        }
        return retorno;
    }

    public List<Aluno> listar() {
        List<Aluno> lista = new ArrayList<Aluno>();
        String sql = "select * from aluno";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Aluno aluno = new Aluno();
                aluno.setLogin(res.getString("loginAlu"));
                aluno.setSenha(res.getString("senhaAlu"));
                aluno.setNome(res.getString("nomeAlu"));    
                aluno.setEmail(res.getString("emailAlu"));
                aluno.setAcertosTotPt(res.getInt("acertosTotPt"));
                aluno.setAcertosTotAt(res.getInt("acertosTotAt"));
                aluno.setAcertosTotAt2(res.getInt("acertosTotAt2"));
                lista.add(aluno);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public Aluno login(Aluno alu) {
        Aluno aluno = null;
        String sql = "select * from aluno where loginAlu = ? and senhaAlu = ?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setString(1, alu.getLogin());
            pst.setString(2, alu.getSenha());
            ResultSet res = pst.executeQuery();
            if (res.next()) {
                aluno = new Aluno();
                aluno.setLogin(res.getString("loginAlu"));
                aluno.setSenha(res.getString("senhaAlu"));
                aluno.setNome(res.getString("nomeAlu"));
                aluno.setEmail(res.getString("emailAlu"));
                aluno.setAcertosTotPt(res.getInt("acertosTotPt"));
                aluno.setAcertosTotAt(res.getInt("acertosTotAt"));
                aluno.setAcertosTotAt2(res.getInt("acertosTotAt2"));
            }
        } catch (Exception e) {
        }
        return aluno;
    }
    
    public Aluno atualizar(Aluno aluno) {  
        String sql = "UPDATE aluno SET nomeAlu = ?, senhaAlu = ?, emailAlu = ? WHERE loginAlu = ?";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            pst.setString(1, aluno.getNome());
            pst.setString(2, aluno.getSenha());
            pst.setString(3, aluno.getEmail());
            pst.setString(4, aluno.getLogin());
            
            pst.executeUpdate();
                       
        } catch (Exception ex) {
            ex.printStackTrace();
           aluno = null;
        }
        return aluno;
    }
    
    public Boolean excluir(String login) {
        Boolean retorno;
        String sql = "DELETE FROM aluno WHERE loginAlu = '"+login+"'";
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
}
