import 'package:myapp/tdlib/td_api.dart';
import 'package:rxdart/subjects.dart';

class UIEvents {
  static final BehaviorSubject<int?> _selectedChat = BehaviorSubject<int?>();
  static void selectChat(int? id) => _selectedChat.add(id);
  static Stream<int?> selectedChat() => _selectedChat.stream;

  static final BehaviorSubject<List<ChatList>> _chatLists =
      BehaviorSubject<List<ChatList>>();
  static void changeChatList(List<ChatList> newChatList) =>
      _chatLists.add(newChatList);
  static Stream<List<ChatList>> chatLists() => _chatLists.stream;

  static final BehaviorSubject<ChatList> _currentChatList =
      BehaviorSubject<ChatList>();
  static void selectChatList(ChatList newChatList) =>
      _currentChatList.add(newChatList);
  static Stream<ChatList> currentChatList() => _currentChatList.stream;
}
