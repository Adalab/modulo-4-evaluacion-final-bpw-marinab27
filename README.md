# Guía de uso de la API frases-miticas

## 1. Crear la base de datos y las tablas en MySQL

1. Abre una terminal en la carpeta del proyecto.
2. Asegúrate de tener MySQL instalado y configurado.
3. Verifica que el archivo `esquema-de-tablas.sql` está en la raíz del proyecto.
4. Ejecuta el siguiente comando para crear la base de datos y las tablas:

   `sh mysql -u root -p < esquema-de-tablas.sql`
   `sh mysql -u root -p < datos-prueba.sql`

Ya está la base de datos lista para usar.

## 2. Configurar las variables de entorno

1. En el siguiente archivo `.env` se encuentran las propiedades de la base de datos:
   ```
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=TU_CONTRASEÑA
   DB_NAME=frases_miticas
   DB_PORT=3306
   ```

## 3. Instalar dependencias y ejecutar el proyecto

1. Instala las dependencias del proyecto:
   `sh npm install`
2. Inicia el servidor:
   `sh npm run dev`

## 4. Importar la colección de Postman

1. Abre Postman.
2. Haz clic en el botón **Import** (Importar) en la esquina superior izquierda.
3. Selecciona **Upload Files** (Subir archivos).
4. Busca y selecciona el archivo de la colección de Postman que se encuentra en este proyecto (por ejemplo, `frases-miticas.postman_collection.json`).
5. Haz clic en **Import**.
6. La colección aparecerá en tu espacio de trabajo y podrás probar los endpoints de la API.

## 5. Probar los endpoints

- Utiliza la colección de Postman para enviar peticiones a la API.
- Asegúrate de que el servidor está corriendo antes de probar los endpoints.
- Puedes modificar las variables de entorno en Postman si tu servidor corre en un puerto diferente.
