package AllosProject.PrenotazioniAeree.model;

import javax.persistence.*;
import javax.validation.constraints.*;

@Entity
@Table(name="domicili")
public class Domicilio {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_domicilio;
	@NotNull(message="La regione non può essere null.")
	@Size(min=3, max=50, message = "La regione prevede 3-50 caratteri.")
	@Column(length=50, nullable=false)
	private String regione;
	@NotNull(message="L'indirizzo non può essere null.")
	@Size(min=3, max=50, message = "L'indirizzo prevede 3-50 caratteri.")
	@Column(length=50, nullable=false)
	private String indirizzo;
	@NotNull(message="La citta non può essere null.")
	@Size(min=3, max=50, message = "La citta prevede 3-50 caratteri.")
	@Column(length=50, nullable=false)
	private String citta;
	@NotNull(message="La provincia non può essere null.")
	@Size(min=3, max=30, message = "La provincia prevede 3-30 caratteri.")
	@Column(length=30, nullable=false)
	private String provincia;
	@NotNull(message="Il cap non può essere null.")
	@Size(min=5, max=5, message = "Il cap prevede 5 numeri.")
	@Column(length=5, nullable=false)
	private int cap;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "fk_utente", referencedColumnName = "id_utente")
	private Utente utente;

	public int getId_domicilio() {
		return id_domicilio;
	}

	public void setId_domicilio(int id_domicilio) {
		this.id_domicilio = id_domicilio;
	}

	public String getRegione() {
		return regione;
	}

	public void setRegione(String regione) {
		this.regione = regione;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public int getCap() {
		return cap;
	}

	public void setCap(int cap) {
		this.cap = cap;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

}
