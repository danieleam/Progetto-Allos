package AllosProject.PrenotazioniAeree.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import AllosProject.PrenotazioniAeree.model.Prenotazione;

public interface IRepoPrenotazione extends JpaRepository<Prenotazione, Integer> {
	
	public Prenotazione findById(int id);
}
