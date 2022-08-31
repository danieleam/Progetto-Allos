<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="bg-light">

	<div class="container">
		<main>
			<div class="py-5 text-center">
				<img class="d-block mx-auto mb-4"
					src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72"
					height="57">
				<h2>Checkout Biglietto</h2>
			</div>

			<div class="row g-5">
				<div class="col-md-5 col-lg-4 order-md-last">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary">Il tuo carello</span> <span
							class="badge bg-primary rounded-pill">3</span>
					</h4>
					<ul class="list-group mb-3">
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0">Product name</h6>
								<small class="text-muted">Brief description</small>
							</div> <span class="text-muted">$12</span>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0">Second product</h6>
								<small class="text-muted">Brief description</small>
							</div> <span class="text-muted">$8</span>
						</li>
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div>
								<h6 class="my-0">Third item</h6>
								<small class="text-muted">Brief description</small>
							</div> <span class="text-muted">$5</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between bg-light">
							<div class="text-success">
								<h6 class="my-0">Promo code</h6>
								<small>EXAMPLECODE</small>
							</div> <span class="text-success">−$5</span>
						</li>
						<li class="list-group-item d-flex justify-content-between"><span>Total
								(USD)</span> <strong>$20</strong></li>
					</ul>

					<form class="card p-2">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Promo code">
							<button type="submit" class="btn btn-secondary">Redeem</button>
						</div>
					</form>
				</div>
				<div class="col-md-7 col-lg-8">
					<h4 class="mb-3">Indirizzo Di Fatturazione</h4>
					<form class="needs-validation" novalidate>
						<div class="row g-3">
							<div class="col-sm-6">
								<label for="firstName" class="form-label">Nome</label> <input
									type="text" class="form-control" id="firstName" placeholder=""
									value="" required>
								<div class="invalid-feedback">Valid first name is
									required.</div>
							</div>

							<div class="col-sm-6">
								<label for="lastName" class="form-label">Cognome</label> <input
									type="text" class="form-control" id="lastName" placeholder=""
									value="" required>
								<div class="invalid-feedback">Valid last name is required.
								</div>
							</div>

							<div class="col-12">
								<label for="username" class="form-label">Username</label>
								<div class="input-group has-validation">
									<span class="input-group-text">@</span> <input type="text"
										class="form-control" id="username" placeholder="Username"
										required>
									<div class="invalid-feedback">Your username is required.
									</div>
								</div>
							</div>

							<div class="col-12">
								<label for="email" class="form-label">Email <span
									class="text-muted">(Optional)</span></label> <input type="email"
									class="form-control" id="email" placeholder="you@example.com">
								<div class="invalid-feedback">Please enter a valid email
									address for shipping updates.</div>
							</div>

							<div class="col-12">
								<label for="address" class="form-label">Indirizzo</label> <input
									type="text" class="form-control" id="address"
									placeholder="1234 Main St" required>
								<div class="invalid-feedback">Please enter your shipping
									address.</div>
							</div>

							<div class="col-12">
								<label for="address2" class="form-label">Indirizzo 2 <span
									class="text-muted">(Optional)</span></label> <input type="text"
									class="form-control" id="address2"
									placeholder="Apartment or suite">
							</div>

							<div class="col-md-5">
								<label for="country" class="form-label">Nazione</label> <select
									class="form-select" id="country" required>
									<option value="">Scegli...</option>
									<option>United States</option>
									<option>Italy</option>
								</select>
								<div class="invalid-feedback">Please select a valid
									country.</div>
							</div>

							<div class="col-md-4">
								<label for="state" class="form-label">Citta'</label> <select
									class="form-select" id="state" required>
									<option value="">Scegli...</option>
									<option>Milano</option>
									<option>Napoli</option>
									<option>Roma</option>
								</select>
								<div class="invalid-feedback">Please provide a valid
									state.</div>
							</div>

							<div class="col-md-3">
								<label for="zip" class="form-label">Codice Postale (CAP)</label> <input
									type="text" class="form-control" id="zip" placeholder=""
									required>
								<div class="invalid-feedback">Zip code required.</div>
							</div>
						</div>

						<hr class="my-4">

						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="same-address">
							<label class="form-check-label" for="same-address">L'indirizzo di spedizione e' lo stesso del mio indirizzo di fatturazione</label>
						</div>

						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="save-info">
							<label class="form-check-label" for="save-info">Salva queste informazioni per la prossima volta</label>
						</div>

						<hr class="my-4">

						<h4 class="mb-3">Pagamento</h4>

						<div class="my-3">
							<div class="form-check">
								<input id="credit" name="paymentMethod" type="radio"
									class="form-check-input" checked required> <label
									class="form-check-label" for="credit">Credit card</label>
							</div>
							<div class="form-check">
								<input id="debit" name="paymentMethod" type="radio"
									class="form-check-input" required> <label
									class="form-check-label" for="debit">Debit card</label>
							</div>
							<div class="form-check">
								<input id="paypal" name="paymentMethod" type="radio"
									class="form-check-input" required> <label
									class="form-check-label" for="paypal">PayPal</label>
							</div>
						</div>

						<div class="row gy-3">
							<div class="col-md-6">
								<label for="cc-name" class="form-label">Name on card</label> <input
									type="text" class="form-control" id="cc-name" placeholder=""
									required> <small class="text-muted">Full name
									as displayed on card</small>
								<div class="invalid-feedback">Name on card is required</div>
							</div>

							<div class="col-md-6">
								<label for="cc-number" class="form-label">Credit card
									number</label> <input type="text" class="form-control" id="cc-number"
									placeholder="" required>
								<div class="invalid-feedback">Credit card number is
									required</div>
							</div>

							<div class="col-md-3">
								<label for="cc-expiration" class="form-label">Expiration</label>
								<input type="text" class="form-control" id="cc-expiration"
									placeholder="" required>
								<div class="invalid-feedback">Expiration date required</div>
							</div>

							<div class="col-md-3">
								<label for="cc-cvv" class="form-label">CVV</label> <input
									type="text" class="form-control" id="cc-cvv" placeholder=""
									required>
								<div class="invalid-feedback">Security code required</div>
							</div>
						</div>

						<hr class="my-4">

						<button class="w-100 btn btn-primary btn-lg" type="submit">Continue
							to checkout</button>
					</form>
				</div>
			</div>
		</main>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>

	<script src="form-validation.js"></script>
</body>
</html>