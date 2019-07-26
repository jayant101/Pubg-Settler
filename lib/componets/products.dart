import 'dart:io';
import 'dart:math';
import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:progress_indicators/progress_indicators.dart';



  
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class Products extends StatefulWidget {
  var user;

  Products({this.user});
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Royal Passes",
      "picture": "images/products/s1.jpg",
      "old_price": 120,
      "price": 85,
      "name1": "Elite Royale pass(600UC) rank 25",
      "price1": "179 token",
      "name2": "Elite Royale pass(600UC) rank 50",
      "price2": "250 token",
      "name3": "Elite Royale pass(600UC) rank 100",
      "price3": "500 token",
      "name4": "Elite Royale pass(1800UC) rank 25",
      "price4":"1000 token",
      "name5":"Elite Royale pass(1800UC) rank 50",
      "price5":"1200 token",
      "name6":"Elite Royale pass(1800UC) rank 100",
      "price6":"1400 token"

    },
    {
      "name": "Clothes",
      "picture": "images/products/s2.jpg",
      "old_price": 100,
      "price": 50,
     "name1": "PUBG CRATE",
      "price1": "150 token",
      "name2": "PITCH MASTER CRATE",
      "price2": "550 token",
      "name3": "PUBG and PITCH MASTER CRATE ",
      "price3": "750 token",
      "name4": "Pubg Legendary Items",
      "price4":"750 token",
      "name5":"Pubg Classic Crate",
      "price5":"750 token",
      "name6":"Pubg Premium Crate ",
      "price6":"750 token"
    },
    {
      "name": "Pubg UC",
      "picture": "images/products/s3.jpg",
      "old_price": 100,
      "price": 50,
      "name1": "700UC",
      "price1": "200 token",
      "name2": "1500UC",
      "price2": "400 token",
      "name3": "2000UC",
      "price3": "550 token",
      "name4": "2600UC",
      "price4":"700 token",
      "name5":"3000UC",
      "price5":"850 token",
      "name6":"only 100 Rank",
      "price6":"300 token"
    },
    {
      "name": "Guns Skin",
      "picture": "images/products/s4.jpg",
      "old_price": 100,
      "price": 50,
       "name1": "AR all skins",
      "price1": "250 token",
      "name2": "Sniper all skins",
      "price2": "400 token",
      "name3": "DP-28 and UMP9 skins",
      "price3": "550 token",
      "name4": "M416 AKM M16A4 Kar98 DP-28 combo",
      "price4":"700 token",
      "name5":"All Shotguns",
      "price5":"200 token",
      "name6":"AUG and GROZA skin",
      "price6":"200 token"
    },
    {
      "name": "Vehicles",
      "picture": "images/products/s5.jpg",
      "old_price": 100,
      "price": 50,
       "name1": "Mirado skin",
      "price1": "250 token",
      "name2": "Mirado and Dasia skin",
      "price2": "400 token",
      "name3": "UAZ and Mirado skin",
      "price3": "400 token",
      "name4": "UAZ,Van,Dasia skin",
      "price4":"650 token",
      "name5":"Motorcycle,Jeep,Buggy,UAZ,Dasia Combo",
      "price5":"750 token",
      "name6":"Premium Skins",
      "price6":"800 token"
    },
    {
      "name": "Subscription",
      "picture": "images/products/s6.jpg",
      "old_price": 100,
      "price": 50,
        "name1": "UNBAN or UNBLOCK",
      "price1": "250 token",
      "name2": "UNBAN with Title ",
      "price2": "550 token",
      "name3": "Prime Subscription(6Months)",
      "price3": "400 token",
      "name4": "Prime Plus Subscription(6Months)",
      "price4":"1000 token",
      "name5":"Prime Plus Subscription(12Months)",
      "price5":"1500 token",
      "name6":"Prime Subscription(2Months)",
      "price6":"300 token"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_pricture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
              prod_name1:product_list[index]['name1'],
              prod_price1:product_list[index]['price1'],
              prod_name2:product_list[index]['name2'],
              prod_price2:product_list[index]['price2'],
              prod_name3:product_list[index]['name3'],
              prod_price3:product_list[index]['price3'],
              prod_name4:product_list[index]['name4'],
              prod_price4:product_list[index]['price4'],
              prod_name5:product_list[index]['name5'],
              prod_price5:product_list[index]['price5'],
              prod_name6:product_list[index]['name6'],
              prod_price6:product_list[index]['price6'],
              user:widget.user
            ),
            
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;
  final prod_name1;
  final prod_price1;
  final prod_name2;
  final prod_price2;
  final prod_name3;
  final prod_price3;
  final prod_name4;
  final prod_price4;
  final prod_name5;
  final prod_price5;
  final prod_name6;
  final prod_price6;
  var user;
  

  Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
    this.prod_name1,
    this.prod_price1,
    this.prod_name2,
    this.prod_price2,
    this.prod_name3,
    this.prod_price3,
    this.prod_name4,
    this.prod_price4,
    this.prod_name5,
    this.prod_price5,
    this.prod_name6,
    this.prod_price6, 
    this.user,
   
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Newpage(prod_name:prod_name,prod_name1:prod_name1,
                prod_price1:prod_price1,
                prod_name2:prod_name2,
                prod_price2:prod_price2,
                prod_name3:prod_name3,
                prod_price3:prod_price3,
                prod_name4:prod_name4,
                prod_price4:prod_price4,
                prod_name5:prod_name5,
                prod_price5:prod_price5,
                prod_name6:prod_name6,
                prod_price6:prod_price6,
                user:user
                
                ))
                );
              },
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                        leading: Text(
                          prod_name,
                          style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Patrick Hand'),
                        ),
                        title: Text(
                          "\$$prod_price",
                          style: TextStyle(
                            fontFamily: 'Patrick Hand',
                              color: Colors.red, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          "\$$prod_old_price",
                          style: TextStyle(
                            fontFamily: 'Patrick Hand',
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              decoration
                                  :TextDecoration.lineThrough),
                        ),
                    ),
                  ),
                  child: Image.asset(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}



