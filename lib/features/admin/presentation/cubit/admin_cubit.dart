import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/core/models/sub_models/market_body_model.dart';
import 'package:order_app/features/admin/data/models/product_body_model.dart';
import 'package:order_app/features/admin/data/models/update_product_body_model.dart';
import 'package:order_app/features/admin/data/repositories/admin_response_repository.dart';
import 'package:order_app/features/admin/data/repositories/create_market_repository.dart';
import 'package:order_app/features/admin/data/repositories/create_product_repository.dart';
import 'package:order_app/features/admin/data/repositories/delete_market_repository.dart';
import 'package:order_app/features/admin/data/repositories/delete_product_repository.dart';
import 'package:order_app/features/admin/data/repositories/to_admin_repository.dart';
import 'package:order_app/features/admin/data/repositories/to_user_repository.dart';
import 'package:order_app/features/admin/data/repositories/update_market_repository.dart';
import 'package:order_app/features/admin/data/repositories/update_product_repository.dart';
part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(ToUserInitial());


  TextEditingController locationController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController availableQuantityController = TextEditingController();

  XFile? marketImage;
  XFile? productImage;

  final formMarketKey = GlobalKey<FormState>();
  final formKeyProductKey = GlobalKey<FormState>();

  eitherFailureOrToUser(int adminId) async {
    emit(ToUserLoading());
    final result = await sl<ToUserRepository>().toUser(adminId);

    result.fold((failure) {
      emit(ToUserFailure(failure.errMessage));
    }, (message) {
      emit(ToUserSuccessfully(message));
    });
  }

  eitherFailureOrToAdmin(int userId) async {
    emit(ToAdminLoading());
    final result = await sl<ToAdminRepository>().toAdmin(userId);

    result.fold((failure) {
      emit(ToAdminFailure(failure.errMessage));
    }, (message) {
      emit(ToAdminSuccessfully(message));
    });
  }

  eitherFailureOrCreateMarket() async {
    emit(CreateMarketLoading());
    final result = await sl<CreateMarketRepository>()
        .createMarket(createMarketBodyModel: MarketBodyModel(
          name: nameController.text,
          location: locationController.text,
          descrption: descriptionController.text
            )
            );

    result.fold((failure) {
      emit(CreateMarketFailure(failure.errMessage));
    }, (response) {
      emit(CreateMarketSuccessfully(response.message));
    });
  }

  eitherFailureOrUpdateMarket(
       int marketId) async {
    emit(UpdateMarketLoading());
    final result = await sl<UpdateMarketRepository>()
        .updateMarket(marketBodyModel: MarketBodyModel(
          name: nameController.text,
          location: locationController.text,
          descrption: descriptionController.text
            ), marketId: marketId);

    result.fold((failure) {
      emit(UpdateMarketFailure(failure.errMessage));
    }, (response) {
      emit(UpdateMarketSuccessfully(response.enMessage));
    });
  }

  eitherFailureOrDeleteMarket(int marketId) async {
    emit(DeleteMarketLoading());
    final result =
        await sl<DeleteMarketRepository>().deleteMarket(marketId: marketId);

    result.fold((failure) {
      emit(DeleteMarketFailure(failure.errMessage));
    }, (message) {
      emit(DeleteMarketSuccessfully(message));
    });
  }

  eitherFailureOrCreateProduct(
      int marketId) async {
    emit(CreateProductLoading());
    final result = await sl<CreateProductRepository>()
        .createProduct(productBodyModel: ProductBodyModel(
          name: nameController.text,
          availableQuantity:int.parse(availableQuantityController.text),
          description: descriptionController.text,
          pirce: int.parse(availableQuantityController.text)
          ), marketId: marketId);

    result.fold((failure) {
      emit(CreateProductFailure(failure.errMessage));
    }, (message) {
      emit(CreateProductSuccessfully(message));
    });
  }

  eitherFailureOrUpdateProduct(
      UpdateProductBodyModel productBodyModel, int productId) async {
    emit(UpdateMarketLoading());
    final result = await sl<UpdateProductRepository>().updateProduct(
        productId: productId,
         productBodyModel: UpdateProductBodyModel(
          method: 'put',
          name: nameController.text,
          availableQuantity:int.parse(availableQuantityController.text),
          description: descriptionController.text,
          pirce: int.parse(availableQuantityController.text),
          ));

    result.fold((failure) {
      emit(UpdateProductFailure(failure.errMessage));
    }, (message) {
      emit(UpdateProductSuccessfully(message));
    });
  }

  eitherFailureOrDeleteProduct(int productId) async {
    emit(DeleteProductLoading());
    final result =
        await sl<DeleteProductRepository>().deleteProduct(productId: productId);

    result.fold((failure) {
      emit(UpdateMarketFailure(failure.errMessage));
    }, (message) {
      emit(UpdateMarketSuccessfully(message));
    });
  }

  eitherFailureOrAdminResponse(int orderId, bool answer) async {
    final result = await sl<AdminResponseRepository>()
        .adminResponse(orderId: orderId, answer: answer);
    result.fold((failure) {
      emit(AdminResponseFailure(failure.errMessage));
    }, (message) {
      emit(AdminResponseSuccessfully(message));
    });
  }
}
