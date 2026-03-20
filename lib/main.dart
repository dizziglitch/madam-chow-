import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MadamChowApp());
}

// ===================== THEME =====================
class MadamChowApp extends StatelessWidget {
  const MadamChowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madam Chow Menu Master',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B1A1A),
          primary: const Color(0xFF8B1A1A),
        ),
        fontFamily: 'Georgia',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// ===================== COLORS =====================
const kCrimson = Color(0xFF8B1A1A);
const kGold = Color(0xFFC9A84C);
const kCream = Color(0xFFFAF6EF);
const kInk = Color(0xFF1A1209);
const kMuted = Color(0xFF7A6E60);
const kBorder = Color(0xFFE8DDD0);
const kGreen = Color(0xFF2D6A4F);

// ===================== DATA MODEL =====================
class MenuItem {
  final String name;
  final String cat;
  final String sub;
  final String desc;
  final String price;
  final int? kcal;
  final bool veg;
  final bool sig;
  final bool spicy;

  const MenuItem({
    required this.name,
    required this.cat,
    required this.sub,
    required this.desc,
    required this.price,
    this.kcal,
    this.veg = false,
    this.sig = false,
    this.spicy = false,
  });
}

// ===================== MENU DATA =====================
const List<MenuItem> kAllItems = [
  // DIMSUM - STEAMED
  MenuItem(name: 'Walk in the forest', cat: 'Dimsum', sub: 'Steamed', desc: 'Mélange of mushroom, spinach wrapper, true cream', price: '₹1050', kcal: 401, veg: true),
  MenuItem(name: 'Golden crown', cat: 'Dimsum', sub: 'Steamed', desc: 'Philadelphia cream cheese, garlic flakes, garlic chives', price: '₹1050', kcal: 655, veg: true),
  MenuItem(name: 'Fortune funguo', cat: 'Dimsum', sub: 'Steamed', desc: 'Hazelnut, morel, celery, carrot', price: '₹1050', kcal: 420, veg: true),
  MenuItem(name: 'Crimson tide', cat: 'Dimsum', sub: 'Steamed', desc: 'Quinoa, edamame, silken tofu, chilli jam', price: '₹1050', kcal: 371, veg: true),
  MenuItem(name: 'Napa Valley', cat: 'Dimsum', sub: 'Steamed', desc: 'Asparagus, babycorn, water chestnut, bird eye chilli', price: '₹1050', kcal: 376, veg: true),
  MenuItem(name: 'The whole truth', cat: 'Dimsum', sub: 'Steamed', desc: 'Baby bok choy, prawn, tobiko', price: '₹1350', kcal: 312),
  MenuItem(name: 'Hargao three Kingdoms', cat: 'Dimsum', sub: 'Steamed', desc: 'Shrimp, water chestnut', price: '₹1350', kcal: 358),
  MenuItem(name: 'Harmony', cat: 'Dimsum', sub: 'Steamed', desc: 'Chicken, prawn, green onions, wheat wrapper', price: '₹1350', kcal: 398),
  MenuItem(name: 'Orient tide', cat: 'Dimsum', sub: 'Steamed', desc: 'Blue pea flower, rock lobster, shaved truffle, asparagus', price: '₹1500', kcal: 416, sig: true),
  MenuItem(name: 'Mala medley', cat: 'Dimsum', sub: 'Steamed', desc: 'Sichuan chicken, pickled wood ear fungus', price: '₹1250', kcal: 334, spicy: true),
  MenuItem(name: 'Canton core', cat: 'Dimsum', sub: 'Steamed', desc: 'Chicken, pickled young ginger, garlic chives', price: '₹1250', kcal: 460),
  MenuItem(name: 'Xiaolongbao', cat: 'Dimsum', sub: 'Steamed', desc: 'Shanghainese pork soup dumpling, goji berry', price: '₹1500', kcal: 317, sig: true),
  // BAO
  MenuItem(name: 'Yumi bao', cat: 'Dimsum', sub: 'Bao', desc: 'Sweet corn, chilli, peppers, cream cheese', price: '₹1050', kcal: 432, veg: true),
  MenuItem(name: 'Volcano bao', cat: 'Dimsum', sub: 'Bao', desc: 'Barbeque chicken, ash bao, 24k gold', price: '₹1250', kcal: 410, sig: true),
  MenuItem(name: 'Sheng jian bao', cat: 'Dimsum', sub: 'Bao', desc: 'Sesame crust, pan seared pork buns, caramelized onion', price: '₹1500', kcal: 545),
  // BAKED & FRIED
  MenuItem(name: 'Green mountain', cat: 'Dimsum', sub: 'Baked & Fried', desc: 'Shiitake, carrot, pumpkin, truffle paste', price: '₹1150', kcal: 375, veg: true),
  MenuItem(name: 'Mao dou', cat: 'Dimsum', sub: 'Baked & Fried', desc: 'Edamame, Philadelphia cheese, truffle oil', price: '₹1150', kcal: 642, veg: true),
  MenuItem(name: 'Lychee Bonsai', cat: 'Dimsum', sub: 'Baked & Fried', desc: 'Shrimp, mozzarella, bubu arare', price: '₹1450', kcal: 492, sig: true),
  MenuItem(name: 'Dragon mountain', cat: 'Dimsum', sub: 'Baked & Fried', desc: 'Chicken, cha xiu sauce', price: '₹1350', kcal: 544),
  MenuItem(name: 'Wu gok', cat: 'Dimsum', sub: 'Baked & Fried', desc: '5 spiced chicken puff, shiitake, purple cabbage dust', price: '₹1350', kcal: 621),
  MenuItem(name: 'Swan', cat: 'Dimsum', sub: 'Baked & Fried', desc: 'Spiced chicken, black bean, water chestnut puff', price: '₹1350', kcal: 622),
  // CHEUNG FUN
  MenuItem(name: 'The dinosaur', cat: 'Dimsum', sub: 'Cheung Fun', desc: 'Daikon, wood ear fungus, signature rice paper', price: '₹1250', kcal: 532, veg: true),
  MenuItem(name: 'Ocean silk', cat: 'Dimsum', sub: 'Cheung Fun', desc: 'Prawn, garlic chives, baby bok choy', price: '₹1450', kcal: 608),
  MenuItem(name: 'Feather fire', cat: 'Dimsum', sub: 'Cheung Fun', desc: 'Chicken, shiitake, crushed chilli, Chinese parsley', price: '₹1350', kcal: 607, spicy: true),
  // SMALL PLATES
  MenuItem(name: 'Prosperity salad', cat: 'Small Plates', sub: 'Salads', desc: 'Hass avocado, jujube, goji berry, toasted sesame dressing', price: '₹1250', kcal: 520, veg: true, sig: true),
  MenuItem(name: 'Sichuan chicken salad', cat: 'Small Plates', sub: 'Salads', desc: 'Wood ear fungus, chilli threads, toasted peanuts', price: '₹1750', kcal: 427, spicy: true),
  MenuItem(name: 'Black truffle rolls', cat: 'Small Plates', sub: 'Appetizers', desc: 'Wild mushrooms, dried seaweed, creamy chilli sauce', price: '₹1350', kcal: 319, veg: true),
  MenuItem(name: 'Zepan village lotus root', cat: 'Small Plates', sub: 'Appetizers', desc: 'Honey, golden sesame and scallions', price: '₹1250', kcal: 300, veg: true),
  MenuItem(name: 'Soft shell crab nest', cat: 'Small Plates', sub: 'Appetizers', desc: 'Spiced egg floss, quail egg, black pepper sauce', price: '₹2250', kcal: 711, sig: true),
  MenuItem(name: 'Trio of tiger prawns', cat: 'Small Plates', sub: 'Appetizers', desc: 'Hot Sichuan, aromatic garlic pepper and creamy pumpkin sauce', price: '₹2250', kcal: 527, sig: true),
  MenuItem(name: 'Sichuan La Zi Ji chicken', cat: 'Small Plates', sub: 'Appetizers', desc: 'Fragrant spice, Sichuan peppercorn, crisp fried chilli', price: '₹1750', kcal: 769, spicy: true, sig: true),
  MenuItem(name: 'Pong Pong prawns', cat: 'Small Plates', sub: 'Appetizers', desc: 'Puffed up like a hot air balloon, plum garlic sauce', price: '₹2250', kcal: 442),
  MenuItem(name: 'Hunanese Mandarin lamb', cat: 'Small Plates', sub: 'Appetizers', desc: 'Star anise and Chinese citrus sauce, orange peel dust', price: '₹2000', kcal: 574),
  // SOUP
  MenuItem(name: 'Imperial Jade — Vegetables', cat: 'Soup', sub: 'Imperial Jade', desc: 'Baby spinach, sweet corn', price: '₹950', kcal: 128, veg: true),
  MenuItem(name: 'Imperial Jade — Chicken', cat: 'Soup', sub: 'Imperial Jade', desc: 'Baby spinach, chicken and egg drop', price: '₹1050', kcal: 270),
  MenuItem(name: 'Yin Yang — Vegetables', cat: 'Soup', sub: 'Yin Yang', desc: 'Fresh shiitake, silken tofu, chinkiang vinegar', price: '₹950', kcal: 160, veg: true),
  MenuItem(name: 'Yin Yang — Chicken', cat: 'Soup', sub: 'Yin Yang', desc: 'Shiitake, silken tofu, vinegar, chicken and egg drop', price: '₹1050', kcal: 300),
  MenuItem(name: 'Shangxi Fragrant — Chicken', cat: 'Soup', sub: 'Shangxi Fragrant', desc: 'Star anise broth, shredded chicken', price: '₹1050', kcal: 210),
  MenuItem(name: 'Shangxi Fragrant — Prawn', cat: 'Soup', sub: 'Shangxi Fragrant', desc: 'Star anise broth, poached prawn', price: '₹1150', kcal: 208),
  // ROAST & BBQ
  MenuItem(name: 'Roast Peking Duck (Half)', cat: 'Roast & BBQ', sub: 'Duck', desc: 'Mandarin pancakes, scallions, cucumber, plum sauce + duck broth + stir fried duck with jasmine rice', price: '₹4500', kcal: 812, sig: true),
  MenuItem(name: 'Roast Peking Duck (Full)', cat: 'Roast & BBQ', sub: 'Duck', desc: 'Full duck served in 3 glorious courses', price: '₹6500', sig: true),
  MenuItem(name: 'Imperial roast chicken', cat: 'Roast & BBQ', sub: 'Poultry', desc: 'Fried onion and Mala sauce', price: '₹2200', kcal: 650),
  MenuItem(name: 'Sizzling barbeque lamb chops', cat: 'Roast & BBQ', sub: 'Meat', desc: 'Sweet pepper sauce, pickled chillies', price: '₹3750', kcal: 617, sig: true),
  MenuItem(name: 'Char siu pork', cat: 'Roast & BBQ', sub: 'Meat', desc: 'Classic Cantonese style barbeque pork neck, pickled rainbow vegetables', price: '₹2500', kcal: 527),
  // MAINS - VEG
  MenuItem(name: 'Xiang La Tofu', cat: 'Main Course', sub: 'Vegetarian', desc: "Chef's take on a Sichuanese classic", price: '₹1900', kcal: 516, veg: true, spicy: true, sig: true),
  MenuItem(name: 'Wok tossed Chinese eggplant', cat: 'Main Course', sub: 'Vegetarian', desc: 'Oyster chilli sauce, Sichuan peppercorn', price: '₹1900', kcal: 353, veg: true, spicy: true),
  MenuItem(name: 'Broccoli, chestnuts and goji berries', cat: 'Main Course', sub: 'Vegetarian', desc: 'White garlic sauce', price: '₹1900', kcal: 347, veg: true),
  MenuItem(name: 'Filled silken tofu with Asian vegetables', cat: 'Main Course', sub: 'Vegetarian', desc: 'Garlic bean sauce', price: '₹1900', kcal: 349, veg: true),
  // MAINS - SEAFOOD
  MenuItem(name: 'Drunken lobster', cat: 'Main Course', sub: 'Fish & Seafood', desc: 'Narcissus rice wine, golden garlic broccoli', price: '₹4500', kcal: 493, sig: true),
  MenuItem(name: 'King scallops and green asparagus', cat: 'Main Course', sub: 'Fish & Seafood', desc: 'Shanghai sauce, white garlic flakes', price: '₹3550', kcal: 391),
  MenuItem(name: 'Cantonese steamed Chilean seabass', cat: 'Main Course', sub: 'Fish & Seafood', desc: 'Superior soy sauce, fresh coriander, banana chilli, young ginger', price: '₹4250', kcal: 382, sig: true),
  MenuItem(name: 'Wu xiang fen Barramundi', cat: 'Main Course', sub: 'Fish & Seafood', desc: 'House spice blend, Mala oil', price: '₹3050', kcal: 615),
  // MAINS - MEAT
  MenuItem(name: 'Shandong style roast chicken', cat: 'Main Course', sub: 'Meat & Poultry', desc: 'Crisp skin, black vinegar, maltose, fresh red chillies', price: '₹2250', kcal: 581, sig: true),
  MenuItem(name: 'Ding baozhen chicken', cat: 'Main Course', sub: 'Meat & Poultry', desc: 'Cashews, dried chillies, Sichuan peppercorns', price: '₹2250', kcal: 525, spicy: true),
  MenuItem(name: 'Lamb shanks hot pot', cat: 'Main Course', sub: 'Meat & Poultry', desc: 'Slow braised with shimeji mushrooms in a spiced broth, golden mantou buns', price: '₹3250', kcal: 578, sig: true),
  MenuItem(name: 'Twice cooked pork belly', cat: 'Main Course', sub: 'Meat & Poultry', desc: 'Black bean sauce', price: '₹3050', kcal: 540),
  MenuItem(name: 'Ruby pork', cat: 'Main Course', sub: 'Meat & Poultry', desc: 'Jiangsu style sweet and sour pork, pineapple', price: '₹3050', kcal: 511),
  MenuItem(name: 'Wok fried duck and leeks', cat: 'Main Course', sub: 'Meat & Poultry', desc: 'Ginger and leek sauce', price: '₹3000', kcal: 427),
  // ACCOMPANIMENTS
  MenuItem(name: 'Oriental seasonal greens', cat: 'Accompaniments', sub: 'Greens', desc: 'Smoked chilli and white garlic sauce', price: '₹1150', kcal: 343, veg: true),
  MenuItem(name: 'Hydroponic spinach and asparagus', cat: 'Accompaniments', sub: 'Greens', desc: 'Golden garlic sauce', price: '₹1150', kcal: 375, veg: true),
  MenuItem(name: 'Yang Zhou fried rice', cat: 'Accompaniments', sub: 'Rice', desc: 'Char siu pork, poached prawn', price: '₹2050', kcal: 662, sig: true),
  MenuItem(name: 'Stone pot Sichuan rice', cat: 'Accompaniments', sub: 'Rice', desc: 'Sizzled with Chinese wine, seasonal Chinese vegetables', price: '₹1600', kcal: 527, veg: true),
  MenuItem(name: 'Lanzhou udon noodles', cat: 'Accompaniments', sub: 'Noodles', desc: 'Flat wheat noodles from the noodle capital of China', price: '₹1600', kcal: 695, veg: true),
  MenuItem(name: 'Wat tan hor fun', cat: 'Accompaniments', sub: 'Noodles', desc: 'Silken rice noodles in golden garlic sauce', price: '₹1600', kcal: 512, veg: true),
  // DESSERTS
  MenuItem(name: "Jasmine tea 'mai lai go'", cat: 'Desserts', sub: 'Desserts', desc: 'Cantonese sponge cake, carnation milk, dehydrated rice crisp', price: '₹1200', kcal: 485),
  MenuItem(name: "Empress' flare", cat: 'Desserts', sub: 'Desserts', desc: 'Alphonso carnation milk, sago pearls, pomelo segments', price: '₹1200', kcal: 352, sig: true),
  MenuItem(name: 'Darsan', cat: 'Desserts', sub: 'Desserts', desc: "Chef's style honey noodles with Sichuan pepper ice cream", price: '₹1200', kcal: 472, sig: true),
  MenuItem(name: "The 'good luck' red candy", cat: 'Desserts', sub: 'Desserts', desc: 'Milk chocolate mousse, yuzu center, peanut rice crunch', price: '₹1200', kcal: 606, sig: true),
  MenuItem(name: 'Slow baked Chinese red date pudding', cat: 'Desserts', sub: 'Desserts', desc: 'Caramelized ginger ice cream, roasted walnuts, toffee sauce', price: '₹1200', kcal: 496),
  MenuItem(name: 'Sichuan peppercorn ice cream', cat: 'Desserts', sub: 'Ice Cream', desc: 'Homemade ice cream', price: '₹990', kcal: 98),
  MenuItem(name: 'Black sesame ice cream', cat: 'Desserts', sub: 'Ice Cream', desc: 'Homemade ice cream', price: '₹990', kcal: 115),
  // COCKTAILS
  MenuItem(name: 'Zenith', cat: 'Cocktails', sub: 'Signature', desc: 'Vodka, cucumber, ginger, sesame — earthy nuttiness with refreshing coolness', price: '₹1650'),
  MenuItem(name: 'Jade Hue', cat: 'Cocktails', sub: 'Signature', desc: 'Vodka, green juice, honey — lush greens vitality and balance', price: '₹1650'),
  MenuItem(name: 'Mandarin spice Old Fashioned', cat: 'Cocktails', sub: 'Signature', desc: 'Bourbon, mandarin orange, five spice infusion', price: '₹1650', sig: true),
  MenuItem(name: "Madam's Favourite", cat: 'Cocktails', sub: 'Signature', desc: 'Gin, rose tea, cardamom, coconut, cherry — good fortune', price: '₹1650', sig: true),
  MenuItem(name: 'Pearl of Fire', cat: 'Cocktails', sub: 'Signature', desc: 'Tequila, pineapple, jalapeño, Sichuan peppercorn — spicy finish', price: '₹1650', spicy: true),
  MenuItem(name: 'Emerald Bloom', cat: 'Cocktails', sub: 'Signature', desc: 'Lychee, basil, cucumber, five spice honey, tonic', price: '₹1650'),
  MenuItem(name: 'Mandarin Garden', cat: 'Cocktails', sub: 'Non-Alcoholic', desc: 'Mint, spiced citrus and ginger — bright, zesty, festive', price: '₹650', veg: true),
  // WINES
  MenuItem(name: 'Patrick Clerget Pouilly Fumé', cat: 'Wine by Glass', sub: 'White', desc: 'Sauvignon Blanc, Loire France — Citrus, green apple, gooseberry. Dry, high acidity', price: '₹2000'),
  MenuItem(name: 'Camas Sauvignon Blanc', cat: 'Wine by Glass', sub: 'White', desc: 'Pays d\'Oc France — Passion fruit, pineapple, citrus, fresh herbs', price: '₹1000'),
  MenuItem(name: 'Sula Zinfandel Rosé', cat: 'Wine by Glass', sub: 'Rosé', desc: 'Nashik India — Strawberry, raspberry, watermelon, rose petals. Off-dry', price: '₹1200'),
  MenuItem(name: 'Viña Tarapacá Cabernet Sauvignon', cat: 'Wine by Glass', sub: 'Red', desc: 'Maipo Chile — Blackcurrant, black cherry, plum. Full-bodied', price: '₹2000'),
  MenuItem(name: 'Brancott Estate Pinot Noir', cat: 'Wine by Glass', sub: 'Red', desc: 'Marlborough NZ — Red cherry, raspberry, cranberry, spice', price: '₹1900'),
  MenuItem(name: 'Campo Viejo Tempranillo', cat: 'Wine by Glass', sub: 'Red', desc: 'Rioja Spain — Red cherry, strawberry, plum, vanilla', price: '₹1500'),
  // CHAMPAGNE
  MenuItem(name: 'Moët & Chandon Brut', cat: 'Champagne', sub: 'Épernay', desc: 'The iconic house Brut — crisp, biscuity, elegant', price: '₹23,500'),
  MenuItem(name: 'Dom Pérignon Brut', cat: 'Champagne', sub: 'Reims', desc: '2013 Prestige cuvée — the pinnacle', price: '₹54,500', sig: true),
  MenuItem(name: 'Veuve Clicquot Brut', cat: 'Champagne', sub: 'Reims', desc: 'NV Yellow label icon', price: '₹20,000'),
  MenuItem(name: 'Chandon Brut Cuvée', cat: 'Champagne', sub: 'India', desc: 'NV — Nashik, India sparkling wine', price: '₹9,000'),
  // WHISKY
  MenuItem(name: 'The Macallan 18 YO', cat: 'Scotch Whisky', sub: 'Highland', desc: 'Double cask aged 18 years — rich dried fruit and vanilla', price: '₹8,500'),
  MenuItem(name: 'Glenmorangie Signet', cat: 'Scotch Whisky', sub: 'Highland', desc: 'Premium expression using chocolate malt', price: '₹4,000'),
  MenuItem(name: 'The Glenlivet 25 YO', cat: 'Scotch Whisky', sub: 'Speyside', desc: 'Ultra-premium aged expression', price: '₹9,000'),
  MenuItem(name: 'Glenfiddich 21 YO', cat: 'Scotch Whisky', sub: 'Speyside', desc: 'Caribbean rum cask finish', price: '₹4,450'),
  MenuItem(name: 'Lagavulin 16 YO', cat: 'Scotch Whisky', sub: 'Islay', desc: 'Peaty, smoky Islay classic', price: '₹4,250'),
  MenuItem(name: 'Johnnie Walker Blue Label', cat: 'Scotch Whisky', sub: 'Blended', desc: 'Ultra-premium blend', price: '₹3,250'),
  // COGNAC & OTHERS
  MenuItem(name: 'Rémy Martin Louis XIII', cat: 'Cognac & Others', sub: 'Cognac', desc: 'The pinnacle — 100-year-old blend in crystal decanter', price: '₹32,500'),
  MenuItem(name: 'Hennessy XO', cat: 'Cognac & Others', sub: 'Cognac', desc: 'XO expression — rich and complex', price: '₹3,950'),
  MenuItem(name: 'The Yamazaki 12 YO', cat: 'Cognac & Others', sub: 'Japanese Whisky', desc: "Japan's iconic single malt", price: '₹3,750'),
  MenuItem(name: 'Hibiki', cat: 'Cognac & Others', sub: 'Japanese Whisky', desc: "Suntory's elegant blended Japanese whisky", price: '₹2,750'),
  MenuItem(name: 'Campari', cat: 'Cognac & Others', sub: 'Aperitif', desc: 'Bitter Italian aperitivo — 60ml serve', price: '₹1,000'),
  // BEER & SPIRITS
  MenuItem(name: 'Kingfisher Premium', cat: 'Beer & Spirits', sub: 'Beer', desc: 'Indian lager — crisp and refreshing', price: '₹700'),
  MenuItem(name: 'Hoegaarden', cat: 'Beer & Spirits', sub: 'Beer', desc: 'Belgian white ale with coriander and orange peel', price: '₹900'),
  MenuItem(name: 'Beluga Gold', cat: 'Beer & Spirits', sub: 'Vodka', desc: 'Ultra-premium Russian vodka', price: '₹2,950'),
  MenuItem(name: 'Hendricks Flora Adora', cat: 'Beer & Spirits', sub: 'Gin', desc: 'Floral expression of Hendricks gin', price: '₹1,450'),
  MenuItem(name: 'Don Julio 1942', cat: 'Beer & Spirits', sub: 'Tequila', desc: 'Iconic aged añejo tequila', price: '₹5,200'),
  MenuItem(name: 'Bacardi Ocho 8 YO', cat: 'Beer & Spirits', sub: 'Rum', desc: 'Aged Cuban rum — complex and smooth', price: '₹1,150'),
  // SOFT DRINKS
  MenuItem(name: 'Kombucha — Stabilize', cat: 'Soft Drinks', sub: 'Kombucha', desc: 'Beetroot, moringa, Indian hibiscus', price: '₹600', veg: true),
  MenuItem(name: 'Kombucha — Immunity', cat: 'Soft Drinks', sub: 'Kombucha', desc: 'Mint, turmeric, Indian hibiscus', price: '₹600', veg: true),
  MenuItem(name: 'BLÅ | JASMINE Sparkling Tea', cat: 'Soft Drinks', sub: 'Copenhagen Tea', desc: 'Jasmine, chamomile and citrus with smooth white and green tea', price: '₹950', veg: true),
  MenuItem(name: 'LYSERØD | HIBISCUS Sparkling Tea', cat: 'Soft Drinks', sub: 'Copenhagen Tea', desc: 'Dry sparkling rose tea with red berry, apple and hibiscus', price: '₹950', veg: true),
  MenuItem(name: 'Red Bull', cat: 'Soft Drinks', sub: 'Others', desc: 'Energy drink 330ml', price: '₹375', veg: true),
  MenuItem(name: 'Perrier', cat: 'Soft Drinks', sub: 'Others', desc: 'Sparkling mineral water 330ml', price: '₹475', veg: true),
];