class Newpage extends StatefulWidget{
  var prod_name;
  var prod_name1;
  var prod_price1;
  var prod_name2;
  var prod_price2;
  var prod_name3;
  var prod_price3;
  var prod_name4;
  var prod_price4;
  var prod_name5;
  var prod_price5;
  var prod_name6;
  var prod_price6;
  var user;

  Newpage({
    this.prod_name,
    this.prod_name1,
    this.prod_price1,
    this.prod_name2,
    this.prod_price2,
    this.prod_name3,
    this.prod_price3,
    this.prod_name4,
    this.prod_price4,
    this.prod_name5,
    this.prod_price5,
    this.prod_name6,
    this.prod_price6, 
    this.user,
  });
  @override 
  NewpageState createState() => NewpageState();
}


class NewpageState extends State<Newpage>{
 
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.prod_name,style: TextStyle(fontFamily: 'Patrick Hand'),),
        centerTitle: true,

        
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        heroTag: 'Add Token',
        tooltip: 'Addtoken',
        elevation: 6.0,
        onPressed:(){ 
          print(widget.user.uid);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage(user:widget.user)));},
      ),
  
      body: ListView(
        children: <Widget>[
          ListTile(
          
            leading: Icon(Icons.add),
            
            title: Text(widget.prod_name1,style: TextStyle(fontFamily: 'Patrick Hand'),),
            subtitle: Text(widget.prod_price1,style: TextStyle(fontFamily: 'Patrick Hand'),),
            onTap: (){
             
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:widget.prod_name1,prod_price:widget.prod_price1))); 
            },
            
          ),

          ListTile(
          
            leading: Icon(Icons.add),
            title: Text(widget.prod_name2,style: TextStyle(fontFamily: 'Patrick Hand'),),
            subtitle: Text(widget.prod_price2,style: TextStyle(fontFamily: 'Patrick Hand'),),
            onTap: (){
           
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:widget.prod_name2,prod_price:widget.prod_price2))); 
            },

            
          ),

          ListTile(
          
            leading: Icon(Icons.add),
            title: Text(widget.prod_name3,style: TextStyle(fontFamily: 'Patrick Hand'),),
            subtitle: Text(widget.prod_price3,style: TextStyle(fontFamily: 'Patrick Hand'),),
            onTap: (){
           
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:widget.prod_name3,prod_price:widget.prod_price3))); 
            },

            
          ),

          ListTile(
          
            leading: Icon(Icons.add),
            title: Text(widget.prod_name4,style: TextStyle(fontFamily: 'Patrick Hand'),),
            subtitle: Text(widget.prod_price4,style: TextStyle(fontFamily: 'Patrick Hand'),),
            onTap: (){
             
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:widget.prod_name4,prod_price:widget.prod_price4))); 
            },

            
          ),

          ListTile(
          
            leading: Icon(Icons.add),
            title: Text(widget.prod_name5,style: TextStyle(fontFamily: 'Patrick Hand'),),
            subtitle: Text(widget.prod_price5,style: TextStyle(fontFamily: 'Patrick Hand'),),
            onTap: (){
              
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:widget.prod_name5,prod_price:widget.prod_price5))); 
            },

            
          ),

          ListTile(
          
            leading: Icon(Icons.add),
            title: Text(widget.prod_name6,style: TextStyle(fontFamily: 'Patrick Hand'),),
            subtitle: Text(widget.prod_price6,style: TextStyle(fontFamily: 'Patrick Hand'),),
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:widget.prod_name6,prod_price:widget.prod_price6))); 
            }
            
          )
        ],
      ) 
    );
  }
}

