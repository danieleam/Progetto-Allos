package AllosProject.PrenotazioniAeree.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import AllosProject.PrenotazioniAeree.model.Aereoporto;

public interface IRepoAereoporto extends JpaRepository<Aereoporto, Integer> {
	
	public Aereoporto findById(int id);

}