String catEmoji(String cat) {
  const map = {
    'Dimsum': '🥟',
    'Small Plates': '🥗',
    'Soup': '🍜',
    'Roast & BBQ': '🔥',
    'Main Course': '🍽️',
    'Accompaniments': '🍚',
    'Desserts': '🍮',
    'Cocktails': '🍹',
    'Wine by Glass': '🍷',
    'Champagne': '🥂',
    'Scotch Whisky': '🥃',
    'Cognac & Others': '🥃',
    'Beer & Spirits': '🍺',
    'Soft Drinks': '🫧',
  };
  return map[cat] ?? '•';
}

List<String> get allCategories =>
    kAllItems.map((i) => i.cat).toSet().toList();

// ===================== HOME SCREEN =====================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    BrowseScreen(),
    FlashcardScreen(),
    QuizScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCream,
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        indicatorColor: kCrimson.withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.menu_book_outlined), selectedIcon: Icon(Icons.menu_book, color: kCrimson), label: 'Browse'),
          NavigationDestination(icon: Icon(Icons.style_outlined), selectedIcon: Icon(Icons.style, color: kCrimson), label: 'Flashcards'),
          NavigationDestination(icon: Icon(Icons.quiz_outlined), selectedIcon: Icon(Icons.quiz, color: kCrimson), label: 'Quiz'),
        ],
      ),
    );
  }
}

