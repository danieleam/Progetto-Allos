package AllosProject.PrenotazioniAeree.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import AllosProject.PrenotazioniAeree.model.Utente;
import AllosProject.PrenotazioniAeree.model.Volo;
import AllosProject.PrenotazioniAeree.repository.IRepoUtente;
import AllosProject.PrenotazioniAeree.repository.IRepoVolo;

@Controller
public class AvvioGuest {

	@Autowired
	IRepoVolo rv;

	@Autowired
	IRepoUtente ru;

	HttpSession sessione;

	// --------------------HOME-------------------------------//
	@GetMapping(value = "")
	public String home(HttpServletRequest request) {
		List<Volo> voliQuery = rv.findDiscountProducts();
		List<Volo> voliHome = new ArrayList<Volo>();
		int MAXELEM;
		int[] indiceVoli = new int[3];// max di voli da visualizzare nella home
		boolean flag;
		if (voliQuery.size() >= 3)// se ho 3 o più voli
			MAXELEM = 3;
		else// se ne ho 2 o meno
			MAXELEM = voliQuery.size();
		do {
			flag = true;// setto il flag a true
			for (int i = 0; i <= MAXELEM - 1; i++) {// genera numeri random basati sui voli all'interno della lista
				indiceVoli[i] = new Random().nextInt(voliQuery.size());
			}
			if (voliQuery.size() >= 2) {// controllo se i numeri presi non sono uguali
				if (indiceVoli[0] == indiceVoli[1])
					flag = false;
				if (voliQuery.size() >= 3) {
					if (indiceVoli[1] == indiceVoli[2])
						flag = false;
					else if (indiceVoli[2] == indiceVoli[0])
						flag = false;
				}
			}
		} while (!flag);
		for (int i = 0; i <= MAXELEM - 1; i++) {// genera numeri random basati sui prodotti all'interno della lista
			voliHome.add(voliQuery.get(indiceVoli[i]));
		}
		request.setAttribute("logo", "Guest/img/airplane.png");
		request.setAttribute("banner1", "Guest/img/tropical.jpg");
		request.setAttribute("banner2", "Guest/img/banner1.png");
		request.setAttribute("triangolo", "Guest/img/triangolo.png");
		request.setAttribute("roma", "Guest/img/roma.jpg");
		request.setAttribute("voli", voliHome);
		return "Guest/home";
	}

	@GetMapping(value = "ricercaVoliAndata")
	public String ricercaVoliAndata(HttpServletRequest request, HttpServletResponse response, @RequestParam String cittaPartenza, @RequestParam String cittaArrivo, @RequestParam Date Andata, @RequestParam(required = false) Date Ritorno, @RequestParam int totaleAdulti, @RequestParam int totaleBambini, @RequestParam String radioButton) { // required = false sto dicendo che il parametro Ritorno non dev'essere obbligatorio
		request.setAttribute("PasseggeriAdulti", totaleAdulti);
		request.setAttribute("PasseggeriBambini", totaleBambini);
		request.setAttribute("triangolo", "Guest/img/triangolo.png");
		request.setAttribute("logo", "Guest/img/airplane.png");
		request.setAttribute("voli", rv.searchVoli(cittaPartenza, cittaArrivo, Andata, totaleAdulti+totaleBambini)); //ANDATA
		System.out.println(rv.searchVoli(cittaPartenza, cittaArrivo, Andata, totaleAdulti+totaleBambini));
		if(radioButton.equals("AndataRitorno")){
			request.setAttribute("AndataRitorno", "vero");
			request.setAttribute("cittaPartenza", cittaPartenza);
			request.setAttribute("cittaArrivo", cittaArrivo);
			request.setAttribute("dataRitorno", Ritorno);
		}
		return "Guest/voli";
	}

	@GetMapping(value = "ricercaVoliRitorno")
	public String ricercaVoliRitorno(HttpServletRequest request, @RequestParam String cittaPartenza, @RequestParam String cittaArrivo, @RequestParam Date Ritorno, @RequestParam int totaleAdulti, @RequestParam int totaleBambini) {
		request.setAttribute("PasseggeriAdulti", totaleAdulti);
		request.setAttribute("PasseggeriBambini", totaleBambini);
		request.setAttribute("triangolo", "Guest/img/triangolo.png");
		request.setAttribute("logo", "Guest/img/airplane.png");
		request.setAttribute("voli", rv.searchVoli(cittaArrivo, cittaPartenza, Ritorno, totaleAdulti + totaleBambini)); // RITORNO
		return "Guest/voli";
	}

	// -----REGISTRAZIONE UTENTE-----
	@PostMapping(value = "registrazione")
	public String registrazione(Utente utente) {
		ru.save(utente);
		return "Guest/registrazioneAvvenuta";
	}

	// ----LOGIN UTENTE-----
	@PostMapping(value = "loginUtente")
	public String loginUtente(HttpServletRequest request, HttpServletResponse respone, @RequestParam String email,
			@RequestParam String password) throws IOException {
		sessione = request.getSession();
		for (int i = 0; i < ru.findAll().size(); i++) {
			if ((ru.findAll().get(i).getEmail().equals(email))
					&& (ru.findAll().get(i).getPassword().equals(password))) {
				sessione.setAttribute("email", email);
				sessione.setAttribute("password", password);
				sessione.setAttribute("nome", ru.findAll().get(i).getNome());
				sessione.setAttribute("login", "vero");
			} else if ((email.equals("user@admin.it")) && (password.equals("password"))) {
				sessione.setAttribute("email", email);
				sessione.setAttribute("password", password);
				return "redirect:/Admin"; // mi reindirizza al login dell'admin
			}
		}
		return "redirect:/";
	}

	// ----LOGOUT UTENTE-----
	@GetMapping(value = "logoutUtente")
	public String logoutUtente(HttpServletRequest request, @RequestParam int num) {
		sessione = request.getSession();
		if (num == 1) {
			sessione.invalidate();
		}
		return "redirect:/";
	}

}
