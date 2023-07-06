import 'package:flutter/material.dart';

class materialResources {
  String title;
  List<String> videos;
  List<String> PDFs;
  materialResources({
    required this.title,
    required this.videos,
    required this.PDFs,
  });
}

List<materialResources> materials = [
  materialResources(title: 'Divizibilitate', videos: [
    'https://www.youtube.com/watch?v=GTfo0FzyMHk',
    'https://www.youtube.com/watch?v=AsZrxULzEB8',
  ], PDFs: [
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FDivizibilitate%2F500%20Exerce%C8%9Bii%20divizibilitate.pdf?alt=media&token=93f0adf7-c97c-4699-bc15-6f9815e397bb'
  ]),
  materialResources(title: 'Ecuatii, inecuatii, expresii', videos: [
    'https://www.youtube.com/watch?v=cDg3K1Z2WQY',
    'https://www.youtube.com/watch?v=kvuMeeJQmPI',
    'https://www.youtube.com/watch?v=FmElCxtcvqY',
    'https://www.youtube.com/watch?v=28-rThqQATQ',
    'https://www.youtube.com/watch?v=fGNWJ-igBj0',
    'https://www.youtube.com/watch?v=HU2cnjHWo0A',
  ], PDFs: [
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FEcua%C8%9Bii%2C%20Inecua%C8%9Bii%2C%20Expresii%2FEcua%C8%9Bia%20de%20gradul%202.pdf?alt=media&token=95809228-f792-4362-8bdd-2279f7ad58fb',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FEcua%C8%9Bii%2C%20Inecua%C8%9Bii%2C%20Expresii%2FTest%20expresii%20algebrice.pdf?alt=media&token=c18078d1-660f-45ba-8b45-82cb7fd178dc',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FEcua%C8%9Bii%2C%20Inecua%C8%9Bii%2C%20Expresii%2FFormule%20de%20calcul%20prescurtat.pdf?alt=media&token=e22338b5-eee9-457a-985d-a2368f753bae',
  ]),
  materialResources(title: 'Medii', videos: [
    'https://www.youtube.com/watch?v=GDTLQRvwAs8',
    'https://www.youtube.com/watch?v=NeDSkqZkGYo',
    'https://www.youtube.com/watch?v=JGvYHtXqnn4',
    'https://www.youtube.com/watch?v=kvuMeeJQmPI',
  ], PDFs: [
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FMedii%2F2012_EN_Matematica_Model_Barem_LRO.pdf?alt=media&token=091e6a6d-f3ad-4bd8-a4fb-a1e9e4b1bd77',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FMedii%2F2012_EN_Matematica_Model_Subiect_LRO.pdf?alt=media&token=6b1d25db-ed19-41d4-894d-38b3ba2c6f92',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FMedii%2FMedii%20Teorie.pdf?alt=media&token=c9c8326e-1b3c-46b1-adb7-8621d2cb34f2',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FMedii%2FMedii%20aritmetice%20%C8%99i%20geometrice%20(%2Brezolv%C4%83ri).pdf?alt=media&token=1449398e-d112-4eca-bb52-0861d1b7693d',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FMedii%2FTest%20din%20medii.pdf?alt=media&token=e7e65779-24ce-4add-8a9b-bfd123fb86fa',
  ]),
  materialResources(title: 'Multimi', videos: [
    'https://www.youtube.com/watch?v=p0Yw8AHbMks',
    'https://www.youtube.com/watch?v=rUpDdEs1Bx4',
    'https://www.youtube.com/watch?v=AscOv1kn3zQ',
  ], PDFs: [
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FMul%C8%9Bimi%2FTest%20ml%C8%9Bimi%20.pdf?alt=media&token=4be13dd7-8cf4-4365-8404-8d1338519f7e',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FMul%C8%9Bimi%2FMul%C8%9Bimi%20Exerci%C8%9Bii%20.pdf?alt=media&token=da075e29-2267-4826-8146-15f7c4c57eaf',
  ]),
  materialResources(title: 'Numere, ordonari, comparari, fractii', videos: [
    'https://www.youtube.com/watch?v=_6DNEff2LhU',
    'https://www.youtube.com/watch?v=ANPdX7qLJk4',
    'https://www.youtube.com/watch?v=hjOvHS0JKJM',
    'https://www.youtube.com/watch?v=Hd9BO55jIiQ',
    'https://www.youtube.com/watch?v=W58fiSdrNLY',
    'https://www.youtube.com/watch?v=C5a1dIyou_8',
    'https://www.youtube.com/watch?v=akMIrgv-adU',
    'https://www.youtube.com/watch?v=qYSPMEdX5hs',
    'https://www.youtube.com/watch?v=5LcqDPAr8CE',
    'https://www.youtube.com/watch?v=ZkYLHH7OIT8',
    'https://www.youtube.com/watch?v=fN9vbcj5oBI',
    'https://www.youtube.com/watch?v=dUZwo0WYlzQ',
    'https://www.youtube.com/watch?v=QVHjwvC0t7k',
    'https://www.youtube.com/watch?v=kWZ4F37kMss',
    'https://www.youtube.com/watch?v=1-ZoqdBQ2qo',
    'https://www.youtube.com/watch?v=x8eWo3dgO80',
    'https://www.youtube.com/watch?v=MB-gEuUsjp4',
    'https://www.youtube.com/watch?v=6gqfAh9-s60',
    'https://www.youtube.com/watch?v=gGGOdVnhkj4',
    'https://www.youtube.com/watch?v=bkEzMRm_gt4',
    'https://www.youtube.com/watch?v=MrauwwO-nj4',
    'https://www.youtube.com/watch?v=9kjEcT34uFw',
    'https://www.youtube.com/watch?v=vu2ODA5ZkdQ',
    'https://www.youtube.com/watch?v=Cf7yWd0_GP4',
    'https://www.youtube.com/watch?v=ggci7zphWCo',
    'https://www.youtube.com/watch?v=_vIIjVaprro',
    'https://www.youtube.com/watch?v=72tFM1aO9gU',
    'https://www.youtube.com/watch?v=FkYeInOBiwI',
    'https://www.youtube.com/watch?v=260wDENZToY',
    'https://www.youtube.com/watch?v=JkxdESSbYq0',
    'https://www.youtube.com/watch?v=NcRXwZPT4IY',
    'https://www.youtube.com/watch?v=hxel1wIETJ4',
    'https://www.youtube.com/watch?v=o5C2EUcGFbs'
  ], PDFs: [
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FNumere%2C%20ordon%C4%83ri%2C%20compara%C8%9Bii%2C%20frac%C8%9Bii%2F500%20exerci%C8%9Bii%20sisteme%20de%20ecua%C8%9Bii%20.pdf?alt=media&token=3be89ed0-dae5-42b4-8716-d17d46990465https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FNumere%2C%20ordon%C4%83ri%2C%20compara%C8%9Bii%2C%20frac%C8%9Bii%2F500%20exerci%C8%9Bii%20sisteme%20de%20ecua%C8%9Bii%20.pdf?alt=media&token=3be89ed0-dae5-42b4-8716-d17d46990465',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FNumere%2C%20ordon%C4%83ri%2C%20compara%C8%9Bii%2C%20frac%C8%9Bii%2FDescompuneri%20%C3%AEn%20factori%20primi.pdf?alt=media&token=62b777ed-d341-4115-aed9-ca121e0aa6c6',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FNumere%2C%20ordon%C4%83ri%2C%20compara%C8%9Bii%2C%20frac%C8%9Bii%2FFisa%20de%20lucru%20operatii%20cu%20fractii%20ordinare%20clasa%20V%20%20Zajzon%20Csaba.pdf?alt=media&token=4e5545f5-29dd-4ac8-bc76-364569a13f15',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FNumere%2C%20ordon%C4%83ri%2C%20compara%C8%9Bii%2C%20frac%C8%9Bii%2FFrac%C8%9Bii%20algebrice.pdf?alt=media&token=a2d470a8-d55c-45ec-9d17-f2f01789959d',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FNumere%2C%20ordon%C4%83ri%2C%20compara%C8%9Bii%2C%20frac%C8%9Bii%2FNumere%20Reale.pdf?alt=media&token=771d95ea-17e1-447a-bea6-358a03e40677',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FNumere%2C%20ordon%C4%83ri%2C%20compara%C8%9Bii%2C%20frac%C8%9Bii%2FNumere%20%C3%8Entregi%20(opera%C8%9Bii).pdf?alt=media&token=33143f40-976e-420d-9a54-0deb5a43cf31',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FNumere%2C%20ordon%C4%83ri%2C%20compara%C8%9Bii%2C%20frac%C8%9Bii%2FTest%20frac%C8%9Bii%20ordinare%20%C8%99i%20zecimale.pdf?alt=media&token=e9ed798a-2281-4da4-a4fa-ca8f42ae2bdd',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FNumere%2C%20ordon%C4%83ri%2C%20compara%C8%9Bii%2C%20frac%C8%9Bii%2FUltima%20cifr%C4%83%20a%20unui%20num%C4%83r.pdf?alt=media&token=e6bd2d7a-2ca8-4149-9e6d-f828d4dd0efc',
  ])
];
