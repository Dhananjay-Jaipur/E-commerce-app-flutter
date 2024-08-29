import 'package:flutter/material.dart';
import 'package:store/components/tiles.dart';
import 'package:store/pages/shop.dart';
import 'package:store/models/imagePaths.dart';

class MyAddress extends StatelessWidget {
  MyAddress({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .8,

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(14),
      ),

      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 13,
                      backgroundImage: AssetImage(Imagepaths.user),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

              for(int i=0; i<2; i++)
                addressTile(),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

              InkWell(
                onTap: (){},
                child: Text(
                  "add new",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 43,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueAccent,
                  ),
                ),

              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            ],
          ),
        ),
    );
  }
}


class addressTile extends StatelessWidget {
  addressTile({super.key});

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
            suffixIcon: IconButton(
                onPressed: (){Navigator.pop(context);},
                icon: Icon(Icons.done_outline, color: Theme.of(context).colorScheme.primary,)
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
      ),
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "👤  name",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary,),),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "📞  phone number",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary,),),
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

          SizedBox(width: MediaQuery.of(context).size.width * 0.8, child: Divider(color: Theme.of(context).colorScheme.secondary,)),

          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🏠 ️ house no",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary,),),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🛣️ ️  street",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary,),),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "📍  pin code",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary,),),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🌆  city",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary,),),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🗺️  state",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary,),),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🌍  country",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              IconButton(onPressed: (){DilogBox("edit it...", context);}, icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary,),),
            ],
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

        ],
      ),
    );
  }
}
