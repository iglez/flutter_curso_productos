# flutter_curso_productos

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Almacenar fotogracia

### Servicio
https://cloudinary.com/

### Documentacion
https://cloudinary.com/documentation/image_upload_api_reference

https://api.cloudinary.com/v1_1/<cloud_name>/image/upload

Si es unsigned se tiene que habilitar
Enable unsigned uploading (en el upload_preset viene el link) borrarlo y crearlo de nuevo.

Algo parecido es el POST
curl --location --request POST 'https://api.cloudinary.com/v1_1/fluttercurso/image/upload?upload_preset=xxx0xxx0' \
--form 'file=@"/Users/ivangonzalez/Downloads/no-image.png"'