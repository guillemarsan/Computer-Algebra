# Computer-Algebra
Computer Algebra algorithms implemented for the subject Computer Algreba of the Double Degree Computer Science and Mathematics in Universidad Complutense de Madrid (2019/20)

1. Algoritmo de Euclides en un D.E.
  * Ejemplos en Z, Z(i) y Fq[x] -> EuclidScript.m
  + Versión usual -> euclid.m
  + Versión extendida -> euclid_extended.m
  + Versión única -> euclid_u.m
  + Versión extendida única -> euclid_extended_u.m
 
2. Algoritmo Chino del Resto en un D.E.
  * Ejemplos en Z, Z(i) y Fq[x] -> ChineseScript.m
  + Versión 1 -> chinese_rem.m
  + Versión 2 -> chinese_rem2.m 
  
3. MCD en un DFU[x] -> euclid_primitive.m
  * Ejemplos en Z[x] -> MCDScript.m
  
4. Inverso en K[x] = Fq[x]/f -> inverse.m
  * Ejemplos en Fq[x]/f -> InverseScript.m
  
5. Test de irreducibilidad de un polinomio en Fq[x] -> ipt.m
  * Ejemplos en Fq[x] -> IPTScript.m
  
6. Logaritmo discreto en Fq[x]/f -> pollard_rho.m
  * Ejemplos en Fq[x]/f -> LogarithmScript.m
  
7. Algoritmo de factorización en cuerpos finitos
  * Ejemplos en Fq[x] -> FFFactorizationScript.m
  + Square free decomposition (SFD) -> sfd.m
  + Distinct degree factorization (DDF) -> ddf.m
  + Equal degree factorization (EDF) -> edf.m
  
8. Algoritmo de factorización Berlekamp en cuerpos finitos -> berlekamp.m
  * Ejemplos en Fq[x] -> BerlekampScript.m
  
9. Algoritmos de factorización en Z[x] 
  * Ejemplos en Z[x] -> ZFactorizationScript.m
  + Big prime factorization -> bigprimefact.m
  + Hensel lifting (Zassenhaus) -> zassenhaus.m
  
10. Test primalidad AKS -> aks.m
  * Ejemplos en Z+ -> AKSScript.m
  
11. Test primalidad Miller-Rabin -> miller_rabin.m
  * Ejemplos en Z+ -> MillerRabinScript.m
  
12. División en polinomios de varias variables -> mult_div.m
  * Ejemplos en Fq[x,y] con tres órdenes monomiales -> MultDivScript.m
  
13. Algoritmo de Buchberger (cálculo de una base de Gröbner) -> buchberger.m
  * Ejemplos en Fq[x,y] con tres órdenes monomiales -> BuchbergerScript.m
  
14. Algoritmo de pertenencia a un ideal -> ideal_member.m
  * Ejemplos en Fq[x,y] con tres órdenes monomiales -> IdealMemberScript.m
  
15. MCD en P-ádicos -> Llamando a euclid.m y usando la división de p-ádicos implementada en Padics.m
  * Ejemplos en Qp -> PadicEuclidScript.m
  
Para ejecutar los ejemplos se han implementado las siguientes estructuras algebraicas:
  + Z -> Integers.m
  + Z[x] -> IntegerPoly.m
  + Z(i) -> GaussIntegers.m
  + Zn -> NIntegers.m
  + Fq[x] -> FiniteFieldPoly.m
  + Fq[x1,...,xn] -> FiniteFieldMultiPoly.m
  + Qp -> Padics.m
  
