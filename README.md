# Computer-Algebra
Authors: Jaime Corral Bueno, Rafael Herrera Troca, Guillermo Martín Sánchez

Computer Algebra algorithms implemented for the subject Computer Algebra of the Double Degree Computer Science and Mathematics in Universidad Complutense de Madrid (2019/20)

1. Euclid's Algorithm in an Euclidean Domain
  * Examples in Z, Z(i) and Fq[x] -> EuclidScript.m
  + Common version -> euclid.m
  + Extended version -> euclid_extended.m
  + Unique version -> euclid_u.m
  + Unique Extended version -> euclid_extended_u.m
 
2. Chinese Remainder Algorithm in a Euclidean Domain
  * Examples in Z, Z(i) y Fq[x] -> ChineseScript.m
  + Version 1 -> chinese_rem.m
  + Version 2 -> chinese_rem2.m 
  
3. GCD in a UFD[x] -> euclid_primitive.m
  * Examples in Z[x] -> MCDScript.m
  
4. Inverse in K[x] = Fq[x]/f -> inverse.m
  * Examples in Fq[x]/f -> InverseScript.m
  
5. Polynomial Irreducibility Test in Fq[x] -> ipt.m
  * Examples in Fq[x] -> IPTScript.m
  
6. Discrete logarithm in Fq[x]/f -> pollard_rho.m
  * Examples in Fq[x]/f -> LogarithmScript.m
  
7. Finite Field Factorization Alogirithm
  * Examples in Fq[x] -> FFFactorizationScript.m
  + Square free decomposition (SFD) -> sfd.m
  + Distinct degree factorization (DDF) -> ddf.m
  + Equal degree factorization (EDF) -> edf.m
  
8. Berlekamp Factorization Algorithm in finite fields -> berlekamp.m
  * Examples in Fq[x] -> BerlekampScript.m
  
9. Factorization Algorithms in Z[x] 
  * Examples in Z[x] -> ZFactorizationScript.m
  + Big prime factorization -> bigprimefact.m
  + Hensel lifting (Zassenhaus) -> zassenhaus.m
  
10. Primality test AKS -> aks.m
  * Examples in Z+ -> AKSScript.m
  
11. Primality test Miller-Rabin -> miller_rabin.m
  * Examples in Z+ -> MillerRabinScript.m
  
12. Multivariate polynomial division -> mult_div.m
  * Examples in Fq[x,y] with three monomial orders -> MultDivScript.m
  
13. Buchberger Algorithm (computation of a Gröbner basis) -> buchberger.m
  * Examples in Fq[x,y] with three monomial orders -> BuchbergerScript.m
  
14. Ideal Membership Algorithm -> ideal_member.m
  * Examples in Fq[x,y] with three monomial orders -> IdealMemberScript.m
  
15. GCD in P-adics -> Calling euclid.m and using the P-adic division implemented in Padics.m
  * Examples in Qp -> PadicEuclidScript.m
  
For the examples the next algebraic structures have been implemented:
  + Z -> Integers.m
  + Z[x] -> IntegerPoly.m
  + Z(i) -> GaussIntegers.m
  + Zn -> NIntegers.m
  + Fq[x] -> FiniteFieldPoly.m
  + Fq[x1,...,xn] -> FiniteFieldMultiPoly.m
  + Qp -> Padics.m