// ===================== SHARED WIDGETS =====================
class AppHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AppHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        color: kCrimson,
        image: const DecorationImage(
          image: NetworkImage('https://www.transparenttextures.com/patterns/45-degree-fabric-light.png'),
          repeat: ImageRepeat.repeat,
          opacity: 0.05,
        ),
      ),
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 11,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final MenuItem item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: kInk)),
                const SizedBox(height: 4),
                if (item.desc.isNotEmpty)
                  Text(item.desc,
                      style: const TextStyle(color: kMuted, fontSize: 12, height: 1.4)),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 4,
                  children: [
                    if (item.veg) _badge('🌿 Veg', const Color(0xFFE8F5E9), kGreen),
                    if (item.sig) _badge('⭐ Signature', const Color(0xFFFFF3E0), Colors.orange.shade800),
                    if (item.spicy) _badge('🌶️ Spicy', const Color(0xFFFFEAEA), kCrimson),
                    if (item.kcal != null) _badge('${item.kcal} kcal', const Color(0xFFF5F5F5), kMuted),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(item.price,
              style: const TextStyle(
                  color: kCrimson,
                  fontWeight: FontWeight.w700,
                  fontSize: 14)),
        ],
      ),
    );
  }

  Widget _badge(String label, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: TextStyle(fontSize: 10, color: fg, fontWeight: FontWeight.w500)),
    );
  }
}

