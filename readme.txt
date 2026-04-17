NTT DATA API TEST
=================

TECNOLOGÍAS
-----------
Java                      1.8 (JDK 8)
Maven                     3.9.1
Karate Framework          1.2.0
JUnit                     4.13.2
maven-cucumber-reporting  4.11.0

PRERREQUISITOS
--------------
- Java JDK 1.8 instalado con JAVA_HOME configurado
- Maven 3.9.1 instalado con MAVEN_HOME y %MAVEN_HOME%\bin en el PATH
- Conexión a internet (los tests consumen la API pública de PetStore)

EJECUCIÓN
---------
Desde la raíz del proyecto:

    mvn clean verify

REPORTES
--------
Cucumber JSON : target/karate-reports/petstore.pet.pet.json
Cucumber HTML : target/cucumber-html-reports/overview-features.html
