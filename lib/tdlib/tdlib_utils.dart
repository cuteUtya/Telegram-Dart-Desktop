import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

int? getSenderId(MessageSender? sender) {
  if (sender == null) return null;
  if (sender is MessageSenderUser) return sender.userId!;
  return (sender as MessageSenderChat).chatId!;
}

User? getInterlocutor(Chat chat, TelegramClient client) {
  int? id;
  if (chat.type is ChatTypeSecret) {
    id = (chat.type as ChatTypeSecret).userId;
  } else if (chat.type is ChatTypePrivate) {
    id = (chat.type as ChatTypePrivate).userId;
  }
  if (id != null) return client.getUser(id);
}
