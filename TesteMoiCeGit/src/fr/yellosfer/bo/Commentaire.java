package fr.yellosfer.bo;

public class Commentaire {

	private int idCommentaire;
	private String texteCommentaire;

	public Commentaire(int idCommentaire, String texteCommentaire) {
		this.idCommentaire = idCommentaire;
		this.texteCommentaire = texteCommentaire;
	}

	public Commentaire(String texteCommentaire) {

		this.texteCommentaire = texteCommentaire;
	}

	public Commentaire() {
	}

	public int getIdCommentaire() {
		return idCommentaire;
	}

	public void setIdCommentaire(int idCommentaire) {
		this.idCommentaire = idCommentaire;
	}

	public String getTexteCommentaire() {
		return texteCommentaire;
	}

	public void setTexteCommentaire(String texteCommentaire) {
		this.texteCommentaire = texteCommentaire;
	}

	@Override
	public String toString() {
		return "Commentaire [idCommentaire=" + idCommentaire + ", texteCommentaire=" + texteCommentaire + "]";
	}

}
