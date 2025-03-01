import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class TaskPage extends StatelessWidget {
  TaskPage({super.key});

  final iconList = [
    const Icon(
      Icons.file_copy,
      color: Colors.amber,
      size: 30,
    ),
    const Icon(
      Icons.shopping_bag,
      color: Colors.pinkAccent,
      size: 30,
    ),
    const Icon(
      Icons.message,
      color: Colors.green,
      size: 30,
    ),
    const Icon(
      Icons.location_on,
      color: Colors.amber,
      size: 30,
    ),
    const Icon(
      Icons.group,
      color: Colors.deepPurple,
      size: 30,
    ),
    const Icon(
      Icons.fastfood,
      color: Colors.indigoAccent,
      size: 30,
    )
  ];

  final progressColor = [
    Colors.amber,
    Colors.pinkAccent,
    Colors.green,
    Colors.amber,
    Colors.deepPurple,
    Colors.indigoAccent
  ];

  final nameList = [
    "Basics",
    "Occupations",
    "Conversations",
    "Places",
    "Family Members",
    "Food",
  ];
  final doneList = [
    '4/5',
    '1/5',
    '3/5',
    '1/5',
    '3/5',
    '2/5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade600,
        elevation: 0,
        title: const Text(
          'Curse',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading:
            const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        actions: const [Icon(Icons.more_vert, color: Colors.white)],
      ),
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.amber.shade600,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  bottomRight: Radius.circular(150)),
            ),
          ),
          Align(
            alignment: const Alignment(-1.5, 10),
            child: Opacity(
              opacity: 0.4,
              child: CircleAvatar(
                maxRadius: 80,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber.shade400, shape: BoxShape.circle),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1.5, -1),
            child: Opacity(
              opacity: 0.4,
              child: CircleAvatar(
                maxRadius: 80,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber.shade400, shape: BoxShape.circle),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Spanish',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Beginner'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.stars_rounded,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.stars_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          "  2 Milestones",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Align(
                  alignment: const Alignment(1.5, -1),
                  child: CircularPercentIndicator(
                    radius: 55,
                    lineWidth: 6,
                    animation: true,
                    animationDuration: 2000,
                    backgroundWidth: 2,
                    percent: 0.43,
                    progressColor: Colors.white,
                    backgroundColor: Colors.grey.shade300,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '43%',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          'Complete',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: const Alignment(0, 0.7),
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            iconList[index],
                            const SizedBox(height: 10),
                            Text(
                              nameList[index],
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              doneList[index],
                            ),
                            const SizedBox(height: 7),
                            LinearPercentIndicator(
                              animation: true,
                              width: 160,
                              lineHeight: 7,
                              percent: int.parse(doneList[index][0]) /
                                  int.parse(doneList[index][2]),
                              backgroundColor: Colors.grey.shade300,
                              progressColor: progressColor[index],
                              barRadius: const Radius.circular(30),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
