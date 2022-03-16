import 'package:customerapp/constant.dart';
import 'package:customerapp/controller/ControlergetFavorit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoriteCard extends StatefulWidget {
  var doctors;

  FavoriteCard(this.doctors);

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
      child: Container(
        child: new Stack(
          children: <Widget>[
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.doctors.full_name}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${widget.doctors.email}",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    RatingBarIndicator(
                      rating: double.parse(widget.doctors.rating),
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 25.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.0, -0.4),
              child: Align(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage("${widget.doctors.img}"),
                ),
                alignment: FractionalOffset(0.5, 0.0),
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.46, 2.2),
              child: Align(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      primary: textblue,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(5)),
                  child: const Icon(
                    Icons.favorite,
                    size: 25,
                    color: primarydarkcolor,
                  ),
                  onPressed: () {
                    ControlergetFavorit.DeleteFavorit(widget.doctors.wp_user_id);
                  },
                ),
                alignment: FractionalOffset(0.4, 0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
