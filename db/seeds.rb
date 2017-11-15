# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new({name: "pants", price: "75", image:"https://cdn-images.farfetch-contents.com/11/74/48/22/11744822_8459818_322.jpg", description: "black and white Feti Puma pants"})
product.save
product = Product.new({name: "shirt", price: "25", image:"https://media.gucci.com/style/DarkGray_Center_0_0_650x650/1481637621/440103_X3F05_9045_001_100_0000_Light-Washed-T-shirt-with-Gucci-Logo.jpg", description: "white casual tshirt with centered Gucci logo"})
product.save
product = Product.new({name: "sweatshirt", price: "50", image:"http://scene7.zumiez.com/is/image/zumiez/pdp_hero/Champion-Big-C-Reverse-Weave-Heather-Grey-Hoodie-_264491-front.jpg", description: "heather grey reverse weave champion hoodie"})
product.save
product = Product.new({name: "shoes", price: "700", image:"https://i.pinimg.com/originals/2b/11/09/2b11099f4763e1f895059fdb21f37cc1.jpg", description: "black and white balenciaga speed knit sneakers"})
product.save
product = Product.new({name: "handbag", price: "1600", image:"https://www.plein.com/dw/image/v2/BBKQ_PRD/on/demandware.static/-/Sites-plein-master-catalog/default/dwd0196d34/images/main/S18A-WBA0533-PLE075N_02_m.jpg?sw=440&sh=560", description: "black philippe plein handbag"})
product.save