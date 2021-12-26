import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/src/tdapi/tdapi.dart';

String getSenderName(MessageSender sender, TelegramClient client) {
  if (sender is MessageSenderUser) {
    return client.getUser(sender.userId!).firstName!;
  }
  return client.getChat((sender as MessageSenderChat).chatId!).title!;
}
