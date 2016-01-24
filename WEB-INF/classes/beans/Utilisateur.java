package beans;

public class Utilisateur {

	private String email;
	private String password;
	private String pseudo;

	public Utilisateur() {}

	public Utilisateur(String email, String password, String pseudo) {
		this.email = email;
		this.password = password;
		this.pseudo = pseudo;
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

	public String getJSON() {
		StringBuilder builder = new StringBuilder();
		builder.append("{");
		builder.append("\"email\" : \"" + email + "\",");
		builder.append("\"password\" : \"" + password + "\",");
		builder.append("\"pseudo\" : \"" + pseudo + "\"");
		builder.append("}");
		return builder.toString();
	}
}