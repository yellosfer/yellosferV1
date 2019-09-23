<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/creerEnchere.css">

<title>LOSNA - Créer enchère</title>
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
			<h1>Nouvelle Enchère</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>
		<form method="post"
			action="${pageContext.request.contextPath}/creerEnchereServlet">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 mb-4 ml-4 mr-4">
					<img src="images/grey.jpg" alt="..." class="img-thumbnail rounded"
						name="img-product" id="img-product">
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Article</span>
						</div>
						<input type="text" class="form-control" placeholder="Article"
							aria-label="Username" aria-describedby="basic-addon1"
							name="nom_article" id="nom_article">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text">Description</span>
						</div>
						<textarea class="form-control" aria-label="With textarea"
							name="description" id="description"></textarea>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text" for="no_categorie">Catégorie</label>
						</div>
						<select class="custom-select" name="no_categorie"
							id="no_categorie">
							<option value="1">Informatique</option>
							<option value="2">Ameublement</option>
							<option value="3">Vêtement</option>
							<option value="4">Sport & Loisirs</option>
						</select>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="custom-file-label" for="image">Photo de
								l'article</label>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="image"
								name="image" value="image">
						</div>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Mise à
								prix</span>
						</div>
						<input class="form-control" type="number" name="prix_initial"
							id="prix_initial" value="10" id="example-number-input">
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Début de
								l'enchère</span>
						</div>
						<input class="form-control" type="date" name="date_debut_enchere"
							id="date_debut_enchere">

					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon1">Fin de
								l'enchère</span>
						</div>
						<input class="form-control" type="date" name="date_fin_enchere"
							id="date_fin_enchere">
					</div>
					<div class="panel panel-info">
						<!-- Contenu avec la classe .panel-default -->
						<div class="panel-heading">Retrait</div>
						<div class="panel-body">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">Rue</span>
								</div>
								<input type="text" class="form-control" name="rue" id="rue"
									placeholder="Rue" aria-label="Username"
									aria-describedby="basic-addon1" value="${utilisateurCourant.adresse.rue}">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">Code
										Postal</span>
								</div>
								<input type="text" class="form-control" name="code_postal"
									id="code_postal" placeholder="Code Postal"
									aria-label="Username" aria-describedby="basic-addon1" value="${utilisateurCourant.adresse.code_postal}">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">Ville</span>
								</div>
								<input type="text" class="form-control" name="ville" id="ville"
									placeholder="Ville" aria-label="Username"
									aria-describedby="basic-addon1" value="${utilisateurCourant.adresse.ville}">
							</div>
						</div>
					</div>
					<div class="form-group text-center">
						<input type="submit" class="btn btn-md mx-3 mb-2"
							value="Enregistrer"> <a href="${pageContext.request.contextPath}/accueilServlet"
							class="btn btn-md mx-3 mb-2" value="Enregistrer">Annuler</a>
					</div>
				</div>
			</div>
		</form>
	</div>
	<%@include file="/includes/footer.jsp"%>