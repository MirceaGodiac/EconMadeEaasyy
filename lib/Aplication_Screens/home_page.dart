import 'package:econ_made_easy_files/Aplication_Screens/Login%20group/welcome_screen.dart';
import 'package:econ_made_easy_files/Other%20stuff/movie_list_item.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../Other stuff/lessons_list.dart';
import 'Login group/loading_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FlutterTts flutterTts = FlutterTts();
  static int nrOfCompletedLessons = 0;

  @override
  Widget build(BuildContext context) {
    int percentOfCompletedLessons = 0;
    nrOfCompletedLessons = 0;
    for (int i = 0; i < 10; i++) {
      if (LoadingScreen.userData.completedLessons[0][i.toString()]) {
        nrOfCompletedLessons++;
      }
    }

    if (nrOfCompletedLessons == 0) {
      percentOfCompletedLessons = 0;
    }

    if (percentOfCompletedLessons > 1) percentOfCompletedLessons = 100;

    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: double.infinity,
          width: 550,
          decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 40),
                child: const Text(
                  'Lecțiile următoare:',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 45,
                ),
                child: const Text(
                  'Econ Made Easy',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 23,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  'Cursuri:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (nrOfCompletedLessons != 10)
                for (int i = 0; i < lessons.length; i++)
                  if (!LoadingScreen.userData.completedLessons[0][i.toString()])
                    MovieListItem(index: i),
              if (nrOfCompletedLessons == 10)
                Column(children: [
                  ClipRRect(
                    child: Image.asset(
                      'lib/images/finishedAppEasterEgg.jpg',
                      filterQuality: FilterQuality.medium,
                      height: 600,
                    ),
                  ),
                  const Text(
                    'Bravo! ai terminat aplicația!\nSperăm că ai învațat ceva\ndin Econ Made Easy🤗',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500),
                  )
                ])
            ],
          ),
        ),
        SizedBox(
          height: double.infinity,
          width: 480,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[100],
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        )),
                    child: const Icon(
                      Icons.home_outlined,
                      size: 20,
                      color: Colors.black45,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${LoadingScreen.userData.firstName} ${LoadingScreen.userData.lastName}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            LoadingScreen.userData.email,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 10,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.person_outlined,
                        size: 40,
                        color: Colors.grey.shade700,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 60),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    const SizedBox(width: 40),
                    Text(
                      'Statistici',
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey.shade100),
                          child: Icon(
                            Icons.percent,
                            color: Colors.grey.shade600,
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lecții terminate',
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Cât la sută din toate lecții sunt terminate',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 27),
                    child: CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 5.0,
                      percent: nrOfCompletedLessons / 11,
                      center:
                          Text('${(nrOfCompletedLessons * 100 / 11).round()}%'),
                      progressColor: Colors.green,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey.shade100),
                          child: Icon(
                            Icons.edit,
                            color: Colors.grey.shade600,
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Scorul mediu',
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Scorul mediu obținut la fiecare test',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 27),
                    child: CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 5.0,
                      percent: (nrOfCompletedLessons != 0)
                          ? ((LoadingScreen.userData.credits /
                                      nrOfCompletedLessons)
                                  .round()) /
                              100
                          : 0,
                      center: (nrOfCompletedLessons != 0)
                          ? Text(
                              '${(LoadingScreen.userData.credits / nrOfCompletedLessons).round()}%')
                          : const Text('0%'),
                      progressColor: Colors.green,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey.shade100),
                          child: Icon(
                            Icons.auto_graph_sharp,
                            color: Colors.grey.shade600,
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Numarul de lecții completate',
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Câte lecții ai completat până la final',
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 40),
                      child: Text(
                        nrOfCompletedLessons.toString(),
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w600,
                            fontSize: 30),
                      ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
