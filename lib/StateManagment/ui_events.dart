import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:rxdart/subjects.dart';

class UIEvents {
  static final BehaviorSubject<int?> _selectedChat = BehaviorSubject<int?>();
  static int? _lastSelectedChat;
  static void selectChat(int? id, TelegramClient client) {
    if (_lastSelectedChat != null) {
      client.send(CloseChat(chatId: id));
    }
    _lastSelectedChat = id;
    _selectedChat.add(id);
  }

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

  static final BehaviorSubject<bool> _archiveOpened = BehaviorSubject<bool>();
  static void openArchive() => _archiveOpened.add(true);
  static void closeArchive() => _archiveOpened.add(false);
  static Stream<bool> archiveState() => _archiveOpened.stream;
}
