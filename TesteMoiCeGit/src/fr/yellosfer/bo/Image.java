/**
 * 
 */
package fr.yellosfer.bo;

/**
 * @author lroy2019
 *
 */
public class Image {
	private int idImage;
	private String pathImage;

	public Image(int idImage, String pathImage) {

		this.idImage = idImage;
		this.pathImage = pathImage;
	}

	public Image(String pathImage) {

		this.pathImage = pathImage;
	}

	public Image() {

	}

	public int getIdImage() {
		return idImage;
	}

	public void setIdImage(int idImage) {
		this.idImage = idImage;
	}

	public String getPathImage() {
		return pathImage;
	}

	public void setPathImage(String pathImage) {
		this.pathImage = pathImage;
	}

	@Override
	public String toString() {
		return "Image [idImage=" + idImage + ", pathImage=" + pathImage + "]";
	}

}
