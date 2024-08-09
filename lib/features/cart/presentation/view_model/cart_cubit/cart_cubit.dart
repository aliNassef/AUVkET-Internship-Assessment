import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart_model.dart';
import '../../../data/repo/cart_repo.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(CartInitial());

  final CartRepo _cartRepo;

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await _cartRepo.getCartProducts();
    result.fold(
      (l) {
        calcTotal(l);
        emit(
          CartLoaded(cartModel: l),
        );
      },
      (r) => emit(
        CartFailure(errMessage: r),
      ),
    );
  }

  int total = 0;
  calcTotal(CartModel model) {
    for (int i = 0; i < model.numOfCartItems!; i++) {
      total += model.data!.products![i].price!;
    }
  }

  Future<void> deleteProduct(String id) async {
    emit(CartLoading());
    final result = await _cartRepo.removeSpecificCartItem(id: id);
    result.fold(
      (l) => emit(
        CartLoaded(cartModel: l),
      ),
      (r) => emit(
        CartFailure(errMessage: r),
      ),
    );
  }

  Future<void> updateCount(String id, int count) async {
    if (count != 0) {
      var resault = await _cartRepo.updateCartProductQuantity(
        count: count,
        id: id,
      );
      resault.fold(
        (l) => emit(
          CartLoaded(cartModel: l),
        ),
        (r) => emit(CartFailure(errMessage: r)),
      );
    } else {
      var resault = await _cartRepo.updateCartProductQuantity(
        count: 1,
        id: id,
      );
      resault.fold(
        (l) => emit(
          CartLoaded(cartModel: l),
        ),
        (r) => emit(CartFailure(errMessage: r)),
      );
    }
  }

  addProductToCart({required String id}) async {
    emit(CartAddLoading());
    try {
      await _cartRepo.addProductToCart(id: id);
      emit(CartAddedSuccess());
    } catch (e) {
      emit(CartAddedFailure(errMessage: e.toString()));
    }
  }
}
