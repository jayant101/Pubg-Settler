import 'package:pubg_settler/pages/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import './pages/login.dart';
import './componets/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './triangle_painer.dart';




void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: <String,WidgetBuilder>{
        'homepage':(context)=>new HomePage()
      },
    theme: ThemeData(
      primaryColor: Colors.red.shade900
    ),
    home: HomePage1(),
  ));
}

class LoginPage extends StatefulWidget{
  @override 
  LoginPageState createState() => LoginPageState();
}


class LoginPageState extends State<LoginPage>{

  



  final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();




  



  Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );





  final FirebaseUser user = await _auth.signInWithCredential(credential);
  print("signed in " + user.displayName);
  
  return user;
}
  
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(

      body: Stack(
        children:<Widget>[
          
          
          new Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/q1.jpg"),
              fit: BoxFit.fill)
            ),
          ),
               Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
            child: RaisedButton(
              color:Colors.deepOrange,
              elevation: 6.0,
              textColor: Colors.black,
              child: Text("Press to SignIn"),
              onPressed: (){_handleSignIn()
    .then((FirebaseUser user) {Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage(user:user),)
    
    
    
    
    );
    
   
   


    Firestore.instance.collection(user.uid).add({ 'tokens': 'nil', 'withdraw': 'nil', 'pastorder': 'No past order','number':'nil',
     'alert': 'Alert!!!','notokens':'No Tokens, Please add Tokens to proceed','url1': 'https://p-y.tm/D0Al-pr','url2':'https://p-y.tm/F-omx3E' });
                    
            
                  
                  }
    )
    .catchError((e) => print(e));
            }
            ),
          ),
        ),]
      ),

    );
  }
}



class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight,
                  minHeight: constraints.maxHeight,
                ),
                child: HomePage1Body(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomePage1Body extends StatefulWidget {
  @override
  HomePageBodyState createState() => HomePageBodyState();
}

class HomePageBodyState extends State<HomePage1Body>
    with SingleTickerProviderStateMixin {
    
  final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController uname= new TextEditingController();

  TextEditingController semail= new TextEditingController();
  TextEditingController spassword= new TextEditingController();

 


Future<FirebaseUser> signup(String email,String password) async{
    
      try{
        final FirebaseUser user = await _auth.createUserWithEmailAndPassword(email: email,password: password);
      print(user.uid);
      return user;
      
      }
      catch (e){
        print(e);
      }
}

Future<FirebaseUser>  signin(String email,String password) async{

  try{
    final FirebaseUser user = await _auth.signInWithEmailAndPassword(email: email ,password: password);
  print('signedIn  '+ user.uid);
   return user;
  }
  catch(e){
    print(e);
  }
 
}


  final String imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD05rG-G4WhgBbzDoetCTeqO1Ite8-uMJ2jnx4rilB8ko1aJQWgQ";

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  Widget _buildHeaderPanel(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        
        fit: StackFit.expand,
        children: <Widget>[

          Image.asset(
            'images/i4.jpg',
            fit: BoxFit.cover,
            
           
            colorBlendMode: BlendMode.multiply,
     
          ),
          
        ],
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.amber,Colors.deepOrange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child: CustomPaint(
        painter: TrianglePainter(_pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: _onSignInButtonPress,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome to Pubg Settler",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 10.0,),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                controller: semail,
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: "Email",
                ),
              ),
            ),
          ),
          Spacer(),
          SizedBox(height: 20.0),
          Expanded(
            child: SizedBox(
              width: 340.0,
              height: 40.0,
              child: TextField(
                controller: spassword,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                  
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber,Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                
              ),
              child: MaterialButton(
                  
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 25.0,fontWeight: FontWeight.bold),
                    ),
                  ),
                  onPressed: () {
                  
                 signin(semail.text,spassword.text)
                    .then((FirebaseUser user){
                      if(user!=null){
                        Navigator.of(context).pushReplacement(
                           new MaterialPageRoute(
                             settings:RouteSettings(name: 'homepage'),
                             builder: (context)=>new HomePage(user: user,uname:uname.text)
                           )
                         );



                    
                     
    
                      }
                      else{
                        
                      }

          }).catchError((e)=>print(e));
              
                  }
              ),)
          ),
          SizedBox(height: 40.0,)
          
        ],
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Text(
            "Welcome to Pubg Settler",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                controller: uname,
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: "User Name",
                ),
              ),
            ),
          ),
    
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: "Email",
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                ),
              ),
            ),
          ),
           Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Confirm Password",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 23.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber,Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                )
              ),
              child: MaterialButton(
                 
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 42.0),
                    child: Text("Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 25.0,fontWeight: FontWeight.bold)),
                  ),
                  onPressed: () {
                      signup(email.text,password.text).then((FirebaseUser user){

                        if(password.text.isEmpty == false){
                       
                    
                    
                Firestore.instance.collection(user.uid).add({ 'tokens': 'nil', 'withdraw': 'nil', 'pastorder': 'No past order','number':'nil',
                'name': uname.text,'notokens':'No Tokens, Please add Tokens to proceed','url1': 'https://p-y.tm/D0Al-pr','url2':'https://p-y.tm/F-omx3E' });
    

                   showDialog(
                      context: (context),
                      builder: (context){
                        return AlertDialog(
                          title: Text('Account Created Successfully...',style: TextStyle(fontFamily: 'Patrick Hand'),),

                        );
                      }
                    );
                        }

                        else{

                        }
                    
                      },
                      
                      
                
                      );

                    

                    
                 
                  }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeaderPanel(context),
        _buildMenuBar(context),
        Expanded(
          flex: 2,
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              _buildSignIn(context),
              _buildSignUp(context),
            ],
          ),
        ),
      ],
    );
  }
}