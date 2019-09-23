<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/visualiserMonProfil.css">


<title>LOSNA - Visualiser mon profil</title>
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
			<h1>Profil de ${utilisateurCourant.pseudo}</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>
		<div class="row">
			<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Pseudo</span>
				</div>
				<div class="form-control">${utilisateurCourant.pseudo}</div>
			</div>
			<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Nom</span>
				</div>
				<div class="form-control">${utilisateurCourant.nom}</div>
			</div>
			<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Prénom</span>
				</div>
				<div class="form-control">${utilisateurCourant.prenom}</div>
			</div>
			<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Email</span>
				</div>
				<div class="form-control">${utilisateurCourant.email}</div>
			</div>
			<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Téléphone</span>
				</div>
				<div class="form-control">${utilisateurCourant.telephone}</div>
			</div>
			<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Rue</span>
				</div>
				<div class="form-control">${utilisateurCourant.adresse.rue}</div>
			</div>
			<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Code Postal</span>
				</div>
				<div class="form-control">${utilisateurCourant.adresse.code_postal}</div>
			</div>
			<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Ville</span>
				</div>
				<div class="form-control">${utilisateurCourant.adresse.ville }</div>
			</div>
			<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
				<div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">Crédits</span>
				</div>
				<div class="form-control">${utilisateurCourant.credit }</div>
			</div>
		</div>
		<div class="form-group mt-3 text-center">
			<a href="${pageContext.request.contextPath}/SupprimerProfilServlet"
				class="btn btn-md mx-3 mb-2">Supprimer mon compte</a> <a
				href="${pageContext.request.contextPath}/modifierProfilServlet"
				class="btn btn-md mx-3 mb-2">Modifier mon compte</a> <a
				href="${pageContext.request.contextPath}/modifierMotDePasseServlet"
				class="btn btn-md mx-3 mb-2">Modifier mot de passe</a>
		</div>
	</div>


	<%@include file="/includes/footer.jsp"%>