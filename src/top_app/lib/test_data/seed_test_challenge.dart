import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/providers/firebase_provider.dart';

Future<void> seedTestChallenge() async {
  final Map<String, Object> challengeData = <String, Object>{
    'authorId': 'S5y8BHDjXndBt8ZQJssEPBD2Rho1',
    'authorName': 'T.O.P Team',
    'description':
        "For this challenge, you'll have to wake up at 3:30 in the morning EVERY FUCKING DAY.",
    'thumbnailUrl':
        'https://www.thesun.co.uk/wp-content/uploads/2023/01/fat-ultra-fit-david-goggins-790613110-3.jpg',
    'id': 'wake-up-3am',
    'iconCode': 'sand_clock',
    'edgeReward': 1000,
    'duration': 90,
    'name': '3 A.M. BEAST',
    'activities': <String, Map<String, Object>>{
      'wake-up-3am': <String, Object>{
        'name': 'Wake up at 3:30a.m.',
        'daysOfWeek': <int>[1, 2, 3, 4, 5, 6, 7],
        'iconCode': 'bed',
        'id': 'wake-up-3am',
        'streakEdge': 10,
        'proof': <String, Map<String, Object>>{
          '3am-pic-time-based': <String, Object>{
            'iconCode': 'camera',
            'id': '3am-pic-time-based',
            'name': 'Take a picture before 3:40a.m.',
            'timeBased': true,
            'type': 'image',
            'proofStartTime': '03:30',
            'proofEndTime': '03:40',
          },
        },
      },
      'first-thing-of-day': <String, Object>{
        'name': 'Do something important first thing in the morning',
        'daysOfWeek': <int>[1, 2, 3, 4, 5, 6, 7],
        'iconCode': 'laptop',
        'id': 'first-thing-of-day',
        'streakEdge': 5,
        'proof': <String, Map<String, Object>>{
          'first-thing-proof': <String, Object>{
            'iconCode': 'open_book',
            'id': 'first-thing-proof',
            'name':
                'Write a brief description and upload a picture of what you did, that moved you closer to your goals',
            'timeBased': false,
            'type': 'text-and-image',
          },
        },
      },
    },
  };

  try {
    await getIt<FirebaseProvider>()
        .firestore
        .collection('challenges')
        .doc('wake-up-3am')
        .set(challengeData);
  } catch (e) {
    print(e);
  }
}
