part of 'menus_cubit.dart';

class MenusState extends Equatable {
  final ViewData<MenusEntity> menuData;
  final ViewData<int> qty;

  MenusState({required this.menuData, required this.qty});

  MenusState copyWith({
    ViewData<MenusEntity>? menuData,
    ViewData<int>? qty,
  }) {
    return MenusState(
      menuData: menuData ?? this.menuData,
      qty: qty ?? this.qty
    );
  }

  @override
  List<Object> get props => [menuData, qty];

}

