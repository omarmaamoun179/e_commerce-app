import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/data/datasources/add_to_cart_ds.dart';
import 'package:e_commerce/features/home/data/datasources/add_to_fav_ds.dart';
import 'package:e_commerce/features/home/data/datasources/get_categories_data.dart';
import 'package:e_commerce/features/home/data/datasources/get_fav_ds.dart';
import 'package:e_commerce/features/home/data/datasources/get_prand_ds.dart';
import 'package:e_commerce/features/home/data/datasources/get_user_ds.dart';
import 'package:e_commerce/features/home/data/datasources/product_data_sourec.dart';
import 'package:e_commerce/features/home/data/datasources/update_profile_ds.dart';
import 'package:e_commerce/features/home/data/models/categorie_image_model.dart';
import 'package:e_commerce/features/home/data/repositories/add_to_cart_data_repo.dart';
import 'package:e_commerce/features/home/data/repositories/add_to_fav_data_repo.dart';
import 'package:e_commerce/features/home/data/repositories/get_categories_date_reopo.dart';
import 'package:e_commerce/features/home/data/repositories/get_fav_data_repo.dart';
import 'package:e_commerce/features/home/data/repositories/get_prands_data_repo.dart';
import 'package:e_commerce/features/home/data/repositories/get_prouct_data_repo.dart';
import 'package:e_commerce/features/home/data/repositories/get_user_data_repo.dart';
import 'package:e_commerce/features/home/data/repositories/update_profile_data_repo.dart';
import 'package:e_commerce/features/home/domain/entities/fav_entity/datum.dart';
import 'package:e_commerce/features/home/domain/entities/get_categories_entity/get_categories_entity/datum.dart';
import 'package:e_commerce/features/home/domain/entities/get_prands/datum.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity/datum.dart';
import 'package:e_commerce/features/home/domain/entities/update_data.dart';
import 'package:e_commerce/features/home/domain/entities/user_entity/data.dart';
import 'package:e_commerce/features/home/domain/repositories/add_to_cart_domain_repo.dart';
import 'package:e_commerce/features/home/domain/repositories/add_to_fav.dart';
import 'package:e_commerce/features/home/domain/repositories/get_categories_repo.dart';
import 'package:e_commerce/features/home/domain/repositories/get_fav_domain_repo.dart';
import 'package:e_commerce/features/home/domain/repositories/get_prands_repo.dart';
import 'package:e_commerce/features/home/domain/repositories/get_product_domin_repo.dart';
import 'package:e_commerce/features/home/domain/repositories/get_user_domain_repo.dart';
import 'package:e_commerce/features/home/domain/repositories/update_profile_repo.dart';
import 'package:e_commerce/features/home/domain/usecases/add_to_cart.dart';
import 'package:e_commerce/features/home/domain/usecases/add_to_fav.dart';
import 'package:e_commerce/features/home/domain/usecases/get_category.dart';
import 'package:e_commerce/features/home/domain/usecases/get_fav_use_Case.dart';
import 'package:e_commerce/features/home/domain/usecases/get_prands_use_case.dart';
import 'package:e_commerce/features/home/domain/usecases/get_product.dart';
import 'package:e_commerce/features/home/domain/usecases/get_user.dart';
import 'package:e_commerce/features/home/domain/usecases/update_profile.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_state.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/categories_screen.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/home_view.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/liked_screen.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/product_screen.dart';
import 'package:e_commerce/features/home/presentation/pages/tabs/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  GetPrandsDataSorce getPrandsDataSorce;
  GetCategoriesDataSource getCategoriesDataSource;
  ProductDataSource getProductDataSource;
  GetFavDataSource getFavDataSource;
  AddToFavDataSource addToFavDataSource;

  AddToCartDataSource addToCartDataSource;
  GetUserDataSource getUserDataSource;
  UpdateProfileDs updateProfileDs;
  GetCategoriesDetailsDataSource getCategoriesDetailsDataSource;

  HomeCubit(
      this.getCategoriesDataSource,
      this.getPrandsDataSorce,
      this.getFavDataSource,
      this.getProductDataSource,
      this.addToFavDataSource,
      // this.cartsDataSource,
      this.addToCartDataSource,
      this.getUserDataSource,
      this.updateProfileDs , 
      
      this.getCategoriesDetailsDataSource
      )
      : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int activeindex = 0;
  int tabindex = 0;
  List<DatumCategoriesEntity> catategories = [];
  List<DatumPrandsEntity>? prands = [];
  List<DatumProdcutEntity>? products = [];
  List<DatumFavEntity> favourites = [];
  UserDataEntity? data;

  List<String> images = [
    'assets/images/ad_1.png',
    'assets/images/ad_2.png',
    'assets/images/ad_3.png',
  ];
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  List<CategoryImage> menFashion = [
    CategoryImage(
      imagePath: 'assets/images/men_fashion.png',
      text: '',
    ),
    CategoryImage(
      imagePath: 'assets/images/shorts.png',
      text: 'Shorts',
    ),
    CategoryImage(
      imagePath: 'assets/images/t-shirt.png',
      text: 'T-Shirt',
    ),
    CategoryImage(
      imagePath: 'assets/images/jeans.png',
      text: 'Jeans',
    ),
    CategoryImage(
      imagePath: 'assets/images/footwear.png',
      text: 'Shoes',
    ),

    // CategoryImage(
    //   imagePath: 'assets/images/pants.png',
    //   text: 'Bags',
    // ),
    // CategoryImage(
    //   imagePath: 'assets/images/suits.png',
    //   text: 'Suits',
    // ),
    // CategoryImage(
    //   imagePath: 'assets/images/bags.png',
    //   text: 'Bags',
    // ),
    // CategoryImage(
    //   imagePath: 'assets/images/glasses.png',
    //   text: 'Eyewear',
    // ),
  ];
  List<Widget> screens = [
    const HomeView(),
    const CategoriesScreen(),
    const ProductScreen(),
    const LikedScreen(),
    const ProfileScreen(),
  ];
  changeTab(int index) {
    tabindex = index;
    emit(HomeChangeTab());
  }

  changeIndexIndicator(int index) {
    activeindex = index;
    emit(HomeChangeindicatorIndex());
  }

  changeBottomNav(int index) {
    emit(HomeInitial());
    currentIndex = index;
    emit(HomeChangeBottomNav());
  }

  Map<int, bool> fav = {};
  Map<dynamic, bool>? incart = {};
  getCategory() async {
    emit(HomeLoading());
    GetCategroirsDomainRepo getCategroirsDomainRepo =
        GetCategoriesDataRepo(getCategoriesDataSource);
    GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesUseCase(getCategroirsDomainRepo);
    var result = await getCategoriesUseCase.call();
    result.fold((l) => emit(HomeGetCategoriesError(l)), (r) {
      catategories = r.data?.data ?? [];
      return emit(HomeGetCategoriesSuccess(r));
    });
  }
  getCategoryDetails(int id) async {
    emit(HomeLoading());
    GetCategroirsDetailsDomainRepo getCategroirsDetailsDomainRepo =
        GetCategoriesDetailsDataRepo(getCategoriesDetailsDataSource);
    GetCategorieDetailsUseCase getCategoriesDetailsUseCase =
        GetCategorieDetailsUseCase(getCategroirsDetailsDomainRepo);
    var result = await getCategoriesDetailsUseCase.call(id);
    result.fold((l) => emit(GetProductByCategoryError(l)), (r) {
      products = r.data?.data ?? [];
      return emit(GetProductByCategorySuccess(r));
    });
  }

  getPrands() async {
    GetPrandsDomainRepo getPrandsDomainRepo =
        GetPrandsDataRepo(getPrandsDataSorce);
    GetPrandsUseCase getPrandsUseCase = GetPrandsUseCase(getPrandsDomainRepo);
    var result = await getPrandsUseCase.call();
    result.fold((l) => emit(HomeGetPrandsError(l)), (r) {
      prands = r.data ?? [];
      return emit(HomeGetPrandsSuccess(r));
    });
  }

  getProduct() async {
    GetProductDomainRepo getProductDomainRepo =
        GetProductDataRepo(getProductDataSource);
    GetProductUseCase getProductUseCase =
        GetProductUseCase(getProductDomainRepo);
    var result = await getProductUseCase.call();
    result.fold((l) {
      return emit(
        HomeProductError(l),
      );
    }, (r) {
      products = r.data?.data ?? [];
      for (var element in products!) {
        fav.addAll({element.id!: element.inFavorites!});
      }
      for (var element in products!) {
        incart!.addAll({element.id!: element.inCart!});
      }
      print(incart.toString());

      return emit(
        HomeProductSuccess(r),
      );
    });
  }

  getFavorite() async {
    emit(HomeGetFavLoading());
    GetFavDomainRepo getFavDomainRepo = GetFavDataRepo(getFavDataSource);
    GetFavUseCase getFavUseCase = GetFavUseCase(getFavDomainRepo);
    var result = await getFavUseCase.call();
    result.fold((l) {
      return emit(
        HomeGetFavError(l),
      );
    }, (r) {
      favourites = r.data!.data ?? [];

      return emit(
        HomeGetFavSuccess(r),
      );
    });
  }

  changeFav(int id) async {
    emit(HomeLoading());
    fav[id] = !fav[id]!;

    AddToFavDomainRepo addToFavDomainRepo =
        AddToFavDataRepo(addToFavDataSource);
    AddToFavUseCase addToFavUseCase = AddToFavUseCase(addToFavDomainRepo);
    var result = await addToFavUseCase.call(id);
    result.fold((l) {
      fav[id] = !fav[id]!;
      return emit(
        HomeAddToFavError(l),
      );
    }, (r) {
      getFavorite();
      emit(HomeChangeFavorite());
      return emit(
        HomeAddToFavSuccess(r),
      );
    });
  }

  changeCart(int? id, context) async {
    emit(HomeLoading());

    AddToCartDomainRepo addToCartDomainRepo =
        AddToCartDataRepo(addToCartDataSource);
    AddToCartUseCase addToCartUseCase = AddToCartUseCase(addToCartDomainRepo);
    var result = await addToCartUseCase.call(id!);
    result.fold((l) {
      return emit(
        HomeAddToCartError(l),
      );
    }, (r) {
      CartCubit.get(context).getCart();
      return emit(
        HomeAddToCartSuccess(r),
      );
    });
  }

  getUserData() async {
    GetUserDomainRepo getUserDomainRepo = GetUserDataRepo(getUserDataSource);
    GetUserUseCase getUserUseCase = GetUserUseCase(getUserDomainRepo);
    var result = await getUserUseCase.call();
    result.fold((l) {
      return emit(
        HomeGetUserError(l),
      );
    }, (r) {
      data = r.data;
      return emit(
        HomeGetUserSuccess(r),
      );
    });
  }

  updateProfile() async {
    UpdateProfileDomainRepo updateProfileDomainRepo =
        UpdateProfileDataRepo(updateProfileDs);
    UpdateProfileUseCase updateProfileUseCase =
        UpdateProfileUseCase(updateProfileDomainRepo);
    UpdateData userData = UpdateData(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text);
    var result = await updateProfileUseCase.call(userData);
    result.fold((l) => UpdateUserError(l), (r) => UpdateUserSuccess(r));
  }
}
