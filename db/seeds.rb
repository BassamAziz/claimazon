# frozen_string_literal: true

# product #1
product = Product.create(
  {
    "sku": '1',
    "author": 'Kevin Lücke',
    "title": "A CTO's Tale",
    "description": 'claimsforce CTO Kevin explains how they  build a tech stack which is totally unable to scale.',
    "thumbnail": 'https://picsum.photos/200',
    "image": 'https://picsum.photos/640',
    "price_cents": 4900,
    "price_currency": 'EUR',
    "items_in_stock": '34',
    "rating": 3
  }
)
tags = Tag.create([{ name: 'tech' }, { name: 'business' }])
tags.each do |tag|
  ProductTag.create(tag: tag, product: product)
end
Review.create(
  [
    {
      "product_id": product.id,
      "message": 'Total bullshit this guy has no idea.',
      "rating": 1
    },
    {
      "product_id": product.id,
      "message": nil,
      "rating": 5
    },
    {
      "product_id": product.id,
      "message": 'I expected more but it is okay',
      "rating": 3
    }
  ]
)
Recommendation.create([{ product: product, degree: 3 }, { product: product, degree: 4 }])

############
# product #2
product = Product.create(
  {
    "sku": '2',
    "author": 'Dr. Schmidtchen',
    "title": 'How to build your own house in less than 3 month',
    "description": 'Follow this guy into a world of do it yourself house building.',
    "thumbnail": 'https://picsum.photos/200',
    "image": 'https://picsum.photos/640',
    "price_cents": 3900,
    "price_currency": 'EUR',
    "items_in_stock": 4,
    "rating": 4
  }
)

tags = Tag.create([{ name: 'home' }])
tags.each do |tag|
  ProductTag.create(tag: tag, product: product)
end
Review.create(
  [
    {
      "product_id": product.id,
      "message": "I'm totally disappointed",
      "rating": 2
    },
    {
      "product_id": product.id,
      "message": nil,
      "rating": 5
    },
    {
      "product_id": product.id,
      "message": nil,
      "rating": 5
    }
  ]
)

############
# product #3
product = Product.create(
  {
    "sku": '3',
    "author": 'D. Klengel',
    "title": "I don't share",
    "description": 'Follow little Daniel on his second identity as a brooker he always tries to hide.',
    "thumbnail": 'https: //picsum.photos/200',
    "image": 'https://picsum.photos/640',
    "price_cents": 999,
    "price_currency": 'EUR',
    "items_in_stock": 6,
    "rating": 5
  }
)
tag = Tag.find_by(name: 'business')
ProductTag.create(tag: tag, product: product)
Review.create(
  [
    {
      "product_id": product.id,
      "message": nil,
      "rating": 5
    }
  ]
)
Recommendation.create([{ product: product, degree: 2 }])

############
# product #4
product = Product.create(
  {
    "sku": '4',
    "author": 'Kevin Lücke',
    "title": "A CTO's Fail",
    "description": 'claimsforce CTO Kevin explains how they  build a tech stack which is totally unable to scale.',
    "thumbnail": 'https: //picsum.photos/200',
    "image": 'https://picsum.photos/640',
    "price_cents": 3275,
    "price_currency": 'EUR',
    "items_in_stock": 400,
    "rating": nil
  }
)
tags = Tag.where(name: %w[tech businness])
tags.each do |tag|
  ProductTag.create(tag: tag, product: product)
end
Recommendation.create([{ product: product, degree: 1 }])
