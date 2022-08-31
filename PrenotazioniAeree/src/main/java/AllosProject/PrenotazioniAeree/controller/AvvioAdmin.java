package AllosProject.PrenotazioniAeree.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import AllosProject.PrenotazioniAeree.model.Aereoporto;
import AllosProject.PrenotazioniAeree.model.Compagnia;
import AllosProject.PrenotazioniAeree.model.Volo;
import AllosProject.PrenotazioniAeree.repository.IRepoAereoporto;
import AllosProject.PrenotazioniAeree.repository.IRepoCompagnia;
import AllosProject.PrenotazioniAeree.repository.IRepoVolo;

@Controller
public class AvvioAdmin {

	@Autowired
	IRepoVolo rv;

	@Autowired
	IRepoAereoporto ra;

	@Autowired
	IRepoCompagnia rc;

	// -----INSERIMENTO/MODIFICA VOLO-----
	@PostMapping(value = "insertUpdateVolo")
	public String inserisciModificaVolo(Volo volo) {
		rv.save(volo);
		return "redirect:/viewVoliAdmin";
	}

	// -----ELIMINA VOLO-----
	@GetMapping(value = "deleteVolo")
	public String deleteMarca(@RequestParam int id) {
		rv.deleteById(id);
		return "redirect:/viewVoliAdmin";
	}

	// -----INSERIMENTO/MODIFICA AEREOPORTO-----
	@PostMapping(value = "insertUpdateAereoporto")
	public String inserisciModificaAereoporto(Aereoporto aereoporto) {
		ra.save(aereoporto);
		return "redirect:/viewCompagnieAereoportiAdmin";
	}

	// -----ELIMINA AEREOPORTO-----
	@GetMapping(value = "deleteAereoporto")
	public String deleteAereoporto(@RequestParam int id) {
		ra.deleteById(id);
		return "redirect:/viewCompagnieAereoportiAdmin";
	}

	// -----INSERIMENTO/MODIFICA COMPAGNIA-----
	@PostMapping(value = "insertUpdateCompagnia")
	public String inserisciModificaCompagnia(Compagnia compagnia) {
		rc.save(compagnia);
		return "redirect:/viewCompagnieAereoportiAdmin";
	}

	// -----ELIMINA COMPAGNIA-----
	@GetMapping(value = "deleteCompagnia")
	public String deleteCompagnia(@RequestParam int id) {
		rc.deleteById(id);
		return "redirect:/viewCompagnieAereoportiAdmin";
	}

	@GetMapping(value = "/login")
	public String login() {
		return "Admin/login";
	}

	// -----MOSTRA TUTTI I VOLI CON IMPAGINAZIONE-----
	@GetMapping(value = "viewVoliAdmin")
	public String viewVoliAdmin(HttpServletRequest request, @RequestParam(required = false) String keyword) {
		ArrayList<Volo> listaFiltrata = new ArrayList<>();
		List<Volo> tuttiVoli;

		if (keyword == null)
			tuttiVoli = rv.findAll();
		else
			tuttiVoli = rv.findByKeyword(keyword);

		int pagina = 1;

		if (request.getParameter("pagina") != null) {
			pagina = Integer.parseInt(request.getParameter("pagina"));
		}

		int nPagine = 0;
		int totElementi = tuttiVoli.size();
		int nVisualizzati = 7;
		int offset = 0;
		int limit = 0;

		if (totElementi % nVisualizzati != 0) // controlliamo se il rapporto ha resto
			nPagine = (totElementi / nVisualizzati) + 1; // incremento per eccesso per non perdere una pagina
		else
			nPagine = (totElementi / nVisualizzati);
		if (pagina == 0) { // se pagina–- porta a pagina=0, la variabile pagina viene riportata a 1
			pagina = 1;
		} else if (pagina > nPagine) { // controllo se pagina++ supera il limite delle pagine
			pagina = nPagine;
		}
		// offset e limit variano in funzione della variabile "pagina"
		offset = (pagina - 1) * nVisualizzati;
		limit = offset + nVisualizzati;
		for (int i = offset; i < limit && i < tuttiVoli.size(); i++) {
			listaFiltrata.add(tuttiVoli.get(i));
		}
		request.setAttribute("keyword", keyword);
		request.setAttribute("voli", listaFiltrata);
		request.setAttribute("nPagine", nPagine);
		request.setAttribute("pagina", pagina);
		request.setAttribute("aereoporti", ra.findAll());
		request.setAttribute("compagnie", rc.findAll());
		return "Admin/voli";
	}

