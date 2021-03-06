# TFG
Trabajo de Fin de Grado

## Resumen

En este trabajo se presenta la disciplina del aprendizaje de métricas de distancia, y se analiza teóricamente sus fundamentos, junto con los principales algoritmos de aprendizaje utilizados en esta disciplina. Además, se presenta un software que recoge todos los algoritmos estudiados, que ha sido utilizado además para elaborar diferentes experimentos sobre estos algoritmos.

En primer lugar se introducen los principales fundamentos matemáticos en los que se basa el aprendizaje de métricas de distancia. Estos fundamentos se presentan en tres bloques diferenciados. El primero de ellos es el análisis convexo, fundamental en la mayoría de las funciones a optimizar dentro de los algoritmos estudiados. En segundo lugar se presenta un estudio detallado de algunos aspectos de las matrices, haciendo especial hincapié en las matrices semidefinidas y la optimización por vectores propios. Este estudio será de gran importancia a la hora de modelar el problema. Por último, se presentan algunos conceptos de la teoría de la información, presentes en varios de los algoritmos estudiados.

En el análisis teórico del aprendizaje de métricas de distancia se recuerda, en primer lugar, el concepto de distancia, destacando las distancias de Mahalanobis, las cuales permitirán parametrizar los problemas a estudiar. A continuación se presenta el problema de aprendizaje, y cómo modelarlo, junto con algunas de sus principales aplicaciones. Finalmente se presenta el concepto de aprendizaje por semejanza, una familia de algoritmos de aprendizaje que utilizan distancias para lograr sus objetivos, y para las cuales el aprendizaje de métricas de distancia es de gran importancia. Finalmente se analizan teóricamente los algoritmos presentados, explicando su objetivo, la función que pretenden optimizar y los métodos de resolución que emplean.

Por último se presenta el software desarrollado, con sus principales características y ejemplos, y se describen los experimentos realizados, junto con los resultados obtenidos.

**Palabras clave:** aprendizaje de métricas de distancia, aprendizaje automático, clasificación, distancia de Mahalanobis, dimensionalidad, vecinos cercanos, semejanza, matrices, análisis convexo.

## Abstract

In this work we study the distance metric learning model, and we analyze its theoretical foundations, together with the main distance metric learning algorithms proposed over the years. Also, we present a software that collects all the studied algorithms. This software has also been used to develop several experiments to evaluate these algorithms.

### Description of the addressed problem

The distance metric learning problem consists in learning distances from the data. The use of distances in machine learning is present since its inception. The distances provide a similarity measure between the data, so that near data are considered similar, while remote data will be considered non-similar. One of the most popular examples of this similarity learning is the well-known nearest neighbors rule for classification, where a new sample is labeled with the majority class in the training set nearest neighbors of the sample.

Similarity learning algorithms have commonly used standard distances, like Euclidean distance, in its learning process. However, a standard distance may ignore some important properties available in our dataset, so that the learning results could be non optimal. Distance metric learning algorithms try to learn an optimal distance from the data, in order to be used later in other learning tasks.

Learning an abstract distance can be approachless, from a computational perspective. That is why in distance metric learning, a particular family of distance are considered: Mahalanobis distances. It will be shown that these distances can be easily parameterized, hence their importance.

Several distance metric learning algorithms will also be studied in this work, from some of the classical distance metric learning algorithms, that are still popular nowadays, to some of the newest proposals and classic techniques improvements. These algorithms have been grouped in: dimensionality reduction techniques, nearest neighbors oriented techniques, nearest centroids oriented techniques, information theory based algorithms, and kernel based techniques.

Some of the mathematical foundations underlying distance metric learning and its algorithms will be shown. They are grouped in three main blocks. Firstly, a few notions of convex analysis will be presented. Convex analysis is essential in most of the studied algorithms. Secondly, a deep study of some matrix aspects is provided, highlighting the positive semidefinite matrices and some results about eigenvalues and eigenvectors optimization. These results will help to model the distance metric learning problem. Finally, a few concepts about information theory will be explained. These concepts are present in the information theory based algorithms.

At the end, this document will present the developed software. This software collects all the studied algorithms, and it is implemented in Python (pyDML), providing also a wrapper for the R language (rDML). The main features of the software will be shown, with some examples. Finally, a few experiments made using pyDML are described, with their results.

### Theoretical framework

Distance metric learning has its main mathematical foundations in three areas: convex analysis, matrix analysis and information theory.

In convex analysis it is important to remark some geometric properties of the convex sets. It is well-known that convex sets are those that verify that every line between two points in the set is contained in it. An important characterization of convex sets is given by the supporting hyperplane theorem, which states that every closed convex set allows a supporting hyperplane in each point at the boundary. Another important property of convex sets is the convex projection theorem, which states that projections onto a convex set are well defined, for any point in the space we are working.

A remarkable family of convex sets is the family of cones, that is, sets that are closed under non-negative linear combinations. Some of their properties, such as the ability of defining an order, will be analyzed. Several properties about convex functions will also be remembered, highlighting Jensen's inequality, which relates convex functions and integration, and will be needed for information theory. Finally, optimization problems will be presented, focusing on constrained problems and convex problems, and providing some basic solving methods, such as the projected gradient descent, and the iterated projections method.

