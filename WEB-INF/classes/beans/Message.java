package beans;

import java.util.Date;

public class Message {

	private Utilisateur expediteur;
	private String contenu;
	private String image;
	private Date date;

	public Message() {}

	public Message(Utilisateur expediteur, String contenu, String image, Date date) {
		this.expediteur = expediteur;
		this.contenu = contenu;
		this.image = image;
		this.date = date;
	}

	public String getJSON() {
		StringBuilder builder = new StringBuilder();
		builder.append("{");
		builder.append("\"expediteur\" : " + expediteur.getJSON() + ",");
		builder.append("\"contenu\" : \"" + contenu + "\",");
		builder.append("\"image\" : \"" + image + "\",");
		builder.append("\"date\" : \"" + date + "\"");
		builder.append("}");
		return builder.toString();
	}
}