import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_conference_app/resources/firestore_methods.dart';

class MeetingHistoryScreen extends StatelessWidget {
  const MeetingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
                'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}'),
                subtitle: Text('Joined on ${DateFormat.yMEd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'),
          ),
        );
      },
    );
  }
}