About matrices, firstly, the Frobenius norm will be introduced, which endows the matrix set with a Hilbert space structure. This structure allows to see the positive semidefinite matrix set as a cone, and take projections onto this cone. This projections can be calculated explicitly, thanks to the semidefinite projection theorem. Many other interesting properties about the descomposition of positive semidefinite matrices will be shown, that will allow to model the distance metric learning problem in different ways. Powerful tools about positive semidefinite matrices will be introduced as well, such as square roots or the module. To conclude this section, some optimization problems that can be solved via eigenvectors will be studied. These problems will be used by several distance metric learning algorithms.

Finally, a few notions about information theory are given, focusing on divergences. Divergences are a concept similar to distance but weaker, requiring only non-negativeness and coincidence properties. Two important divergences in information theory are the Kullback-Leibler divergence and the Jeffrey divergence. These divergences can measure similarity between different probability distributions and will be used by some of the studied algorithms for optimization. To conclude, an easy calculation of these divergences for gaussian distributions is provided.

### Distance metric learning and algorithms

As said above, distance metric learning consists in learning a distance from the data, and the way the distances are learned is using Mahalanobis distances. This pseudodistances depend on a positive semidefinite matrix $M$ and are defined by $d(x,y) = \sqrt{(x-y)^TM(x-y)}$. The studied decomposition theorems show that exists a matrix $L$ so that $M = L^TL$, and $L$ is unique up to isommetries. In this case, $d(x,y) = \|L(x-y)\|_2$. So, we can learn a distance either learning a positive semidefinite matrix $M$ that defines a Mahalanobis metric, or learning a linear map matrix $L$. In this case, the distance learned equals to the euclidean distance after applying the map.

Focusing on supervised learning, distance metric learning problems consist on optimizing a function of a mahalanobis distance, that depends on the training set and its labels. This function can be viewed as a function of $M$ or a function of $L$. Both approaches are valid and each one has particular advantages. Distance metric learning has applications in improving distance based classifiers and similarity learning algorithms in general, in dimensionality reduction and even in non-supervised and semi-supervised learning.

The dimensionality reduction algorithms studied in this work are PCA, LDA and ANMM. PCA is an important dimensionality reduction technique that finds directions that maximize the variance. Even it is not supervised, it is useful in other supervised techniques that don't allow dimensionality reduction. LDA is a supervised technique similar to the PCA's idea. In this case, LDA maximizes a ratio that involves between-class variances and within-class variances. ANMM is another dimensionality reduction technique that defines the concept of \emph{average neighborhood margin} and maximizes it.

Two of the most important nearest neighbors oriented techniques are LMNN and NCA. The first one defines the \emph{target neighbors}, the candidates to be nearest neighbors after learning the distance, and the \emph{impostors}, the samples that invade a perimeter defined by the target neighbors. LMNN learns a distance that tries to bring near the target neighbors, while keeping away the impostors. In the other hand, NCA optimization consists in maximizing the expected leave one out score for nearest neighbors classification.

Nearest centroid classifiers are also similarity learning algorithms. They are simplier than the nearest neighbors classifier. The algorithms NCMML and NCMC try to improve this kind of classifiers, both optimizaing an expected score function. The first is oriented to the nearest class mean classifier, while the second one allows multiple centroids in each class.

Information theory based algorithms try to optimize functions that depend on a divergence. In this type of techniques we include ITML, DMLMJ and MCML. ITML minimizes the Kullback-Leibler divergence to an initial gaussian distribution, with similarity constraints for same-class data, and dissimilarity constraints for different-class data. DMLMJ maximizes the Jeffrey divergence between the distributions associated to \emph{positive difference spaces} and \emph{negative difference spaces}, which contain the differences between same-class data and different-class data, respectively. Finally, MCML minimizes the Kullback-Leibler divergence to an ideal distribution where same-class samples collapse into a point, and different class points are infinitely far away.

Finally, some of these algorithms can work in high dimensional Hilbert spaces thanks to the kernel trick. In this way, the kernel versions for LDA, ANMM, DMLMJ and LMNN have been studied. Other algorithms, that are not enclosed in any of the previous algorithm groups, are also included in this work: LSI, DML-eig and LDML.

### Software implementation and experiments

Together with the theoretical analysis of distance metric learning, two software packages have been developed. This packages make all the algorithms studied available for the user. The first package is \texttt{pyDML}, a library for Python. Python is a programming language widely used for machine learning. A lot of machine learning libraries are available for this language, specially Scikit-Learn, an efficient library with powerful machine learning tools. However, there is not any complete distance metric learning library, hence this choice.

The pyDML software is easy to use, and follows the same scheme as the Scikit-Learn algorithms. It allows to use all the distance metric learning algorithms studied in this work, and it also provides utilities such as distance based classifiers, tuning functions or distance regions plotting. In this document, the main structure of the software is introduced, with some examples and links to the full documentation.

In relation to the second software package, it has been made for the R programmming language, and called \texttt{rDML}. R is another library widely used for machine learning, and neither has a complete distance metric learning library. The rDML is a wrapper for pyDML. In this document the main features of rDML are also shown.

Finally, this work presents a battery of tests to evaluate the performance of the studied algorithms. Among this tests, we can find standard experiments that use as score the nearest neighbors classification score, specific nearest centroid algorithms experiments, dimensionality reduction experiments and kernel experiments. The experiments were done using pyDML library. The results are shown at the end of the document.

**Keywords:** distance metric learning, machine learning, classification, Mahalanobis distance, dimensionality, nearest neighbors, similarity, matrices, convex analysis.
