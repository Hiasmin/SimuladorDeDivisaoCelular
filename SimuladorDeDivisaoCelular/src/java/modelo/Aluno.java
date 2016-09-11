
package modelo;

public class Aluno {
    
    private String login;
    private String senha;
    private String nome;    
    private String email;
    private Integer acertosTotPt;
    private Integer acertosTotAt;
    private Integer acertosTotAt2;

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getAcertosTotPt() {
        return acertosTotPt;
    }

    public void setAcertosTotPt(Integer acertosTotPt) {
        this.acertosTotPt = acertosTotPt;
    }

    public Integer getAcertosTotAt() {
        return acertosTotAt;
    }

    public void setAcertosTotAt(Integer acertosTotAt) {
        this.acertosTotAt = acertosTotAt;
    }

    public Integer getAcertosTotAt2() {
        return acertosTotAt2;
    }

    public void setAcertosTotAt2(Integer acertosTotAt2) {
        this.acertosTotAt2 = acertosTotAt2;
    }

}
