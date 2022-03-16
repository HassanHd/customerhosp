import 'package:customerapp/view/screens/bottom_nav/profile/utilscreen.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import 'profile/mypatienthistory.dart';
import 'profile/myprifile.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>   with SingleTickerProviderStateMixin {
  final tabList = ["My Profile","Utiles"];
  final tab = [MyProfile()];
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: tabList.length);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textblue,
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile'),
        bottom: TabBar(
          indicatorWeight: 10,
          controller: _tabController,
          tabs: tabList.map((item) {
            return Tab(
              text: item,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          MyProfile(),

          UtilesScreen(),
        ],
      ),
    );
  }
}
