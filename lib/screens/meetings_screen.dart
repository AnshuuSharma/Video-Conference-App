import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_conference_app/resources/jitsi_meet_methods.dart';
import 'package:video_conference_app/widgets/meeting_button.dart';

class MeetingsScreen extends StatelessWidget {
  MeetingsScreen({super.key});
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: "New Meeting",
            ),
            HomeMeetingButton(
              onPressed: () => joinMeeting(context),
              icon: Icons.add_box_rounded,
              text: "Join Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: "Schedule Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward_rounded,
              text: "Share Screen",
            )
          ],
        ),
        const Expanded(
            child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'Video conferencing made easy and fast in your hands !',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ))
      ],
    );
  }
}
