import 'package:customerapp/constant.dart';
import 'package:customerapp/controller/ProfileController.dart';
import 'package:flutter/material.dart';

import 'EditProfile.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ProfileController.getProfile(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.7,
                  margin: const EdgeInsets.only(top: 60),
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                      color: primarydarkcolor,
                      border: Border.all(color: primarydarkcolor, width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 90.0,
                          width: double.infinity,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: primarydarkcolor,
                            image: new DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: NetworkImage(
                                "${snapshot.data["image"]}",
                              ),
                            ),
                            border: Border.all(color: Colors.white, width: 3),
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
                                  "First Name",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "${snapshot.data["firstName"]}",
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
                                        Icons.edit_outlined,
                                        color: white,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder:
                                                (BuildContext context) {
                                          return EditProfile(firstName: "${snapshot.data["firstName"]}", city: "${snapshot.data["city"]}", country: "${snapshot.data["country"]}", phone2: "${snapshot.data["phone2"]}", lastName: "${snapshot.data["lastName"]}", email: "${snapshot.data["user_email"]}", mobile: "${snapshot.data["phone"]}", address:"${snapshot.data["address"]}",);
                                        }));
                                      },
                                    ),
                                    Text(
                                      "Edit",
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
                            "Last Name",
                            style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "${snapshot.data["lastName"]}",
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
                      ("${snapshot.data["user_email"]}"=="")? SizedBox() :      Container(
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
                          subtitle: Row(
                            children: [
                              Text(
                                "${snapshot.data["user_email"]}",
                                style: TextStyle(
                                  color: grayborder,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Icon(
                                  Icons.verified_user,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ("${snapshot.data["user_email"]}"=="")? SizedBox() :    SizedBox(
                        height: 10,
                      ),
                      ("${snapshot.data["phone"]}"=="")? SizedBox() : Container(
                        height: 35,
                        child: ListTile(
                          title: Text(
                            "Phone",
                            style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "${snapshot.data["phone"]}",
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
                      ("${snapshot.data["phone2"]}"=="")? SizedBox() :   Container(
                        height: 35,
                        child: ListTile(
                          title: Text(
                            "Another Phone",
                            style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "${snapshot.data["phone2"]}",
                            style: TextStyle(
                              color: grayborder,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      ("${snapshot.data["phone2"]}"=="")? SizedBox() :   SizedBox(
                        height: 10,
                      ),
                      ("${snapshot.data["country"]}"=="")? SizedBox() :    Container(
                        height: 35,
                        child: ListTile(
                          title: Text(
                            "Country",
                            style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "${snapshot.data["country"]}",
                            style: TextStyle(
                              color: grayborder,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      ("${snapshot.data["country"]}"=="")? SizedBox() :   SizedBox(
                        height: 10,
                      ),
                      ("${snapshot.data["city"]}"=="")? SizedBox() :   Container(
                        height: 35,
                        child: ListTile(
                          title: Text(
                            "City",
                            style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "${snapshot.data["city"]}",
                            style: TextStyle(
                              color: grayborder,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      ("${snapshot.data["city"]}"=="")? SizedBox() : SizedBox(
                        height: 10,
                      ),
                      ("${snapshot.data["address"]}"=="")? SizedBox() :Container(
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
                            "${snapshot.data["address"]}",
                            style: TextStyle(
                              color: grayborder,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      ("${snapshot.data["address"]}"=="")? SizedBox() :   SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
