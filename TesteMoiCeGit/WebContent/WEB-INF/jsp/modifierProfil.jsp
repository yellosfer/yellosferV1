<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/modifierProfil.css">

<title>LOSNA - Modifier Profil</title>
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
			<h1>Modifier mon profil</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>
		<form method="post"
			action="${pageContext.request.contextPath}/modifierProfilServlet">
			<div class="row">
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Pseudo</span>
					</div>
					<input type="text" class="form-control" placeholder="Pseudo"
						aria-label="Username" aria-describedby="basic-addon1"
						name="pseudo" value="${utilisateurCourant.pseudo}">
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Nom</span>
					</div>
					<input type="text" class="form-control" placeholder="Nom"
						aria-label="Username" aria-describedby="basic-addon1" name="nom"
						value="${utilisateurCourant.nom }">
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Prénom</span>
					</div>
					<input type="text" class="form-control" placeholder="Prénom"
						aria-label="Username" aria-describedby="basic-addon1"
						name="prenom" value="${utilisateurCourant.prenom }">
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Email</span>
					</div>
					<input type="text" class="form-control" placeholder="Email"
						aria-label="Username" aria-describedby="basic-addon1" name="email"
						value="${utilisateurCourant.email }">
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Téléphone</span>
					</div>
					<input type="text" class="form-control" placeholder="Téléphone"
						aria-label="Username" aria-describedby="basic-addon1"
						name="telephone" value="${utilisateurCourant.telephone }">
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Rue</span>
					</div>
					<input type="text" class="form-control" placeholder="Rue"
						aria-label="Username" aria-describedby="basic-addon1" name="rue"
						value="${utilisateurCourant.adresse.rue }">
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Code
							Postal</span>
					</div>
					<input type="text" class="form-control" placeholder="Code Postal"
						aria-label="Username" aria-describedby="basic-addon1" name="cp"
						value="${utilisateurCourant.adresse.code_postal }">
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Ville</span>
					</div>
					<input type="text" class="form-control" placeholder="Ville"
						aria-label="Username" aria-describedby="basic-addon1" name="ville"
						value="${utilisateurCourant.adresse.ville }">
				</div>
			</div>
			<div class="form-group mt-2 text-center">
				<input type="submit" class="btn btn-md mb-2"
					value="Valider Modification">
			</div>
		</form>
	</div>

	<%@include file="/includes/footer.jsp"%>