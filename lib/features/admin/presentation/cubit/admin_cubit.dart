import 'dart:convert';
//import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:order_app/core/di/dependency_injection.dart';
import 'package:order_app/core/models/sub_models/market_body_model.dart';
import 'package:order_app/features/admin/data/models/notification_response_model.dart';
import 'package:order_app/features/admin/data/models/product_body_model.dart';
import 'package:order_app/features/admin/data/models/update_product_body_model.dart';
import 'package:order_app/features/admin/data/repositories/admin_notification_repository.dart';
import 'package:order_app/features/admin/data/repositories/admin_response_repository.dart';
import 'package:order_app/features/admin/data/repositories/create_market_repository.dart';
import 'package:order_app/features/admin/data/repositories/create_product_repository.dart';
import 'package:order_app/features/admin/data/repositories/delete_market_repository.dart';
import 'package:order_app/features/admin/data/repositories/delete_product_repository.dart';
import 'package:order_app/features/admin/data/repositories/to_admin_repository.dart';
import 'package:order_app/features/admin/data/repositories/to_user_repository.dart';
import 'package:order_app/features/admin/data/repositories/update_market_repository.dart';
import 'package:order_app/features/admin/data/repositories/update_product_repository.dart';
import 'package:order_app/features/shops/presentation/cubit/markets_cubit.dart';
part 'admin_state.dart';


class AdminCubit extends Cubit<AdminState> {

  MarketsCubit marketsCubit ;
  AdminCubit(this.marketsCubit) : super(ToUserInitial());

  
  TextEditingController locationController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController availableQuantityController = TextEditingController();

  List<int>? selectedFile;
  Uint8List? bytesData;

  final formMarketKey = GlobalKey<FormState>();
  final formKeyProductKey = GlobalKey<FormState>();

@override
  Future<void> close() {
    // Dispose of controllers when the Cubit is closed
    locationController.dispose();
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    availableQuantityController.dispose();
    return super.close();
  }


  startWebFilePicker() async {
  //   html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
  //   uploadInput.multiple = true;
  //   uploadInput.draggable = true;
  //   uploadInput.click();

  //   uploadInput.onChange.listen((event) {
  //     final files = uploadInput.files;
  //     final file = files![0];
  //     final reader = html.FileReader();

  //     reader.onLoadEnd.listen((event) {
        
  //         bytesData =
  //           const  Base64Decoder().convert(reader.result.toString().split(",").last);
  //         selectedFile = bytesData;
  //         emit(UploadImageSuccessfully());
      
  //     });
  //     reader.readAsDataUrl(file);
  //   });
   }

  

  eitherFailureOrToUser(int adminId) async {
    emit(ToUserLoading());
    final result = await sl<ToUserRepository>().toUser(adminId);

    result.fold((failure) {
      emit(ToUserFailure(errMessage: failure.errMessage,arErrMessage:failure.arErrMessage ));
    }, (message) {
      emit(ToUserSuccessfully());
    });
  }

  eitherFailureOrToAdmin(int userId) async {
    emit(ToAdminLoading());
    final result = await sl<ToAdminRepository>().toAdmin(userId);

    result.fold((failure) {
      emit(ToAdminFailure(errMessage: failure.errMessage,arErrMessage:failure.arErrMessage));
    }, (message) {
      emit(ToAdminSuccessfully());
    });
  }

  eitherFailureOrCreateMarket() async {
  emit(CreateMarketLoading());

  final result = await sl<CreateMarketRepository>().createMarket(
    createMarketBodyModel: MarketBodyModel(
      name: nameController.text,
      location: locationController.text,
      descrption: descriptionController.text,
      image:selectedFile == null ?null : MultipartFile.fromBytes(
        selectedFile!,
        filename: 'market_image.jpg', 
        contentType: MediaType('image', 'json'), 
      ), 
    ),
  );

  result.fold(
    (failure) {
      emit(CreateMarketFailure(errMessage: failure.errMessage,arErrMessage:failure.arErrMessage));
    },
    (response) {
      print("create successfully");
      emit(CreateMarketSuccessfully());
      marketsCubit.eitherFailureOrMarktes();
    },
  );
}



