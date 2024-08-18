import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/components/drawer.dart';
import 'package:store/models/user.dart';
import 'package:store/pages/home.dart';
import 'package:store/pages/loginPages/backend.dart';
import 'package:store/pages/my%20address.dart';
import 'package:store/pages/profileSetting.dart';
import 'package:store/pages/shop.dart';
import 'package:store/models/imagePaths.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  void Logout() async{
    await BackEnd.instace.SignoutUser();
    Get.to(() => Home(i: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: myDrawer(),

      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
            ),

            expandedHeight: MediaQuery.of(context).size.height / 4,
            iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSecondary),

            // IF YOU WANT TO ADD IMAGE IN THE BG::::::::
            flexibleSpace: Stack(
              children: <Widget>[
                InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSetting()));},
                  child: Center(
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 13,
                      backgroundImage: NetworkImage(user.profile_picture),
                    ),
                  ),
                ),
                
                Positioned(
                  bottom: MediaQuery.of(context).size.width / 20,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${user.email} 🔥",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 43,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20,),),

          SliverToBoxAdapter(
            child: Center(child: Text("${user.Username}", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary))),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 30)),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 15,),
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      color: Theme.of(context).colorScheme.shadow,
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 60),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                      height: MediaQuery.of(context).size.height / 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "️📬  notification",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 43,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),

                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),

                    onTap: (){},
                  ),

                  InkWell(
                    child: Container(
                      color: Theme.of(context).colorScheme.shadow,
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 60),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                      height: MediaQuery.of(context).size.height / 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "💳  payment",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 43,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),

                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),

                    onTap: (){},
                  ),

                  InkWell(
                    child: Container(
                      color: Theme.of(context).colorScheme.shadow,
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 60),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                      height: MediaQuery.of(context).size.height / 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "📦  my orders",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 43,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),

                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),

                    onTap: (){},
                  ),

                  InkWell(
                    child: Container(
                      color: Theme.of(context).colorScheme.shadow,
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 60),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                      height: MediaQuery.of(context).size.height / 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "📃  order history",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 43,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),

                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),

                    onTap: (){},
                  ),

                  InkWell(
                    child: Container(
                      color: Theme.of(context).colorScheme.shadow,
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 60),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                      height: MediaQuery.of(context).size.height / 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "🚛  my returns",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),

                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),

                    onTap: (){},
                  ),

                  InkWell(
                    child: Container(
                      color: Theme.of(context).colorScheme.shadow,
                      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.width / 60),
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 50),
                      height: MediaQuery.of(context).size.height / 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "🏢  my addresses",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 20,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),

                          Icon(Icons.arrow_forward_ios_rounded),
                        ],
                      ),
                    ),

                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyAddress()));},
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: InkWell(
              onTap: (){
                Logout();
              },

              child: Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
                height: MediaQuery.of(context).size.width / 5,
                width: MediaQuery.of(context).size.width / 2.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                child: Center(
                  child: Text("log-out", style: TextStyle(fontSize: 26, color: Theme.of(context).colorScheme.error)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
