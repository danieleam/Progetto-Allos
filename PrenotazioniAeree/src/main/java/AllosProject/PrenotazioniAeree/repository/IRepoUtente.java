package AllosProject.PrenotazioniAeree.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import AllosProject.PrenotazioniAeree.model.Utente;

public interface IRepoUtente extends JpaRepository<Utente,Integer>{
	
	public Utente findById(int id);
	
}