	// -----MOSTRA TUTTI GLI AEREOPORTI CON IMPAGINAZIONE-----
	@GetMapping(value = "viewCompagnieAereoportiAdmin")
	public String viewCompagnieAereoportiAdmin(HttpServletRequest request,
			@RequestParam(required = false) String keyword) {
		// IMPAGINAZIONE AEREOPORTI
		List<Aereoporto> listaFiltrataAereoporti = new ArrayList<>();
		/*
		 * List<Aereoporto> listaAereoporti;
		 * 
		 * if(keyword==null || keyword.equals("")) listaAereoporti = ra.findAll(); else
		 * listaAereoporti = ra.findby
		 */

		int pagina = 1;

		if (request.getParameter("paginaAereoporti") != null) {
			pagina = Integer.parseInt(request.getParameter("paginaAereoporti"));
		}

		int nPagine = 0;
		int totElementi = ra.findAll().size();
		int nVisualizzati = 7;
		int offset = 0;
		int limit = 0;

		if (totElementi % nVisualizzati != 0) // controlliamo se il rapporto ha resto
			nPagine = (totElementi / nVisualizzati) + 1; // incremento per eccesso per non perdere una pagina
		else
			nPagine = (totElementi / nVisualizzati);
		if (pagina == 0) { // se pagina–- porta a pagina=0, la variabile pagina viene riportata a 1
			pagina = 1;
		} else if (pagina > nPagine) { // controllo se pagina++ supera il limite delle pagine
			pagina = nPagine;
		}
		// offset e limit variano in funzione della variabile "pagina"
		offset = (pagina - 1) * nVisualizzati;
		limit = offset + nVisualizzati;
		for (int i = offset; i < limit && i < ra.findAll().size(); i++) {
			listaFiltrataAereoporti.add(ra.findAll().get(i)); // prendo solo i valori delimitati da offset e limit
		}
		request.setAttribute("aereoporti", listaFiltrataAereoporti);
		request.setAttribute("nPagineAereoporti", nPagine);
		request.setAttribute("paginaAereoporti", pagina);

		// IMPAGINAZIONE COMPAGNIE
		ArrayList<Compagnia> listaFiltrataCompagnie = new ArrayList<>();

		int pagina2 = 1;

		if (request.getParameter("paginaCompagnie") != null) {
			pagina2 = Integer.parseInt(request.getParameter("paginaCompagnie"));
		}

		int nPagine2 = 0;
		int totElementi2 = rc.findAll().size();
		int nVisualizzati2 = 7;
		int offset2 = 0;
		int limit2 = 0;

		if (totElementi2 % nVisualizzati2 != 0) // controlliamo se il rapporto ha resto
			nPagine2 = (totElementi2 / nVisualizzati2) + 1; // incremento per eccesso per non perdere una pagina
		else
			nPagine2 = (totElementi2 / nVisualizzati2);
		if (pagina2 == 0) { // se pagina–- porta a pagina=0, la variabile pagina viene riportata a 1
			pagina2 = 1;
		} else if (pagina2 > nPagine2) { // controllo se pagina++ supera il limite delle pagine
			pagina2 = nPagine2;
		}
		// offset e limit variano in funzione della variabile "pagina"
		offset2 = (pagina2 - 1) * nVisualizzati2;
		limit2 = offset2 + nVisualizzati2;
		for (int i = offset2; i < limit2 && i < rc.findAll().size(); i++) {
			listaFiltrataCompagnie.add(rc.findAll().get(i)); // prendo solo i valori delimitati da offset e limit
		}
		request.setAttribute("compagnie", listaFiltrataCompagnie);
		request.setAttribute("nPagineCompagnie", nPagine2);
		request.setAttribute("paginaCompagnie", pagina2);

		return "Admin/aereoporti";
	}

}
