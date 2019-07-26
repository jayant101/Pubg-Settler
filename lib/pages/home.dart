
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:progress_indicators/progress_indicators.dart';

  

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/painting.dart';

//my own imports
import 'package:pubg_settler/componets/horizontal_listview.dart';
import 'package:pubg_settler/componets/products.dart';
import 'package:pubg_settler/main.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  var uname;
  var user;
  HomePage({this.user,this.uname});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  getData() async{
  var firestore = Firestore.instance;
  QuerySnapshot qn = await firestore.collection(widget.user.uid).getDocuments();
  

  return qn.documents;


}


  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child:  new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/i1.jpg'),
          AssetImage('images/i2.jpg'),
          AssetImage('images/i3.jpg'),
          AssetImage('images/i4.jpg'),
          AssetImage('images/i5.jpg'),
        ],
        autoplay: true,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.black,
        title: Text('Pubg Settler',style: TextStyle(fontFamily: 'Patrick Hand'),),
        actions: <Widget>[
          
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPage(user: widget.user,)));
              }),
        ],
      ),
      drawer: new Drawer(
        
        child: new ListView(
          children: <Widget>[
//            header

 Container(
                   
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[ Colors.amber[200],Colors.orange,Colors.pink],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                ),
              
                   child: DrawerHeader(
                     child: Column(children: <Widget>[
                       SizedBox(height: 4.0,),
                       Container(
                         height: 80.0,
                         width: 80.0,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30.0),
                           border: Border.all()
                         ),
                         child: Icon(Icons.account_circle,color: Colors.black,),
                       ),

                       SizedBox(height: 10.0,),
                        FutureBuilder(
                future: getData(),
                builder: (_,snapshot){
                 if(snapshot.connectionState == ConnectionState.waiting){
                   return Container(child:Center(child: Text('loading',style: TextStyle(fontFamily: 'Patrick Hand'),),));
                 }
                 else{
                   return Text(snapshot.data[0].data['name'],style: TextStyle(fontFamily: 'Patrick Hand'),);
                 }
                },
              ),
                       Text(widget.user.email,style: TextStyle(fontFamily: 'Patrick Hand',fontSize: 12.0),)
                     ],),
                   ),
                 ),

          /*  new UserAccountsDrawerHeader(
              accountName: FutureBuilder(
                future: getData(),
                builder: (_,snapshot){
                 if(snapshot.connectionState == ConnectionState.waiting){
                   return Container(child:Center(child: Text('loading',style: TextStyle(fontFamily: 'Patrick Hand'),),));
                 }
                 else{
                   return Text(snapshot.data[0].data['name'],style: TextStyle(fontFamily: 'Patrick Hand'),);
                 }
                },
              ),
              accountEmail: Text(widget.user.email,style: TextStyle(fontFamily: 'Patrick Hand'),),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  
                  child: Image.network(widget.user.uid),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.deepOrange
              ),
            ),*/

//            body

            InkWell(
              onTap: (){
                Navigator.pop(context,MaterialPageRoute(builder: (context)=>HomePage(user:widget.user)));
              },
              child: ListTile(
                title: Text('Home Page',style: TextStyle(fontFamily: 'Patrick Hand'),),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: (){
                
         
              
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DataPage(user:widget.user,uname: widget.uname,)));
                           },
              child: ListTile(
                title: Text('My account',style: TextStyle(fontFamily: 'Patrick Hand'),),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPage(user: widget.user,)));
              },
              child: ListTile(
                title: Text('My Orders',style: TextStyle(fontFamily: 'Patrick Hand'),),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SpecialOffers(user: widget.user,)));
              },
              child: ListTile(
                title: Text('Special Offers',style: TextStyle(fontFamily: 'Patrick Hand'),),
                leading: Icon(Icons.stars),
              ),
            ),

             InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Hacks(user: widget.user,)));
              },
              child: ListTile(
                title: Text('Hacks for FREE',style: TextStyle(fontFamily: 'Patrick Hand'),),
                leading: Icon(Icons.settings_applications),
              ),
            ),



            Divider(),

            InkWell(
              onTap: (){

               FirebaseAuth.instance.signOut().then((value)=>
                 Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage1()))
                );

               
              },
              child: ListTile(
                title: Text('Log out',style: TextStyle(fontFamily: 'Patrick Hand'),),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),

          ],
        ),
      ),

      body:  new Column(
        
          children: <Widget>[
            //image carousel begins here
            image_carousel,

            //padding widget
            new Padding(padding: const EdgeInsets.all(4.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Categories',style: TextStyle(fontFamily: 'Patrick Hand'),)),),

            //Horizontal list view begins here
            HorizontalList(),

            //padding widget
            new Padding(padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: new Text('Services',style: TextStyle(fontFamily: 'Patrick Hand'),)),),

            //grid view
            Flexible(child: Products(user: widget.user,)),

          ],
        ),
      
    );
  }
}



