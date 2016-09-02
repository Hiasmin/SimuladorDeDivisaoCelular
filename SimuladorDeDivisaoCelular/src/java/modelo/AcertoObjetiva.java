package modelo;

import java.sql.Date;

public class AcertoObjetiva {
    private Long id;
    private Aluno aluno;
    private QuestaoObjetiva questao;
    private Boolean acertou;
    private Date dataHora;

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

    public QuestaoObjetiva getQuestao() {
        return questao;
    }

    public void setQuestao(QuestaoObjetiva questao) {
        this.questao = questao;
    }

    public Boolean getAcertou() {
        return acertou;
    }

    public void setAcertou(Boolean acertou) {
        this.acertou = acertou;
    }
        
}
