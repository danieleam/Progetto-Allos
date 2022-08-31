package AllosProject.PrenotazioniAeree.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import AllosProject.PrenotazioniAeree.model.Domicilio;

public interface IRepoDomicilio extends JpaRepository<Domicilio, Integer>{

	public Domicilio findById(int id);
}
