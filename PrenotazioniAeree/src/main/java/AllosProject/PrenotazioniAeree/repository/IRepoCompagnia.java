package AllosProject.PrenotazioniAeree.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import AllosProject.PrenotazioniAeree.model.Compagnia;

public interface IRepoCompagnia extends JpaRepository<Compagnia, Integer>{
	
	public Compagnia findById(int id);
}
