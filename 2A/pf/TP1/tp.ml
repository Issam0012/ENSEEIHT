open Graphics 
open Affichage

(* Exercice 2 *)
(*  
   coeff_directeur : float*float -> float*float -> float
   calcule le coefficient directeur de la droite représentée par deux points
   Parametre (x1, y1) : float*float, le premier point
   Parametre (x2, y2) : float*float, le second point
   Resultat : float, le coefficient directeur de la droite passant par
   (x1, y1) et (x2, y2)
*)

let coeff_directeur (x1,y1) (x2,y2) = if x1 = x2 then failwith "Infini" else (y2-.y1)/.(x2-.x1);;

let%test _ = coeff_directeur (0., 0.) (1., 2.) = 2.
let%test _ = coeff_directeur (1., 2.) (0., 0.) = 2.
let%test _ = coeff_directeur (0., 0.) (2., 1.) = 0.5
let%test _ = coeff_directeur (0., 0.) (-2., 1.) = -0.5
let%test _ = coeff_directeur (1., 2.) (2., 1.) = -1.


(* Exercice 3 *)
(* Les contrats et tests des fonctions ne sont pas demandés *)
(* f1 : int * int -> bool *)
(* f2 : int -> bool *)
(* f3 : 'a -> `a *)
(* f4 : `a * `a -> bool *)
(* f5 : `a*`b -> `a*)
let f1 (x,y) = x-0<y;;
let f2 x = x<5;;
let f3 x = x;;
let f4 (x,y) = x<y;;
(*let f5 (x,y) = x;;*)

(* Exercice 4 *)
(* ieme : TO DO type *)
(* renvoie le ième élément d'un triplet *)
(* t : le triplet *)
(* i : l'indice de l'élèment dans le triplet *)
(* renvoie le ième élément t *)
(* précondition : 1 =< i =< 3 *)

let ieme t i = match t with | (x,y,z) ->
   match i with
| 1 -> x
| 2 -> y
| 3 -> z
| _ -> failwith "ça doit être entre 1 et 3" 

let%test _ = ieme (5,60,7) 1 = 5
let%test _ = ieme (5,60,17) 2 = 60
let%test _ = ieme (5,60,17) 3 = 17
let%test _ = ieme ('r','e','l') 1 = 'r'
let%test _ = ieme ('r','e','l') 2 = 'e'
let%test _ = ieme ('r','e','l') 3 = 'l'


(* Exercice 5 *)
(* PGCD -> pgcd.ml *)
let pgcd a b =
   let rec pgcd_pos x y =
     if (x=y) then x else if (x>y) then (pgcd_pos (x-y) y) else (pgcd_pos x (y-x));
   in (pgcd_pos (abs a) (abs b));;


(* Exercice 6 *)
(*  padovan : int -> int
Fonction qui calcule la nième valeur de la suite de Padovan : u(n+3) = u(n+1) + u(n); u(2)=1, u(1)=u(0)=0 
Paramètre n : un entier représentant la nième valeur à calculer
Précondition : n >=0
Résultat : un entier la nième valeur de la suite de Padovan 
*)

(* version naive *)
(*let rec padovan n = match n with 
| 0 -> 0
| 1 -> 0
| 2 -> 1
| _ -> (padovan (n-2)) + (padovan (n-3))*)

(* version amélioré *)
let padovan n =
   match n with 
   | 0 -> 0
   | 1 -> 0
   | _ ->
   (let rec padovan_rec i padovani padovanii padovaniii =
     if i = n then padovani else padovan_rec (i+1) (padovanii+padovaniii) padovani padovanii ;
   in padovan_rec 2 1 0 0);;

let%test _ = padovan 0 = 0
let%test _ = padovan 1 = 0 
let%test _ = padovan 2 = 1
let%test _ = padovan 3 = 0
let%test _ = padovan 4 = 1
let%test _ = padovan 5 = 1
let%test _ = padovan 6 = 1
let%test _ = padovan 7 = 2
let%test _ = padovan 8 = 2
let%test _ = padovan 9 = 3
let%test _ = padovan 10 = 4

(* Exercice 7 *)
(* estPremier : int -> bool
fonction qui indique si un nombre est premier
Paramètre n : un entier naturel dont on doit dire s'il est premier ou pas
Précondition : n >= 0
Résultat : l'information de si n est premier ou pas
*)

let estPremier n = if n=0 || n=1 then false else
   let rec divise i n =
      if i*i > n then true
      else if (n mod i) = 0 then false 
      else false || (divise (i+1) n)
   in divise 2 n

let%test _ = estPremier 2
let%test _ = estPremier 3 
let%test _ = not (estPremier 4)
let%test _ = estPremier 5
let%test _ = not (estPremier 6)
let%test _ = estPremier 7
let%test _ = not (estPremier 8)
let%test _ = not (estPremier 9)
let%test _ = not (estPremier 10)
let%test _ = not (estPremier 0)
let%test _ = not (estPremier 1)

(*****************************)
(****** Bonus "ludique" ******)
(*****************************)


(*  Création de l'écran d'affichage *)
let _ = open_graph " 800x600"

(* Exercice 8 *)
(*  
   dragon : (int*int) -> (int*int) -> int -> unit
   Dessine la courbe du dragon à partir de deux points et d'une précision.
   Parametre (xa,ya) : (int*int), coordonnées de la première extrémité du dragon
   Paramètre (xb,yb) : (int*int), coordonnées de la seconde extrémité du dragon
   Paramètre n : nombre d'itération (plus n est grand, plus la courbe aura de détails)
   Resultat : unit, affichage de la courbe du dragon sur l'écran
   Précondition : n positif ou nul
*)



let rec dragon (xa,ya) (xb,yb) n = 
   if n = 0 then begin dessine_segment (xa,ya) (xb,yb) end
   else
      let (xc,yc) = ((xa+xb)/2 +(yb-ya)/2 ,(ya+yb)/2 + (xa-xb)/2) in
         dragon (xa,ya) (xc,yc) (n-1);
         dragon (xb,yb) (xc,yc) (n-1)

let%test_unit _ = dragon (200,350) (600,350) 20;



(*  Fermeture de l'écran d'affichage *)
close_graph() 
