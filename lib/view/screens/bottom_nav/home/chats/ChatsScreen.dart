import 'package:customerapp/controller/ChatsController.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../constant.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
        title: CustomText(
          text: "Chats",
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
      body:  ChangeNotifierProvider<ChatsController>(
    create: (context) => ChatsController(),
child: Consumer<ChatsController>(
    builder: (context, value, child) {
  return ListView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: value.Chatslist.length,
    itemBuilder: (BuildContext context, int index) {

      return Card(
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                elevation: 8.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundColor: white,
                        foregroundColor: white,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                              backgroundColor: Colors.black,
                              foregroundColor: primarydarkcolor,
                              backgroundImage: NetworkImage(
                                "${value.Chatslist[index].image}",
                              ),
                              radius: 25),
                        ),
                      ),
                      title: Container(
                        // padding: EdgeInsets.only(top: 3),
                        child: CustomText(
                          text: "${value.Chatslist[index].Receiver_name}",
                          textAlign: TextAlign.left,
                          color:Colors.black ,
                          fontWeight: FontWeight.bold,
                            fontSize: 16

                        ),
                      ),
                      subtitle: CustomText(
                          text:"${value.Chatslist[index].messageTime}",
                          textAlign: TextAlign.left,
                          color: Colors.black54,
                          fontSize: 14
                      ),
                      trailing:(value.Chatslist[index].unread_count=="0")?SizedBox()
                          :MaterialButton(
                        onPressed: () {},
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text("${value.Chatslist[index].unread_count}"),
                        padding: EdgeInsets.all(0),
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ),
              );

      // return RadioListTile(
      //     groupValue: radioItemCompanies,
      //     value: value.companieslist[index],
      //     activeColor: primarydarkcolor,
      //     dense: true,
      //     title: Text(
      //       value.companieslist[index],
      //     ),
      //     onChanged: (Object? value) {
      //       setState(() {
      //         radioItemCompanies = value;
      //       });
      //     });
    },
  );
}),

      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(5.0),
      //   child: ListView(
      //       children: [
      //     Card(
      //       margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      //       elevation: 8.0,
      //       child: Container(
      //         width: MediaQuery.of(context).size.width,
      //         child: Container(
      //           child: ListTile(
      //             onTap: () {},
      //             leading: CircleAvatar(
      //               backgroundColor: white,
      //               foregroundColor: white,
      //               radius: 30,
      //               child: Padding(
      //                 padding: const EdgeInsets.all(3.0),
      //                 child: CircleAvatar(
      //                     backgroundColor: Colors.black,
      //                     foregroundColor: primarydarkcolor,
      //                     backgroundImage: NetworkImage(
      //                       "https://as2.ftcdn.net/v2/jpg/01/78/10/59/1000_F_178105933_A27LvXzS32mawAbj1ZsqpyC2rIakXehY.jpg",
      //                     ),
      //                     radius: 25),
      //               ),
      //             ),
      //             title: Container(
      //               // padding: EdgeInsets.only(top: 3),
      //               child: CustomText(
      //                 text: "Hassan Daboos",
      //                 textAlign: TextAlign.left,
      //                 color:Colors.black ,
      //                 fontWeight: FontWeight.bold,
      //                   fontSize: 16
      //
      //               ),
      //             ),
      //             subtitle: CustomText(
      //                 text:"السلام عليكم",
      //                 textAlign: TextAlign.left,
      //                 color: Colors.black54,
      //                 fontSize: 14
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //
      //
      //   ]),
      // ),
    );
  }
}
