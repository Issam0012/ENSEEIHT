(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.

(* Why3 assumption *)
Inductive liste (a:Type) :=
  | Nil : liste a
  | Cons : a -> (liste a) -> liste a.
Axiom liste_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (liste a).
Existing Instance liste_WhyType.
Arguments Nil {a}.
Arguments Cons {a}.

(* Why3 assumption *)
Fixpoint append {a:Type} {a_WT:WhyType a} (l1:liste a)
  (l2:liste a) {struct l1}: liste a :=
  match l1 with
  | Nil => l2
  | Cons t q => Cons t (append q l2)
  end.

Axiom append_Nil_left :
  forall {a:Type} {a_WT:WhyType a},
  forall (l:liste a), ((append (Nil : liste a) l) = l).

Axiom append_Cons_left :
  forall {a:Type} {a_WT:WhyType a},
  forall (e:a), forall (l1:liste a) (l2:liste a),
  ((append (Cons e l1) l2) = (Cons e (append l1 l2))).

Axiom append_Nil_right :
  forall {a:Type} {a_WT:WhyType a},
  forall (l:liste a), ((append l (Nil : liste a)) = l).

(* Why3 goal *)
Theorem append_associative {a:Type} {a_WT:WhyType a} :
  forall (l1:liste a) (l2:liste a) (l3:liste a),
  ((append l1 (append l2 l3)) = (append (append l1 l2) l3)).
Proof.
intros l1 l2 l3.
induction l1.
tauto.
simpl.
rewrite IHl1.
reflexivity.

Qed.

