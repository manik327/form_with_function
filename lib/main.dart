import 'package:flutter/material.dart';

import 'custom_textfield.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Flutter Form Demo';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  int currentIndex = 0;

  List<MyModel> myData = [
    MyModel(hinttext: "Manik", labeltext: "Mehra", returns: "error"),
    MyModel(hinttext: "Manik", labeltext: "Mehra", returns: "error"),
    MyModel(hinttext: "Manik", labeltext: "Mehra", returns: "error"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _mainBuild());
  }

  _mainBuild() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomField(
            controller: nameController,
            validator: (String? value) {
              if ((value ?? "").isEmpty) {
                return "jsdjf";
              }
            },
          ),
          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                print("====> validate");
              } else {
                print("===> novlaidate");
              }
            },
            child: Text("Login"),
          )
        ],
      ),
    );
  }

  _mainBuild1() {
    return Column(children: [
      textformfiled1(
          text1: List.from(myData),
          text2: myData,
          text3: myData,
          text4: myData,
          iconData: myData),
      SizedBox(
        height: 10,
      ),
      textformfiled2(
          text1: myData,
          text2: myData,
          text3: myData,
          text4: myData,
          iconData: myData),
    ]);

    /*TextFormField(decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        hintText: 'dd',
        labelText: 'eff',
      )
      );*/
  }

  textformfiled1(
      {required List<MyModel> text1,
      required List<MyModel> text4,
      required List<MyModel> iconData,
      required List<MyModel> text2,
      required List<MyModel> text3}) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  textformfiled2(
      {required List<MyModel> text1,
      required List<MyModel> text4,
      required List<MyModel> iconData,
      required List<MyModel> text2,
      required List<MyModel> text3}) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
  //  textformfiled(text1: myData, text2: myData, text3: myData, text4: myData, iconData: myData);

  form({required GlobalKey<FormState> key, required Column child}) {
    return form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /* SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              icon: Icon(Icons.person),
              hintText: 'Enter your full name',
              labelText: 'Name',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              icon: Icon(Icons.phone),
              hintText: 'Enter a phone number',
              labelText: 'Phone',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter valid phone number';
              }
              return null;
            },
          ),
          SizedBox(height: 10,),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              ),
              icon: Icon(Icons.calendar_today),
              hintText: 'Enter your date of birth',
              labelText: 'Dob',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter valid date';
              }
              return null;
            },
          ),*/
              Container(
                padding: EdgeInsets.only(left: 150.0, top: 40.0),
                child: ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Awesome Snackbar!'),
                            action: SnackBarAction(
                              label: 'Action',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) ;
                              },
                            )),
                      );
                    }),
              )
            ]));
  }

  textformFiled({
    required text1,
    required text2,
    required text3,
    required text4,
    required iconData,
  }) {
    return TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))
        /*  ListView.separated(
            itemCount: myData.length,
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return divider1();
            },
            itemBuilder: (context, index) {
              MyModal item=      myData[index];
              return textformfiled(item: item);
            })*/

        );
  }
}

textformFiled({required MyModel item}) {
  return row(
    text1: item.hinttext ?? "",
    text2: item.labeltext ?? "",
    text3: item.returns ?? "",
    iconData: item.iconData ?? Icons.person,
  );
}

row({
  required text1,
  required text2,
  required text3,
  required iconData,
}) {}

class MyModel {
  final IconData? iconData;
  final String? hinttext, labeltext, returns;

  MyModel({
    this.hinttext,
    this.labeltext,
    this.returns,
    this.iconData,
  });
}
