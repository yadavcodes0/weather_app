import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          bottom: height / 2.4,
          child: Image.network(
            'https://i.ibb.co/Y2CNM8V/new-york.jpg',
            height: height,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: height / 2.4,
            width: width,
            color: const Color(0XFF2D2C35),
          ),
        ),
        const ForeGround(),
      ],
    );
  }
}

class ForeGround extends StatelessWidget {
  const ForeGround({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    var inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white),
    );
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.ibb.co/Z1fYsws/profile-image.jpg',
            ),
            backgroundColor: Colors.black26,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: DefaultTextStyle(
          style: GoogleFonts.raleway(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Hello Siti',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Check the weather by the city',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 35),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search city',
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    border: inputBorder,
                    focusedBorder: inputBorder,
                    enabledBorder: inputBorder,
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My locations',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: const CircleBorder(),
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var location in locations)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    Colors.black45,
                                    BlendMode.darken,
                                  ),
                                  child: Image.network(
                                    location.imageUrl,
                                    height: height * 0.35,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      location.text,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(location.timing),
                                    const SizedBox(height: 40),
                                    Text(
                                      '${location.temperature}°',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 50),
                                    Text(location.weather),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Location {
  final String text;
  final String timing;
  final int temperature;
  final String weather;
  final String imageUrl;

  Location({
    required this.text,
    required this.timing,
    required this.temperature,
    required this.weather,
    required this.imageUrl,
  });
}

final locations = [
  Location(
    text: 'New York',
    timing: '10:44 am',
    temperature: 15,
    weather: 'Cloudy',
    imageUrl: 'https://i.ibb.co/df35Y8Q/2.png',
  ),
  Location(
    text: 'San Francisco',
    timing: '7:44 am',
    temperature: 6,
    weather: 'Raining',
    imageUrl: 'https://i.ibb.co/7WyTr6q/3.png',
  ),
  Location(
    text: 'London',
    timing: '5:44 am',
    temperature: 10,
    weather: 'Sunny',
    imageUrl:
        'https://images.unsplash.com/photo-1526129318478-62ed807ebdf9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
  ),
  Location(
    text: 'Paris',
    timing: '3:44 am',
    temperature: 12,
    weather: 'Cloudy',
    imageUrl:
        'https://images.unsplash.com/photo-1511739001486-6bfe10ce785f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  )
];
