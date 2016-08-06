package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Glossario;

public class GlossarioDAO {

    public List<Glossario> listar() {
        List<Glossario> lista = new ArrayList<Glossario>();
        String sql = "select * from glossario order by palavraGlos";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();
            while (res.next()) {
                Glossario glo = new Glossario();
                glo.setId(res.getLong("idGlos"));
                glo.setPalavra(res.getString("palavraGlos"));
                glo.setSignificado(res.getString("significadoGlos"));
                lista.add(glo);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    public List<Glossario> pesquisar(String pesquisa) {
        List<Glossario> lista = new ArrayList<Glossario>();
        String sql = "select * from glossario where palavraGlos ilike '%" + pesquisa + "%' order by palavraGlos";
        PreparedStatement pst = Conexao.getPreparedStatement(sql);
        try {
            ResultSet res = pst.executeQuery();

            while (res.next()) {
                Glossario glo = new Glossario();
                glo.setId(res.getLong("idGlos"));
                glo.setPalavra(res.getString("palavraGlos"));
                glo.setSignificado(res.getString("significadoGlos"));
                lista.add(glo);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
}
