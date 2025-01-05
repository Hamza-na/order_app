// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:order_app/core/entities/sub_entities/access_token_entitiy.dart';
import 'package:order_app/core/entities/sub_entities/refresh_token_entitiy.dart';
import 'package:order_app/core/entities/sub_entities/user_entitiy.dart';

class AuthResponseEntitiy {
  AccessTokenEntitiy accessTokenEntitiy;
  RefreshTokenEntitiy refreshTokenEntitiy;
  UserEntitiy userEntitiy;

  
  AuthResponseEntitiy({
    required this.accessTokenEntitiy,
    required this.refreshTokenEntitiy,
    required this.userEntitiy,
  });
}
