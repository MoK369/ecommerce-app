import 'package:ecommerce/domain/models/brands/brands_model.dart';

sealed class BrandsState{}

class BrandsLoadingState extends BrandsState{}
class BrandsSuccessState extends BrandsState{
  List<BrandData> listOfBrandData;
  BrandsSuccessState({required this.listOfBrandData});

}
class BrandsErrorState extends BrandsState{
  Exception exception;

  BrandsErrorState({required this.exception});
}