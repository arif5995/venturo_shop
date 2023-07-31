import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:venturo_shop/model/menus_entity.dart';
import 'package:venturo_shop/model/order_body_entity.dart';
import 'package:venturo_shop/model/response_entity.dart';
import 'package:venturo_shop/model/voucher_entity.dart';
import 'package:venturo_shop/utils/error/failure_response.dart';

abstract class RemoteApi{
  Future<Either<FailureResponse, MenusEntity>>getDataMenu();
  Future<Either<FailureResponse, VoucherEntity>>getVoucher({required String kdVoucher});
  Future<Either<FailureResponse, ResponseEntity>>sendOrder({required OrderBodyEntity orderBodyEntity});
  Future<Either<FailureResponse, ResponseEntity>>cancelOrder({required String idOrder});
}

class RemoteApiImpl implements RemoteApi{
  final dio = Dio();
  @override
  Future<Either<FailureResponse, ResponseEntity>> cancelOrder({required String idOrder}) async{
    try{
      final response = await dio.post("https://tes-mobile.landa.id/api/order/cancel/$idOrder");
      return Right(ResponseEntity.fromJson(response.data));
    }catch(e){
      return Left(FailureResponse(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, MenusEntity>> getDataMenu()async {
    try{
      final response = await dio.get("https://tes-mobile.landa.id/api/menus");
      return Right(MenusEntity.fromJson(response.data));
    }catch(e){
      return Left(FailureResponse(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, VoucherEntity>> getVoucher({required String kdVoucher}) async{
    try{
      final response = await dio.get("https://tes-mobile.landa.id/api/vouchers?kode=$kdVoucher");
      return Right(VoucherEntity.fromJson(response.data));
    }catch(e){
      return Left(FailureResponse(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<FailureResponse, ResponseEntity>> sendOrder({required OrderBodyEntity orderBodyEntity}) async{
    try{
      final response = await dio.post("https://tes-mobile.landa.id/api/order", data: orderBodyEntity.toJson());
      return Right(ResponseEntity.fromJson(response.data));
    }catch(e){
      return Left(FailureResponse(errorMessage: e.toString()));
    }
  }
  
}
