const String createProduct = """
mutation addProduct(
  \$title: String!, 
  \$price: Float!, 
  \$description: String!, 
  \$categoryId: Float!,
  \$images: [String!]!
) {
    addProduct(
      data: {
        title: \$title, 
        price:  \$price, 
        description: \$description, 
        categoryId: \$categoryId
        images: \$images
      }) {
      id
      title
      price
      description
      images
      category {
        name
      }
    }
}

""";


const String updateProduct = """
mutation UpdateProduct(\$id: ID!, \$title: String, \$price: Float, \$description: String, \$categoryId: FLOAT!) {
  updateProduct(id: \$id, changes: {
    title: \$title,
    price: \$price,
    description: \$description,
    categoryId: \$categoryId
  }) {
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


const String deleteProduct = """
mutation deleteProduct(\$id: FLOAT!) {
  deleteProduct(id: \$id)
}
""";