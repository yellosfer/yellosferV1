<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/gagnerEnchereAcheteur.css">

<title>LOSNA - Login</title>
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
		<div
			class="page-header text-center  col-lg-10 col-md-10 col-sm-10 col-xs-12 mb-5">
			<h1>Bravo! Vous avez remporté la vente!</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">Contactez le vendeur au plus vite pour convenir d'un rendez vous à l'adresse de retrait. <br><br> ${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>

		<div class="row">
			<div
				class="image col-lg-3 col-md-3 col-sm-3 col-xs-12 mb-4 ml-4 mr-4">
				<img src="images/encheres/${articleVisu.image}" alt="..."
					class="img-thumbnail rounded">
			</div>

			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="article" nom="article">Article</span>
					</div>
					<div class="form-control">${articleVisu.nom_article}</div>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">Description</span>
					</div>
					<div class="form-control">${articleVisu.description}</div>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="prix_vente" nom="prix_vente">Meilleur
							offre</span>
					</div>
					<div class="form-control">${enchereVisu.montant_enchere}</div>
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="prix_initial"
							nom="prix_initial">Mise à prix</span>
					</div>
					<div type="text" class="form-control">${articleVisu.prix_initial}</div>
				</div>
				
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="date_fin_enchere"
							nom="date_fin_enchere">Fin de l'enchère</span>
					</div>
					<fmt:parseDate pattern="yyyy-MM-dd"
							value="${articleVisu.date_fin_enchere}" var="datefin" />
					
					<div type="text" class="form-control"><fmt:formatDate
								type="date" value="${datefin}" /></div>
				</div>

				<div class="panel panel-info">
					<!-- Contenu avec la classe .panel-default -->
					<div class="panel-heading">Retrait</div>
					<div class="panel-body">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Rue</span>
							</div>
							<div class="form-control">${retraitVisu.rue}</div>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Code
									Postal</span>
							</div>
							<div class="form-control">${retraitVisu.code_postal}</div>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon1">Ville</span>
							</div>
							<div class="form-control">${retraitVisu.ville}</div>
						</div>
					</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="nom" nom="nom">Acheteur</span>
					</div>
					<div class="form-control">${acheteurVisu.pseudo}</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="telephone" nom="telephone">Téléphone</span>
					</div>
					<div class="form-control">${acheteurVisu.telephone}</div>
				</div>
				<div>
					<a onClick="history.back()" class="btn btn-md mb-2">Retour</a>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>