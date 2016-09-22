# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

grocery = Category.create(name: "Groceries")
Item.create(title: "Banana",
            description: "Wholesome yellow goodness",
            price: "180",
            category_id: grocery.id,
            image_path: "http://saltmarshrunning.com/wp-content/uploads/2014/09/bananasf.jpg",
            long_description: "You like potassium, right? Of course you do, its a great element! Get tastiness and potatssium at the same time.")

Item.create(title: "Apple",
            description: "Keep the doctor away",
            price: "80",
            category_id: grocery.id,
            image_path: "http://sites.psu.edu/siowfa15/wp-content/uploads/sites/29639/2015/09/04_Apples.jpg",
            long_description: "Crisp, sweet and healthy. We source our apples from the finest farms, you'll taste the difference.")

Item.create(title: "Steak",
            description: "Delicious grilled, seared or sliced",
            price: "650",
            category_id: grocery.id,
            image_path: "http://www.omahasteaks.com/gifs/os/dd_01_filet.jpg",
            long_description: "We maintain a close relationship with our farmers to ensure quality and sustainability. Enjoy without guilt.")

Item.create(title: "Carrot",
            description: "Orange, healthy and delicious",
            price: "199",
            category_id: grocery.id,
            image_path: "http://dingo.care2.com/pictures/greenliving/uploads/2016/05/carrots.jpg",
            long_description: "Add them to a soup, fry them, or eat them raw. No matter what you do, you won't be disappointed.")

Item.create(title: "Lettuce",
            description: "Fresh from the garden",
            price: "110",
            category_id: grocery.id,
            image_path: "http://www.vegkitchen.com/wp-content/uploads/2011/07/Romaine-lettuce.jpg",
            long_description: "Lettuce is ubiquitous for a reason. Fresh and crisp, build a salad or top your burger.")

Item.create(title: "Bacon",
            description: "BACON! Need we say more?",
            price: "599",
            category_id: grocery.id,
            image_path: "http://www.drserenamurray.com/wp-content/uploads/2013/02/1bacon0929.jpg",
            long_description: "America loves bacon, you probably love bacon. Buy this bacon and increase your happiness.")

health = Category.create(name: "Health")
Item.create(title: "Toothpaste",
            description: "Clean your teeth in style",
            price: "399",
            category_id: health.id,
            image_path: "http://www.personal.psu.edu/afr3/blogs/siowfa12/toothpaste.jpg",
            long_description: "Oral health is important to overall wellbeing. Our whitening toothpaste will help your self-esteem and health.")

Item.create(title: "Band-Aids",
            description: "Clean and cover wounds",
            price: "299",
            category_id: health.id,
            image_path: "http://www.fluenceportland.com/wp-content/uploads/2012/11/Band-Aid.jpg",
            long_description: "Covering your wounds is important to preventing infection. These adhesive bandages are a cheap way to avoid the ER.")

Item.create(title: "Mouth Wash",
            description: "Minty breath",
            price: "350",
            category_id: health.id,
            image_path: "https://sites.psu.edu/siowfa15/wp-content/uploads/sites/29639/2015/10/3001.jpg",
            long_description: "Instead of stinky breath, enjoy the brisk minty sensation of mouth wash.")

Item.create(title: "Advil",
            description: "Dull your aches and pain",
            price: "925",
            category_id: health.id,
            image_path: "http://neopharmgroup.com/wp-content/uploads/2012/12/advil.jpg",
            long_description: "Quick and easy relief from aches and pains. Long lasting capsules means more time living life on your terms.")

Item.create(title: "Multivitamin",
            description: "Keep your body in tip-top shape",
            price: "1299",
            category_id: health.id,
            image_path: "http://myheart.net/wp-content/uploads/2015/12/multivitamin.jpg",
            long_description: "We all try to eat healthy, but perfect nutrition is hard. This suppliment will cover any vitamins you miss and help your health.")

Item.create(title: "Cough Medicine",
            description: "Fix your cough and sleep better",
            price: "799",
            category_id: health.id,
            image_path: "http://www.motherjones.com/files/blog_cough_medicine.jpg",
            long_description: "Colds are no fun. Enjoy a good night of sleep, instead of coughing all night, with our cough medicine.")

cleaning = Category.create(name: "Cleaning Supplies")
Item.create(title: "Bleach",
            description: "When you just have to clean it",
            price: "1550",
            category_id: cleaning.id,
            image_path: "https://images-na.ssl-images-amazon.com/images/I/41W00ZtAw5L.jpg",
            long_description: "This concetrated bleach formula will clean whatever you need. DO NOT MIX WITH AMMONIA.")

Item.create(title: "Glass Cleaner",
            description: "Leave your glass beautiful",
            price: "1199",
            category_id: cleaning.id,
            image_path: "http://cormsquare.com//Images/Product/20150831100637236/_08312015100637238_bf7a3865-b127-4165-b120-9edba03e59f0.jpg",
            long_description: "Clean your glass without worrying about annoying glass streaks. Our patented formula is guaranteed to leave your glass sparkling.")

