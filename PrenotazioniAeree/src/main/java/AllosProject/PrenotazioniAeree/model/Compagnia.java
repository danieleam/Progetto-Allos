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
@Table(name="compagnie")
public class Compagnia {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_compagnia;
	@NotNull(message="il nome della compagnia non può essere null")
	@Size(min=3, max=30, message = "Il nome della compagnia prevede 3-30 caratteri.")
	@Column(length=30, nullable=false)
	private String nome;
	
	@OneToMany(mappedBy = "compagnia", fetch = FetchType.LAZY)
	private List<Volo> voli;

	public int getId_compagnia() {
		return id_compagnia;
	}

	public void setId_compagnia(int id_compagnia) {
		this.id_compagnia = id_compagnia;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Volo> getVoli() {
		return voli;
	}

	public void setVoli(List<Volo> voli) {
		this.voli = voli;
	}
}
