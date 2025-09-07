// lib/featuers/favorite/data/repos/favi_repo_implement.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_e_comerc_app/core/err/faire.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/add_favi/add_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/delet_favi/delet_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/get_favi_product/get_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/repos/favi_repo.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/services_favi/services_favi.dart';

class FaviRepoImpelment extends FaviRepo {
  final ServicesFavi servicesFavi;

  FaviRepoImpelment(this.servicesFavi);

  @override
  Future<Either<ServerFailler, AddFaviResponse>> futureAddProduct({
    required String productId,
  }) async {
    try {
      var response = await servicesFavi.addFvieProduct(productId: productId);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailler.fromDioError(e));
      } else {
        return left(ServerFailler(e.toString()));
      }
    }
  }

  @override
  Future<Either<ServerFailler, DeletFaviResponse>> futureDeletProduct({
    required String productId,
  }) async {
    try {
      var response = await servicesFavi.deletFvieProduct(productId: productId);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailler.fromDioError(e));
      } else {
        return left(ServerFailler(e.toString()));
      }
    }
  }

  @override
  Future<Either<ServerFailler, List<GetFaviResponse>>> futureGetFavitProduct() async {
    try {
      final response = await servicesFavi.getFavi(); // dynamic: Map or List or String decoded

      final List<GetFaviResponse> products = [];

      // حالة: response هو Map (حاسس أن السيرفر يجيب { "list": [...] } أو { "message": [...] })
      if (response is Map<String, dynamic>) {
        // حاول مفاتيح مختلفة لأن APIs بتختلف
        final candidate = response['list'] ?? response['data'] ?? response['message'] ?? response['products'] ?? response['favorites'];

        if (candidate is List) {
          for (var element in candidate) {
            if (element is Map<String, dynamic>) {
              products.add(GetFaviResponse.fromJson(element));
            } else if (element is Map) {
              products.add(GetFaviResponse.fromJson(Map<String, dynamic>.from(element)));
            }
          }
        } else {
          // إذا لم نجد لستة تحت أي مفتاح، حاول معالجة response نفسه لو هو قائمة
          // (لا نفعل شيء هنا، سيتم التحقق أسفل)
        }
      } else if (response is List) {
        for (var element in response) {
          if (element is Map<String, dynamic>) {
            products.add(GetFaviResponse.fromJson(element));
          } else if (element is Map) {
            products.add(GetFaviResponse.fromJson(Map<String, dynamic>.from(element)));
          }
        }
      }

      // لو لسة فاضية، حاول البحث عن "list" بعد تحويل الأنواع غير قياسية
      if (products.isEmpty && response is Map<String, dynamic>) {
        final fallback = response.values.firstWhere(
          (v) => v is List,
          orElse: () => null,
        );
        if (fallback is List) {
          for (var element in fallback) {
            if (element is Map<String, dynamic>) products.add(GetFaviResponse.fromJson(element));
          }
        }
      }

      return right(products);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailler.fromDioError(e));
      } else {
        return left(ServerFailler(e.toString()));
      }
    }
  }
}
