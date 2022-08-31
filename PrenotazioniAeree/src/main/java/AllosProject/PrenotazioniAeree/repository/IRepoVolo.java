package AllosProject.PrenotazioniAeree.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import AllosProject.PrenotazioniAeree.model.Volo;

public interface IRepoVolo extends JpaRepository<Volo, Integer>{
	
	Volo findById(int id);
	
	@Query(value="Select * From voli v "
			+ "where v.fk_aereoportoPartenza in (select id_aereoporto from aereoporti where nome = ?1) "
			+ "AND v.fk_aereoportoArrivo in (select id_aereoporto from aereoporti where nome = ?2) "
			+ "AND v.data>= ?3 AND v.numPasseggeri >= ?4", nativeQuery=true)
	List<Volo> searchVoli(String cittaPartenza, String cittaArrivo, Date data, int numPrenotazioni);

	@Query(value="Select * From voli Where sconto is not null", nativeQuery=true)
	List<Volo> findDiscountProducts();
	
	@Query(value="Select * from voli v "
			+ "join aereoporti ap on (ap.id_aereoporto=v.fk_aereoportoPartenza) "
			+ "join aereoporti aa on (aa.id_aereoporto=v.fk_aereoportoArrivo) "
			+ "join compagnie c on (c.id_compagnia=v.fk_compagnia) "
			+ "where ap.nome like %?1% or aa.nome like %?1% or c.nome like %?1% or v.data like %?1%", nativeQuery=true)
	List<Volo> findByKeyword(String keyword);
	
}
