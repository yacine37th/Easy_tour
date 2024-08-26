class EventModel {
  final String id;
  final String topicName;
  final String topicIcon;
  final String link;
  late String conditions;
  EventModel({
    required this.id,
    required this.topicIcon,
    required this.topicName,
    required this.link,
    required this.conditions,
  });
}
