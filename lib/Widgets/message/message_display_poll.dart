import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Widgets/Userpic/userpic.dart';
import 'package:myapp/Widgets/copyable_text.dart';
import 'package:myapp/Widgets/display_text.dart';
import 'package:myapp/Widgets/message/message_display_text.dart';
import 'package:myapp/tdlib/client.dart';
import 'package:myapp/tdlib/td_api.dart' hide Text;

class MessageDisplayPoll extends StatefulWidget {
  const MessageDisplayPoll({
    Key? key,
    required this.message,
    required this.client,
    this.senderName,
    this.replieWidget,
    this.infoWidget,
  }) : super(key: key);

  final Message message;
  final TelegramClient client;
  final String? senderName;
  final Widget? replieWidget;
  final Widget? infoWidget;

  @override
  State<StatefulWidget> createState() => _MessageDisplayPollState();
}

class _MessageDisplayPollState extends State<MessageDisplayPoll> {
  Map<int, bool> answerValues = {};
  @override
  Widget build(BuildContext context) {
    assert(widget.message.content is MessagePoll);
    var poll = (widget.message.content as MessagePoll).poll!;
    bool isAnswered = false;
    bool multyplyAnswers = poll.type is PollTypeRegular ? (poll.type as PollTypeRegular).allowMultipleAnswers! : false;
    for (final a in poll.options!) {
      if (a.isChosen!) {
        isAnswered = true;
        break;
      }
    }
    return MessageDisplayText(
      client: widget.client,
      message: widget.message,
      senderName: widget.senderName,
      replieWidget: widget.replieWidget,
      infoWidget: widget.infoWidget,
      text: FormattedText(
        text: "",
        entities: [],
      ),
      additionalContent: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CopyableText(
              TextSpan(
                text: poll.question!,
                style: TextDisplay.create(
                  size: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.client.buildTextByKey(
                  poll.isClosed!
                      ? "lng_polls_closed"
                      : poll.isAnonymous!
                          ? poll.type is PollTypeQuiz
                              ? "lng_polls_anonymous_quiz"
                              : "lng_polls_anonymous"
                          : poll.type is PollTypeQuiz
                              ? "lng_polls_public_quiz"
                              : "lng_polls_public",
                  TextDisplay.create(
                    size: 18,
                  ),
                ),
                if (!poll.isAnonymous!)
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Stack(
                      children: poll.recentVoterUserIds!.map((e) {
                        var user = widget.client.getUser(e);
                        return Container(
                          width: 28,
                          height: 28,
                          margin: EdgeInsets.only(left: poll.recentVoterUserIds!.indexOf(e) * 16),
                          child: Userpic(
                            userId: user.id!,
                            userTitle: "${user.firstName} ${user.lastName}",
                            client: widget.client,
                            profilePhoto: user.profilePhoto,
                          ),
                        );
                      }).toList(),
                    ),
                  )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: poll.options!.map(
                (e) {
                  var index = poll.options!.indexOf(e);
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: _PollOptionDisplay(
                      option: e,
                      answered: isAnswered,
                      pollType: poll.type!,
                      multyplyAnswers: multyplyAnswers,
                      value: answerValues[index] ?? false,
                      onValueChanged: (nvalue) => setState(() {
                        if (!multyplyAnswers) {
                          answerValues.clear();
                        }
                        answerValues[index] = nvalue;
                      }),
                    ),
                  );
                },
              ).toList(),
            ),
            if (!poll.isAnonymous! || !isAnswered)
              Align(
                alignment: Alignment.center,
                child: LayoutBuilder(
                  builder: (_, box) => TextButton(
                    onPressed: () {
                      if (!isAnswered && answerValues.isNotEmpty) {
                        widget.client.send(
                          SetPollAnswer(
                            chatId: widget.message.chatId!,
                            messageId: widget.message.id!,
                            optionIds: answerValues.keys.toList(),
                          ),
                        );
                      }
                    },
                    child: SizedBox(
                      width: box.maxWidth * 0.5,
                      child: Center(
                        child: widget.client.buildTextByKey(
                          isAnswered ? "lng_polls_view_results" : "lng_polls_submit_votes",
                          TextDisplay.create(
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _PollOptionDisplay extends StatelessWidget {
  const _PollOptionDisplay({
    Key? key,
    required this.option,
    required this.answered,
    required this.pollType,
    required this.value,
    required this.multyplyAnswers,
    required this.onValueChanged,
  }) : super(key: key);

  final PollOption option;
  final bool answered;
  final bool multyplyAnswers;
  final PollType pollType;
  final bool value;
  final Function(bool nvalue) onValueChanged;

  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        if (answered)
          Text("${option.votePercentage}%")
        else
          Checkbox(
            value: value,
            onChanged: (_) => onValueChanged(!value),
            shape: multyplyAnswers ? null : const CircleBorder(),
          ),
        Container(
          margin: const EdgeInsets.only(left: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                option.text!,
                style: TextDisplay.create(
                  size: 18,
                ),
              ),
              if (answered)
                LayoutBuilder(
                  builder: (_, box) => Container(
                    margin: EdgeInsets.only(top: 2),
                    height: 4,
                    width: max(box.maxWidth / 100 * option.votePercentage!, 4),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                      color: Colors.amber,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
