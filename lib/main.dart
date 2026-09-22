import 'package:flutter/material.dart';

void main() {
  runApp(const IlhamApp());
}

class IlhamApp extends StatelessWidget {
  const IlhamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ilham Workspace',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const DashboardPage(),
    );
  }
}


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Ilham Workspace",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [


            // HEADER CARD
            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(

                gradient: const LinearGradient(

                  colors: [
                    Color(0xff4F46E5),
                    Color(0xff7C3AED),
                  ],

                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                ),

                borderRadius: BorderRadius.circular(25),

              ),


              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [


                  const CircleAvatar(

                    radius: 32,

                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.indigo,
                    ),

                  ),


                  const SizedBox(height: 15),


                  const Text(

                    "Halo, Ilham 👋",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 24,

                      fontWeight: FontWeight.bold,

                    ),

                  ),


                  const SizedBox(height: 8),


                  Text(

                    "Belajar Flutter, Dart, dan Mobile Development",

                    style: TextStyle(

                      color: Colors.white.withOpacity(.85),

                      fontSize: 15,

                    ),

                  ),

                ],

              ),

            ),



            const SizedBox(height: 25),



            const Text(

              "Project Statistic",

              style: TextStyle(

                fontSize: 20,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 15),



            Row(

              children: [


                statisticCard(
                  "3",
                  "Project",
                  Icons.apps,
                ),


                const SizedBox(width: 12),


                statisticCard(
                  "12",
                  "Commit",
                  Icons.code,
                ),


                const SizedBox(width: 12),


                statisticCard(
                  "1",
                  "Device",
                  Icons.phone_android,
                ),


              ],

            ),



            const SizedBox(height: 30),



            const Text(

              "Quick Menu",

              style: TextStyle(

                fontSize: 20,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 15),



            GridView.count(

              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),

              crossAxisCount: 2,

              crossAxisSpacing: 15,

              mainAxisSpacing: 15,


              children: [


                menuCard(
                  "Mobile",
                  Icons.phone_android,
                  Colors.blue,
                ),


                menuCard(
                  "Coding",
                  Icons.terminal,
                  Colors.green,
                ),


                menuCard(
                  "Learning",
                  Icons.menu_book,
                  Colors.orange,
                ),


                menuCard(
                  "Setting",
                  Icons.settings,
                  Colors.purple,
                ),


              ],

            ),



            const SizedBox(height: 30),



            const Text(

              "Recent Activity",

              style: TextStyle(

                fontSize: 20,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 15),



            activityTile(
              "Flutter Installed",
              "Connected with WSL Ubuntu",
              Icons.check_circle,
            ),


            activityTile(
              "POCO X3 Connected",
              "Android API 31 Device",
              Icons.smartphone,
            ),


            activityTile(
              "First App Running",
              "Hello World Successfully",
              Icons.rocket_launch,
            ),


          ],

        ),

      ),



      floatingActionButton: FloatingActionButton(

        onPressed: () {},

        child: const Icon(Icons.add),

      ),



      bottomNavigationBar: NavigationBar(

        destinations: const [


          NavigationDestination(

            icon: Icon(Icons.home),

            label: "Home",

          ),


          NavigationDestination(

            icon: Icon(Icons.search),

            label: "Search",

          ),


          NavigationDestination(

            icon: Icon(Icons.person),

            label: "Profile",

          ),

        ],

      ),


    );

  }



}



// STATISTIC CARD

Widget statisticCard(
    String value,
    String title,
    IconData icon,
    ){

  return Expanded(

    child: Container(

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

      ),


      child: Column(

        children: [


          Icon(
            icon,
            color: Colors.indigo,
          ),


          const SizedBox(height: 8),


          Text(

            value,

            style: const TextStyle(

              fontSize: 22,

              fontWeight: FontWeight.bold,

            ),

          ),


          Text(

            title,

            style: const TextStyle(

              color: Colors.grey,

            ),

          ),


        ],

      ),

    ),

  );

}



// MENU CARD

Widget menuCard(
    String title,
    IconData icon,
    Color color,
    ){

return Container(

decoration: BoxDecoration(

color: Colors.white,

borderRadius: BorderRadius.circular(20),

),


child: Column(

mainAxisAlignment: MainAxisAlignment.center,

children: [


Icon(
icon,
size:35,
color:color,
),


const SizedBox(height:10),


Text(
title,
style:const TextStyle(
fontWeight:FontWeight.bold,
),
)


],


),


);

}



// ACTIVITY TILE

Widget activityTile(

String title,

String subtitle,

IconData icon,

){

return Container(

margin:const EdgeInsets.only(bottom:12),

padding:const EdgeInsets.all(15),

decoration:BoxDecoration(

color:Colors.white,

borderRadius:BorderRadius.circular(18),

),


child:Row(

children:[


CircleAvatar(

backgroundColor:Colors.indigo.shade50,

child:Icon(
icon,
color:Colors.indigo,
),

),


const SizedBox(width:15),


Column(

crossAxisAlignment:CrossAxisAlignment.start,

children:[

Text(

title,

style:const TextStyle(

fontWeight:FontWeight.bold,

),

),


Text(

subtitle,

style:const TextStyle(

color:Colors.grey,

),

),


],

)

],

),

);

}