
package modelo;

public class Professor {

    private String login;
    private String senha;
    private String nome;
    private String formacao;
    private String email;
    private String MouD;

    public void setFormacao(String formacao) {
        this.formacao = formacao;
    }        

    public String getFormacao() {
        return formacao;
    }

    public String getMouD() {
        return MouD;
    }

    public void setMouD(String MouD) {
        this.MouD = MouD;
    }

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
 
}
