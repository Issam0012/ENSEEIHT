(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require int.Int.

(* Why3 assumption *)
Inductive ref (a:Type) :=
  | mk_ref : a -> ref a.
Axiom ref_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (ref a).
Existing Instance ref_WhyType.
Arguments mk_ref {a}.

(* Why3 assumption *)
Definition contents {a:Type} {a_WT:WhyType a} (v:ref a) : a :=
  match v with
  | mk_ref x => x
  end.

Parameter pgcd: Z -> Z -> Z.

Axiom pgcd_euclide :
  forall (a:Z) (b:Z), (b < a)%Z -> ((pgcd a b) = (pgcd (a - b)%Z b)).

Axiom pgcd_identite : forall (a:Z), ((pgcd a a) = a).

Axiom pgcd_sym : forall (a:Z) (b:Z), ((pgcd a b) = (pgcd b a)).

Parameter a: Z.

Parameter b: Z.

Axiom H : (0%Z < a)%Z.

Axiom H1 : (0%Z < b)%Z.

Parameter bp: Z.

Parameter ap: Z.

Axiom H2 : ((pgcd a b) = (pgcd ap bp)).

Axiom H3 : (0%Z <= bp)%Z.

Axiom H4 : (0%Z <= ap)%Z.

Axiom H5 : ((ap - bp)%Z < (ap + bp)%Z)%Z.

Axiom H6 : (((ap + bp)%Z - ap)%Z < (ap + bp)%Z)%Z.

Axiom H7 : ~ (ap = bp).

Axiom H8 : ~ (ap <= bp)%Z.

Parameter ap1: Z.

Axiom H9 : (ap1 = (ap - bp)%Z).

(* Why3 goal *)
Theorem VC_pgcd_euclide :
  (0%Z <= (ap + bp)%Z)%Z /\ ((ap1 + bp)%Z < (ap + bp)%Z)%Z.
Proof.


Qed.

