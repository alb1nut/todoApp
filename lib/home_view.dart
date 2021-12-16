import 'package:flutter/material.dart';
import 'package:my_task_app/to_do_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF20306C),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1638794249638-b97e05aaa900?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
            ),
          ),
        ),
        title: Text("My Tasks"),
        actions: [
          Icon(Icons.filter_list_rounded),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.search),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xff0f4ff),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.check_circle_outline_outlined),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Plan a trip to Finland",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff44527e),
                            ),
                          ),
                          Text(
                            "planning the trip",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.notifications),
                        Text(
                          "Yeterday",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }, //takes an anonymous function (contex,index) returns card /listtiles /etc widget
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          }, //takes an anonymous function (contex,index)returns widget you want to use a s seperater ie SizedBox,Divider etc
          itemCount: 5, // number of itemBuilder to display eg in a list
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: InkWell(
          onTap: () {
            showBarModalBottomSheet(
             
              context: context,
              builder: (context) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_outline_outlined),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Plan a trip to Finland",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff44527e),
                                    ),
                                  ),
                                  Text(
                                    "planning the trip",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.notifications),
                                Text(
                                  "Yeterday",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }, //takes an anonymous function (contex,index) returns card /listtils /etc widget
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  }, //takes an anonymous function (contex,index)returns widget you want to use a s seperater ie SizedBox,Divider etc
                  itemCount: 5, // number of itemBuilder to display eg in a list
                );
              },
            );
          },
          child: Card(
            color: Color(0xFF20306C),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.check_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Completed",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "24",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ToDoView();
              },
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff20306c),
      ),
    );
  }
}
