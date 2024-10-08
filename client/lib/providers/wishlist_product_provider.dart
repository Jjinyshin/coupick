import 'package:flutter/material.dart';
import '../models/wishlist_product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _wishlist = [
    Product(name: '이츠굿텐 남녀공용 여행용 배낭 방수 크로스백 메신저백', price: 24900, imageUrl: 'https://image7.coupangcdn.com/image/vendor_inventory/0efa/a06441eb8f831c8936daceb93101fb02ff58a3382deafdb2a3c0526ef20e.jpg', coupangUrl: 'https://www.coupang.com/vp/products/7735767825?itemId=20799419012&vendorItemId=87868514679&q=%EC%9D%B4%EC%B8%A0%EA%B5%BF%ED%85%90+%EB%82%A8%EB%85%80%EA%B3%B5%EC%9A%A9+%EC%97%AC%ED%96%89%EC%9A%A9+%EB%B0%B0%EB%82%AD+%EB%B0%A9%EC%88%98+%ED%81%AC%EB%A1%9C%EC%8A%A4%EB%B0%B1+%EB%A9%94%EC%8B%A0%EC%A0%80%EB%B0%B1&itemsCount=36&searchId=a0f89d700aa848b38132f45c8c0cf610&rank=1&isAddedCart=', isRocketShipping: true),
    Product(name: '코멧 특대형 일회용 마스크 XL, 100매, 블랙, 1개', price: 9990, imageUrl: 'https://image8.coupangcdn.com/image/retail/images/13267445609757000-60cb0f1e-1e4d-42cc-b2d0-53430ff6c1f6.jpg', coupangUrl: 'https://www.coupang.com/vp/products/6247507367?itemId=12645084140&vendorItemId=79912572399&q=%EC%BD%94%EB%A9%A7+%ED%8A%B9%EB%8C%80%ED%98%95+%EC%9D%BC%ED%9A%8C%EC%9A%A9+%EB%A7%88%EC%8A%A4%ED%81%AC+XL%2C+100%EB%A7%A4%2C+%EB%B8%94%EB%9E%99%2C+1%EA%B0%9C&itemsCount=36&searchId=90673219c6b74405a0fae34c061b9d3c&rank=1&isAddedCart=', isRocketShipping: true),
    Product(name: '브레빌 바리스타 익스프레스 임프레스 커피머신', price: 1210000, imageUrl: 'https://image10.coupangcdn.com/image/retail/images/2024/02/07/15/2/b9856ee4-d306-450b-8730-d5040fb56844.jpg', coupangUrl: 'https://www.coupang.com/vp/products/7883629673?itemId=21566227350&vendorItemId=88618178912&q=%EB%B8%8C%EB%A0%88%EB%B9%8C+%EB%B0%94%EB%A6%AC%EC%8A%A4%ED%83%80+%EC%9D%B5%EC%8A%A4%ED%94%84%EB%A0%88%EC%8A%A4+%EC%9E%84%ED%94%84%EB%A0%88%EC%8A%A4+%EC%BB%A4%ED%94%BC%EB%A8%B8%EC%8B%A0&itemsCount=36&searchId=8b227af38a7045d9ba64544770e177ae&rank=1&isAddedCart=', isRocketShipping: true),
    Product(name: 'Apple 2023 맥북 프로 14 M3', price: 2557680, imageUrl: 'https://image9.coupangcdn.com/image/retail/images/2119768668797193-b109eb1a-fd30-4420-850f-04faf0aea2f9.jpg', coupangUrl: 'https://www.coupang.com/vp/products/7719393118?itemId=20712942833&vendorItemId=87783936731&pickType=COU_PICK&q=Apple+2023+%EB%A7%A5%EB%B6%81+%ED%94%84%EB%A1%9C+14+M3&itemsCount=36&searchId=5f5c7a188fc946318abf19def889bea2&rank=0&isAddedCart=', isRocketShipping: true),
    Product(name: '운동기구 아령 0.5kg 1kg 1.5kg 2kg 3kg 덤벨 2개1세트', price: 14300, imageUrl: 'https://image6.coupangcdn.com/image/vendor_inventory/images/2016/07/06/15/9/dce7e557-9276-4a45-9f00-37b97dfc203f.jpg', coupangUrl: 'https://www.coupang.com/vp/products/103672163?itemId=314780677&vendorItemId=3034896271&q=%EC%9A%B4%EB%8F%99%EA%B8%B0%EA%B5%AC+%EC%95%84%EB%A0%B9+0.5kg+1kg+1.5kg+2kg+3kg+%EB%8D%A4%EB%B2%A8+2%EA%B0%9C1%EC%84%B8%ED%8A%B8&itemsCount=36&searchId=b6742c1cd492479aa13af7de7068fc43&rank=1', isRocketShipping: false),
    Product(name: '자이스 렌즈 와이프 클리너', price: 14820, imageUrl: 'https://image9.coupangcdn.com/image/retail/images/2606949545276165-43e7b62b-9a60-40fd-a4ae-fc5dc6d3b5d5.jpg', coupangUrl: 'https://www.coupang.com/vp/products/120358812?itemId=358237583&vendorItemId=3871909245&pickType=COU_PICK&q=%EC%9E%90%EC%9D%B4%EC%8A%A4+%EB%A0%8C%EC%A6%88+%EC%99%80%EC%9D%B4%ED%94%84+%ED%81%B4%EB%A6%AC%EB%84%88&itemsCount=35&searchId=3fec3f7ee4814859aba17c5e0d5c8e4f&rank=0&isAddedCart=', isRocketShipping: true),
    Product(name: '룩트 유기농귀리 그래놀라 25g', price: 2200, imageUrl: 'https://image7.coupangcdn.com/image/vendor_inventory/c8f5/bd8bbfe8548a239c8abfaecb2dc9d992d4cf1cebfd65ab6b7738198cfe37.jpg', coupangUrl: 'https://www.coupang.com/vp/products/8279432943?itemId=23868731218&vendorItemId=80567288897&q=%EB%A3%A9%ED%8A%B8+%EC%9C%A0%EA%B8%B0%EB%86%8D%EA%B7%80%EB%A6%AC+%EA%B7%B8%EB%9E%98%EB%86%80%EB%9D%BC+25g&itemsCount=36&searchId=8006d5033c724e8d9adfdc23418c1725&rank=1', isRocketShipping: false),
    Product(name: '어반룩북 스퀘어넥 반팔 시원 니트', price: 15120, imageUrl: 'https://image8.coupangcdn.com/image/vendor_inventory/78bf/c8ea4ade8569eacdc675c9d4be4f6bcce677b65b0aa3bcc605a3861f4be0.jpg', coupangUrl: 'https://www.coupang.com/vp/products/7284184997?itemId=18603609457&vendorItemId=90130629221&q=%EC%96%B4%EB%B0%98%EB%A3%A9%EB%B6%81+%EC%8A%A4%ED%80%98%EC%96%B4%EB%84%A5+%EB%B0%98%ED%8C%94+%EC%8B%9C%EC%9B%90+%EB%8B%88%ED%8A%B8&itemsCount=36&searchId=932216e5faa04629ae42442a4db79b00&rank=1&isAddedCart=', isRocketShipping: true),
    Product(name: '지나송 로망 아일렛 봉포함 이중 암막커튼 세트', price: 86400, imageUrl: 'https://image7.coupangcdn.com/image/retail/images/3912072982258902-2bd2e912-9975-4df8-99f7-ecd5b1743e3f.jpg', coupangUrl: 'https://www.coupang.com/vp/products/88519951?itemId=276984462&vendorItemId=3672328160&pickType=COU_PICK&q=%EC%A7%80%EB%82%98%EC%86%A1+%EB%A1%9C%EB%A7%9D+%EC%95%84%EC%9D%BC%EB%A0%9B+%EB%B4%89%ED%8F%AC%ED%95%A8+%EC%9D%B4%EC%A4%91+%EC%95%94%EB%A7%89%EC%BB%A4%ED%8A%BC+%EC%84%B8%ED%8A%B8&itemsCount=36&searchId=cfdaacbb96a34a88b5a6ee902cc7f8f1&rank=1&isAddedCart=', isRocketShipping: true),
    Product(name: '아크네스 데일리 딥 클렌저 100g, 100g, 2개', price: 16900, imageUrl: 'https://image10.coupangcdn.com/image/vendor_inventory/0a18/1fc57db3f7bc994177e9197aea0ff2f5f0aeb9b3c7ac6add24fb88400ca6.jpg', coupangUrl: 'https://www.coupang.com/vp/products/6378641307?itemId=1101008542&vendorItemId=74736827460&q=%EC%95%84%ED%81%AC%EB%84%A4%EC%8A%A4+%EB%AA%A8%EC%9D%B4%EC%8A%A4%EC%B2%98+%ED%94%8C%EB%A3%A8%EC%9D%B4%EB%93%9C%2C+150ml%2C+1%EA%B0%9C&itemsCount=35&searchId=9ea7be4774a044e1ac5c76d586857970&rank=55&isAddedCart=', isRocketShipping: false),
  ];

  Product? _selectedProduct;

  List<Product> get wishlist => _wishlist;

  Product? get selectedProduct => _selectedProduct;

    void selectProduct(Product product) {
    _selectedProduct = product;
    notifyListeners();
  }

  void addProduct(Product product) {
    _wishlist.add(product);
    notifyListeners();
  }
}