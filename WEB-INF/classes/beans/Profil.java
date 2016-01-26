package beans;

import java.util.List;
import java.util.ArrayList;

public class Profil {

	private String nom;
	private String prenom;
	private String photo;

	public Profil() { }

	public Profil(String nom, String prenom, String photo) {
		this();
		this.nom = nom;
		this.prenom = prenom;
		this.photo = photo;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getNom() {
		return this.nom;
	}

  public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getPrenom() {
		return this.prenom;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getPhoto() {
		return this.photo;
	}

	public String getJSON() {
		StringBuilder builder = new StringBuilder();
		builder.append("{");
		builder.append("\"nom\" : \"" + nom + "\",");
		builder.append("\"prenom\" : \"" + prenom + "\",");
		builder.append("\"photo\" : \"" + photo + "\"");
		builder.append("}");
		return builder.toString();
	}
}
