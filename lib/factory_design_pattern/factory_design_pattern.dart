enum ProductType { A, B }

abstract class Product {
  String getDescription();
}

class ConcreteProductA extends Product {
  @override
  String getDescription() {
    return 'Concrete Product A';
  }
}

class ConcreteProductB extends Product {
  @override
  String getDescription() {
    return 'Concrete Product B';
  }
}

abstract class Creator {
  Product createProduct(ProductType type);
}

class ConcreteCreator extends Creator {
  @override
  Product createProduct(ProductType type) {
    Product product;
    switch (type) {
      case ProductType.A:
        product = ConcreteProductA();
        break;
      case ProductType.B:
        product = ConcreteProductB();
        break;
      default:
        throw 'type not exist';
    }

    return product;
  }
}

void main() {
  Creator creator = ConcreteCreator();
  Product productA = creator.createProduct(ProductType.A);
  productA.getDescription();

  Product productB = creator.createProduct(ProductType.B);
  productB.getDescription();
}
