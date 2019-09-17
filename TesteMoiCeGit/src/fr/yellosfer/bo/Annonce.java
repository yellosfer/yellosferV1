/**
 * 
 */
package fr.yellosfer.bo;

import java.time.LocalDate;

/**
 * @author lroy2019
 *
 */
public class Annonce {
	private int idAnnonce;
	private String titreAnnonce;
	private String descriptionAnnonce;
	private LocalDate dateCreationAnnonce;
	private int nbJaimeAnnonce;
	private int nbJaimePasAnnonce;
	private int nbPartageAnnonce;
	private int positionAnnonce;
	private boolean actifAnnonce;

	public Annonce(int idAnnonce, String titreAnnonce, String descriptionAnnonce, LocalDate dateCreationAnnonce,
			int nbJaimeAnnonce, int nbJaimePasAnnonce, int nbPartageAnnonce, int positionAnnonce,
			boolean actifAnnonce) {
		this.idAnnonce = idAnnonce;
		this.titreAnnonce = titreAnnonce;
		this.descriptionAnnonce = descriptionAnnonce;
		this.dateCreationAnnonce = dateCreationAnnonce;
		this.nbJaimeAnnonce = nbJaimeAnnonce;
		this.nbJaimePasAnnonce = nbJaimePasAnnonce;
		this.nbPartageAnnonce = nbPartageAnnonce;
		this.positionAnnonce = positionAnnonce;
		this.actifAnnonce = actifAnnonce;
	}

	public Annonce(String titreAnnonce, String descriptionAnnonce, LocalDate dateCreationAnnonce, int nbJaimeAnnonce,
			int nbJaimePasAnnonce, int nbPartageAnnonce, int positionAnnonce, boolean actifAnnonce) {

		this.titreAnnonce = titreAnnonce;
		this.descriptionAnnonce = descriptionAnnonce;
		this.dateCreationAnnonce = dateCreationAnnonce;
		this.nbJaimeAnnonce = nbJaimeAnnonce;
		this.nbJaimePasAnnonce = nbJaimePasAnnonce;
		this.nbPartageAnnonce = nbPartageAnnonce;
		this.positionAnnonce = positionAnnonce;
		this.actifAnnonce = actifAnnonce;
	}

	public Annonce() {
	}

	public int getIdAnnonce() {
		return idAnnonce;
	}

	public void setIdAnnonce(int idAnnonce) {
		this.idAnnonce = idAnnonce;
	}

	public String getTitreAnnonce() {
		return titreAnnonce;
	}

	public void setTitreAnnonce(String titreAnnonce) {
		this.titreAnnonce = titreAnnonce;
	}

	public String getDescriptionAnnonce() {
		return descriptionAnnonce;
	}

	public void setDescriptionAnnonce(String descriptionAnnonce) {
		this.descriptionAnnonce = descriptionAnnonce;
	}

	public LocalDate getDateCreationAnnonce() {
		return dateCreationAnnonce;
	}

	public void setDateCreationAnnonce(LocalDate dateCreationAnnonce) {
		this.dateCreationAnnonce = dateCreationAnnonce;
	}

	public int getNbJaimeAnnonce() {
		return nbJaimeAnnonce;
	}

	public void setNbJaimeAnnonce(int nbJaimeAnnonce) {
		this.nbJaimeAnnonce = nbJaimeAnnonce;
	}

	public int getNbJaimePasAnnonce() {
		return nbJaimePasAnnonce;
	}

	public void setNbJaimePasAnnonce(int nbJaimePasAnnonce) {
		this.nbJaimePasAnnonce = nbJaimePasAnnonce;
	}

	public int getNbPartageAnnonce() {
		return nbPartageAnnonce;
	}

	public void setNbPartageAnnonce(int nbPartageAnnonce) {
		this.nbPartageAnnonce = nbPartageAnnonce;
	}

	public int getPositionAnnonce() {
		return positionAnnonce;
	}

	public void setPositionAnnonce(int positionAnnonce) {
		this.positionAnnonce = positionAnnonce;
	}

	public boolean isActifAnnonce() {
		return actifAnnonce;
	}

	public void setActifAnnonce(boolean actifAnnonce) {
		this.actifAnnonce = actifAnnonce;
	}

	@Override
	public String toString() {
		return "Annonce [idAnnonce=" + idAnnonce + ", titreAnnonce=" + titreAnnonce + ", descriptionAnnonce="
				+ descriptionAnnonce + ", dateCreationAnnonce=" + dateCreationAnnonce + ", nbJaimeAnnonce="
				+ nbJaimeAnnonce + ", nbJaimePasAnnonce=" + nbJaimePasAnnonce + ", nbPartageAnnonce=" + nbPartageAnnonce
				+ ", positionAnnonce=" + positionAnnonce + ", actifAnnonce=" + actifAnnonce + "]";
	}
}
