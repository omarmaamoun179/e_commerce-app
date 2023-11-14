import 'package:e_commerce/features/cart/data/datasources/get_cart_data_source.dart';
import 'package:e_commerce/features/cart/data/repositories/get_cart_data_repo.dart';
import 'package:e_commerce/features/cart/domain/entities/get_cart_entity/cart_item.dart';
import 'package:e_commerce/features/cart/domain/repositories/get_cart_domain_repo.dart';
import 'package:e_commerce/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  GetCartDataSource getCartDataSource;

  CartCubit(this.getCartDataSource) : super(CartInitial());
  List<CartItem> carts = [];
  static CartCubit get(context) => BlocProvider.of(context);
  getCart() async {
    emit(GetCartLoading());
    GetCartDomainRepo getCartDomainRepo = GetCartDataRepo(getCartDataSource);
    GetCartUseCase getCartUseCase = GetCartUseCase(getCartDomainRepo);
    var result = await getCartUseCase.call();
    result.fold((l) {
      return emit(GetCartError(l));
    }, (r) {
      carts = r.data!.cartItems ?? [];
      return emit(GetCartSuccess(r));
    });
  }

  // deleteCart(int id) async {
  //   emit(GetCartLoading());
  //   GetCartDomainRepo getCartDomainRepo = GetCartDataRepo(getCartDataSource);
  //   GetCartUseCase getCartUseCase = GetCartUseCase(getCartDomainRepo);
  //   var result = await getCartUseCase.deleteCart(id);
  //   result.fold((l) {
  //     return emit(GetCartError(l));
  //   }, (r) {
  //     carts=r.data?.cartItems??[];
  //     return emit(GetCartSuccess(r));
  //   });
}
