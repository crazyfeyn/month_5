const String fetchProducts = """
query {
  products(limit:2, offset: 1) {
    id
    title
    price
    description
    category {
      name
    }
  }
}
""";
