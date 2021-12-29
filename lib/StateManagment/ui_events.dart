import 'package:rxdart/subjects.dart';

class UIEvents {
  static final BehaviorSubject<int?> _selectedChat = BehaviorSubject<int?>();
  static void selectChat(int? id) => _selectedChat.add(id);
  static Stream<int?> selectedChat() => _selectedChat.stream;
}
