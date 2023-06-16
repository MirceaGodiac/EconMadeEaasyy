import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: double.infinity,
              width: 1100,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    bottomLeft: Radius.circular(60)),
                color: Colors.white,
              ),
              child: SizedBox(
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      bottomLeft: Radius.circular(60)),
                  child: Image.asset(
                    'lib/images/logindoodle.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: 1100,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(56),
                    bottomLeft: Radius.circular(56)),
                color: Colors.black87,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.white24),
                    height: double.infinity,
                    width: 400,
                    margin: const EdgeInsets.only(top: 20, left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20, left: 30),
                          child: const Text(
                            'Noutati',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 110,
                          width: 350,
                          margin: const EdgeInsets.only(left: 25),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 110,
                          width: 350,
                          margin: const EdgeInsets.only(left: 25),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 110,
                          width: 350,
                          margin: const EdgeInsets.only(left: 25),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 110,
                          width: 350,
                          margin: const EdgeInsets.only(left: 25),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.black87,
                          ),
                        )
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.white38,
                    endIndent: 10,
                    thickness: 2.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 300,
                          width: 500,
                          margin: const EdgeInsets.only(top: 20, right: 20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                            color: Colors.white38,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Bine ai venit in E N A B L E !',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Această aplicație te va ajuta sa înveți pentru examen!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Profită de o mulțime de modele de examen oficiale',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Și teste personalizate si simulări cool',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Toate in aceasta aplicație alaturi de Dinu!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
