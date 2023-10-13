import 'package:flutter/material.dart';


class WidgetCategoria extends StatelessWidget {
  final String name;
  final String urlImg;
  WidgetCategoria({super.key, required this.name,required this.urlImg});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(13)),
                child: Image.network(
                  urlImg,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(0.1),
                  colorBlendMode: BlendMode.difference,
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0xAA000000), Colors.transparent],
                  ),
                ),
              ),
            ),
            // Contenido
            Positioned(
              bottom: 50,
              left: 20,
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
