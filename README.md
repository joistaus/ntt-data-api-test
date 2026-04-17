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
            └── petstore/
                ├── karate-config.js          <- Configuración global (baseUrl, headers)
                └── pet/
                    ├── pet.feature           <- Escenarios de prueba
                    └── data/
                        ├── add-pet.json      <- Payload para POST /pet
                        └── update-pet.json   <- Payload para PUT /pet
```

---

## Cómo ejecutar las pruebas

Desde la raíz del proyecto, ejecutar:

```bash
mvn clean verify
```

> Se utiliza `verify` (en lugar de `test`) para que Maven ejecute también la fase de generación del reporte HTML de Cucumber luego de correr los tests.

---

## Reportes generados

Luego de la ejecución, los reportes se encuentran en:

```
target/
├── surefire-reports/                        <- Reporte XML de Surefire
├── karate-reports/                          <- Reportes internos de Karate
│   ├── karate-summary.html                  <- Reporte HTML nativo de Karate
│   └── petstore.pet.json                    <- JSON en formato Cucumber (por feature)
└── cucumber-html-reports/                   <- Reporte HTML generado por Masterthought
    └── overview-features.html               <- Reporte principal (abrir en el navegador)
```

Para ver el reporte HTML de Cucumber, abrir el archivo `target/cucumber-html-reports/overview-features.html` en cualquier navegador web.

---

## Escenarios de prueba

### 1. Agregar una mascota (POST /pet)
Crea una nueva mascota en el sistema con datos definidos en `add-pet.json`. Valida que la respuesta tenga código 200 y que el ID y nombre de la mascota sean correctos. El ID generado se reutiliza en los siguientes escenarios.

### 2. Obtener mascota por ID (GET /pet/{petId})
Consulta la mascota creada en el escenario 1 usando su ID. Valida que el código de respuesta sea 200 y que los datos coincidan con los enviados en la creación.

### 3. Actualizar nombre y estado de la mascota (PUT /pet)
Actualiza el nombre y el estado de la mascota a "sold" usando los datos de `update-pet.json`. Valida que la respuesta tenga código 200 y que los cambios se reflejen correctamente.

### 4. Buscar mascota por estado "sold" (GET /pet/findByStatus)
Busca todas las mascotas con estado "sold" y verifica que la mascota actualizada en el escenario 3 aparezca en la lista. Valida que el código de respuesta sea 200 y que el resultado sea una lista no vacía.

---

## Tecnologías utilizadas

- Karate Framework 1.2.0
- JUnit 4.13.2
- maven-cucumber-reporting 4.11.0 (reporte HTML estilo Cucumber/Masterthought)
- Apache Maven 3.9.1
- Java 1.8
