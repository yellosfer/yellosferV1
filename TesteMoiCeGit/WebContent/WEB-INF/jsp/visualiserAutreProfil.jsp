<%@include file="/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/param.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/visualiserAutreProfil.css">

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
		<div class="page-header text-center  mb-3">
			<h1>Profil de ${utilisateurAutre.pseudo}</h1>
			<hr>
		</div>
		<div class="row mb-3">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">${message}</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12"></div>
		</div>

		<form>
			<div class="row">
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Pseudo</span>
					</div>
					<div class="form-control">${utilisateurAutre.pseudo }</div>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Nom</span>
					</div>
					<div class="form-control">${utilisateurAutre.nom }</div>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Prénom</span>
					</div>
					<div class="form-control">${utilisateurAutre.prenom }</div>
				</div>
				<div class="input-group mb-3 col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">Email</span>
					</div>
					<div class="form-control">${utilisateurAutre.email }</div>
				</div>
				
			</div>
		</form>
		<div>
			<a href="javascript:history.back()" class="btn btn-md mb-2">Retour</a>
		</div>
	</div>


	<%@include file="/includes/footer.jsp"%>