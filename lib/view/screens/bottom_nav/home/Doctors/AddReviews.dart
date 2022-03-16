
import 'package:customerapp/view/widgets/CustomButton.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../constant.dart';
class AddReviews extends StatefulWidget {
  var id;
  var reviews;

  AddReviews(this.id);

  @override
  _AddReviewsState createState() => _AddReviewsState();
}

class _AddReviewsState extends State<AddReviews> {
  var stars;
  TextEditingController _messageController = TextEditingController();

  // void addratefun() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   var id = preferences.getString("id")?.toString();
  //   var url = Uri.parse(
  //       "https://allsportscourts.com/sportsws.php?type=insertreviews&format=json&message=${_messageController.text.toString()}&rate=$stars&courtid=${widget.id}&customerid=$id&_=1637832492440");
  //   print(url);
  //   var response = await http.get(url);
  //   var responseBody = jsonDecode(response.body)["posts"]["inserted"];
  //   print(responseBody);
  //   if (responseBody == 1) {
  //     print("responseBody");
  //     Navigator.pop(context);
  //     // Navigator.of(context, rootNavigator: true).pushReplacement(
  //     //     MaterialPageRoute(
  //     //         builder: (context) =>
  //     //             new ReviewsCortScreen(widget.reviews, widget.id)));
  //   } else {
  //     Get.snackbar("ASC", "Please check your Internet");
  //   }
  //   // checkid();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Add Review",
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
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: ListView(
            children: [
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "Rating",
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 33,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                    setState(() {
                      stars = rating;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    "Message",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 15),
                    child: TextFormField(
                      controller: _messageController,
                      maxLines: 10,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        // filled: true,
                          fillColor: Colors.white,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: "Please add a review "),
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Please Enter Review';
                        }
                        return null;
                      },
                    ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              CustomButton(
                text: 'ADD',
                onPressed: () {
                  // addratefun();
                },
              ),
            ],
          )),
    );
  }
}