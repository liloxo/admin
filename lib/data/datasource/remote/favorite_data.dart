import '../../../core/class/crud.dart';
import '../../../core/constant/linkapi.dart';

class FavoriteData {

  Crud crud;
  FavoriteData(this.crud);

  addFavorite(String usersid, String itemsid)async{
    var response = await crud.postData(AppLink.favoriteAdd, {'usersid' : usersid, 'itemsid' : itemsid});
    return response!.fold((l) => l, (r) => r);
  }
  removeFavorite(String usersid, String itemsid)async{
    var response = await crud.postData(AppLink.favoriteRemove, {'usersid' : usersid, 'itemsid' : itemsid});
    return response!.fold((l) => l, (r) => r);
  }
}

class MyFavoriteData {

  Crud crud;
  MyFavoriteData(this.crud);

  getData(String id)async{
    var response = await crud.postData(AppLink.favoriteView, {'id': id});
    return response!.fold((l) => l, (r) => r);
  }
  deleteData(String id)async{
    var response = await crud.postData(AppLink.deletefromFavorite, {'id': id});
    return response!.fold((l) => l, (r) => r);
  }
}