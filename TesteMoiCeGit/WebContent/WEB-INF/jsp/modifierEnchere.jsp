<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/modifierEnchere.css">

<title>LOSNA - Modifier Mon Enchère</title>
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
			<h1>Modifier mon enchère</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>
		<div class="row">
			<div class="image col-lg-3 col-md-3 col-sm-3 col-xs-12 mb-4 ml-4 mr-4">
				<img src="images/grey.jpg" alt="..." class="img-thumbnail rounded">
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Article</span>
					</div>
					<input type="text" class="form-control" placeholder="Article"
						aria-label="Username" aria-describedby="basic-addon1"
						value="${articleVisu.nom_article}">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">Description</span>
					</div>
					<textarea class="form-control" aria-label="With textarea">${articleVisu.description}</textarea>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="inputGroupSelect01">Catégorie</label>
					</div>
					<select class="custom-select" id="inputGroupSelect01">
						<option selected>Sélectionner</option>
						<option value="1">Informatique</option>
						<option value="2">Sport & Loisirs</option>
						<option value="3">Vêtement</option>
						<option value="4">Ameublement</option>
					</select>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text" for="inputGroupSelect01">Photo</label>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="inputGroupFile02"
							value="test"> <label class="custom-file-label"
							for="inputGroupFile02">Photo de l'article</label>
					</div>
					<div class="input-group-append">
						<span class="input-group-text" id="">Uploader</span>
					</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Mise à
							prix</span>
					</div>
					<input class="form-control" type="number" value="1"
						id="example-number-input" value="${articleVisu.prix_initial}">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Début de
							l'enchère</span>
					</div>
					<input class="form-control" type="date" id="example-number-input"
						value="${articleVisu.date_debut_enchere}">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Fin de
							l'enchère</span>
					</div>
					<input class="form-control" type="date" id="example-number-input"
						value="${articleVisu.date_fin_enchere}">
				</div>
				<div class="panel panel-info">
					<!-- Contenu avec la classe .panel-default -->
					<div class="panel-heading">Retrait</div>
					<div class="panel-body">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Rue</span>
							</div>
							<input type="text" class="form-control" placeholder="Rue"
								aria-label="Username" aria-describedby="basic-addon1"
								value="${articleVisu.adresse.rue}">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Code
									Postal</span>
							</div>
							<input type="text" class="form-control" placeholder="Code Postal"
								aria-label="Username" aria-describedby="basic-addon1"
								value="${articleVisu.adresse.code_postal}">
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Ville</span>
							</div>
							<input type="text" class="form-control" placeholder="Ville"
								aria-label="Username" aria-describedby="basic-addon1"
								value="${articleVisu.adresse.ville}">
						</div>
					</div>
				</div>
				<div class="form-group text-center">
					<input type="submit" class="btn btn-md mx-3 mb-2" value="Enregistrer">
					<a href="#" class="btn btn-md mx-3 mb-2" value="annuler">Annuler</a> 
					<a href="#" class="btn btn-md mx-3 mb-2" value="annulervente">Annuler la vente</a>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>