  eitherFailureOrUpdateMarket(
       int marketId) async {
    emit(UpdateMarketLoading());
    final result = await sl<UpdateMarketRepository>()
        .updateMarket(marketBodyModel: MarketBodyModel(
          name: nameController.text,
          location: locationController.text,
          descrption: descriptionController.text,
          method: 'put',
          image:selectedFile == null ? null: MultipartFile.fromBytes(
        selectedFile!,
        filename: 'market_image.jpg', 
        contentType: MediaType('image', 'json'), 
      ), 
            ), marketId: marketId);

    result.fold((failure) {
      emit(UpdateMarketFailure(errMessage: failure.errMessage,arErrMessage:failure.arErrMessage));
    }, (response) {
      emit(UpdateMarketSuccessfully());
      marketsCubit.eitherFailureOrMarktes();
    });
  }

  eitherFailureOrDeleteMarket(int marketId) async {
    emit(DeleteMarketLoading());

    final result =
        await sl<DeleteMarketRepository>().deleteMarket(marketId: marketId);

    result.fold((failure) {
      emit(DeleteMarketFailure(errMessage: failure.errMessage,arErrMessage:failure.arErrMessage));
    }, (message) async{
      emit(DeleteMarketSuccessfully());
      marketsCubit.eitherFailureOrMarktes();
    });
  }

  eitherFailureOrAdminNotification() async {
    emit(AdminNotificationLoading());

    final result =
        await sl<AdminNotificationRepository>().adminNotification();

    result.fold((failure) {
      emit(AdminNotificationFailure(errMessage: failure.errMessage,arErrMessage:failure.arErrMessage));
    }, (model) {
      emit(AdminNotificationSuccessfully(model));
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
          pirce: int.parse(availableQuantityController.text),
          image:selectedFile == null?null: MultipartFile.fromBytes(
        selectedFile!,
        filename: 'product.jpg', 
        contentType: MediaType('image', 'json'), 
      )
          ), marketId: marketId);

    result.fold((failure) {
      emit(CreateProductFailure(errMessage: failure.errMessage,arErrMessage:failure.arErrMessage));
    }, (message) {
      emit(CreateProductSuccessfully());
    });
  }

  eitherFailureOrUpdateProduct(int productId) async {
    emit(UpdateMarketLoading());
    final result = await sl<UpdateProductRepository>().updateProduct(
        productId: productId,
         productBodyModel: UpdateProductBodyModel(
          method: 'put',
          name: nameController.text,
          availableQuantity:int.parse(availableQuantityController.text),
          description: descriptionController.text,
          image:selectedFile == null? null : MultipartFile.fromBytes(
        selectedFile!,
        filename: 'product_image.jpg', 
        contentType: MediaType('image', 'json'), 
      ), 
          pirce: int.parse(availableQuantityController.text),
          ));

    result.fold((failure) {
      emit(UpdateProductFailure(errMessage: failure.errMessage,arErrMessage:failure.arErrMessage));
    }, (message) {
      emit(UpdateProductSuccessfully());
    });
  }

  eitherFailureOrDeleteProduct(int productId) async {
    emit(DeleteProductLoading());
    final result =
        await sl<DeleteProductRepository>().deleteProduct(productId: productId);

    result.fold((failure) {
      emit(DeleteProductFailure(errMessage: failure.errMessage,arErrMessage:failure.arErrMessage));
    }, (message) {
      emit(DeleteProductSuccessfully());
    });
  }

  eitherFailureOrAdminResponse(int orderId, bool answer) async {
    final result = await sl<AdminResponseRepository>()
        .adminResponse(orderId: orderId, answer: answer);
    result.fold((failure) {
      emit(AdminResponseFailure(errMessage: failure.errMessage,arErrMessage:failure.arErrMessage));
    }, (message) {
      emit(AdminResponseSuccessfully());
      eitherFailureOrAdminNotification();
    });
  }
}
