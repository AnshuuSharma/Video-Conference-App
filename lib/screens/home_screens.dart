import 'package:flutter/material.dart';
import 'package:video_conference_app/resources/auth_methods.dart';
import 'package:video_conference_app/screens/meeting_history_screen.dart';
import 'package:video_conference_app/screens/meetings_screen.dart';
import 'package:video_conference_app/utils/colors.dart';
import 'package:video_conference_app/widgets/custom_button.dart';
import 'package:video_conference_app/widgets/meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthMethods _authMethods = AuthMethods();
  int _page = 0;
  onPageChnaged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingsScreen(),
    const MeetingHistoryScreen(),
    const Text('Contacts'),
    CustomButton(text: 'Log Out', onPressed:()=> AuthMethods().signOut)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Meet & Chat",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Color.fromARGB(255, 49, 119, 249),
        unselectedItemColor: Color.fromARGB(255, 140, 139, 139),
        onTap: onPageChnaged,
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_rounded), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock), label: "Meetings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "settings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_rounded), label: "Chat")
        ],
      ),
      body: pages[_page],
    );
  }
}

// class meetings extends StatelessWidget {
//   const meetings({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 50,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             HomeMeetingButton(
//               onPressed: () {},
//               icon: Icons.videocam,
//               text: "New Meeting",
//             ),
//             HomeMeetingButton(
//               onPressed: () {},
//               icon: Icons.add_box_rounded,
//               text: "Join Meeting",
//             ),
//             HomeMeetingButton(
//               onPressed: () {},
//               icon: Icons.calendar_today,
//               text: "Schedule Meeting",
//             ),
//             HomeMeetingButton(
//               onPressed: () {},
//               icon: Icons.arrow_upward_rounded,
//               text: "Share Screen",
//             )
//           ],
//         ),
//         const Expanded(
//             child: Center(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 60),
//             child: Text(
//               'Video conferencing made easy and fast in your hands !',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//           ),
//         ))
//       ],
//     );
//   }
// }