Item.create(title: "Paper Towels",
            description: "Clean up your messes with ease",
            price: "899",
            category_id: cleaning.id,
            image_path: "http://www.southernsavers.com/wp-content/uploads/2013/01/Paper-Towels.jpeg",
            long_description: "Fear no mess with extra absorbent paper towels. Absorb 30% more fluid than a competitor.")

Item.create(title: "Trash Bags",
            description: "20 x 13 gallon trash bags",
            price: "999",
            category_id: cleaning.id,
            image_path: "http://d2rormqr1qwzpz.cloudfront.net/photos/2013/07/02/49514-c26-b005gsyxhw-1-l.jpg",
            long_description: "These trash bags are durable and stretchy. No more will you end up with torn bags leaving trash everywhere.")

Item.create(title: "Laundry Detergent",
            description: "Environmentally friendly detergent",
            price: "1350",
            category_id: cleaning.id,
            image_path: "http://static3.consumerreportscdn.org/content/dam/cro/news_articles/appliances/CR-BG-Laundry-Detergent-SBS-TidePlus-Coldwater-Clean.jpg",
            long_description: "Sanitation and sustainability aren't mutually exclusive. This laundry detergent leaves your clothes and your mind worry-free.")

Item.create(title: "Air Freshener",
            description: "Fix smells in a few sprays",
            price: "599",
            category_id: cleaning.id,
            image_path: "https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/img_6565.jpg",
            long_description: "No matter what you do, unpleasant oders creep into our house. Banish them with our top-notch air freshener.")

beverages = Category.create(name: "Beverages")
Item.create(title: "SmartWater",
            description: "Delicious refreshing water",
            price: "110",
            category_id: beverages.id,
            image_path: "http://wdy.h-cdn.co/assets/cm/15/08/54ea7fe1bc68a_-_h-wd0409-smart-water-3.jpg",
            long_description: "Smartwater is vapor distilled, inspired by the way nature purifies water. Water becomes vapor filtering out impurities along the way.")

Item.create(title: "Izze",
            description: "Fruit juice and sparkling water",
            price: "90",
            category_id: beverages.id,
            image_path: "http://www.izze.com/media-resources/CanFamily.jpg",
            long_description: "The perfect partner to help host a sparkling evening, IZZE Sparkling Juice is the Bright-hearted bubbling beverage that’ll liven up your Friends day Night. Gather some friends, whip up something delicious, and pour on the good times.")

Item.create(title: "Black Tea",
            description: "Excellent Ceylon black tea",
            price: "310",
            category_id: beverages.id,
            image_path: "http://ceylonteaco.blazonco.com/images/products/toctc/CatalogImages_OCT.jpg",
            long_description: "Waking up or throughout the day, tea gets scorned for coffee. Some of us know the coffee people are just missing out. Join in with a delicious cup of tea!")

Item.create(title: "Horizon Organic Milk",
            description: "Chocolate Milk - 18 x 8 oz",
            price: "1799",
            category_id: beverages.id,
            image_path: "https://images-na.ssl-images-amazon.com/images/I/51PYyCpMAJL.jpg",
            long_description: "Horizon Organic's shelf-stable milk boxes are great for lunchboxes, snacks, travel and more, and are a perfect alternative to juice boxes.")

Item.create(title: "Nesquik Chocolate",
            description: "Nestlé Chocolate 15 x 8 oz",
            price: "980",
            category_id: beverages.id,
            image_path: "http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=492054",
            long_description: "Nestlé Nesquik Chocolate Low Fat Milk is made with 100% real milk and has 8g of protein in every 8 fluid ounce serving.")

Item.create(title: "Lipton Green Tea",
            description: "104 Count of Lipton Green Tea",
            price: "319",
            category_id: beverages.id,
            image_path: "http://makglobal.com/images/UNILEVER_ALLPRODUCTS_LIPTON/4100000100.jpg",
            long_description: "Savor the original, delicious taste enjoyed by discriminating tea connoisseurs for more than a century.")

Item.create(title: "Kahlua Ground Coffee",
            description: "40 oz White Coffee.",
            price: "1449",
            category_id: beverages.id,
            image_path: "https://i5.walmartimages.com/asr/42a53ca5-6936-4f2b-aa6d-e074adca9aa1_1.5a5571e55ac6d26870e30ae902723d78.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF",
            long_description: "Kahlua Rum and Coffee Liqueur combines the delicious notes of rum, vanilla and caramel, wrapped in roasted coffee flavor from hand-picked Arabica beans.")

Item.create(title: "Zipfizz",
            description: "Great tasting energy drink-mix",
            price: "1399",
            category_id: beverages.id,
            image_path: "http://richmedia.channeladvisor.com/ImageDelivery/imageService?profileId=52000717&id=884535&recipeId=243",
            long_description: "Zipfizz has created an advanced formula that provides a significant amount of vitamins, fewer calories, lower carbohydrates, superior taste, variety and unique packaging! Use Zipfizz as a morning or afternoon pick-me-up, or enhance your training by taking it before, during, or after a hard workout.")

