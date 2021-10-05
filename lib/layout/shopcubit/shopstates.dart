import 'package:shopapp/models/homemodel.dart';
import 'package:shopapp/models/loginmodel.dart';

abstract class ShopStates{}
class ShopInitState extends ShopStates{}
class ShopChangeNavState extends ShopStates{}
class ShopLoadingHomeState extends ShopStates{}
class ShopSuccessHomeState extends ShopStates{}
class ShopErrorHomeState extends ShopStates{
  String?error;
  ShopErrorHomeState( {this.error});
}
class ShopLoadingCategoryState extends ShopStates{}
class ShopSuccessCategoryState extends ShopStates{}
class ShopErrorCategoryState extends ShopStates{
  String?error;
  ShopErrorCategoryState( {this.error});
}
class ShopChangeFavoriteState extends ShopStates{}
class ShopChangeSuccessFavoriteState extends ShopStates{}
class ShopChangeErrorFavoriteState extends ShopStates{
  String?error;
  ShopChangeErrorFavoriteState( {this.error});
}
class ShopLoadingFavoriteState extends ShopStates{}
class ShopSuccessFavoriteState extends ShopStates{}
class ShopErrorFavoriteState extends ShopStates{
  String?error;
  ShopErrorFavoriteState( {this.error});
}
class ShopLoadingGetProfileState extends ShopStates{}
class ShopSuccessGetProfileState extends ShopStates{}
class ShopErrorGetProfileState extends ShopStates{
  String?error;
  ShopErrorGetProfileState( {this.error});
}
class ShopLoadingUpDateProfileState extends ShopStates{}
class ShopSuccessUpDateProfileState extends ShopStates{}
class ShopErrorUpDateProfileState extends ShopStates{
  String?error;
  ShopErrorUpDateProfileState( {this.error});
}

