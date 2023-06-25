import 'package:flutter/material.dart';

class ViewQuestionsPage extends StatefulWidget {
  const ViewQuestionsPage({super.key});
  State<ViewQuestionsPage> createState() => _ViewQuestionsPageState();
}

class questionModel extends StatefulWidget {
  String title;
  String path;
  String userName;
  String description;
  int reward;
  Color backgroundcolor;
  questionModel({
    super.key,
    required this.title,
    required this.path,
    required this.userName,
    required this.description,
    required this.reward,
    required this.backgroundcolor,
  });

  @override
  State<questionModel> createState() => _questionModelState();
}

class _questionModelState extends State<questionModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12, width: 5),
        color: widget.backgroundcolor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  widget.path,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'autor: ${widget.userName}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15, right: 15),
            child: Row(
              children: [
                Text(
                  'x${widget.reward}  ',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 40,
                  child: Image.asset('lib/images/flower.png'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ViewQuestionsPageState extends State<ViewQuestionsPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        width: 1100,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(60),
          ),
          child: Image.asset(
            'lib/images/logindoodle.jpg',
            filterQuality: FilterQuality.medium,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(
        width: 1100,
        height: double.infinity,
        child: Container(
          color: Colors.black87,
        ),
      ),
      Container(
        width: 950,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Start of content in container

            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Cele mai noi intrebari:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: Center(
                          child: Text(
                            'Pune o intrebare',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Filtre',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w100),
                      ),
                      Icon(
                        Icons.filter_alt_sharp,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: 950,
              height: 570,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      questionModel(
                        title: 'Va rog ajutor',
                        path: 'Culegere EN mate 2022',
                        userName: 'Danuts',
                        description:
                            'Pe o dreapta sunt 2 puncte oarecare, \nA si B. Demonstrati...',
                        reward: 30,
                        backgroundcolor: Colors.amber.shade200,
                      ),
                      questionModel(
                        title: 'Vai de purecii mei',
                        path: 'Model EN mate 2021',
                        userName: 'RazvanIoardan2006',
                        description:
                            'Un cub are 2 drepte paralele pe el, \ndemonstrati teorema lui...',
                        reward: 60,
                        backgroundcolor: Colors.blue.shade200,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      questionModel(
                        title: 'Imi tuseste creieru',
                        path: 'Subiect oficial EN mate 2020',
                        userName: 'IonDeLaBalcon2',
                        description:
                            'Functia f(x) = ax + b are valoarea 0\nsi 4 la valorile 3, respectiv...',
                        reward: 65,
                        backgroundcolor: Colors.green.shade200,
                      ),
                      questionModel(
                        title: 'Va rog ajutor',
                        path: 'Culegere EN mate 2022',
                        userName: 'MariusDarius34',
                        description:
                            'Pe o dreapta sunt 2 puncte oarecare, \nA si B. Demonstrati...',
                        reward: 30,
                        backgroundcolor: Colors.amber.shade200,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      questionModel(
                        title: 'Send help',
                        path: 'Culegere EN mate 2022',
                        userName: 'Ambata kuuum',
                        description:
                            'Patrulaterul regulat ABCD are 2 laturi\nparalele, aflacalabokkatroka',
                        reward: 15,
                        backgroundcolor: Colors.red.shade200,
                      ),
                      questionModel(
                        title: 'Va rog ajutor',
                        path: 'Culegere EN mate 2022',
                        userName: 'Danuts',
                        description:
                            'Pe o dreapta sunt 2 puncte oarecare, \nA si B. Demonstrati...',
                        reward: 56,
                        backgroundcolor: Colors.blue.shade200,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      questionModel(
                        title: 'Va rog ajutor',
                        path: 'Culegere EN mate 2022',
                        userName: 'Danuts',
                        description:
                            'Pe o dreapta sunt 2 puncte oarecare, \nA si B. Demonstrati...',
                        reward: 3,
                        backgroundcolor: Colors.amber.shade200,
                      ),
                      questionModel(
                        title: 'Va rog ajutor',
                        path: 'Culegere EN mate 2022',
                        userName: 'Danuts',
                        description:
                            'Pe o dreapta sunt 2 puncte oarecare, \nA si B. Demonstrati...',
                        reward: 100,
                        backgroundcolor: Colors.blue.shade200,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
