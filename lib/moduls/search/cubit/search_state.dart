abstract class SearchStates{}
class SearchInitState extends SearchStates{}
class ShopLoadingSearchState extends SearchStates{}
class ShopSuccessSearchState extends SearchStates{}
class ShopErrorSearchState extends SearchStates{
  String?error;
  ShopErrorSearchState( {this.error});
}