import 'package:flutter/material.dart';
import 'package:store/models/user.dart';
import 'package:store/pages/shop.dart';
import 'package:store/models/imagePaths.dart';

class ProfileSetting extends StatelessWidget {
  ProfileSetting({super.key});

  TextEditingController textControler = TextEditingController();

  void DilogBox(text, context){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        content: TextField(
          controller: textControler,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
          decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
            suffixIcon: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.done_outline, color: Theme.of(context).colorScheme.primary,)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){Navigator.pop(context);},
        ),
        centerTitle: true,
        title: Text("my account", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),),
        // flexibleSpace: const Image(
        //   image: AssetImage('asset/ae15d75a7b430dea3857b89e5df5fc63.jpg'),
        //   fit: BoxFit.contain,
        // ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onSecondary),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [

            SizedBox(height: MediaQuery.of(context).size.width / 13,),

            Center(
              child: Column(
                children: [

                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 13,
                    backgroundImage: NetworkImage(user.profile_picture),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.width / 30,),

                  InkWell(
                    onTap: (){},
                    child: Text(
                      "change profile picture",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 43,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.width / 13,),

            SizedBox(width: MediaQuery.of(context).size.width * 0.8, child: Divider()),

            SizedBox(height: MediaQuery.of(context).size.width / 20,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "👤  ${user.Username}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                      IconButton(
                        onPressed: (){
                          DilogBox("edit it...", context);
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "🫅  male",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                      IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.width / 25,),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.8, child: Divider()),

                  SizedBox(height: MediaQuery.of(context).size.width / 25,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "🪪  user ID",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                      IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "🗝️  change password",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                      IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "📧  ${user.email}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                      IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "📞  ${user.phone_number}",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                      IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "🐣  D-O-B",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                      IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit),),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.width / 25,),

                  SizedBox(width: MediaQuery.of(context).size.width * 0.8, child: Divider()),

                  SizedBox(height: MediaQuery.of(context).size.width / 25,),

                  InkWell(
                    onTap: (){},
                    child: Text(
                      "️delete account",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 43,
                        fontWeight: FontWeight.w500,
                        color: Colors.redAccent,
                      ),
                    ),

                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