void catrgori (BuildContext context){
    AlertDialog alertDialog = AlertDialog(
      title: Text('Empty!!!',style: new TextStyle( fontWeight: FontWeight.bold,color: Colors.red,fontFamily: 'Patrick Hand')),
      content: Text('No Items Present',style: TextStyle(fontFamily: 'Patrick Hand'),),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }

class DataPage extends StatefulWidget{
  var user;
  var uname;
  DataPage({this.user,this.uname});
  @override 
  DataPageState createState()=> DataPageState();
}

class DataPageState extends State<DataPage>{

  
getData() async{
  var firestore = Firestore.instance;
  QuerySnapshot qn = await firestore.collection(widget.user.uid).getDocuments();
  

  return qn.documents;


}


TextEditingController accountno = TextEditingController();
TextEditingController ifsc = TextEditingController();
TextEditingController name = TextEditingController();

var formkey = GlobalKey<FormState>();


   changeEverthing(){
      accountno.text = '';
      ifsc.text = '';
      name.text = '';
    }



  @override 
  Widget build(BuildContext context){
    return Scaffold(
          body: FutureBuilder(
            future:   getData(),    
                  builder: (_,snapshot)


            {
           
            
              if (snapshot.connectionState == ConnectionState.waiting){
                return Center(child: Text('Loading...',style: TextStyle(fontFamily:'Patrick Hand',fontSize:15.0,letterSpacing: 3.0),),);
              }


              else{
               
                return Container(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (_,index){
                      return Container(
                        child: Column(
       children: <Widget>[
           Stack(
             children: <Widget>[
                    Container(
               height: 150.0,
               color: Colors.grey,
             ),
        

             Column(
              
                 children: <Widget>[
                   SizedBox(height: 90.0 ,),
                   Row(
                     
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       
                       Center(
                            child: Container(
                                                 
                           height: 100.0,
                           width: 100.0,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             color: Colors.green
                           ),
                           child: CircleAvatar(
                             child:Icon(Icons.account_circle)
                           ),
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             

             


             ]
           ),


           SizedBox(height: 10.0,),

           Text(snapshot.data[index].data['name'],style: TextStyle(letterSpacing: 3.0,fontFamily: "Patrick Hand"),),

          
           
           SizedBox(height: 10.0,),

           Container(
             height: 30.0,
             child: ListTile(
                        
                leading:
                 RaisedButton(
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> AddPage(user: widget.user,)));
                   },
                   
                   elevation: 6.0,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                   child: Text('Deposite',style: TextStyle(fontFamily: "Patrick Hand",color: Colors.white),),
                 ),

                 trailing: FloatingActionButton.extended(
                   onPressed: (){
                     
                     showModalBottomSheet(
                       context: (context),
                       builder: (builder){
                         return Form(
                           key: formkey,
                           child: Container(
                             child:ListView(
                               children: <Widget>[
                                 Card(
                                   
                                     
                                     
                                     
                                      child: TextFormField(
                                         controller: accountno,
                                         validator: (String value){
                                           if(value.isEmpty){
                                             return 'Please enter account number';
                                           }
                                         },
                                         
                                         decoration: InputDecoration(
                                          labelText: 'Account',
                                          labelStyle:TextStyle(fontFamily:'Patrick Hand'),
                                           hintText: 'Your Account Number',
                                           hintStyle: TextStyle(fontFamily: "Patrick Hand")
                                         ),
                                       ),
                                     
                                   
                                 ),

                                 Card(
                                   child: TextFormField(
                                         validator: (String value){
                                           if(value.isEmpty){
                                             return 'Please enter ifsc code';
                                           }
                                         },
                                         controller:ifsc,
                                         decoration: InputDecoration(
                                           labelText: 'Name',
                                           labelStyle:TextStyle(fontFamily:'Patrick Hand'),
                                           hintText: 'Name on Account',
                                           hintStyle: TextStyle(fontFamily: "Patrick Hand")
                                         ),
                                       ),
                                     
                                 ),



                                 Card(
                                   child:TextFormField(
                                         validator: (String value){
                                           if(value.isEmpty){
                                             return 'Please enter name';
                                           }
                                         },
                                         controller:name,
                                         decoration: InputDecoration(
                                           labelText: 'Name',
                                           labelStyle:TextStyle(fontFamily:'Patrick Hand'),
                                           hintText: 'Name on Account',
                                           hintStyle: TextStyle(fontFamily: "Patrick Hand")
                                         ),
                                       ),
                                  
                                 ),


                                SizedBox(
                                  height: 30.0,
                                ),

                                    FloatingActionButton.extended(
                                      onPressed: (){
                                      
                                      setState(() {
                                        

                                        if(formkey.currentState.validate()){
                                          showDialog(
                                        
                                          context: context,
                                          builder: (context){
                                            return AlertDialog(
                                              title: Text('Request Submitted,you will be notified within 24 hours',style:TextStyle(fontFamily: "Patrick Hand",color:Colors.orange)),
                                              actions: <Widget>[
                                                IconButton(icon: Icon(Icons.check),
                                                color: Colors.blue,
                                                onPressed: (){
                                                  
                                                  Navigator.pop(context);
                                                  databaseReference.child(widget.user.uid).push().set({'number': accountno.text,'ifsc':ifsc.text,'name':name.text});
                                                },
                                                
                                                )
                                              ],
                                            );
                                          }
                                        );
                                      }
                                      });
                                      
                                      
                                      
                                   //   changeEverthing();
                                      
                                      },

                                      backgroundColor: Colors.yellowAccent,
                                      label: Text('Submit',style:TextStyle(fontFamily: "Patrick Hand",color: Colors.black)),
                                    ),
                                  
                              



                               ],
                             ),
                           ),
                         );
                       }
                     );
                   },
                   backgroundColor: Colors.blue,
                   label: Text('Withdraw',style: TextStyle(fontFamily: "Patrick Hand",),),
                 ),
                  

                 
               
             ),
           ),

            SizedBox(height:40.0),

           Text('Account Details',style:TextStyle(fontFamily: 'Patrick Hand',letterSpacing: 3.0,color: Colors.amber)),

           Divider(height: 60.0,),

          
       
          
                
                  Card(
          
          
          
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child:  Icon(Icons.attach_money,color: Colors.white,),),
                      title: Text('TOKENS PRESENT',style:TextStyle(fontFamily: "Patrick Hand",letterSpacing:3.0)),
                      trailing: Text(snapshot.data[index].data['tokens'].toString(),style: TextStyle(fontFamily: 'Patrick Hand',color:Colors.blue),),
                    ),
                  ),
          
                  Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child:  Icon(Icons.compare_arrows,color:Colors.white)),
                      title: Text('Last Withdraw',style:TextStyle(fontFamily: "Patrick Hand",letterSpacing:3.0)),
                      trailing: Text(snapshot.data[index].data['withdraw'].toString(),style: TextStyle(fontFamily: 'Patrick Hand',color:Colors.blue),),
                    ),
                  ),
          
          
                    Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child:  Icon(Icons.shopping_cart,color:Colors.white)),
                      title: Text('Last Order',style:TextStyle(fontFamily: "Patrick Hand",letterSpacing:3.0)),
                      subtitle: Text(snapshot.data[index].data['pastorder'].toString(),style: TextStyle(fontFamily: 'Patrick Hand',color:Colors.blue),),
                    ),
                  ),
                  
               ],
          
             ),
                              );
                            },
                          )
                                                  
                        );
                      }
          
                    },
                  ),
    );
  }
}








