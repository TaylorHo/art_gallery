'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/audio/sound_interaction.mp3": "7e06c0c4c369d96d781a83fed3d3e412",
"assets/assets/audio/sound_bg.mp3": "e6f2adaaa3fa07968e6c4aaf21087c07",
"assets/assets/images/load.png": "ce440444ba825e8d6bfe917386c605eb",
"assets/assets/images/letter.png": "51f6b581624a9c6e2718845bea2fb936",
"assets/assets/images/sprites/recepcionista.png": "ff618c9c86fd8ecf8b9d165a689d071e",
"assets/assets/images/sprites/butterfly.png": "c8c2065fd5732d93d03966d61893b37a",
"assets/assets/images/sprites/emojis.png": "678e6fdcee301fab6c6dd7b8e5c80914",
"assets/assets/images/sprites/frog_2.png": "9ce4e663b50713ea9353a30f1f20a807",
"assets/assets/images/sprites/taylor.png": "f1cc87892b5967fbe33261a2cced305c",
"assets/assets/images/sprites/baloon_yellow.png": "f16e7a9acd93eb8d8a41375b184cf0f8",
"assets/assets/images/sprites/frog_1.png": "181c1b21a8bb9682dd003b7c537b3573",
"assets/assets/images/sprites/julia.png": "d750ba1ee84081eddfdb8d2fe41e1758",
"assets/assets/images/sprites/baloon_yellow.json": "cc16e317e15c3d20e304b5bd2a3e70b8",
"assets/assets/images/map/wall_borders.png": "d03e0ec9bc1f4340c190a5c484c060a3",
"assets/assets/images/map/water.json": "4af2d7a6333407869ee1f80ee8f1d6e5",
"assets/assets/images/map/hall_map.json": "dba9ddfec071cf51f49b27b3e84cc799",
"assets/assets/images/map/external_map.json": "ef30a0eb8f657cd763f98807185cab5b",
"assets/assets/images/map/final_room.json": "d777538eb50229331719eb449ed4575b",
"assets/assets/images/map/floor.json": "c5805e7ed6dc6b2bdcc7b26031a5c746",
"assets/assets/images/map/decoration/arrow.json": "dad6c27ba9d1c626f6fb941d7e8aa9ee",
"assets/assets/images/map/decoration/hospital.json": "2f2f57ad28f1c087e49341606a4ca4bf",
"assets/assets/images/map/decoration/arrow.png": "a64163b8dbbc7037f95c3a2d29527e36",
"assets/assets/images/map/decoration/museum.png": "0f9377f6012ac4ee01a044a4bfbfbf2b",
"assets/assets/images/map/decoration/hospital.png": "44257ee330c430ec34f0b9ecd8084aa9",
"assets/assets/images/map/decoration/museum.json": "082e14287f3d1236bf46b06a705b61d2",
"assets/assets/images/map/outdoors.png": "91daa37a5aca83270e471de3a9023025",
"assets/assets/images/map/walls.png": "768d3be8600ca1d3fecc2cacc3130a13",
"assets/assets/images/map/water.png": "5388e5530e90328a7eee442c0d75b83c",
"assets/assets/images/map/museum_room.json": "967dded806a2bb0963b1668be9185a9c",
"assets/assets/images/map/outdoors.json": "197906906856e2896345dd33e69be2ab",
"assets/assets/images/map/floor.png": "bb0dd236ad10730b56e973606f2ae4aa",
"assets/assets/images/map/wall_borders.json": "72bff0b2cebf16f7fed7ad13469ffc41",
"assets/assets/images/map/walls.json": "341542ff68815f8c3c5e7937aabc8378",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.json": "0c90791f390ef8c57c0da733e780e7ae",
"assets/NOTICES": "618eec4c289f54c5482c84139e5cf580",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"index.html": "97b63956acb7c111c92abb9201c43bd9",
"/": "97b63956acb7c111c92abb9201c43bd9",
"version.json": "38f6cf5cc849eaceee0d41d59a5368db",
"icons/Icon-maskable-192.png": "e64bb376dbf89e03793992100464cee1",
"icons/Icon-maskable-512.png": "33c6b6e7fdc46f76dec52c8f949a79a0",
"icons/cursor.png": "af342841e0c8d33188d924d98710cea1",
"icons/Icon-512.png": "33c6b6e7fdc46f76dec52c8f949a79a0",
"icons/Icon-192.png": "e64bb376dbf89e03793992100464cee1",
"main.dart.js": "35925ed995e4a29dc4299b96b3b8dfe6",
"favicon.png": "70bed4bd89513517cc5fbca89eba83b1",
"manifest.json": "818d8c3ad513e9d17b4f7e396b4d9053",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
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
