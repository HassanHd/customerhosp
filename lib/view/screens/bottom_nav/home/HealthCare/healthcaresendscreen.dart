import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../../constant.dart';
class HealthCareSendScreen extends StatefulWidget {
  const HealthCareSendScreen({Key? key}) : super(key: key);

  @override
  _HealthCareSendScreenState createState() => _HealthCareSendScreenState();
}

class _HealthCareSendScreenState extends State<HealthCareSendScreen> {
  var radioItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Health Care",
          color: black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: primarydarkcolor,
            size: 35,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
           ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: CustomText(
                  text:
                  "Do you have any medical information?",
                  color: black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            dense: false,
            subtitle: Row(
              children: [
                Expanded(
                  flex: 50,
                  child: RadioListTile(
                    groupValue: radioItem,
                    value: "1",
                    activeColor: primarydarkcolor,
                    title: Text("Yse"),
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                        print("radioItem----$radioItem");
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: RadioListTile(
                    groupValue: radioItem,
                    value: "0",
                    activeColor: primarydarkcolor,
                    title: Text("NO"),
                    onChanged: (val) {
                      setState(() {
                        radioItem = val;
                        print("radioItem----$radioItem");
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      ),

    );
  }
}
