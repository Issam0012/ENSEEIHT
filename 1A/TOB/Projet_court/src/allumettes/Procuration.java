package allumettes;

/** La classe qui va servir comme proxy ou procuration pour détecter les triches
 * @author	Issam Alouane
 */

public class Procuration implements Jeu {
	
	// Le jeu d'allumettes qui va servir comme objet de procuration
	private Jeu jeu;
	
	// Le joueur en train de jouer
	private Joueur joueur;
	
	/** Construire une procuration à partir d'un jeu
	 * @param jeu
	 */
	public Procuration(Jeu jeu, Joueur joueur) {
		this.jeu = jeu;
		this.joueur = joueur;
	}
	
	/** Obtenir le nombre d'allumettes encore en jeu (une opération autorisé au joueur).
	 * @return nombre d'allumettes encore en jeu
	 */
	public int getNombreAllumettes() {
		return this.jeu.getNombreAllumettes();
	}
	
	/** Retirer un nombre d'allumettes du jeu, mais qui est une opération interdite au joueur donc on va lever
	 * OperationInterditeException
	 */
	public void retirer(int nbPrises) throws CoupInvalideException {
		
		throw new OperationInterditeException(joueur.getNom());
		
	}
	
}