final databaseReference = FirebaseDatabase.instance.reference();




  class Yehaidialog extends StatefulWidget{
    var prod_name;
    var prod_price;
    var user;
    Yehaidialog({this.user,this.prod_name,this.prod_price});
    @override 
    YehaidialogState createState() => YehaidialogState();
  }

  class YehaidialogState extends State<Yehaidialog>{


getData() async{
  var firestore = Firestore.instance;
  QuerySnapshot qn = await firestore.collection(widget.user.uid).getDocuments();

  return qn.documents;


}

    @override 
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('Place order'),
        ),

        body: FutureBuilder(
          future: getData(),

          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Container(
                child: Center(child: Text('Loading...',style: TextStyle(fontFamily: "Patrick Hand",fontSize: 15.0,letterSpacing: 3.0),),),
              );
            }

            else{
            return ListView.builder(
              itemCount:1,
              itemBuilder: (context,index){
                return Container(
                  child:Column(
                    children: <Widget>[
                      Container(
                        height: 70.0,
                        width: 70.0,
                        child: Icon(Icons.add_box,color: Colors.black,size: 40.0,),
                      ),

                Text(widget.prod_name,style: TextStyle(fontFamily: "Patrick Hand",fontSize: 20.0,letterSpacing: 4.0),),
         



                      SizedBox(height: 250.0,),
                      
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                 
                    child:Row(children: <Widget>[
                          
                          RaisedButton(
                            onPressed: (){
                              DialogBoxs(context);
                            },
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                            elevation: 6.0,
                            color: Colors.orange,
                            child: Text('Pubg Details',style: TextStyle(fontFamily: 'Patrick Hand',color: Colors.white),),
                          ),

                          


                    ],)
                ),
                        ],
                      ),

                      Text(widget.prod_price,style: TextStyle(fontFamily: "Patrick Hand",fontSize: 20.0,letterSpacing: 4.0),),
                      

                      SizedBox(height: 20.0,),

                      
                      FloatingActionButton.extended(
                        onPressed: (){
                        final snackBar = SnackBar(
            content: Text(snapshot.data[0].data['notokens']),
        
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);

          databaseReference.child(widget.user.uid).push().set({"order": widget.prod_name.toString(),"price":widget.prod_price.toString()});
                        },
                        backgroundColor: Colors.green,
                        label: Text('Done',style:TextStyle(fontFamily: "Patrick Hand")),
                      ),


                    ],
                  )
                );
              },
            );
            }
          },
        ),
      );
    }
  }

  class AddPage extends StatefulWidget{
    var user;

    AddPage({this.user});
    @override 
    AddPageState createState() => AddPageState();
  }


