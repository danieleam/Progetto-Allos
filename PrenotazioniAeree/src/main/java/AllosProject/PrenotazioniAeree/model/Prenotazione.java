package AllosProject.PrenotazioniAeree.model;

import java.sql.*;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
@Table(name="prenotazioni")
public class Prenotazione {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_prenotazione;
	@NotNull(message="Il nome non può essere null.")
	@Size(min=3, max=30, message = "Il nome prevede 3-30 caratteri.")
	@Column(length=30, nullable=false)
	private String nome;
	@NotNull(message="Il cognome non può essere null.")
	@Size(min=3, max=30, message = "Il cognome prevede 3-30 caratteri.")
	@Column(length=30, nullable=false)
	private String cognome;
	@NotNull(message="L'eta non può essere null.")
	@Column(length=3, nullable=false)
	private int eta;
	@NotNull(message="Data e Ora non possono essere null.")
	@Column(nullable=false)
	private Timestamp DataOra;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_utente", referencedColumnName = "id_utente")
	private Utente utente;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_volo", referencedColumnName = "id_volo")
	private Volo volo;

	public int getId_prenotazione() {
		return id_prenotazione;
	}

	public void setId_prenotazione(int id_prenotazione) {
		this.id_prenotazione = id_prenotazione;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public int getEta() {
		return eta;
	}

	public void setEta(int eta) {
		this.eta = eta;
	}

	public Timestamp getDataOra() {
		return DataOra;
	}

	public void setDataOra(Timestamp dataOra) {
		DataOra = dataOra;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public Volo getVolo() {
		return volo;
	}

	public void setVolo(Volo volo) {
		this.volo = volo;
	}
}
