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
  ]),
  materialResources(title: 'Probleme Practice', videos: [
    'https://www.youtube.com/watch?v=uUbf0iYXz-c',
    'https://www.youtube.com/watch?v=q-Ifmvrz-mg',
    'https://www.youtube.com/watch?v=dWszUi8ej44',
    'https://www.youtube.com/watch?v=vPYl-RzGbM4',
  ], PDFs: [
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FProbleme%20practice%2FProbleme%20rezolvate%20cu%20ajutorul%20ecua%C5%A3iilor%20I%20.pdf?alt=media&token=7831fcc6-2874-4635-b7f2-03d2b8e5b049',
    'https://storage.googleapis.com/made-easy-a99a4.appspot.com/Teorie/ALGEBRA/Probleme%20practice/Probleme%20rezolvate%20cu%20ajutorul%20ecua%C8%9Biilor%20II.pdf?GoogleAccessId=service-254072273691@gcp-sa-firebasestorage.iam.gserviceaccount.com&Expires=1688635328&Signature=NXtTzLVXHo1yv4lpIjZ%2BuM4hTfxzb9QtKTbu2/%2B4A9fAX2RBCuSWqznseGQkK3wkchatp77t3y3fjqi/6thA2Us7s/i1z/iGonlmUaDrbb636vmC9NqXFbTKO1prBB7zZ9hkK2pMob2b22PEFVXAElMBMW23F3OkCnpPSGElTdFEAidBIzstNzQY3s5TpjI1PV9GszaGhv9gjjqkMb9J9tR5YI9XrOy7MehiLd5JAOdnQ/9jDfUMKPVBJM%2BGkuY62jPMgDk2T3lYPE0e6e0ByuyZ410JaRdza5Ie%2BheA3WFDNmwH1F7mBzecbe2HzPQ920J9plWTv5qfQCZYzUf4wQ%3D%3D',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FProbleme%20practice%2FProbleme%20rezolvate%20cu%20ajutorul%20ecua%C8%9Biilor%20III.pdf?alt=media&token=605947f1-0ff3-40a4-b2de-eb56465b6481',
  ]),
  materialResources(title: 'Rapoarte, procente, proportii', videos: [
    'https://www.youtube.com/watch?v=kxu5zW0gWiE',
    'https://www.youtube.com/watch?v=YBgPStS_eKk',
    'https://www.youtube.com/watch?v=5ziJJK46af0',
    'https://www.youtube.com/watch?v=VHIXXXPxdE8',
    'https://www.youtube.com/watch?v=ZQxUOYXJZew',
    'https://www.youtube.com/watch?v=9OvSBrT_kCk',
    'https://www.youtube.com/watch?v=9OvSBrT_kCk',
    'https://www.youtube.com/watch?v=rEjOqH0amE0',
    'https://www.youtube.com/watch?v=W4SJPJf3g30',
  ], PDFs: [
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FRapoarte%2C%20Procente%2C%20Propor%C8%9Bii%2FPropor%C8%9Bii%20derivate%20.pdf?alt=media&token=ec3cc59b-84e0-4f3e-b02d-4b42d065ba94',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FRapoarte%2C%20Procente%2C%20Propor%C8%9Bii%2FRapoarte%2C%20procente%2C%20propor%C8%9Bii%20(exerci%C8%9Bii).pdf?alt=media&token=09a56f8b-e013-4d92-b936-8517849673c8',
    'https://storage.googleapis.com/made-easy-a99a4.appspot.com/Teorie/ALGEBRA/Rapoarte,%20Procente,%20Propor%C8%9Bii/Rapoarte,%20procente,%20propor%C8%9Bii%20(exerci%C8%9Bii).pdf?GoogleAccessId=service-254072273691@gcp-sa-firebasestorage.iam.gserviceaccount.com&Expires=1688635509&Signature=YwvooQUFT2Pkd3w1s4uq3C81ktM1%2BcqUo3kE91GXJygkEnLmm%2BnuYK0feMaFqcQG%2Bs%2BcYNwx3b6PKtqXPyL6VBKrEtqZ9uTWczT2mfbiHUnNdkqPkmtRezh3Djlb0XXy3Nx5FWP30ulpt81R6HQVFia1wjnHcwmKku0GnuzFHWDtFNpRw%2Bp5en79QIGJL30VcHoeetqWfqFW%2Bp3Rsr%2B6AdifsuGzNJ%2B0uIPAHdoS8J6j5YlDSOOu4VCEH4717eRMC6sTzvDIvS9v4tSXnygkgvStiBzd3tZRn4k8itbAGHo50RCqWJoJwYH9jOmS9aWHk/sBByW7MEcXj%2BXNz9PEqA%3D%3D',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FRapoarte%2C%20Procente%2C%20Propor%C8%9Bii%2FRegula%20de%203%20simpl%C4%83.pdf?alt=media&token=3e1948c7-0959-4509-947e-725ec7b5be64',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FRapoarte%2C%20Procente%2C%20Propor%C8%9Bii%2FTest%20m%C4%83rimi%20invers%20%C8%99i%20direct%20propor%C8%9Bionale.pdf?alt=media&token=da142461-6bd2-4668-b710-ebff38f93d73',
  ]),
  materialResources(title: 'Reguli de Calcul', videos: [
    'https://www.youtube.com/watch?v=6qhH71Ic-zg&feature=youtu.be',
    'https://www.youtube.com/watch?v=6qhH71Ic-zg&feature=youtu.be',
    'https://www.youtube.com/watch?v=mZZcJgG2g9o',
  ], PDFs: [
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FReguli%20de%20calcul%2FSume%20de%20puteri.pdf?alt=media&token=26186617-ea79-40b9-87e2-053856d5af10',
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FALGEBRA%2FReguli%20de%20calcul%2FRegula%20de%203%20simpl%C4%83.pdf?alt=media&token=3acba655-50a4-4e4b-9e0a-ea741c51ffaf'
  ]),
  materialResources(title: 'Geometrie in plan', videos: [
    'https://www.youtube.com/watch?v=krpkTKH1fuQ',
    'https://www.youtube.com/watch?v=otyOOj74Jko',
    'https://www.youtube.com/watch?v=6J9d3FlX2Lw',
    'https://www.youtube.com/watch?v=Uqqmeo3npqI',
    'https://www.youtube.com/watch?v=MUHDVZ5UurU',
    'https://www.youtube.com/watch?v=BZlv6WzOFas',
    'https://www.youtube.com/watch?v=xX2RjNFZfGc',
    'https://www.youtube.com/watch?v=pA6xSilp8zk',
    'https://www.youtube.com/watch?v=E-947Lo77lw',
    'https://www.youtube.com/watch?v=p_hTGv2HSoI',
    'https://www.youtube.com/watch?v=fUn_co467Us',
    'https://www.youtube.com/watch?v=w4lGFVFBUC4',
    'https://www.youtube.com/watch?v=VSj5SUZnfPw',
    'https://www.youtube.com/watch?v=EPpfMnPIBiQ',
    'https://www.youtube.com/watch?v=POSrn4LC4iw',
    'https://www.youtube.com/watch?v=xEKGcCrSGok',
    'https://www.youtube.com/watch?v=YzSzmuNdC6w',
    'https://www.youtube.com/watch?v=R19WDE8rIp8',
    'https://www.youtube.com/watch?v=YhQkuyldeVg',
    'https://www.youtube.com/watch?v=5Ewamg9rPEQ',
    'https://www.youtube.com/watch?v=iI80AbgIQXs',
    'https://www.youtube.com/watch?v=3yfjCEu-6xs',
    'https://www.youtube.com/watch?v=ZmYLL1abAKU',
    'https://www.youtube.com/watch?v=4SaZAk4lcpQ',
    'https://www.youtube.com/watch?v=5D6r_WniN5g',
    'https://www.youtube.com/watch?v=E-947Lo77lw',
    'https://www.youtube.com/watch?v=nEZ4np4nfI0',
    'https://www.youtube.com/watch?v=eIKXYeuULE8',
  ], PDFs: []),
  materialResources(title: 'Geometrie in spatiu', videos: [
    'https://www.youtube.com/watch?v=rUGuiF2SH1s',
    'https://www.youtube.com/watch?v=goWpBAtL34k',
    'https://www.youtube.com/watch?v=dbI8FfoQ6h0',
    'https://www.youtube.com/watch?v=M76GRFDvX20',
    'https://www.youtube.com/watch?v=rUGuiF2SH1s',
    'https://www.youtube.com/watch?v=6SBAS2BtlMo',
    'https://www.youtube.com/watch?v=d2GZIRG0mRw',
  ], PDFs: []),
  materialResources(
    title: 'Recapitulare finala',
    videos: [
      'https://www.youtube.com/watch?v=FRq8jdiRx4o',
      'https://www.youtube.com/watch?v=E8eSLTs6yQ0',
      'https://www.youtube.com/watch?v=C6JXnsm2abU',
      'https://www.youtube.com/watch?v=ZHuQDF9Xpt8',
    ],
    PDFs: [],
  ),
  materialResources(title: 'Formule Gimnaziu', videos: [], PDFs: [
    'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2Fformule_matematica_gimnaziu_m.pdf?alt=media&token=83f4b12d-9251-4240-be75-869ddef21134',
  ]),
  materialResources(
      title: 'Model 1 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_01.pdf?alt=media&token=681097c6-23d2-458f-94c3-032b42d2ead6',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Bar_01.pdf?alt=media&token=f5dbc39a-3997-4dfb-b083-ce55751147b8',
      ]),
  materialResources(
      title: 'Model 2 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_02.pdf?alt=media&token=93e04289-c092-4311-a037-08bb4823601a',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Bar_02.pdf?alt=media&token=f47e8080-b1e4-40ec-ac6a-6d27614de31a',
      ]),
  materialResources(
      title: 'Model 3 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_03.pdf?alt=media&token=df61d3c2-1ea0-4470-984d-e03f86d31f0f',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Bar_03.pdf?alt=media&token=805f3d7e-0034-437f-b14b-0d286a9cd130',
      ]),
  materialResources(
      title: 'Model 4 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_04.pdf?alt=media&token=c4b6508a-8008-42e1-a148-d68d8cc29149',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Bar_04.pdf?alt=media&token=f427dbf3-da08-40c7-9183-b5b1ea41b545',
      ]),
  materialResources(
      title: 'Model 5 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_05.pdf?alt=media&token=941463fe-50ee-4274-8e75-543700b4d068',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Bar_05.pdf?alt=media&token=314d2520-dc31-4377-a27d-292af96b79c2',
      ]),
  materialResources(
      title: 'Model 6 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_06.pdf?alt=media&token=e19cb981-f71f-4e47-a597-1b026ca07e1f',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Bar_06.pdf?alt=media&token=c1432d7c-9136-4047-b997-1414db613482',
      ]),
  materialResources(
      title: 'Model 7 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_07.pdf?alt=media&token=ae7876de-4436-47d0-8f24-c99ff446a856',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Bar_07.pdf?alt=media&token=abe75c4b-d1c3-4b4c-9327-4823c093b786',
      ]),
  materialResources(
      title: 'Model 8 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_08.pdf?alt=media&token=9c6c0acb-f305-4a81-af56-7eb6d4cda2f5',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Bar_08.pdf?alt=media&token=2bce2d2b-e921-4618-a599-01609ece09a4',
      ]),
  materialResources(
      title: 'Model 9 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_09.pdf?alt=media&token=e2d59d8b-cf6c-49be-9ca2-67585ade4ee1',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Bar_09.pdf?alt=media&token=a61407ed-4b92-4aa7-86aa-5e2a33462db7',
      ]),
  materialResources(
      title: 'Model 10 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_10.pdf?alt=media&token=df3f3154-b622-4a61-933f-137b534b29d6',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Bar_10.pdf?alt=media&token=8b79d2b5-409a-47cc-a4e1-c185852ef155',
      ]),
  materialResources(
      title: 'Model 11 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_11.pdf?alt=media&token=cce74256-b768-49f9-8ae6-f354756c6dc8',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2F2020_ENVIII_matematica_Bar_11.pdf?alt=media&token=6f8b55fd-b909-4ce3-8b57-d87862012fbf',
      ]),
  materialResources(
      title: 'Model 12 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_12.pdf?alt=media&token=dba430dd-bd42-40d2-8bb2-861707e18f01',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2F2020_ENVIII_matematica_Barem_12.pdf?alt=media&token=cb81cab8-21cd-4d92-831f-398217621ce3',
      ]),
  materialResources(
      title: 'Model 13 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_13.pdf?alt=media&token=897a2305-5730-4a19-9c45-b76d4b2f3bd6',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2F2021_ENVIII_matematica_Barem_13.pdf?alt=media&token=48a2d016-6a94-48f4-91cc-f49abf6da6dc',
      ]),
  materialResources(
      title: 'Model 14 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_14.pdf?alt=media&token=5e88f3d1-fa99-4aa7-9ff3-60e5a1eef9e0',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2F2021_ENVIII_matematica_Barem_14.pdf?alt=media&token=469fd729-415b-41b5-95d3-0ac28055f627',
      ]),
  materialResources(
      title: 'Model 15 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_15.pdf?alt=media&token=3da45f54-114c-4fe4-b189-97e138d0c288',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2F2020_ENVIII_matematica_Barem_15.pdf?alt=media&token=9fa29cc2-a069-4969-9250-92f1d5a2e30f',
      ]),
  materialResources(
      title: 'Model 16 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2F2020_ENVIII_matematica_Test_16.pdf?alt=media&token=fb96ed9b-27f4-4ec6-9fb8-ed82c8ab0a44',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_16.pdf?alt=media&token=18d7415a-55db-40c0-8b01-3475ba41b757',
      ]),
  materialResources(
      title: 'Model 17 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_17.pdf?alt=media&token=db5976e2-4b25-402f-83c9-868e591f81a9',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_17.pdf?alt=media&token=8645ad27-6cda-4dbd-93f3-5e2b16a55f0a',
      ]),
  materialResources(
      title: 'Model 18 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_18.pdf?alt=media&token=7e23ba0a-e4ef-455b-aa6f-8daa68db4704',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_18.pdf?alt=media&token=eb3dc84b-45e6-4720-b84d-ac525a016f37',
      ]),
  materialResources(
      title: 'Model 19 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_19.pdf?alt=media&token=6fa8f533-2c34-4ba3-850b-eb14cc4f2f4d',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_19.pdf?alt=media&token=c18b83f7-e3cd-4ad0-8a57-6ad00659bea2',
      ]),
  materialResources(
      title: 'Model 20 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'hhttps://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_20.pdf?alt=media&token=79b39e51-f48c-443a-a98f-e86880b3ff12',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_20.pdf?alt=media&token=79b39e51-f48c-443a-a98f-e86880b3ff12',
      ]),
  materialResources(
      title: 'Model 21 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_21.pdf?alt=media&token=b15ec270-a065-45a4-b306-9c38272893cb',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_21.pdf?alt=media&token=c5990869-b288-485f-bae5-0bd1c9e0c9c6',
      ]),
  materialResources(
      title: 'Model 22 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_22.pdf?alt=media&token=177591a8-b78a-42f5-b70b-898787a3a0fb',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_22.pdf?alt=media&token=bd3f78c4-61bb-45f5-9b35-bac4e5a9db6a',
      ]),
  materialResources(
      title: 'Model 23 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_23.pdf?alt=media&token=bf6d2e37-0f62-4a81-adea-c3e004bf3bd6',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_23.pdf?alt=media&token=20bf33b1-62a7-41b3-83bb-fce3253b009f',
      ]),
  materialResources(
      title: 'Model 23 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_24.pdf?alt=media&token=1673f116-b007-4e82-8c50-40ff38c43f5a',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_24.pdf?alt=media&token=638cfba7-8baa-4067-b0ff-8715a3ff3f70',
      ]),
  materialResources(
      title: 'Model 24 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_24.pdf?alt=media&token=1673f116-b007-4e82-8c50-40ff38c43f5a',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_24.pdf?alt=media&token=638cfba7-8baa-4067-b0ff-8715a3ff3f70',
      ]),
  materialResources(
      title: 'Model 25 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_25.pdf?alt=media&token=a4d1b8d9-0edc-4a0b-8b6c-4415c531188e',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_25.pdf?alt=media&token=cfd65bb2-0051-4b36-96e5-3a71fd29af69',
      ]),
  materialResources(
      title: 'Model 26 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_26.pdf?alt=media&token=98dffb22-7d84-46db-bb23-a8c60adaafc8',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_26.pdf?alt=media&token=685e7bf1-0293-460a-b6c3-d03eefe43153',
      ]),
  materialResources(
      title: 'Model 27 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_27.pdf?alt=media&token=8f88dfd1-6501-4e0e-8d9a-9d899c83958e',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_27.pdf?alt=media&token=cb7236fc-8d18-4b69-9273-5fb6ac8fa529',
      ]),
  materialResources(
      title: 'Model 28 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_28.pdf?alt=media&token=fb4f59e5-8b3d-4d79-ad54-6d4f54258ae3',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_28.pdf?alt=media&token=fe333e5f-d47d-4561-88ee-f0856a2725d5',
      ]),
  materialResources(
      title: 'Model 29 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_29.pdf?alt=media&token=98e09896-7d21-4fb8-a6f2-1084ab26645e',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_29.pdf?alt=media&token=70d47f6d-250a-499b-8cd3-c7b4fc5c87e3',
      ]),
  materialResources(
      title: 'Model 30 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_Test_30.pdf?alt=media&token=ace73099-9c33-4c6d-9608-8915699dbb46',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_30.pdf?alt=media&token=7e8e24ac-6fe9-4d08-ba04-dce62df2bb6a',
      ]),
  materialResources(
      title: 'Model 31 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_var_31.pdf?alt=media&token=e7311d05-89ac-4464-8fe1-daf73de7eb61',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_31.pdf?alt=media&token=590203aa-aa4b-4f40-947c-7257604ab987',
      ]),
  materialResources(
      title: 'Model 32 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_var_32.pdf?alt=media&token=09be2dae-825b-4afd-bb46-8162f7bd823b',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_32.pdf?alt=media&token=f9d1ba8f-8005-49f8-a63d-49c62f4bf55c',
      ]),
  materialResources(
      title: 'Model 33 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_var_33.pdf?alt=media&token=11bb5aec-5e06-4d06-acf0-8ecbc3e5adee',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_33.pdf?alt=media&token=646cfb01-e3d4-4bf2-8954-8d46a54f0e5b',
      ]),
  materialResources(
      title: 'Model 34 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_var_34.pdf?alt=media&token=79258afe-3483-4c5d-aba7-aad1f642a9d4',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_34.pdf?alt=media&token=4222726a-5f06-43a0-8072-2062b3f7734a',
      ]),
  materialResources(
      title: 'Model 35 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_var_35.pdf?alt=media&token=439b25b5-b8a1-49a4-819c-8bae08ac895e',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_35.pdf?alt=media&token=029738ff-b2ee-43be-b630-14d36473f5e7',
      ]),
  materialResources(
      title: 'Model 36 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_var_36.pdf?alt=media&token=e1a34805-4c3f-4cc3-a1ee-a78633955324',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_36.pdf?alt=media&token=e1382d04-7f56-4826-9f56-d7313b79d885',
      ]),
  materialResources(
      title: 'Model 37 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_var_37.pdf?alt=media&token=5db02d62-2a7b-4981-91b8-32d95382c919',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_37.pdf?alt=media&token=12a9be8a-03e6-432e-8076-45b6cfd638fd',
      ]),
  materialResources(
      title: 'Model 38 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_var_38.pdf?alt=media&token=895277c6-13b2-4447-9ce4-47a9f3e0d059',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_38.pdf?alt=media&token=32097f57-84a6-4a08-b3f6-a99138cc5163',
      ]),
  materialResources(
      title: 'Model 39 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_var_39.pdf?alt=media&token=93f47732-fbce-4d93-8807-ba146ef83852',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_39.pdf?alt=media&token=1bb057b7-54e3-4ac6-8a43-355132a5b802',
      ]),
  materialResources(
      title: 'Model 40 Evaluarea Nationala 2020',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_var_40.pdf?alt=media&token=62eef9df-c18b-40fa-b0ec-862abfefd63b',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2020%2FENVIII_matematica_2020_bar_40.pdf?alt=media&token=a610692c-2ddb-4f93-9be5-90828f4f39e6',
      ]),
  materialResources(
      title: 'Model 1 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_01.pdf?alt=media&token=1168be3f-6fc7-4123-970b-70cddf60ad24',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_01.pdf?alt=media&token=67d9914a-9992-4403-b4e6-564e6a60f2c1',
      ]),
  materialResources(
      title: 'Model 2 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_02.pdf?alt=media&token=6c6cad72-253e-4da7-bc48-6f64a00f6080',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_02.pdf?alt=media&token=4983eb24-49e0-41cb-95a9-8c93f938c04f',
      ]),
  materialResources(
      title: 'Model 3 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_03.pdf?alt=media&token=a667bf38-5e96-4994-a1d6-39ecb5f862c6',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_03.pdf?alt=media&token=6dafc99f-61d7-443f-8d9c-92a6160645ce',
      ]),
  materialResources(
      title: 'Model 4 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_04.pdf?alt=media&token=cedf2f3e-83a1-4874-a83d-be3e19c1ee0a',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_04.pdf?alt=media&token=331d6ff0-40ca-4941-936b-d9b0b187d8ab',
      ]),
  materialResources(
      title: 'Model 5 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_05.pdf?alt=media&token=46d0b3b8-ddc8-424e-8479-649596f5be1b',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2F2021_ENVIII_matematica_Barem_05.pdf?alt=media&token=f6d8ee83-49b7-44d3-ad49-e746d7c4da35',
      ]),
  materialResources(
      title: 'Model 6 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2F2021_ENVIII_matematica_Test_06.pdf?alt=media&token=ba58940a-2b47-4c97-8618-03dc7186fad9',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2F2021_ENVIII_matematica_Barem_06.pdf?alt=media&token=bd41ed3e-5f85-4233-989d-db721ec152fa',
      ]),
  materialResources(
      title: 'Model 7 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_07.pdf?alt=media&token=2467fad2-a92d-4890-9c76-884fd41a964a',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_07.pdf?alt=media&token=97e05819-211b-4f79-9806-e089dff41a1e',
      ]),
  materialResources(
      title: 'Model 8 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_08.pdf?alt=media&token=23331a9f-4490-43a4-8af5-6b49478ececb',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_08.pdf?alt=media&token=d2a6f51e-f84d-457d-aa5d-27330cd85ca4',
      ]),
  materialResources(
      title: 'Model 9 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_09.pdf?alt=media&token=ba02d31c-2333-4a3b-9307-cdbf524c7b4e',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2F2021_ENVIII_matematica_Barem_09.pdf?alt=media&token=b7a8d05f-1ed8-4441-b303-d7c1e1f13b94',
      ]),
  materialResources(
      title: 'Model 10 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_10.pdf?alt=media&token=74ea0c98-f196-47cb-9822-38d6dc6fabdf',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_10.pdf?alt=media&token=348222fe-427d-438f-949a-fa71ff877df6',
      ]),
  materialResources(
      title: 'Model 11 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_11.pdf?alt=media&token=20ad9e23-1a3a-42f7-95e9-6e43fb566d74',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_11.pdf?alt=media&token=7acc768e-47ad-43be-b821-9f552d7d38bb',
      ]),
  materialResources(
      title: 'Model 12 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_12.pdf?alt=media&token=7effc99f-d950-4928-90c5-c863388d3cd9',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_12.pdf?alt=media&token=08206760-5afa-4707-984f-e2a868e7410b%C3%AE',
      ]),
  materialResources(
      title: 'Model 13 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_13.pdf?alt=media&token=c6b8724d-e84b-45db-a70f-7387d776fb72',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_13.pdf?alt=media&token=1048c624-f1ce-46d8-a3ae-42a2bbd529dc',
      ]),
  materialResources(
      title: 'Model 14 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_14.pdf?alt=media&token=5f39ef73-639e-444b-a1ad-b14f4abf6c6c',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_14.pdf?alt=media&token=eb3e6041-4c72-490c-a452-c4541e0eacaa',
      ]),
  materialResources(
      title: 'Model 15 Evaluarea Nationala 2021',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Test_15.pdf?alt=media&token=edbd3e14-d412-4c66-8497-25fdc1d3d592',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2021%2FEN_VIII_2021_Bar_15.pdf?alt=media&token=446135db-8207-486f-9231-8d2d8b972a06',
      ]),
  materialResources(
      title: 'Model 1 Evaluarea Nationala 2022',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Test_01.pdf?alt=media&token=1ec82da0-ac46-461d-b31d-ae94d34e320a',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Bar_01.pdf?alt=media&token=9bea477b-026d-435a-9fe0-22b236be6720',
      ]),
  materialResources(
      title: 'Model 2 Evaluarea Nationala 2022',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Test_02.pdf?alt=media&token=6bc0a8c1-9895-4cab-9af0-b2873ac31392',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Bar_02.pdf?alt=media&token=4d0c226f-0dd6-418e-a685-fce65c1ce95f',
      ]),
  materialResources(
      title: 'Model 3 Evaluarea Nationala 2022',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Test_03.pdf?alt=media&token=78ba4dd2-7e71-4a52-8c15-1f2886afedb0',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Bar_03.pdf?alt=media&token=79eb752a-4981-4062-b304-e721b4c9724f',
      ]),
  materialResources(
      title: 'Model 4 Evaluarea Nationala 2022',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Test_04.pdf?alt=media&token=39cf32eb-84a4-4891-ae95-e596974db39e',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Bar_04.pdf?alt=media&token=5a7ceb08-5dda-4cae-bfb7-11a999e244c6',
      ]),
  materialResources(
      title: 'Model 5 Evaluarea Nationala 2022',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Test_05.pdf?alt=media&token=4f090a2e-3ce1-4ae5-81e2-be6f9d7dfef6',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Bar_05.pdf?alt=media&token=d400b1f0-302c-49eb-b5af-12b79f5d9326',
      ]),
  materialResources(
      title: 'Model 6 Evaluarea Nationala 2022',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Test_06.pdf?alt=media&token=22ba23d6-4a2c-470f-b0d9-e39e71c0166c',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2022%2FEN_VIII_Matematica_2022_Bar_06.pdf?alt=media&token=d44cadc3-d401-4014-8670-90615bf84c16',
      ]),
  materialResources(
      title: 'Model 1 Evaluarea Nationala 2023',
      videos: [],
      PDFs: [
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2023%2F2023_EN_Matematica_Model_Barem_LRO.pdf?alt=media&token=95a09267-5756-4301-a0a2-8144760c4c60',
        'https://firebasestorage.googleapis.com/v0/b/made-easy-a99a4.appspot.com/o/Teorie%2FRecapitulare%20final%C4%83%2FSubiecte%20din%20anii%20preceden%C8%9Bi%2FModele%2F2023%2F2023_EN_Matematica_Model_Subiect_LRO.pdf?alt=media&token=907026e4-8a25-43c4-a0e7-ec33016db237',
      ]),
];
