import "package:flutter/material.dart";
class CourseTile extends StatelessWidget {
  final String coursename;
  final String imagepath;
  const CourseTile({Key? key,
    required this.coursename,
    required this.imagepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text("Recommended Courses:",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Container(
            width: 300,
            child: ElevatedButton(
                onPressed: () {},
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top:20),
                      child: SizedBox(width: 65, height: 65, child: Container(decoration: BoxDecoration(border: Border.all(width: 1.5)),child: Image.asset(imagepath,fit: BoxFit.fill ))),
                    ),
                    Text(coursename,style:const TextStyle(fontSize: 16) )
                  ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
