class Usermodel {
  // Field
String id, regisdate, name, user, password;

  // constucter
Usermodel(this.id,this.regisdate,this.name,this.user,this.password); //ต้องชื่อเดียวกันกับคลาส ส่งค่าตัวแปล

// Usermodel.fromAPI(Map<String,dynamic> พิมพ์เองเพื่อส่งตัวแปร map 
Usermodel.fromAPI(Map<String,dynamic> map){
  id=map['id'];
  regisdate=map['regisdate'];
  name=map['name'];
  user=map['user'];
  password=map['password'];
  
}


}