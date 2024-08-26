import 'package:get/get.dart';

import '../model/event.dart';

class HomeController extends GetxController {
  final List<EventModel> flutterTopicsList = [
    EventModel(
      id: "0",
      topicIcon: "assets/images/houses.png",
      topicName: "كراء المنازل",
      link: '/Istichara',
      conditions: '',
    ),
    EventModel(
      id: "1",
      topicIcon: "assets/images/businessman.png",
      topicName: "الوكالات السياحية",
      link: '/IwaaStudent',
      conditions: '',
    ),
    EventModel(
      id: "2",
      topicIcon: "assets/images/guide.png",
      topicName: "المرشد السياحي",
      link: '/ElectronicLibrary',
      conditions: '',
    ),
    EventModel(
      id: "3",
      topicIcon: "assets/images/trips.png",
      topicName: "رحلات التخييم",
      link: '/Dawarat',
      conditions: '',
    ),
  ];
}
