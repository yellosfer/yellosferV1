<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/inscrireUtilisateur.css">

<title>LOSNA - Inscrire Utilisateur</title>
</head>
<body>

	<c:choose>
		<c:when test="${!empty utilisateurCourant}">
			<%@include file="/includes/navbarConnecte.jsp"%>
		</c:when>
		<c:otherwise>
			<%@include file="/includes/navbarDeconnecte.jsp"%>
		</c:otherwise>
	</c:choose>


	<div class="container">
		<div class="page-header text-center  mb-3">
			<h1>Inscription</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</br><small class="form-text text-muted">Tout les champs sont obligatoires.</small></div>
			
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			
		</div>
		
		<form method="post"
			action="${pageContext.request.contextPath}/inscrireUtilisateurServlet">
			<div class="row">
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Pseudo</span>
					</div>
					<input type="text" class="form-control" placeholder="Pseudo"
						aria-label="Username" aria-describedby="basic-addon1"
						name="pseudo" required>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Nom</span>
					</div>
					<input type="text" class="form-control" placeholder="Nom"
						aria-label="Username" aria-describedby="basic-addon1" name="nom" required>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Prénom</span>
					</div>
					<input type="text" class="form-control" placeholder="Prénom"
						aria-label="Username" aria-describedby="basic-addon1"
						name="prenom" required>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Email</span>
					</div>
					<input type="text" class="form-control" placeholder="Email"
						aria-label="Username" aria-describedby="basic-addon1" name="email" required>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Téléphone</span>
					</div>
					<input type="text" class="form-control" placeholder="Téléphone"
						aria-label="Username" aria-describedby="basic-addon1"
						name="telephone" required>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Rue</span>
					</div>
					<input type="text" class="form-control" placeholder="Rue"
						aria-label="Username" aria-describedby="basic-addon1" name="rue" required>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Code
							Postal</span>
					</div>
					<input type="text" class="form-control" placeholder="Code Postal"
						aria-label="Username" aria-describedby="basic-addon1"
						name="code_postal" required>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Ville</span>
					</div>
					<input type="text" class="form-control" placeholder="Ville"
						aria-label="Username" aria-describedby="basic-addon1" name="ville" required>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Mot de
							passe</span>
					</div>
					<input type="password" class="form-control" id="mot_de_passe"
						name="mot_de_passe" placeholder="Mot de passe" minlength="8"
						required>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Confirmation</span>
					</div>
					<input type="password" class="form-control"
						name="confirmation_mot_de_passe" id="confirmation_mot_de_passe"
						placeholder="Confirmation du mot de passe" minlength="8" required>
				</div>


				<div
					class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center d-none d-sm-block">
					<small class="form-text text-muted">Votre mot de passe doit
						contenir minimum 8 caractères, au moins une majuscule, un
						caractère spécial et un chiffre.</small>
				</div>
				<div
					class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center d-none d-sm-block">
					<small class="form-text text-muted">La confirmation du mot
						de passe doit être identique au mot de passe choisi.</small>
				</div>

				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-12"></div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<input type="submit" class="btn btn-md mx-3 mb-2" value="Créer">
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<a href="accueil" class="btn btn-md mx-3 mb-2">Annuler</a>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-12"></div>

			</div>
		</form>
	</div>


	<%@include file="/includes/footer.jsp"%>