// ===================== BROWSE SCREEN =====================
class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  String _query = '';

  List<MenuItem> get _filtered => _query.isEmpty
      ? kAllItems
      : kAllItems
          .where((i) =>
              i.name.toLowerCase().contains(_query.toLowerCase()) ||
              i.desc.toLowerCase().contains(_query.toLowerCase()) ||
              i.cat.toLowerCase().contains(_query.toLowerCase()))
          .toList();

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;
    final Map<String, Map<String, List<MenuItem>>> grouped = {};
    for (final item in filtered) {
      grouped.putIfAbsent(item.cat, () => {});
      grouped[item.cat]!.putIfAbsent(item.sub, () => []);
      grouped[item.cat]![item.sub]!.add(item);
    }

    return Column(
      children: [
        const AppHeader(title: '🏮 Madam Chow', subtitle: 'MENU MASTER'),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            onChanged: (v) => setState(() => _query = v),
            decoration: InputDecoration(
              hintText: 'Search any dish or drink...',
              prefixIcon: const Icon(Icons.search, color: kMuted),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kBorder)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kBorder)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: kCrimson)),
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: grouped.entries.map((catEntry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 10),
                    child: Row(children: [
                      Text('${catEmoji(catEntry.key)} ${catEntry.key}',
                          style: const TextStyle(
                              fontFamily: 'Georgia',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: kCrimson)),
                    ]),
                  ),
                  ...catEntry.value.entries.map((subEntry) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (catEntry.value.length > 1)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(subEntry.key.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w600,
                                      color: kGold)),
                            ),
                          ...subEntry.value.map((item) => ItemCard(item: item)),
                        ],
                      )),
                  const Divider(color: kBorder, height: 24),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
