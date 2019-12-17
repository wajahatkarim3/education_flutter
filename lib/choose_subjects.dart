import 'package:flutter/material.dart';

class ChooseSubjects extends StatefulWidget {

  @override
  _ChooseSubjectsState createState() {
    return _ChooseSubjectsState();
  }
}

class _ChooseSubjectsState extends State<ChooseSubjects> {

  List<SubjectItem> subjectsList = [
    SubjectItem(true, "Chemistry", "6 Months", 30),
    SubjectItem(false, "Mathematics", "3 Months", 50),
    SubjectItem(false, "Physics", "1 Months", 20),
    SubjectItem(true, "English", "6 Months", 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Subjects"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: subjectsList.length,
            itemBuilder: (context, position) {
              return createSubjectCard(subjectsList.elementAt(position), position);
            }
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10),
        child: MaterialButton(
            child: Text("Proceed", style: TextStyle(color: Colors.white),),
            color: Colors.green,
            padding: EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
            onPressed: () { }
        ),
      ),
    );
  }

  Container createSubjectCard(SubjectItem subjectItem, int position)
  {
    return Container(
      child: Card(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Checkbox(
                    activeColor: Colors.green,
                    value: subjectItem.isChecked,
                    onChanged: (v) {
                      setState(() {
                        subjectsList.elementAt(position).isChecked = v;
                      });
                    }
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      subjectItem.subjectName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        subjectItem.duration,
                        style: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.normal,
                            fontSize: 14
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "\$ " + subjectItem.price.toString(),
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "per month",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          )
      ),
    );
  }

}

class SubjectItem {
  bool isChecked;
  String subjectName;
  String duration;
  double price;

  SubjectItem(this.isChecked, this.subjectName, this.duration, this.price);
}