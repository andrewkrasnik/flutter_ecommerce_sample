'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "09610dc037d2f481ea2cfacde519a03a",
"assets/assets/fonts/metropolis/Metropolis-Bold.otf": "dea4998b081c6c1133a3b5b08ff2218c",
"assets/assets/fonts/metropolis/Metropolis-BoldItalic.otf": "15b149fc383c85f27360a5736fa6e50d",
"assets/assets/fonts/metropolis/Metropolis-ExtraBold.otf": "d7eaa8ab58ec03f16c8d08389711f553",
"assets/assets/fonts/metropolis/Metropolis-Regular.otf": "f7b5e589f88206b4bd5cb1408c5362e6",
"assets/assets/fonts/metropolis/Metropolis-RegularItalic.otf": "763b44257f3ad942e107551bff15b544",
"assets/assets/fonts/metropolis/Metropolis-SemiBold.otf": "2556a4f74e2c523893e6928d6e300f1c",
"assets/assets/icons/add_to_bag.png": "0025298f947df6b403d8100ea926a312",
"assets/assets/icons/arrow_right.png": "feeece6a02a4b081e9f9fab24835033a",
"assets/assets/icons/bag.png": "59491f0a55b3131c5845b61e49b4cc36",
"assets/assets/icons/bag_active.png": "59d1692f08e07729f584ecef09f6e6c0",
"assets/assets/icons/facebook.png": "baabf199ec54604ab43a236673dd50e0",
"assets/assets/icons/favorites.png": "9c3fad375cf388f99bb0064c4b454bc0",
"assets/assets/icons/favorites_active.png": "ed45ce5a116aea790aa6d867c88b3c1b",
"assets/assets/icons/filter.png": "c6b08af70590f68b957f3ae1455e5b78",
"assets/assets/icons/google.png": "c40cf68e7b88567d11bcbd04a93c6b8b",
"assets/assets/icons/home.png": "e5ad43522afbe4ddb163c7923de9b11f",
"assets/assets/icons/home_active.png": "3aa8e8be9cf7a7bd82a61a0b6857f254",
"assets/assets/icons/items.png": "ec105b33fae2b6394b5f68228353e6cd",
"assets/assets/icons/profile.png": "806188d47ee79cf1dcf7311d65bec308",
"assets/assets/icons/profile_active.png": "88f7e19e39c51e35d47944599642fb69",
"assets/assets/icons/shop.png": "3c2fe95a230b0c8ad91e96572cb65127",
"assets/assets/icons/shop_active.png": "121707f76dd77e7497b847cedf38e978",
"assets/assets/icons/sort.png": "cfc8591d58de4b08dc9573c0215aa5af",
"assets/assets/icons/tiles.png": "9e538b692e857fa9493fd26648a6ed17",
"assets/assets/images/bag/bags.png": "577cbb18e712f4870008c2176903b7bf",
"assets/assets/images/bag/dhl.png": "fabeef70bc75a44357322f1e858e1730",
"assets/assets/images/bag/fedex.png": "eefb7b252c71405cc58bb0862aae0c36",
"assets/assets/images/bag/mastercard.png": "1958189e3c780ad44fc257fc2c089df3",
"assets/assets/images/bag/mastercard_logo.png": "efbd2ca9415295d616f4eee75ed7994d",
"assets/assets/images/bag/promocode_2.png": "76e40d66e83d35196bb4b3a588396142",
"assets/assets/images/bag/success.png": "2f7c0952376fecf803feb1fff8b6c19d",
"assets/assets/images/bag/usps.png": "d8413b0d77573c829b5ac1951883f451",
"assets/assets/images/bag/visa_card.png": "527893c984d9dc626904a13411e07ab2",
"assets/assets/images/bag/visa_logo.png": "e47a70bf05ba24405fc4ac577da89a0d",
"assets/assets/images/categories/accesories.png": "680dc41fa6a23cbfe360a4c9e03a7121",
"assets/assets/images/categories/clothes.png": "7c81b2457e29924ec36690a983148e8d",
"assets/assets/images/categories/new.png": "8c19711a7dc100ccd03055e407384519",
"assets/assets/images/categories/shoes.png": "03ef75bc9d4bec6693cd72d7fcb740f6",
"assets/assets/images/main_page/big_banner.png": "50242ebc47736b0a33058c1be6e6fc66",
"assets/assets/images/main_page/black.png": "c2af6d80b430956a6396740d28171ce6",
"assets/assets/images/main_page/hoodies.png": "c3a811cea94a94e646ed60d4041f3af0",
"assets/assets/images/main_page/new_collection.png": "c5a0a95a13345f1dca0e20c386ed1a68",
"assets/assets/images/main_page/small_banner.png": "11f85071b08442744c43457fecf5c4ce",
"assets/assets/images/products/blouse.png": "21fd29238106ff9bf749d987cc4a7dbe",
"assets/assets/images/products/blouse_sale.png": "474efad6d9860331793af88cc6107204",
"assets/assets/images/products/evening_dress.png": "7aa87122f68a83fb75b85d4abaae4b96",
"assets/assets/images/products/longsleeve_favorites.png": "ac1fb5db042be180b416ae7eacb6be11",
"assets/assets/images/products/new_blouse.png": "86bfa2ee8d06f0ad4134fe316cb3b9f8",
"assets/assets/images/products/new_shirt.png": "e813140eba4aca1c20937b4374776fa6",
"assets/assets/images/products/pullover.png": "8b49eef02739a963c48352d8387dd7e1",
"assets/assets/images/products/shirt.png": "57dcdcbb78ee3f4f34d36e66f1849f3f",
"assets/assets/images/products/shirt_favorites.png": "67daff5a254cd808a82a5ea488c438ea",
"assets/assets/images/products/shirt_outofstock.png": "02c241dae0a295171df527cafb225ad1",
"assets/assets/images/products/short_black_dress_1.png": "2d46ed474cf506c043a6f60494c9ab0d",
"assets/assets/images/products/short_black_dress_2.png": "c87cb18b1a24e514b39bb90393a444c2",
"assets/assets/images/products/sport_dress.png": "d2ecd2f96c058229ccebf32c77f68abf",
"assets/assets/images/products/sport_dress_2.png": "0c488cd3a3f1486abfbb6b0be8b9df74",
"assets/assets/images/products/t-shirt.png": "fc6f83879f3f3786985c6720a471ed4d",
"assets/assets/images/products/t-shitt_spanish.png": "2d4b9b47ac2936614d0763e841681473",
"assets/assets/images/products/tshirt_favorites.png": "724c0059495f0a9c5633bc7a6d1f48ca",
"assets/assets/images/profile/avatar.png": "70bfa1da38a17ae404a2e4eb74dd8621",
"assets/assets/images/search_background.png": "173388a40313ead0510fb2c60866829a",
"assets/FontManifest.json": "9c28ddd1153fb2f80c9e30f48004362b",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "b0d0d8bfc3d13732b3c7025c0318137b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "2b73f6a11e22c808fb902ce87a38fa39",
"/": "2b73f6a11e22c808fb902ce87a38fa39",
"main.dart.js": "49a29804d23da9596431e74a9c57386f",
"manifest.json": "c32ef79bda8db908600d67f948e60213",
"version.json": "7a3bdb6636bc58f68740eb5457080e01"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
