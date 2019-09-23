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
			<h1>Votre enchère a pris fin et a été remportée par ${acheteurVisu.pseudo}</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${acheteurVisu.pseudo} ne tardera pas à vous contacter plus vite pour convenir d'un rendez vous à l'adresse de retrait. <br>${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>

		<form method="post"
			action="${pageContext.request.contextPath}/gagnerEnchereVendeurServlet">
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
							<span class="input-group-text" id="prix_vente" nom="prix_vente">Meilleure
								offre</span>
						</div>
						<div class="form-control">${enchereVisu.montant_enchere}par
							${acheteurVisu.pseudo}</div>
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
						<div class="form-control">${articleVisu.date_fin_enchere}</div>
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
							<span class="input-group-text" id="nom" nom="nom">Vendeur</span>
						</div>
						<div class="form-control">${acheteurVisu.pseudo}</div>
					</div>

					<div class="row">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
							<a href="${pageContext.request.contextPath}/changerEtatRetraitServlet?no_article=${articleVisu.no_article}" class="btn mb-2">Retrait
								effectué</a>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
							<a onClick="history.back()" class="btn btn-md mb-2">Retour</a>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			</div>
		</form>
	</div>

	<%@include file="/includes/footer.jsp"%>