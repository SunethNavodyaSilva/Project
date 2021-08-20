import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:intl/intl.dart';

class ChatBot extends StatefulWidget {
  ChatBot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChatBotState createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  void answer(q) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/project.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(q);
    setState(() {
      msgs.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });
  }

  final _msg = TextEditingController();
  List<Map> msgs = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text(
          'CHATBOT',
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/FitnLift-03.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemCount: msgs.length,
                itemBuilder: (context, index) => talk(
                  msgs[index]["message"].toString(),
                  msgs[index]["data"],
                ),
              ),
            ),
            SizedBox(
              height: 19.9,
            ),
            Divider(
              height: 5.9,
              color: Colors.lightBlue,
            ),
            Container(
              child: ListTile(
                title: Container(
                  height: 34.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14.9)),
                    color: Color.fromRGBO(220, 220, 220, 1),
                  ),
                  padding: EdgeInsets.only(left: 13.9),
                  child: TextFormField(
                    controller: _msg,
                    decoration: InputDecoration(
                      hintText: "Type Anything",
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 15.9,
                      color: Colors.black,
                    ),
                    onChanged: (value) {},
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.send_sharp,
                      size: 29.9,
                      color: Colors.lightBlue,
                    ),
                    onPressed: () {
                      if (_msg.text.isEmpty) {
                        print("Please Enter Anything");
                      } else {
                        setState(() {
                          msgs.insert(0, {"data": 1, "message": _msg.text});
                        });
                        answer(_msg.text);
                        _msg.clear();
                      }
                      FocusScopeNode cf = FocusScope.of(context);
                      if (!cf.hasPrimaryFocus) {
                        cf.unfocus();
                      }
                    }),
              ),
            ),
            SizedBox(
              height: 14.9,
            )
          ],
        ),
      ),
    );
  }

  Widget talk(String msg_, int data) {
    return Container(
      padding: EdgeInsets.only(left: 19.9, right: 19.9),
      child: Row(
        mainAxisAlignment:
            data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0
              ? Container(
                  height: 59.9,
                  width: 59.9,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/robot.png"),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(9.9),
            child: Bubble(
                radius: Radius.circular(14.9),
                color: data == 0 ? Colors.lightBlue : Colors.orange,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 9.9,
                      ),
                      Flexible(
                          child: Container(
                        constraints: BoxConstraints(maxWidth: 199.9),
                        child: Text(
                          msg_,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ))
                    ],
                  ),
                )),
          ),
          data == 1
              ? Container(
                  height: 59.9,
                  width: 59.9,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/user.png"),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
