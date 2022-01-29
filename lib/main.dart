import 'package:flutter/material.dart';
import 'package:flutter_app_todoey2/models/task_list_obj.dart';
import 'package:flutter_app_todoey2/models/task_obj.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TaskListObj aba = TaskListObj();
    final TaskData td= TaskData();

    final LocalStorage storage = new LocalStorage('localstorage_app');

    storage.setItem('name', 'Abolfazl');







    //prefs.remove('apiToken');



    //Registering Multiple providers
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => aba),
        ChangeNotifierProvider(create: (context) => td),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }
  //var checkBoxStatus = [false,false,false];

  //List<bool> checkBoxStatus = [false, false, false];
  var checkBoxStatus = false;
  var checkBoxStatus1 = false;
  var checkBoxStatus2 = false;

  setData() async { // Async func to handle Futures easier; or use Future.then
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = "Hi";
    prefs.setString('apiToken', token);

  }

  final LocalStorage storage = new LocalStorage('localstorage_app');
  var token = "ok";
  loadData() async { // Async func to handle Futures easier; or use Future.then
    SharedPreferences  prefs= await SharedPreferences.getInstance();

    token = prefs.getString('apiToken');
    print(token);
  }


  List<CheckboxListTile> listOfCheckBoxes =[];
  @override
  Widget build(BuildContext context) {
    setData();
    loadData();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final name = storage.getItem('name');
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,


                children:[
                  CircleAvatar(

                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 35,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Todoey",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold


                    ),

                  ),

                  Text("12 Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal


                    ),
                  ),

                  Text(token,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal


                    ),
                  ),



  ]
              ),
            ),
            Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                // boxShadow: [
                //   BoxShadow(color: Colors.grey, spreadRadius: 3),
                // ],
              ),
              //color: Colors.white,

              height: 580,

child: Container(

  padding: EdgeInsets.only(top: 20),
  margin: EdgeInsets.all(20),
  child:   Column(

    children:    getCheckBoxList(Provider.of<TaskListObj>(context).allTasks)
  ),
),


            )
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headline4,
            // ),
          ],
        ),

      floatingActionButton: FloatingActionButton(
       onPressed: _settingModalBottomSheet,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<TaskData> listOfStrings = [];






  List<CheckboxListTile> getCheckBoxList(List<TaskData> listOfStrings) {
    listOfCheckBoxes.clear();
      for (var str in listOfStrings) {

      var checkbox = CheckboxListTile(value: str.isDone,

        onChanged: (value) {
          setState(() {

          });
          str.isDone = !str.isDone;
          value = str.isDone;
          print("value..$value");
        },
        title: Text(str.taskName,
          style: new TextStyle(
            // color: Colors.grey,
            decoration: str.isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
      );

      listOfCheckBoxes.add(checkbox);

      }

      return listOfCheckBoxes;
  }

  void _settingModalBottomSheet(){

    showModalBottomSheet<void>(
      //isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
                padding: EdgeInsets.all(30.0),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Text('Add Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightBlueAccent,

                      ),
                    ),
                    new TextField(
                      autofocus: true,
                      onChanged: (newString){
                        print(newString);
                        //setState(() {
                        Provider.of<TaskData>(context,listen: false).changeString(newString);
                        //textVal=value;

                        //});
                      },
                    ),

                    TextButton(
                      child: Text('Submit'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.lightBlueAccent,
                        onSurface: Colors.grey,
                        //padding: EdgeInsets.only(left: 120,right: 120),

                      ),
                      onPressed: () {
                        //setState(() {
                        print(listOfStrings);
                        var textVal=Provider.of<TaskData>(context,listen:false).taskName;
                        TaskData td3 = TaskData(taskName: textVal,isDone: false);
                        // listOfStrings.add(td3);
                        print('ttextVal: $textVal');
                        // print(listOfStrings);

                        Provider.of<TaskListObj>(context, listen: false).addTodo(td3);
                        //'${context.watch<TaskData>().}';
                        //getCheckBoxesWithWidgets();
                        Navigator.pop(context);
                        // });

                      },
                    )
                  ],
                )));
      },
    );

  }

}



////.........static checkbox


