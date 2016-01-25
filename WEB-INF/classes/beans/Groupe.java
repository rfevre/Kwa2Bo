package beans;

import java.util.List;
import java.util.ArrayList;

public class Groupe {
	private int idGroupe;
	private String nom;
	private List<Utilisateur> participants;
	private List<Message> messages;

	public Groupe() {
		participants = new ArrayList<Utilisateur>();
		messages = new ArrayList<Message>();
	}

	public Groupe(int idGroupe, String nom) {
		this();
		this.idGroupe = idGroupe;
		this.nom = nom;
	}

	public Groupe(int idGroupe, String nom, List<Utilisateur> participants) {
		this(idGroupe, nom);
		this.participants = participants;
	}
	public Groupe(int idGroupe, String nom, List<Utilisateur> participants, List<Message> messages) {
		this(idGroupe, nom, participants);
		this.participants = participants;
		this.messages = messages;
	}

	public void setIdGroupe(int idGroupe) {
		this.idGroupe = idGroupe;
	}

	public int getIdGroupe() {
		return this.idGroupe;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getNom() {
		return this.nom;
	}

	public void setParticipants(List<Utilisateur> participants) {
		this.participants = participants;
	}

	public List<Utilisateur> getParticipants() {
		return this.participants;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public List<Message> getMessages() {
		return this.messages;
	}

	public String getJSON() {
		StringBuilder builder = new StringBuilder();
		builder.append("{");
		builder.append("\"idGroupe\" : " + idGroupe + ",");
		builder.append("\"nom\" : \"" + nom + "\",");
		builder.append("\"participants\" : [");
		for (int i = 0; i < participants.size(); i++) {
			builder.append(participants.get(i).getJSON());
			if (i != participants.size()-1) {
				builder.append(",");
			}
		}
		builder.append("],");
		builder.append("\"messages\" : [");
		for (int i = 0; i < messages.size(); i++) {
			builder.append(messages.get(i).getJSON());
			if (i != messages.size()-1) {
				builder.append(",");
			}
		}
		builder.append("]");
		builder.append("}");
		return builder.toString();
	}
}
