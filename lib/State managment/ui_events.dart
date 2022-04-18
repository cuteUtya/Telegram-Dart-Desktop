import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart';
import 'package:rxdart/subjects.dart';

class UIEvents {
  static final BehaviorSubject<List<int>> _selectedChat =
      BehaviorSubject<List<int>>();
  static List<int> _chatsStack = [];

  /// drop chats chain and open chat with entered [id], close chats if [id] is null
  static void selectChat(int? id, TelegramClient client) {
    if (_chatsStack.isNotEmpty) {
      client.send(CloseChat(chatId: _chatsStack.last));
    }
    if (_chatsStack.isNotEmpty) {
      if (_chatsStack.last == id && id != null) return;
    }
    _chatsStack.clear();
    if (id != null) {
      _chatsStack.add(id);
      client.send(OpenChat(chatId: id));
    }
    _selectedChat.add(_chatsStack);
    replieTo(null);
  }

  /// open new chat, but save chain of opened chats
  static void pushChat(int id, TelegramClient client) {
    if (_chatsStack.isNotEmpty) {
      client.send(CloseChat(chatId: _chatsStack.last));
    }
    client.send(OpenChat(chatId: id));
    _chatsStack.add(id);
    _selectedChat.add(_chatsStack);
    replieTo(null);
  }

  /// close last chat in chats chain and open last before last chat in chain
  static void popChat(TelegramClient client) {
    if (_chatsStack.isNotEmpty) {
      _chatsStack.removeAt(_chatsStack.length - 1);
    }
    _selectedChat.add(_chatsStack.isEmpty ? [] : _chatsStack);
  }

  static Stream<List<int>> selectedChat() => _selectedChat.stream;

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

  static final BehaviorSubject<int?> _replieOn = BehaviorSubject<int?>();
  static void replieTo(int? messageId) => _replieOn.add(messageId);
  static void removeReplie() => replieTo(null);
  static Stream<int?> replieOnStream() => _replieOn.stream;
}
