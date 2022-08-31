package AllosProject.PrenotazioniAeree.model;

import java.sql.*;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotNull;


@Entity
@Table(name="voli")
public class Volo {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int id_volo;
	
	@NotNull(message="Il costo non può essere null.")
	@Column(nullable=false)
	public double costo;
	
	@NotNull(message="La data non può essere null.")
	@Column(nullable=false)
	public Date data;
	
	@NotNull(message="L'orario non può essere null.")
	@Column(nullable=false)
	public Time ora;
	
	@Column(precision=4, scale=2)
	private Double sconto;
	
	@NotNull(message="Il numero dei passeggeri non può essere null.")
	@Column(nullable=false)
	private int numPasseggeri;

	@OneToMany(mappedBy = "volo", fetch = FetchType.LAZY)
	private List<Prenotazione> prenotazioni;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="fk_compagnia", referencedColumnName="id_compagnia")
	private Compagnia compagnia;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="fk_aereoportoPartenza", referencedColumnName="id_aereoporto")
	private Aereoporto cittaPartenza;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="fk_aereoportoArrivo", referencedColumnName="id_aereoporto")
	private Aereoporto cittaArrivo;

	public int getId_volo() {
		return id_volo;
	}

	public void setId_volo(int id_volo) {
		this.id_volo = id_volo;
	}

	public Aereoporto getCittaPartenza() {
		return cittaPartenza;
	}

	public void setCittaPartenza(Aereoporto cittaPartenza) {
		this.cittaPartenza = cittaPartenza;
	}

	public Aereoporto getCittaArrivo() {
		return cittaArrivo;
	}

	public void setCittaArrivo(Aereoporto cittaArrivo) {
		this.cittaArrivo = cittaArrivo;
	}

	public double getCosto() {
		return costo;
	}

	public void setCosto(double costo) {
		this.costo = costo;
	}
	
	public Double getSconto() {
		return sconto;
	}

	public void setSconto(Double sconto) {
		this.sconto = sconto;
	}

	public List<Prenotazione> getPrenotazioni() {
		return prenotazioni;
	}

	public void setPrenotazioni(List<Prenotazione> prenotazioni) {
		this.prenotazioni = prenotazioni;
	}

	public int getNumPasseggeri() {
		return numPasseggeri;
	}

	public void setNumPasseggeri(int numPasseggeri) {
		this.numPasseggeri = numPasseggeri;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Time getOra() {
		return ora;
	}

	public void setOra(Time ora) {
		this.ora = ora;
	}

	public Compagnia getCompagnia() {
		return compagnia;
	}

	public void setCompagnia(Compagnia compagnia) {
		this.compagnia = compagnia;
	}
	
	
}
