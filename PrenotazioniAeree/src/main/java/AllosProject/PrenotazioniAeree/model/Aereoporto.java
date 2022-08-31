package AllosProject.PrenotazioniAeree.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="aereoporti")
public class Aereoporto {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_aereoporto;
	@NotNull(message="il nome dell'aereoporto non può essere null")
	@Size(min=3, max=30, message = "Il nome dell'aereoportoprevede 3-30 caratteri.")
	@Column(length=30, nullable=false)
	private String nome;
	
	@OneToMany(mappedBy = "cittaPartenza", fetch = FetchType.LAZY)
	private List<Volo> voliPartenza;
	
	@OneToMany(mappedBy = "cittaArrivo", fetch = FetchType.LAZY)
	private List<Volo> voliArrivo;

	public int getId_aereoporto() {
		return id_aereoporto;
	}

	public void setId_aereoporto(int id_aereporto) {
		this.id_aereoporto = id_aereporto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Volo> getVoliPartenza() {
		return voliPartenza;
	}

	public void setVoliPartenza(List<Volo> voliPartenza) {
		this.voliPartenza = voliPartenza;
	}

	public List<Volo> getVoliArrivo() {
		return voliArrivo;
	}

	public void setVoliArrivo(List<Volo> voliArrivo) {
		this.voliArrivo = voliArrivo;
	}
	
}
