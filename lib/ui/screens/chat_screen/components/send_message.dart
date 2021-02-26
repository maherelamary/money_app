import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_app/core/viewModel/chat_model.dart';
import 'package:provider/provider.dart';

class SendMessageContainer extends StatefulWidget {
  final ValueChanged<String> onSubmit;

  SendMessageContainer({
    Key key,
    this.onSubmit,
  }) : super(key: key);

  @override
  _SendMessageContainerState createState() => _SendMessageContainerState();
}

class _SendMessageContainerState extends State<SendMessageContainer> {
  String _message;
  final _messageController = TextEditingController();
  VendorChatProvider vendorChatProvider = VendorChatProvider();

  void _sendMessage() {
    widget.onSubmit(_message);
    ChatMessage msg = _createMessageFromText(_message);
    vendorChatProvider.pushMessageToDatabase(
      msg,
    );
    _message = '';
    _messageController.clear();
    setState(() {});
  }

  ChatMessage _createMessageFromText(String textMessage) {
    return ChatMessage(
      message: textMessage,
      timeStamp: DateFormat('yyyy-MM-ddTHH:mm:ss').format(DateTime.now()),
    );
  }

  @override
  Widget build(BuildContext context) {
    vendorChatProvider = Provider.of<VendorChatProvider>(context);

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              onChanged: (msg) {
                setState(() {
                  _message = msg;
                });
              },
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'اكتب رسالة',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          RawMaterialButton(
            onPressed: () {
              _message == null || _message.isEmpty ? null : _sendMessage();
            },
            fillColor: _message == null || _message.isEmpty
                ? Colors.blueGrey
                : Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'ارسال',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
