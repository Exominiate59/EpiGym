import 'package:flutter/material.dart';

/// Crée un bouton personnalisé positionné à des coordonnées spécifiques.
///
/// Ce widget utilise un `GestureDetector` pour gérer les interactions utilisateur
/// et un `Container` stylisé pour afficher un texte au centre.
///
/// ### Exemples d'utilisation
/// ```dart
/// createCustomButton(
///   context: context,
///   x: 50,
///   y: 100,
///   width: 200,
///   height: 50,
///   text: "Cliquez ici",
///   color: Colors.blue,
///   onTap: () {
///     print("Bouton cliqué !");
///   },
/// );
/// ```
///
/// @param context Le contexte actuel de l'application.
/// @param x Position horizontale du bouton.
/// @param y Position verticale du bouton.
/// @param width Largeur du bouton.
/// @param height Hauteur du bouton.
/// @param text Texte affiché sur le bouton.
/// @param color Couleur d'arrière-plan du bouton.
/// @param onTap Fonction appelée lorsqu'on appuie sur le bouton.
/// @return Un widget `Positioned` contenant un bouton interactif.

Widget createCustomButton({
  required BuildContext context,
  required double x,
  required double y,
  required double width,
  required double height,
  required String text,
  required Color color,
  required VoidCallback onTap,
}) {
  return Positioned(
    left: x,
    top: y,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
