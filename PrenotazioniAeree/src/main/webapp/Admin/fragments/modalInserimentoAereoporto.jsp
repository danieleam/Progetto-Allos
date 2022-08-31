<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Modal Inserimento Prodotto-->
<div class="modal fade" id="modalInserimentoAereoporto" tabindex="-1"
	aria-labelledby="modalInserimentoAereoporto" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Tabella inserimento volo</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<c:url value="/insertUpdateAereoporto" var="aereoportoUrl" />
			<form action="${aereoportoUrl}" method="post">
				<div class="modal-body">
					<label for="aereoporto">Aereoporto</label><br> <input class="form-control"
						type="text" name="nome"><br>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Indietro</button>
					<button type="reset" class="btn btn-secondary">Reset</button>
					<button type="submit" class="btn btn-primary">Conferma</button>
				</div>
			</form>
		</div>
	</div>
</div>