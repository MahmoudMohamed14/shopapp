



import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/search_model.dart';
import 'package:shopapp/moduls/search/cubit/search_state.dart';
import 'package:shopapp/shared/componants/constant.dart';
import 'package:shopapp/shared/network/end_point.dart';
import 'package:shopapp/shared/network/remot/dio_helper.dart';
class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitState());

  static SearchCubit get(context) {
    return BlocProvider.of(context);
  }
  SearchModel ?searchData;
  void search(
      {
        required String txt,

      }
      ){



    emit(ShopLoadingSearchState());
    DioHelper.postData(pass:SEARCH,token: token, data: {'text':'$txt',} ).then((value) {
      searchData=SearchModel.fromJson(value.data);
      print(token);
      print(value.data);



      emit(ShopSuccessSearchState());

    }).catchError((error){

      print('shopError Search :'+error.toString());
      emit(ShopErrorSearchState(error: error.toString()));

    });


  }

}








