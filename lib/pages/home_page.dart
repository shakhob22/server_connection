import 'package:flutter/material.dart';
import 'package:server_connection/models/post_model.dart';
import 'package:server_connection/services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";
  var post = Post(id: 1, employee_name: "Shahob", employee_salary: "250000", employee_age: 20, profile_image: "image.png");

  void _apiPostGetAll(){
    Network.GET(Network.API_EMPLOYEES, Network.paramsEmpty()).then((value) => {
      _showResponse("Get all: \n\n" + value!)
    });
  }

  void _apiPostGetOne(){
    Network.GET(Network.API_EMPLOYEE, Network.paramsEmpty()).then((value) => {
      _showResponse("Get one: \n\n" + value!)
    });
  }

  void _apiPostCreate(){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((value) => {
      _showResponse("Create: \n\n" + value!)
    });
  }

  void _apiPostUpdate(){
    Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post)).then((value) => {
      _showResponse("Update: \n\n" + value!)
    });
  }

  void _apiPostDel(){
    Network.DEL(Network.API_DELETE, Network.paramsEmpty()).then((value) => {
      _showResponse("DELETE: \n\n" + value!)
    });
  }

  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 1,),
                MaterialButton(
                  onPressed: (){
                    _apiPostGetAll();
                  },
                  child: Text("GET_ALL"),
                  color: Colors.green,
                ),
                MaterialButton(
                  onPressed: (){
                    _apiPostGetOne();
                  },
                  child: Text("GET_ONE"),
                  color: Colors.greenAccent,
                ),
                MaterialButton(
                  onPressed: (){
                    _apiPostCreate();
                  },
                  child: Text("POST"),
                  color: Colors.blue.shade800,
                ),
                MaterialButton(
                  onPressed: (){
                    _apiPostUpdate();
                  },
                  child: Text("PUT"),
                  color: Colors.blue,
                ),
                SizedBox(width: 1,),
              ],
            ),
            MaterialButton(
              onPressed: (){
                _apiPostDel();
              },
              child: Text("DEL"),
              color: Colors.red,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Text((data.isNotEmpty) ? data: "No Data"),
              ),
            )
          ],
        ),
      ),

    );
  }
}
