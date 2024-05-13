import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ar_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ModelViewer(
      //backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
      src: 'arModel/fox_charater/cartoon_character.glb',
      //alt: 'A 3D model of an astronaut',
      //arModes: ['scene-viewer', 'webxr', 'quick-look'],
      autoRotate: true,
      //iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
      //disableZoom: true,
    );
  }
}
