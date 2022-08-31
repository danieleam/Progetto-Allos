package AllosProject.PrenotazioniAeree.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.*;
@Entity
@Table(name="utenti")
public class Utente {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id_utente;
	@NotNull(message="Il nome non può essere null.")
	@Size(min=3, max=30, message = "Il nome prevede 3-30 caratteri.")
	@Column(length=30, nullable=false)
	private String nome;
	@NotNull(message="Il cognome non può essere null.")
	@Size(min=3, max=30, message = "Il cognome prevede 3-30 caratteri.")
	@Column(length=30, nullable=false)
	private String cognome;
	@NotNull(message="La data di nascita non può essere null.")
	@Column(nullable=false)
	private Date dataNascita;
	@NotNull(message="L'email non può essere null.")
	@Email(message="Il pattern della email non è rispettato.")
	@Column(length = 30, nullable = false, unique = true)
	private String email;
	@NotNull(message="La password non può essere null.")
	@Size(min=8, max=30, message = "La password prevede 8-30 caratteri.")
	@Column(length = 30, nullable = false)
	private String password;
	
	@OneToMany(mappedBy = "utente", fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Domicilio> domicili;
	
	@OneToMany(mappedBy = "utente", fetch = FetchType.LAZY)
	private List<Prenotazione> prenotazioni;
	
	public int getId_utente() {
		return id_utente;
	}
	public void setId_utente(int id_utente) {
		this.id_utente = id_utente;
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
	public Date getDataNascita() {
		return dataNascita;
	}
	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Domicilio> getDomicili() {
		return domicili;
	}
	public void setDomicili(List<Domicilio> domicili) {
		this.domicili = domicili;
	}
	public List<Prenotazione> getPrenotazioni() {
		return prenotazioni;
	}
	public void setPrenotazioni(List<Prenotazione> prenotazioni) {
		this.prenotazioni = prenotazioni;
	}
	
}
