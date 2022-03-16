import 'package:customerapp/model/Doctors.dart';
import 'package:customerapp/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:share/share.dart';

import '../../../../../constant.dart';
import 'AddReviews.dart';
class ProfileDoctor extends StatefulWidget {
  Doctors _doctors;

  ProfileDoctor(this._doctors);
  @override
  _ProfileDoctorState createState() => _ProfileDoctorState();
}

class _ProfileDoctorState extends State<ProfileDoctor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Consultations",
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
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0, vertical: 10.0),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/1.3,
              margin: const EdgeInsets.only(top: 60),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                  color: primarydarkcolor,
                  border:
                  Border.all(color: primarydarkcolor, width: 0.0),
                  borderRadius:
                  BorderRadius.all(Radius.circular(10.0))),
              child:  SingleChildScrollView(
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: RatingBarIndicator(
                        rating:  double.parse(widget._doctors.rating),
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 30.0,
                        direction: Axis.horizontal,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddReviews("${widget._doctors.wp_user_id}")),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add Reviews",
                              style: TextStyle(
                                color: white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 60,
                          child: Container(
                            height: 35,
                            child: ListTile(
                              title: Text(
                                "Name",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "${widget._doctors.full_name}",
                                style: TextStyle(
                                  color: grayborder,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 30,
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Editprofile(
                              //         titlecountry: " ",
                              //         codecountry: " ",
                              //         titlecity: " ",
                              //         codecity: " ",
                              //         titlenationalities: " ",
                              //         codenationalities: " ",
                              //       )),
                              // );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.chat,
                                      color: white,
                                      size: 20,
                                    ), onPressed: () {  },
                                  ),
                                  Text(
                                    "chat",
                                    style: TextStyle(
                                      color: white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                    Container(
                      height: 35,
                      child: ListTile(
                        title: Text(
                          "Company name",
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${widget._doctors.company_name}",
                          style: TextStyle(
                            color: grayborder,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 35,
                      child: ListTile(
                        title: Text(
                          "Email",
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${widget._doctors.email}",
                          style: TextStyle(
                            color: grayborder,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      child: ListTile(
                        title: Text(
                          "mobile",
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${widget._doctors.mobile}",
                          style: TextStyle(
                            color: grayborder,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      child: ListTile(
                        title: Text(
                          "Address",
                          style: TextStyle(
                            color: white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "${widget._doctors.address}",
                          style: TextStyle(
                            color: grayborder,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ListTile(
                      title: Text(
                        "Description",
                        style: TextStyle(
                          color: white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Html(
                        data: "${widget._doctors.bio}",

                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),


                  ],
                ),
              ),
            ),

          Container(
                height: 90.0,
                width: double.infinity,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: primarydarkcolor,
                  image: new DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: NetworkImage(
                      "${widget._doctors.img}",
                    ),
                  ),
                  border: Border.all(
                      color:  Colors.white,
                      width: 3),
                ),
              ),

          ],
        ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: FloatingActionButton(
          onPressed: () {
    Share.share(
    'Shared by Application el-mostashfa ${widget._doctors.profile_link}');

          },
          child: Icon(Icons.share),
          backgroundColor: primarydarkcolor,
          elevation: 5,
        ),
      ),
    );
  }
}