class AddPageState extends State<AddPage>{
  var _currencies = ['Skrill','Paytm'];
  var _currentItemSelected = 'Skrill';



getData() async{
  var firestore = Firestore.instance;
  QuerySnapshot qn = await firestore.collection(widget.user.uid).getDocuments();

print("jee");
print(widget.user.uid);
  return qn.documents;


}


  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text("Cart",style: TextStyle(fontFamily: 'Patrick Hand'),),
        centerTitle: true,
      ),

      body: FutureBuilder(
        future: getData(),

        builder: (context,snapshot){
           if (snapshot.connectionState == ConnectionState.waiting){
                return Center(child: Text('Loading...',style: TextStyle(fontFamily:'Patrick Hand',fontSize:15.0,letterSpacing: 3.0),),);
              }
              else{
          return Container(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context,index){
                return Container(
                  
                child: Column(
                                children:<Widget> [ 
                                  
                                  Image.asset('images/pubg.png',height: 200.0,),
                                  
                                  
                                  Container(
                    child: Center(
                                      child: new Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

                      

              ListTile(
                      
                      title: 
                        
                        

                         RaisedButton
                          (
                            onPressed: (){
                              final snackBar = SnackBar(
                                content: Text('Pastorder not Completed'),
                              ); 
                         Scaffold.of(context).showSnackBar(snackBar);
                            } ,
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          color: Colors.deepOrange,
                          child: Text("Past Orders",style: TextStyle(fontFamily: 'Patrick Hand'),),
                          
                        ),

                          
                      
                      
              
              ),

              ListTile(
                      leading: Text("Add Tokens",style: TextStyle(fontFamily: 'Patrick Hand'),),
                      

              ),
             
             ListTile(
               leading: Text("Payment Mode",style: TextStyle(fontFamily: 'Patrick Hand'),),
               title: DropdownButton<String>(
              items: _currencies.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem,style: TextStyle(fontFamily: "Patrick Hand"),));
              }).toList(),
              
              onChanged: (String newValueSelected) {
                      setState(() {
                       this._currentItemSelected = newValueSelected ; 
                      });

              },
              value: _currentItemSelected,

              ) ,
             ),

             ListTile(
               title: _currentItemSelected == "Skrill" ?Chip(backgroundColor: Colors.red  ,  label: Text("Not Available in INDIA",style: TextStyle(fontFamily: 'Patrick Hand', color:Colors.white,)),) : RaisedButton(elevation: 6.0,
                        child: Text("Tap to add Tokens",style: TextStyle(fontFamily: 'Patrick Hand'),),
                        color: Colors.deepOrange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        onPressed:(){
                        print(widget.user.uid);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Screenshot(user:widget.user)));
                        },
               )
              
             ),


                      
             

              

                       
              


                      
            


              
              
            ],
          ),
                    ),
                  ),
                                ],
                ),
               
                  );
                }
            ),
          );
              }
        },
            
        
      ),
    );
  }
}





 

class Screenshot extends StatefulWidget{
  var user;
  Screenshot({this.user});
 
  @override 
  ScreenshotState createState()=> ScreenshotState();
}

class ScreenshotState extends State<Screenshot>{
  TextEditingController pno= new TextEditingController();
  TextEditingController name = new TextEditingController();
  var _formKey = GlobalKey<FormState>();
  TextEditingController  pname = new TextEditingController();
  TextEditingController uid = new TextEditingController();

var j;


    var _currencies = ['250','500'];
  var _currentItemSelected = '250';


    TextEditingController trans = new TextEditingController();

    getData() async{
  var firestore = Firestore.instance;
  QuerySnapshot qn = await firestore.collection(widget.user.uid).getDocuments();

  return qn.documents;


}



