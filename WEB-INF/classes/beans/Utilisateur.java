package beans;

import java.util.List;
import java.util.ArrayList;

public class Utilisateur {

	private String email;
	private String password;
	private String pseudo;
	private String role;
	private List<Utilisateur> contacts;
	private Profil profil;

	public Utilisateur() {
		contacts = new ArrayList<Utilisateur>();
		profil = new Profil();
	}

	public Utilisateur(String email, String password, String pseudo, String role) {
		this();
		this.email = email;
		this.password = password;
		this.pseudo = pseudo;
		this.role = role;
	}

	public Utilisateur(String email, String password, String pseudo, String role, List<Utilisateur> contacts) {
		this(email,password,pseudo,role);
		this.contacts = contacts;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return this.email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}

	public String getPseudo() {
		return this.pseudo;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getRole() {
		return this.role;
	}

	public void setContacts(List<Utilisateur> contacts) {
		this.contacts = contacts;
	}

	public List<Utilisateur> getContacts() {
		return this.contacts;
	}

	public void setProfil(Profil p) {
		this.profil = p;
	}

	public Profil getProfil() {
		return this.profil;
	}

	public String getJSON() {
		StringBuilder builder = new StringBuilder();
		builder.append("{");
		builder.append("\"email\" : \"" + email + "\",");
		builder.append("\"password\" : \"" + password + "\",");
		builder.append("\"pseudo\" : \"" + pseudo + "\",");
		builder.append("\"role\" : \"" + role + "\",");
		builder.append("\"contacts\" : [");
		for (int i = 0; i < contacts.size(); i++) {
			builder.append(contacts.get(i).getJSON());
			if (i != contacts.size()-1) {
				builder.append(",");
			}
		}
		builder.append("], ");
		builder.append("\"profil\" : " + profil.getJSON());
		builder.append("}");
		return builder.toString();
	}
}