class SpecialOffers extends StatefulWidget{
  var user;
  SpecialOffers({this.user});

  @override 
  SpecialOffersState createState()=> SpecialOffersState();
}

class SpecialOffersState extends State<SpecialOffers>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title:Text('Special Offer',style:TextStyle(fontFamily: 'Patrick Hand')),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Godzilla Jeep',style:TextStyle(fontFamily:"Patrick Hand")),
              subtitle: Text('200 token',style:TextStyle(fontFamily:"Patrick Hand")),
              onTap: (){
           
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:'Godzilla Jeep',prod_price:'200 token'))); 
            },
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text('Godzilla Suit',style:TextStyle(fontFamily:"Patrick Hand")),
              subtitle: Text('250 token',style:TextStyle(fontFamily:"Patrick Hand")),
              onTap: (){
           
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:'Godzilla Suit',prod_price:'250 token'))); 
            },
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text('Godzilla Bag Skin',style:TextStyle(fontFamily:"Patrick Hand")),
              subtitle: Text('250 token',style:TextStyle(fontFamily:"Patrick Hand")),
              onTap: (){
           
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:'Godzilla Bag Skin',prod_price:'250 token'))); 
            },
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text('Spitfire Skin M416',style:TextStyle(fontFamily:"Patrick Hand")),
              subtitle: Text('300 token',style:TextStyle(fontFamily:"Patrick Hand")),
              onTap: (){
           
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:'Spitfire Skin M416',prod_price:'300 token'))); 
            },
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text('Harvester Suit',style:TextStyle(fontFamily:"Patrick Hand")),
              subtitle: Text('300 token',style:TextStyle(fontFamily:"Patrick Hand")),
              onTap: (){
           
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:'Harvester Suit',prod_price:'300 token'))); 
            },
            ),

            ListTile(
              leading: Icon(Icons.add),
              title: Text('Great Indian Warrior Suit',style:TextStyle(fontFamily:"Patrick Hand")),
              subtitle: Text('300 token',style:TextStyle(fontFamily:"Patrick Hand")),
              onTap: (){
           
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Yehaidialog(user:widget.user,prod_name:'Great Indian Warrior Suit',prod_price:'300 token'))); 
            },
            ),
          ],
        ),
    );
  }
}