  @override 
  Widget build(BuildContext context){
    return new Scaffold(
     
  

      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(

              background: Image.asset('images/b.jpg',fit: BoxFit.cover,),
              
              title: Text("Add Tokens",style: TextStyle(fontFamily: 'Patrick Hand'),),

              

            ),
          ),
          SliverFillRemaining(
              
                              child: new Card(
                                elevation:6.0,
                  child:   
                  

                      Container(
                        child: ListView(
                      children: <Widget>[
                        SizedBox(height: 10.0,),
                         Container(
                height: 30.0,
                child: Center(
                    
                        child: FloatingActionButton.extended(
                          label: Text("Token Details",style:TextStyle(fontFamily: 'Patrick Hand',color:Colors.blueGrey[50])),
                          onPressed: (){
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage()));
                        showModalBottomSheet(
                          
                          context: (context),
                          builder: (builder){
                            return Form(
                            
                                                        child: Container(
                                child: Center(
                                  child: DetailsPage(),
                                ),
                              ),
                            );
                          
                          }
                        );
                          },
                        )
                ),
              ),
              SizedBox(height: 10.0,),

                Card(
                                    child: ExpansionTile(
                     title: Text('Add Paytm Number',style: TextStyle(fontFamily: "Patrick Hand",color: Colors.grey),),
                     children: <Widget>[
                       TextFormField(
                         key: _formKey,
                         keyboardType: TextInputType.numberWithOptions(),
                         
                         decoration: InputDecoration(
                           icon: Icon(Icons.phone),
                           
                           
                           hintText: 'paytm number from which payment will occur',
                           hintStyle: TextStyle(fontFamily: "Patrick Hand")
                         ),
                        controller: pno,
                      
                       )
                     ],
                    ),
                ),

                 SizedBox(height: 10.0,),

                Card(
                                    child: ExpansionTile(
                     title: Text('Add Name',style: TextStyle(fontFamily: "Patrick Hand",color: Colors.grey),),
                     children: <Widget>[
                       TextFormField(
                         
                        
                         decoration: InputDecoration(
                           icon: Icon(Icons.account_circle),
                           
                           
                           hintText: 'name on paytm account',
                           hintStyle: TextStyle(fontFamily: "Patrick Hand")
                         ),
                        controller: name,
                    
                       )
                     ],
                    ),
                ),

                

                Chip(
                    elevation: 6.0,
                    backgroundColor: Colors.blue,
                    label: Text('Enter Amount',style:TextStyle(fontFamily: "Patrick Hand",color: Colors.blueGrey[50])),
                ),


                Card(
                                    child: DropdownButton<String>(
            items: _currencies.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem,style: TextStyle(fontFamily: 'Patrick hand'),),);
            }).toList(),
            
            onChanged: (String newValueSelected) {
                        setState(() {
                         this._currentItemSelected = newValueSelected ; 
                        });

            },
            value: _currentItemSelected,

            ),
                ) ,

                SizedBox(height: 30.0,),

