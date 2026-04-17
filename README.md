# ntt-data-api-test

Proyecto de automatización de pruebas de API utilizando el framework Karate, orientado a validar las operaciones principales de la API PetStore.

---

## Descripción

Este proyecto automatiza cuatro escenarios de prueba sobre la API pública de PetStore (`https://petstore.swagger.io/v2`), cubriendo el ciclo de vida completo de una mascota: creación, consulta, actualización y búsqueda por estado.

---

## Prerequisitos

- **Java 1.8** (JDK instalado y configurado en el PATH)
- **Maven 3.9.1** (instalado y configurado en el PATH)
- Conexión a internet (los tests consumen la API pública de PetStore)

---

## Estructura del proyecto

```
ntt-data-api-test/
├── pom.xml
├── .gitignore
├── README.md
└── src/
    └── test/
        ├── java/
        │   └── petstore/
        │       └── runner/
        │           └── TestRunner.java       <- Runner de JUnit 4
        └── resources/
            ├── karate-config.js              <- Configuración global (baseUrl, headers)
            └── petstore/
                └── pet/
                    ├── pet.feature           <- Escenarios de prueba
                    └── data/
                        ├── add-pet.json      <- Payload para POST /pet
                        └── update-pet.json   <- Payload para PUT /pet
```

---

## Cómo ejecutar las pruebas

```bash
mvn clean verify
```

---

## Reportes generados

| Reporte | Ruta |
|---|---|
| JSON generado por Karate en formato Cucumber | `target/karate-reports/petstore.pet.pet.json` |
| HTML visual de resultados | `target/cucumber-html-reports/overview-features.html` |

---

## Tecnologías utilizadas

- Karate Framework 1.2.0
- JUnit 4.13.2
- maven-cucumber-reporting 4.11.0
- Apache Maven 3.9.1
- Java 1.8
