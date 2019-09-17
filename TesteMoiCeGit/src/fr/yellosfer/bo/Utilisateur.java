package fr.yellosfer.bo;

import java.time.LocalDate;

public class Utilisateur {

	private int idUtilisateur;
	private String imageUtilisateur;
	private String pseudoUtilisateur;
	private String prenomUtilisateur;
	private String nomUtilisateur;
	private String emailUtilisateur;
	private String mdpUtilisateur;
	private LocalDate dateInscriptionUtilisateur;
	private int meilleurPositionUtilisateur;
	private int nombreAnnonceUtilisateur;
	private boolean actifUtilisateur;

	public Utilisateur(int idUtilisateur, String imageUtilisateur, String pseudoUtilisateur, String prenomUtilisateur,
			String nomUtilisateur, String emailUtilisateur, String mdpUtilisateur, LocalDate dateInscriptionUtilisateur,
			int meilleurPositionUtilisateur, int nombreAnnonceUtilisateur, boolean actifUtilisateur) {
		this.idUtilisateur = idUtilisateur;
		this.imageUtilisateur = imageUtilisateur;
		this.pseudoUtilisateur = pseudoUtilisateur;
		this.prenomUtilisateur = prenomUtilisateur;
		this.nomUtilisateur = nomUtilisateur;
		this.emailUtilisateur = emailUtilisateur;
		this.mdpUtilisateur = mdpUtilisateur;
		this.dateInscriptionUtilisateur = dateInscriptionUtilisateur;
		this.meilleurPositionUtilisateur = meilleurPositionUtilisateur;
		this.nombreAnnonceUtilisateur = nombreAnnonceUtilisateur;
		this.actifUtilisateur = actifUtilisateur;
	}

	public Utilisateur() {
	}

	public Utilisateur(String imageUtilisateur, String pseudoUtilisateur, String prenomUtilisateur,
			String nomUtilisateur, String emailUtilisateur, String mdpUtilisateur, LocalDate dateInscriptionUtilisateur,
			int meilleurPositionUtilisateur, int nombreAnnonceUtilisateur, boolean actifUtilisateur) {
		this.imageUtilisateur = imageUtilisateur;
		this.pseudoUtilisateur = pseudoUtilisateur;
		this.prenomUtilisateur = prenomUtilisateur;
		this.nomUtilisateur = nomUtilisateur;
		this.emailUtilisateur = emailUtilisateur;
		this.mdpUtilisateur = mdpUtilisateur;
		this.dateInscriptionUtilisateur = dateInscriptionUtilisateur;
		this.meilleurPositionUtilisateur = meilleurPositionUtilisateur;
		this.nombreAnnonceUtilisateur = nombreAnnonceUtilisateur;
		this.actifUtilisateur = actifUtilisateur;
	}

	public int getIdUtilisateur() {
		return idUtilisateur;
	}

	public void setIdUtilisateur(int idUtilisateur) {
		this.idUtilisateur = idUtilisateur;
	}

	public String getImageUtilisateur() {
		return imageUtilisateur;
	}

	public void setImageUtilisateur(String imageUtilisateur) {
		this.imageUtilisateur = imageUtilisateur;
	}

	public String getPseudoUtilisateur() {
		return pseudoUtilisateur;
	}

	public void setPseudoUtilisateur(String pseudoUtilisateur) {
		this.pseudoUtilisateur = pseudoUtilisateur;
	}

	public String getPrenomUtilisateur() {
		return prenomUtilisateur;
	}

	public void setPrenomUtilisateur(String prenomUtilisateur) {
		this.prenomUtilisateur = prenomUtilisateur;
	}

	public String getNomUtilisateur() {
		return nomUtilisateur;
	}

	public void setNomUtilisateur(String nomUtilisateur) {
		this.nomUtilisateur = nomUtilisateur;
	}

	public String getEmailUtilisateur() {
		return emailUtilisateur;
	}

	public void setEmailUtilisateur(String emailUtilisateur) {
		this.emailUtilisateur = emailUtilisateur;
	}

	public String getMdpUtilisateur() {
		return mdpUtilisateur;
	}

	public void setMdpUtilisateur(String mdpUtilisateur) {
		this.mdpUtilisateur = mdpUtilisateur;
	}

	public LocalDate getDateInscriptionUtilisateur() {
		return dateInscriptionUtilisateur;
	}

	public void setDateInscriptionUtilisateur(LocalDate dateInscriptionUtilisateur) {
		this.dateInscriptionUtilisateur = dateInscriptionUtilisateur;
	}

	public int getMeilleurPositionUtilisateur() {
		return meilleurPositionUtilisateur;
	}

	public void setMeilleurPositionUtilisateur(int meilleurPositionUtilisateur) {
		this.meilleurPositionUtilisateur = meilleurPositionUtilisateur;
	}

	public int getNombreAnnonceUtilisateur() {
		return nombreAnnonceUtilisateur;
	}

	public void setNombreAnnonceUtilisateur(int nombreAnnonceUtilisateur) {
		this.nombreAnnonceUtilisateur = nombreAnnonceUtilisateur;
	}

	public boolean isActifUtilisateur() {
		return actifUtilisateur;
	}

	public void setActifUtilisateur(boolean actifUtilisateur) {
		this.actifUtilisateur = actifUtilisateur;
	}

	@Override
	public String toString() {
		return "Utilisateur [idUtilisateur=" + idUtilisateur + ", imageUtilisateur=" + imageUtilisateur
				+ ", pseudoUtilisateur=" + pseudoUtilisateur + ", prenomUtilisateur=" + prenomUtilisateur
				+ ", nomUtilisateur=" + nomUtilisateur + ", emailUtilisateur=" + emailUtilisateur + ", mdpUtilisateur="
				+ mdpUtilisateur + ", dateInscriptionUtilisateur=" + dateInscriptionUtilisateur
				+ ", meilleurPositionUtilisateur=" + meilleurPositionUtilisateur + ", nombreAnnonceUtilisateur="
				+ nombreAnnonceUtilisateur + ", actifUtilisateur=" + actifUtilisateur + "]";
	}
}