                FutureBuilder(
                  future:getData(),
                  builder: (context,snapshot){
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Container(child: Text('Loading...'),);
                    }

                    else{
                      return Container(
                      child: _currentItemSelected == '250' ? Chip(
                      avatar: CircleAvatar(
                        
                        child: Icon(Icons.send,size: 15.0,),
                      ),
                      
                      backgroundColor: Colors.amberAccent[200],
                      label: InkWell(
                        onTap: (){
                          launch(snapshot.data[0].data['url1']);

                          databaseReference.child('${widget.user.uid}'+'  Deposite').push().set({'pymentno': pno.text,'name': name.text,'uid':widget.user.uid});
                       

                        },
                        child: Text('Pay now',style: TextStyle(fontFamily: 'Patrick Hand'),),
                      ),
                      
                  ):Chip(
                      avatar: CircleAvatar(
                        
                        child: Icon(Icons.send,size: 15.0,),
                      ),
                      
                      backgroundColor: Colors.amberAccent[200],
                      label: InkWell(
                        onTap: (){
                           databaseReference.child('${widget.user.uid}'+'  Deposite').push().set({'pymentno': pno.text,'name': name.text,'uid':widget.user.uid});
                       
                        
                          launch(snapshot.data[0].data['url2']);
                          },
                        
                        child: Text('Pay now',style: TextStyle(fontFamily: 'Patrick Hand'),),
                      ),
                      
                  ),
                      );
                    }
                  },
                                  
                ) ,

                    ListTile(
                      title: Text('Submit TransationId',style:TextStyle(fontFamily:"Patrick Hand",color: Colors.grey ),),
                      subtitle: TextField(
                        controller: trans,
                        decoration: InputDecoration(
                          hintText: 'TrasactionId of Last payment',
                          hintStyle: TextStyle(fontFamily: "Patrick Hand")
                        ),
                      ),
                      
                    ),

                     trans.text.isEmpty  ? Chip(label: Text('TransactionId is required',style: TextStyle(fontFamily: 'Patrick Hand'),),):IconButton(
                        icon: Chip(
                          label:Icon(Icons.done)),
                      
                        onPressed:() { 
                          print(widget.user.uid);
                          if(pno.text.length==10){
                        databaseReference.child(widget.user.uid).push().set({'pymentno': pno.text,'name': name.text});
                          newBox(context);
                          }
                     else{
                       newBoxs(context);

                     }
                    
                        }
                        ),

                    

                
              

                

              
                


                        

                      ],
                        
                        )
                              )
                      
                   
                              )
            )
        ],
      ),
      
      
                              
                      
    );         
                   
    
  }
}

newBox(BuildContext context){
  return showDialog(
    context: context,
    builder: (BuildContext context){
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        
          child: Container(
            height: 350.0,
            width:200.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: 30.0,
                ),
              Text("Transaction Id Submitted Successfully !!!",style:TextStyle(fontFamily: "Patrick Hand",color: Colors.green,fontWeight: FontWeight.bold, fontSize: 15.0)),
              


              SizedBox(height: 30.0),
              
              
              Container(
                height: 190.0,
                width: 170.0,
                child: Column(
                  children: <Widget>[
                   Text('Tokens will be added within 24 hrs after the successful verification of transaction Id',style: TextStyle(fontFamily: "Patrick Hand",),),
 
                  ],
                ),

              ),


              SizedBox(height: 25.0,),

              Text('Heartly welcome to PubgSettler',style:TextStyle(fontFamily: "Patrick Hand",color: Colors.grey[500]))
            ],),
          
          
        )
      );
    }
  );
}

