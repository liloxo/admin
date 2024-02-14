import '../../../../core/class/crud.dart';
import '../../../../core/constant/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postdata(String username,String email,String phone,String password)async{
   var response = await crud.postData(AppLink.signup, {
    "username": username,
    "email"   : email,
    "phone"   : phone,
    "password": password,
   });
   return response!.fold((l) => l, (r) => r);
  }
}