class _MyHomePageState2 extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }
  //var checkBoxStatus = [false,false,false];

  //List<bool> checkBoxStatus = [false, false, false];
  var checkBoxStatus = false;
  var checkBoxStatus1 = false;
  var checkBoxStatus2 = false;


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,


                children:[
                  CircleAvatar(

                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 35,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Todoey",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold


                    ),

                  ),

                  Text("12 Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal


                    ),)
                ]
            ),
          ),
          Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              // boxShadow: [
              //   BoxShadow(color: Colors.grey, spreadRadius: 3),
              // ],
            ),
            //color: Colors.white,

            height: 580,

            child: Container(

              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.all(20),
              child:   Column(

                  children:   [


                    CheckboxListTile(value: checkBoxStatus,

                      onChanged: (value){
                        setState(() {

                        });
                        checkBoxStatus = !checkBoxStatus;
                        value = checkBoxStatus;
                        print("value..$value");
                      },
                      title: Text("This is a Task",
                        style: new TextStyle(
                          // color: Colors.grey,
                          decoration: checkBoxStatus ? TextDecoration.lineThrough : TextDecoration.none,
                        ),
                      ),
                    ),
                    CheckboxListTile(value: checkBoxStatus1,

                      onChanged: (value){
                        setState(() {

                        });
                        checkBoxStatus1 = !checkBoxStatus1;
                        value = checkBoxStatus1;
                        print("value..$value");
                      },
                      title: Text("This is a Task",
                        style: new TextStyle(
                          // color: Colors.grey,
                          decoration: checkBoxStatus1 ? TextDecoration.lineThrough : TextDecoration.none,
                        ),

                      ),
                    ),
                    CheckboxListTile(value: checkBoxStatus2,

                      onChanged: (value){
                        setState(() {

                        });
                        checkBoxStatus2 = !checkBoxStatus2;
                        value = checkBoxStatus2;
                        print("value..$value");
                      },
                      title: Text("This is a Task",
                        style: new TextStyle(
                          // color: Colors.grey,
                          decoration: checkBoxStatus2 ? TextDecoration.lineThrough : TextDecoration.none,
                        ),
                      ),
                    ),
                  ]
              ),
            ),


          )
          // Text(
          //   'You have pushed the button this many times:',
          // ),
          // Text(
          //   '$_counter',
          //   style: Theme.of(context).textTheme.headline4,
          // ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
         onPressed: (){

           print("printing");

           // showModalBottomSheet<void>(
           //   //isScrollControlled: true,
           //   context: context,
           //   shape: RoundedRectangleBorder(
           //     borderRadius: BorderRadius.only(
           //         topLeft: Radius.circular(30.0),
           //         topRight: Radius.circular(30.0)),
           //   ),
           //   builder: (BuildContext context) {
           //     return Padding(
           //         padding: MediaQuery.of(context).viewInsets,
           //         child: Container(
           //             padding: EdgeInsets.all(30.0),
           //             child: Wrap(
           //               alignment: WrapAlignment.center,
           //               children: <Widget>[
           //                 Text('Add Task',
           //                   textAlign: TextAlign.center,
           //                   style: TextStyle(
           //                     fontSize: 20,
           //                     color: Colors.lightBlueAccent,
           //
           //                   ),
           //                 ),
           //                 new TextField(
           //                   autofocus: true,
           //                   onChanged: (newString){
           //                     print(newString);
           //                     //setState(() {
           //                     Provider.of<TaskData>(context,listen: false).changeString(newString);
           //                     //textVal=value;
           //
           //                     //});
           //                   },
           //                 ),
           //
           //                 TextButton(
           //                   child: Text('Submit'),
           //                   style: TextButton.styleFrom(
           //                     primary: Colors.white,
           //                     backgroundColor: Colors.lightBlueAccent,
           //                     onSurface: Colors.grey,
           //                     //padding: EdgeInsets.only(left: 120,right: 120),
           //
           //                   ),
           //                   onPressed: () {
           //                     //setState(() {
           //                    // print(listOfStrings);
           //                     var textVal=Provider.of<TaskData>(context,listen:false).taskName;
           //                     TaskData td3 = TaskData(taskName: textVal,isDone: false);
           //                     // listOfStrings.add(td3);
           //                     print('ttextVal: $textVal');
           //                     // print(listOfStrings);
           //
           //                     Provider.of<TaskListObj>(context, listen: false).addTodo(td3);
           //                     //'${context.watch<TaskData>().}';
           //                     //getCheckBoxesWithWidgets();
           //                     Navigator.pop(context);
           //                     // });
           //
           //                   },
           //                 )
           //               ],
           //             )));
           //   },
           // );
         },
        tooltip: 'Increment',
        child: Icon(Icons.add,
        color: Colors.lightBlueAccent
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