newBoxs(BuildContext context){
  return showDialog(
    context: context,
    builder: (BuildContext context){
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        
          child: Container(
            height: 350.0,
            width:200.0,
            child: Center(child: Text('Phone number and Name error',style: TextStyle(fontFamily: "Patrick Hand",color: Colors.red[400]),),)
          
          
        )
      );
    }
  );
}



 

  class DetailsPage extends StatefulWidget{
    @override 
    DetailsPageState createState() => DetailsPageState();
  }

  class DetailsPageState extends State<DetailsPage>{

  

 List<Courses> courses = <Courses>[
  const Courses(coursesname: Text(
    '1 Token is equivalent to 1 indian rupees , these tokens are essential to',style: TextStyle(color: Colors.greenAccent,fontFamily: 'Patrick Hand'),)),
 const Courses(coursesname: Text('make any order',style: TextStyle(color: Colors.greenAccent,fontFamily: 'Patrick Hand'),)),
  
  
];






    @override 
    Widget build(BuildContext context){
      return Card(
              child: Column(
          
          
          children:<Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),

              Row(
                children: <Widget>[
                  SizedBox(width:10.0),
                 

                  PopupMenuButton<String>(
                    
                    itemBuilder: (context){
                      return courses.map((Courses courses){
                        return PopupMenuItem(
                          
                          value: null,
                          child: Container(
                            
                            child:ListTile(
                            
                              title: courses.coursesname,
                            )
                          ),
                        );
                      }).toList();

                    
                      
                    },
                    elevation: 6.0,
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.greenAccent,
                      
                      label: Text('1 Rs = 1 Tokens',style: TextStyle(fontFamily: "Patrick Hand"),),
                    )
                  ),



                 
                  

                ],
              ),

               Container(
                  padding: EdgeInsets.only(top:10.0),
                  child: Column(
                    
                    
                   children: <Widget>[
                  SizedBox(height: 5.0,),
                  Container(
                    height:30.0 ,
                    child: Text('Offers',style: TextStyle(fontFamily: 'Patrick Hand',color: Colors.greenAccent),),
                  ),
                  SizedBox(height: 10.0,),
                   
                   Card(
                      child: ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text('250 Rs   =',style: TextStyle(fontFamily: 'Patrick Hand',color: Colors.greenAccent),),
                      trailing: Text('250 tokens',style: TextStyle(fontFamily: 'Patrick Hand',color: Colors.greenAccent),),
                     ),
                   ),

                   Card(
                      child: ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text('500 Rs   =',style: TextStyle(fontFamily: 'Patrick Hand',color: Colors.greenAccent),),
                      trailing: Text('500 tokens',style: TextStyle(fontFamily: 'Patrick Hand',color: Colors.greenAccent),),
                     ),
                   ),
                     
                   ],
                  ),



                ),

                SizedBox(
                  height:50.0
                ),

                FloatingActionButton.extended(
                  backgroundColor: Colors.greenAccent,
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0),),
                  label: Text('More offers will be updated soon...',style: TextStyle(fontFamily: 'Patrick Hand',color: Colors.red[200]),),
                ),


                



              

           
          ]
        ),
      );
    }
  }
  class Courses{
  const Courses({this.coursesname});

  final Text coursesname;
}



Future DialogBoxs(BuildContext context){

  var formkey = GlobalKey<FormState>();

  TextEditingController a= TextEditingController();
    TextEditingController b= TextEditingController();


  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context){
    return  Dialog(
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          height: 350.0,
          width:200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: <Widget>[
              Form(
                key:formkey,
                              child: Container(
                  height: 350.0,
                  child: ListView(
                    
                    children: <Widget>[
                      SizedBox(height: 70.0,),
                      ExpansionTile(
                        title: Text('Name',style: TextStyle(fontFamily: 'Patrick Hand',color: Colors.grey ),),
                        children: <Widget>[
                          TextFormField(
                           controller: a,
                           validator: (String value){
                             if(value.isEmpty)

                            {
                              return 'enter value';
                            }
                           },
                            decoration: InputDecoration(
                              icon:Icon(Icons.account_circle),
                              hintText: 'Name in Pubg',
                              hintStyle: TextStyle(fontFamily: 'Patrick Hand'),
                            ),
                          ),


                          
                        ],

                      )          ,


                      ExpansionTile(
                        title: Text('UserId',style: TextStyle(fontFamily: 'Patrick Hand',color: Colors.grey ),),
                        children: <Widget>[
                          TextFormField(
                         
                           controller: b,
                           validator: (String value){
                             if(value.isEmpty){
                               return ' enter value';
                             }
                           },
                            decoration: InputDecoration(
                              icon:Icon(Icons.account_circle),
                              hintText: 'UserId of Pubg',
                              hintStyle: TextStyle(fontFamily: 'Patrick Hand'),
                            ),
                          ),


                          
                        ],

                      ) ,

                      SizedBox(height: 50.0,),

                      Column(
                        children: <Widget>[
                          FloatingActionButton.extended(
                            onPressed: (){
                              if(formkey.currentState.validate()){
                           Navigator.pop(context);}
                            },
                            backgroundColor: Colors.amber[200],
                            label:Text('Confirm')
                          ),
                        ],
                      ),

                      SizedBox(height: 10.0,)


                    ]
                ),
                ),
              ),

              Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),


                ),
              ),

              Positioned(
                top: 30,
                left: 120,
                child: CircleAvatar(
                  child: Icon(Icons.account_circle),
                ),
              )
            ],
          ),
        ),
      );
    }
  );
}


  