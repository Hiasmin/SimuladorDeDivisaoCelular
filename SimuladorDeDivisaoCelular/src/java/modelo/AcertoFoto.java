package modelo;

import java.sql.Date;

public class AcertoFoto {
    private Long id;
    private Aluno aluno;
    private QuestaoFoto questao;
    private Boolean acertou;
    private Date dataHora;

    public QuestaoFoto getQuestao() {
        return questao;
    }

    public void setQuestao(QuestaoFoto questao) {
        this.questao = questao;
    }

    public Date getDataHora() {
        return dataHora;
    }

    public void setDataHora(Date dataHora) {
        this.dataHora = dataHora;
    }        

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public Boolean getAcertou() {
        return acertou;
    }

    public void setAcertou(Boolean acertou) {
        this.acertou = acertou;
    }
        
}