Item.create(title: "Bai",
            description: "12 x 18 oz - Antioxidant Infusion.",
            price: "1999",
            category_id: beverages.id,
            image_path: "http://www.drinkhacker.com/wp-content/uploads/2012/07/bai-5.png",
            long_description: "Superfruit infused and antioxidant packed. 100% Natural and just 5 calories. You know the inside of the coffeefruit, it's what your everyday cup'o joe is made from.")

bath_and_body = Category.create(name: "Bath and Body")
Item.create(title: "Aveeno",
            description: "Oil-free, hypoallergenic",
            price: "183",
            category_id: bath_and_body.id,
            image_path: "https://resources.shopstyle.com/sim/b1/a6/b1a650054646fcdb4d4263f22fa05742/nexxus-therappe-shampoo-33-8-oz-2-pk.jpg",
            long_description: "Daily Moisturizer: A unique formula with an exclusive Total Soy Complex to help naturally even out skin tone and smooth texture. It also contains salicylic acid to help clear up and prevent blemishes..")

Item.create(title: "Dove",
            description: "Moisturizing shampoo",
            price: "739",
            category_id: bath_and_body.id,
            image_path: "http://s7d2.scene7.com/is/image/samsclub/0007940052620_A?wid=1500&hei=1500&fmt=jpg&qlt=80",
            long_description: "Get touchably smooth hair that is easy to manage, without excess reside. Dove Daily Moisture Shampoo & Conditioner moisturizes for up to 5X smoother hair in just one wash.")

Item.create(title: "Gillette",
            description: "CustomPlus 3 - 26 Razors",
            price: "2729",
            category_id: bath_and_body.id,
            image_path: "http://c4.soap.com/images/products/p/PG/PG-633B_1z.jpg",
            long_description: "Forget your old disposable razor. Experience a comfortable and precise 3-blade shave in a disposable with Gillette CustomPlus 3.")

Item.create(title: "Head & Shoulders",
            description: "Shampoo Plus Conditioner",
            price: "1199",
            category_id: bath_and_body.id,
            image_path: "http://news.pg.com/sites/pg.newshq.businesswire.com/files/image/image/Head__AND__Shoulders_Anti-Dandruff_Shampoo.jpg",
            long_description: "Healthy hair starts from a healthy scalp. The Head & Shoulders Dandruff Shampoo Plus Conditioner relieves scalp itch, dryness, irritation, and helps prevent flakes associated with dandruff.")

Item.create(title: "Garnier Fructis",
            description: "For frizzy and unmanageable hair",
            price: "799",
            category_id: bath_and_body.id,
            image_path: "http://www.garnierusa.com/~/media/Images/Garnier/Home/Products/Hair/HairCare/Pure-Clean/Pure-Clean-Shampoo-13oz/P0213_packshot.png?h=400&thn=0&w=307",
            long_description: "Lather in Garnier Fructis Sleek & Shine to get 3 Day sleek, even in 97% humidity.")

Item.create(title: "Q-tips",
            description: "1530 Count Cotton Swabs.",
            price: "999",
            category_id: bath_and_body.id,
            image_path: "http://img2.timeinc.net/health/img/web/2012/10/blogs/Q-Tip-Beauty.jpg",
            long_description: "Q-tips cotton swabs are the ultimate home and beauty tool. With an abundance of soft cotton at the end of each gently flexible stick, Q-tips cotton swabs are perfect for a variety of uses.")

Item.create(title: "Prince & Spring",
            description: "Gently cleans, soothes, softens",
            price: "499",
            category_id: bath_and_body.id,
            image_path: "https://dcmzfk78s4reh.cloudfront.net/r512x400_1462143045924.jpg",
            long_description: "Lather up with Prince & Spring Crystal Clear Liquid Hand Soap. Washes away germs and bacteria to leave your hands sparkling clean. Prince & Spring liquid hand soap formulas are not tested on animals.")

Item.create(title: "Men Degree",
            description: "Keeps you fresh and dry",
            price: "999",
            category_id: bath_and_body.id,
            image_path: "http://www.degreedeodorant.com/Images/3091/3091-982504-Single_Men_DRY%20PROTECTION%20COOL%20COMFORT_US.png",
            long_description: "A men's antiperspirant that offers 24-hour dry protection with an energizing burst of crisp, green arctic freshness.")

Item.create(title: "Nexxus",
            description: "Enriched and 100% pure.",
            price: "1799",
            category_id: bath_and_body.id,
            image_path: "https://malibubeautyjm.files.wordpress.com/2011/05/nexxus1.jpg",
            long_description: "THERAPPE Rebalancing Shampoo cleanses, while nourishing deep within. Follow with STEP 2 HUMECTRESS Restoring Conditioner to restore the protective barrier, revealing hair with real flexibility.")