// ===================== FLASHCARD SCREEN =====================
class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen>
    with SingleTickerProviderStateMixin {
  String? _selectedCat;
  late List<MenuItem> _deck;
  int _index = 0;
  bool _flipped = false;
  late AnimationController _flipController;
  late Animation<double> _flipAnim;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _flipAnim = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _flipController, curve: Curves.easeInOut));
    _loadDeck();
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void _loadDeck() {
    final pool = _selectedCat == null
        ? [...kAllItems]
        : kAllItems.where((i) => i.cat == _selectedCat).toList();
    pool.shuffle(Random());
    setState(() {
      _deck = pool;
      _index = 0;
      _flipped = false;
    });
    _flipController.reset();
  }

  void _flip() {
    if (_flipped) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() => _flipped = !_flipped);
  }

  void _next() {
    setState(() {
      _index = (_index + 1) % _deck.length;
      _flipped = false;
    });
    _flipController.reset();
  }

  void _prev() {
    setState(() {
      _index = (_index - 1 + _deck.length) % _deck.length;
      _flipped = false;
    });
    _flipController.reset();
  }

  @override
  Widget build(BuildContext context) {
    if (_deck.isEmpty) return const Center(child: Text('No items'));
    final item = _deck[_index];

    return Column(
      children: [
        const AppHeader(title: '🃏 Flashcards', subtitle: 'TAP CARD TO REVEAL'),
        // Category chips
        SizedBox(
          height: 52,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              _catChip('All', null),
              ...allCategories.map((c) => _catChip(c, c)),
            ],
          ),
        ),
        // Counter
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text('${_index + 1} / ${_deck.length}',
              style: const TextStyle(color: kMuted, fontSize: 13)),
        ),
        // Flashcard
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GestureDetector(
              onTap: _flip,
              child: AnimatedBuilder(
                animation: _flipAnim,
                builder: (context, child) {
                  final angle = _flipAnim.value * pi;
                  final isFront = angle < pi / 2;
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(angle),
                    child: isFront ? _frontCard(item) : _backCard(item),
                  );
                },
              ),
            ),
          ),
        ),
        // Navigation
        Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton.icon(
                onPressed: _prev,
                icon: const Icon(Icons.arrow_back, size: 18),
                label: const Text('Prev'),
                style: OutlinedButton.styleFrom(
                    foregroundColor: kCrimson,
                    side: const BorderSide(color: kBorder)),
              ),
              OutlinedButton.icon(
                onPressed: _next,
                icon: const Icon(Icons.arrow_forward, size: 18),
                label: const Text('Next'),
                style: OutlinedButton.styleFrom(
                    foregroundColor: kCrimson,
                    side: const BorderSide(color: kBorder)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _frontCard(MenuItem item) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kCrimson,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: kCrimson.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 8))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(catEmoji(item.cat), style: const TextStyle(fontSize: 40)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          Text('${item.cat} · ${item.sub}',
              style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 12, letterSpacing: 1)),
          const SizedBox(height: 20),
          Text('Tap to reveal →',
              style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 11)),
        ],
      ),
    );
  }

  Widget _backCard(MenuItem item) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotateY(pi),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kBorder, width: 1.5),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 20, offset: const Offset(0, 8))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('DETAILS', style: TextStyle(fontSize: 10, letterSpacing: 2, color: kMuted)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(item.desc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: kInk, fontSize: 15, height: 1.6)),
            ),
            const SizedBox(height: 20),
            Text(item.price,
                style: const TextStyle(color: kCrimson, fontSize: 22, fontWeight: FontWeight.bold)),
            if (item.kcal != null) ...[
              const SizedBox(height: 6),
              Text('${item.kcal} kcal',
                  style: const TextStyle(color: kMuted, fontSize: 12)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _catChip(String label, String? cat) {
    final selected = _selectedCat == cat;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedCat = cat);
        _loadDeck();
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? kCrimson : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? kCrimson : kBorder),
        ),
        child: Text(label,
            style: TextStyle(
                color: selected ? Colors.white : kMuted,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}

// ===================== QUIZ SCREEN =====================
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizState {
  final String question;
  final String hint;
  final String correct;
  final List<String> options;
  _QuizState({required this.question, required this.hint, required this.correct, required this.options});
}

class _QuizScreenState extends State<QuizScreen> {
  String? _selectedCat;
  List<_QuizState> _questions = [];
  int _index = 0;
  int _score = 0;
  String? _chosen;
  bool _started = false;
  bool _done = false;

  void _startQuiz() {
    final pool = _selectedCat == null
        ? [...kAllItems]
        : kAllItems.where((i) => i.cat == _selectedCat).toList();
    pool.shuffle(Random());
    final questions = <_QuizState>[];
    for (final item in pool.take(15)) {
      final q = _makeQuestion(item, pool);
      if (q != null) questions.add(q);
      if (questions.length >= 10) break;
    }
    setState(() {
      _questions = questions;
      _index = 0;
      _score = 0;
      _chosen = null;
      _started = true;
      _done = false;
    });
  }

  _QuizState? _makeQuestion(MenuItem item, List<MenuItem> pool) {
    final rand = Random();
    final type = rand.nextInt(3);
    if (type == 0) {
      // Which category?
      final wrongCats = pool.where((i) => i.cat != item.cat).map((i) => i.cat).toSet().toList()..shuffle();
      if (wrongCats.length < 3) return null;
      final opts = [item.cat, ...wrongCats.take(3)]..shuffle();
      return _QuizState(
          question: 'Which section of the menu is "${item.name}" found in?',
          hint: 'Think about where you\'d order this',
          correct: item.cat,
          options: opts);
    } else if (type == 1) {
      // Which dish matches this description?
      final samecat = pool.where((i) => i.cat == item.cat && i.name != item.name).toList()..shuffle();
      if (samecat.length < 3) return null;
      final opts = [item.name, ...samecat.take(3).map((i) => i.name)]..shuffle();
      return _QuizState(
          question: 'Which dish is described as:\n"${item.desc}"',
          hint: item.cat,
          correct: item.name,
          options: opts);
    } else {
      // What is the price?
      final wrongPrices = pool.where((i) => i.price != item.price).map((i) => i.price).toSet().toList()..shuffle();
      if (wrongPrices.length < 3) return null;
      final opts = [item.price, ...wrongPrices.take(3)]..shuffle();
      return _QuizState(
          question: 'How much does "${item.name}" cost?',
          hint: '${item.cat} · ${item.sub}',
          correct: item.price,
          options: opts);
    }
  }

  void _answer(String chosen) {
    if (_chosen != null) return;
    final isCorrect = chosen == _questions[_index].correct;
    setState(() {
      _chosen = chosen;
      if (isCorrect) _score++;
    });
  }

  void _next() {
    if (_index + 1 >= _questions.length) {
      setState(() => _done = true);
    } else {
      setState(() {
        _index++;
        _chosen = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppHeader(title: '🧠 Quiz Mode', subtitle: 'TEST YOUR KNOWLEDGE'),
        Expanded(
          child: !_started
              ? _buildSetup()
              : _done
                  ? _buildScore()
                  : _buildQuestion(),
        ),
      ],
    );
  }

  Widget _buildSetup() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Choose a category', style: TextStyle(fontFamily: 'Georgia', fontSize: 20, fontWeight: FontWeight.bold, color: kCrimson)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _catChip('🎯 All Categories', null),
              ...allCategories.map((c) => _catChip('${catEmoji(c)} $c', c)),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _startQuiz,
              style: ElevatedButton.styleFrom(
                  backgroundColor: kCrimson,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text('Start Quiz 🚀', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion() {
    final q = _questions[_index];
    final pct = _index / _questions.length;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Question ${_index + 1} / ${_questions.length}',
                  style: const TextStyle(color: kMuted, fontSize: 13)),
              Text('Score: $_score',
                  style: const TextStyle(color: kCrimson, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: pct,
            backgroundColor: kBorder,
            valueColor: const AlwaysStoppedAnimation(kGold),
            borderRadius: BorderRadius.circular(4),
            minHeight: 5,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: kBorder)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Icon(Icons.lightbulb_outline, color: kGold, size: 16),
                  const SizedBox(width: 6),
                  Text(q.hint, style: const TextStyle(color: kGold, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1)),
                ]),
                const SizedBox(height: 12),
                Text(q.question,
                    style: const TextStyle(fontFamily: 'Georgia', fontSize: 17, color: kInk, height: 1.5)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...q.options.map((opt) => _optionBtn(opt, q.correct)),
          if (_chosen != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: _chosen == q.correct
                    ? const Color(0xFFE8F5E9)
                    : const Color(0xFFFFEAEA),
                borderRadius: BorderRadius.circular(10),
                border: Border(
                  left: BorderSide(
                      color: _chosen == q.correct ? kGreen : kCrimson, width: 4),
                ),
              ),
              child: Text(
                _chosen == q.correct
                    ? '✅ Correct! Well done.'
                    : '❌ Not quite. Answer: ${q.correct}',
                style: TextStyle(
                    color: _chosen == q.correct ? kGreen : kCrimson,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _next,
                style: ElevatedButton.styleFrom(
                    backgroundColor: kCrimson,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                child: Text(_index + 1 < _questions.length ? 'Next Question →' : 'See Results 🏆'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _optionBtn(String opt, String correct) {
    Color borderColor = kBorder;
    Color bgColor = Colors.white;
    if (_chosen != null) {
      if (opt == correct) { borderColor = kGreen; bgColor = const Color(0xFFE8F5E9); }
      else if (opt == _chosen) { borderColor = kCrimson; bgColor = const Color(0xFFFFEAEA); }
    }
    return GestureDetector(
      onTap: () => _answer(opt),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor, width: 1.5)),
        child: Text(opt, style: const TextStyle(fontSize: 14, color: kInk, height: 1.4)),
      ),
    );
  }

  Widget _buildScore() {
    final pct = (_score / _questions.length * 100).round();
    String msg;
    if (pct >= 90) msg = '🏮 Madam Chow approves! You truly know this menu.';
    else if (pct >= 70) msg = '🥡 Very impressive! Nearly menu-certified.';
    else if (pct >= 50) msg = '🍜 Good start! A few more rounds and you\'ll master it.';
    else msg = '🔖 Keep practicing — the menu has many secrets to reveal.';

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_score/${_questions.length}',
                style: const TextStyle(fontFamily: 'Georgia', fontSize: 72, color: kCrimson, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('$pct% — Final Score',
                style: const TextStyle(color: kMuted, letterSpacing: 2, fontSize: 13)),
            const SizedBox(height: 20),
            Text(msg,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Georgia', fontSize: 17, fontStyle: FontStyle.italic, color: kInk, height: 1.5)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => setState(() { _started = false; _done = false; }),
              style: ElevatedButton.styleFrom(
                  backgroundColor: kCrimson,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text('Play Again 🔄', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _catChip(String label, String? cat) {
    final selected = _selectedCat == cat;
    return GestureDetector(
      onTap: () => setState(() => _selectedCat = cat),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? kCrimson : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: selected ? kCrimson : kBorder),
        ),
        child: Text(label,
            style: TextStyle(
                color: selected ? Colors.white : kMuted,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