class Hacks extends StatefulWidget{
  var user;
  Hacks({this.user});
  @override
  HacksState createState()=>HacksState();
}

class HacksState extends State<Hacks>{

TextEditingController emails = new TextEditingController();


  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacks'),
        centerTitle: true,
      ),
      body:ListView(
        children:<Widget>[
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children:<Widget>[

              Icon(Icons.settings_applications,size: 50.0,),

            ],
          ),
          SizedBox(height: 20.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('FREE HACKS',style: TextStyle(fontFamily: "Patrick Hand",fontWeight: FontWeight.bold),),
            ],
          ),

          SizedBox(height: 200.0,),

          Container(
            height: 200.0,
            child: Column(
              children: <Widget>[

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Hacks will be provided to this email only',style:TextStyle(fontFamily: "Patrick Hand")),
                  ],
                ),

                SizedBox(
                  height: 20.0,
                ),

                ListTile(
                  leading: Icon(Icons.email),
                  trailing: Icon(Icons.remove_red_eye),
                        title: TextField(
                          controller: emails,
                    decoration: InputDecoration(
                      hintText: '  email',
                      hintStyle: TextStyle(fontFamily: "Patrick Hand")
                    ),
                  ),
                ),

                SizedBox(height: 30.0,),

                 FloatingActionButton.extended(
                        onPressed: (){
                      
                      if(emails.text.isEmpty== false){
        
                      showDialog(
                        context: (context),
                        builder: (builder){
                          return AlertDialog(
                            title: Text('Details Updated',style: TextStyle(fontFamily: "Patrick Hand",fontWeight: FontWeight.bold,color: Colors.green)),
                            content:Text('You will get Hacks on this email within 24 hrs...',style: TextStyle(fontFamily: "Patrick Hand"),) ,
                          );
                        }
                      );
        

              databaseReference.child(widget.user.uid).push().set({"email": emails.text });
              
              }

              else{

                showDialog(
                        context: (context),
                        builder: (builder){
                          return AlertDialog(
                            title: Text('email error',style: TextStyle(fontFamily: "Patrick Hand",fontWeight: FontWeight.bold,color: Colors.red)),
                               );
                        }
                      );

              }
                        },
                        backgroundColor: Colors.green,
                        label: Text('Done',style:TextStyle(fontFamily: "Patrick Hand")),
                      ),
              ],
            ),
          ),
        ],
      )
    );
  }
  
  }