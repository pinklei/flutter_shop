import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import './provide/details_info.dart';
import './provide/cart.dart';
import './provide/currentIndex.dart';
import 'package:fluro/fluro.dart';
import './routers/routes.dart';
import './routers/application.dart';

void main() {
  var counter = Counter();
  var providers = Providers();
  var childCategory = ChildCategory();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var detailsInfoProvide = DetailsInfoProvide();
  var cartProvide =CartProvide();
  var currentIndexProvide =CurrentIndexProvide();

  providers
  ..provide(Provider<Counter>.value(counter))
  ..provide(Provider<ChildCategory>.value(childCategory))
  ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))
  ..provide(Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
  ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
  ..provide(Provider<CartProvide>.value(cartProvide));

  runApp(ProviderNode(child:MyApp(),providers:providers));
}

class MyApp extends StatelessWidget {
  // final Widget child;

  // name({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
    
    return Container(
      child: MaterialApp(
          title:'ç™¾å§“ç”Ÿæ´»+',
          onGenerateRoute: Application.router.generator,
          debugShowCheckedModeBanner: false,
          theme:ThemeData(
            primaryColor: Colors.pink,
          ),
          home:IndexPage()
      ),
    );
  }
}