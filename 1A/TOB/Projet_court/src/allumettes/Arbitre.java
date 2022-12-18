package allumettes;

/** La classe qui représente l'arbitre d'une partie
 * @author	Issam Alouane
 */

public class Arbitre {
	
	private Joueur joueur_1;
	private Joueur joueur_2;

	/** Construire un arbitre pour une partie entre 2 joueurs
	 * @param joueur_1 le premier joueur
	 * @param joueur_2 le deuxième joueur
	 */
	public Arbitre(Joueur joueur_1, Joueur joueur_2) {
		this.joueur_1 = joueur_1;
		this.joueur_2 = joueur_2;
	}
	
	
	/** Arbitrer une partie entre 2 joueurs
	 * @param jeu le jeu entre les deux joueurs
	 */
	public void arbitrer(Jeu jeu) {
		
		// Le pramètre joueurActuel indique le joueur qui va jouer
		Joueur joueurActuel = joueur_1;
		
		//variable qui indique qu'il n y a pas de triche
		boolean triche = false;
		
		while (jeu.getNombreAllumettes() > 0) {
			
			System.out.println(jeu.toString());
			
			if (joueurActuel == joueur_1) {
				
				joueurActuel = joueur_2;
				
				int indice = 0;
				
				try {
					indice = jouerAfficher( jeu, joueur_1);
				} catch (OperationInterditeException e) {
					System.out.println("Abandon de la partie car " + e.getNomTricheur() +" triche !");
					try {
						jeu.retirer(jeu.getNombreAllumettes());
					} catch (CoupInvalideException e1) {
						// instruction jamais exécuté
						e1.printStackTrace();
					}
				}
				
				if (indice == 1) {
				    joueurActuel = joueur_1;
				}
				
			} else {
				
				joueurActuel = joueur_1;
				
				int indice = 0;
				
				try {
					indice = jouerAfficher( jeu, joueur_2);
				} catch (OperationInterditeException e) {
					System.out.println("Abandon de la partie car " + e.getNomTricheur() +" triche !");
					try {
						while (jeu.getNombreAllumettes()>=Jeu.PRISE_MAX) {
							jeu.retirer(Jeu.PRISE_MAX);
						}
						jeu.retirer(jeu.getNombreAllumettes());
						triche = true;
					} catch (CoupInvalideException e1) {
						// instruction jamais exécuté
						e1.printStackTrace();
					}
				}
			
			    if (indice == 1) {
				    joueurActuel = joueur_2;
				}
		}
	}

		// L'affichage du vainqueur et du perdu
		Joueur vainqueur;
		Joueur perdu;
		if (joueurActuel == joueur_2) {
			vainqueur = joueur_2;
			perdu = joueur_1;
		} else {
			vainqueur = joueur_1;
			perdu = joueur_2;
		}
		
		if ( ! triche ) {
			System.out.println(perdu.getNom() + " perd !");
			System.out.println(vainqueur.getNom() + " gagne !");
		}
		
		
	}
	
	/** Retrouver le nombre de prises du joueur d'après son stratégie
	 * @param joueur le joueur qui va faire la prise
	 * @param jeu le jeu en cours
	 */
	private int priseStrategie(Joueur joueur, Jeu jeu) {
		
		int prise = 0;
		
		if (joueur.estHumain()) {
			prise = joueur.getPrise( (jeuAllumettes) jeu);
			
		} else if (joueur.estTricheur()) {
			if (((jeuAllumettes) jeu).getModeArbitre()) {  //si l'arbitre a confiance au joueur
				prise = joueur.getPrise( (jeuAllumettes) jeu);
			} else {
				Procuration procurationJeu = new Procuration( (jeuAllumettes) jeu, joueur);
				prise = joueur.getPrise(procurationJeu);
			}
			
		} else {
			prise = joueur.getPrise( (jeuAllumettes) jeu);
		}
		
		return prise;
	}
	
	/** afficher le message correspondant après un prise
	 * @param joueur le joueur qui a fait la prise
	 * @param prise la valeur du prise
	 */
	private void afficherPrise(Joueur joueur, int prise) {
		
		if (prise==1 || prise==0 || prise==-1) {
			System.out.println(joueur.getNom() + " prend "+ prise + " allumette.");
			
		} else {
			System.out.println(joueur.getNom() + " prend "+ prise + " allumettes.");
		}
	}
	
	/** Donner le droit au joueur actuel de joueret afficher les messages correspondants
	 * @param jeu le jeu en cours
	 * @param joueur le joueur qui joue à ce moment
	 * @return un entier qui va indiquer le rôle de qui
	 */
	public int jouerAfficher(Jeu jeu, Joueur joueur) {
		
		int prise = priseStrategie(joueur, jeu);
		
		afficherPrise(joueur, prise);
		
		try {
			jeu.retirer(prise);
		} catch (CoupInvalideException e) {
			System.out.println("Impossible ! Nombre invalide : " + prise + e.getProbleme());
			System.out.println();
			return 1;
		}
		
		System.out.println();
		return 0;
	}
	
}
