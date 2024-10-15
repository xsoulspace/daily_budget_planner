'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "14c528399576b56a190010836b57f9e1",
"version.json": "4df13384de3264eaf87f4153a1ef8ba6",
"index.html": "eafe87788dc58fea1c737f1e47c4e478",
"/": "eafe87788dc58fea1c737f1e47c4e478",
"styles.css": "227482c103195817eec30051b8877464",
"main.dart.js": "4e157db9d01b3532df9908d768db05a3",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "af88df2815837ce7fc6e827c7c2614a6",
"icons/Icon-192.png": "913174b7f671e5ed304e53a4020e5426",
"icons/Icon-maskable-192.png": "913174b7f671e5ed304e53a4020e5426",
"icons/Icon-maskable-512.png": "b7d9cb3ede40a9a70a5e93cf77153bfb",
"icons/Icon-512.png": "b7d9cb3ede40a9a70a5e93cf77153bfb",
"manifest.json": "f2a5ece5f2664f24bb9a134c4bd5a12d",
"assets/AssetManifest.json": "a0a8847af5f81c793e2f2beddab55bf2",
"assets/NOTICES": "ed7ff200db8b27948ec2276ac0bb27ad",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "cb59c5c3abc8b63acb7ff3bdc1f42793",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "d40b843dea5fca2bd9b3781f914ba99e",
"assets/packages/mobile_app/assets/images/paywalls/early_features_check.png": "947b6b8a17df59848f37e6ad85af764a",
"assets/packages/mobile_app/assets/images/paywalls/full_access_hands.png": "fb419c486fd0a9f01e0c540ab3ae2e87",
"assets/packages/mobile_app/assets/images/paywalls/ideas.png": "3ab53d45e5fd3a3af5749fa19c17ec23",
"assets/packages/mobile_app/assets/images/paywalls/open_source_hands.png": "c41eaa3678133748156e37749b60cad0",
"assets/packages/mobile_app/assets/images/paywalls/gold_snowflake.png": "8b1793cb3e5ede00ecc15e82dcaf5cae",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "9916877e4d296e6ec6ca158aeffe234d",
"assets/fonts/MaterialIcons-Regular.otf": "0ed4759cc92d437f2e6382f36298a343",
"assets/assets/google_fonts/NotoSans-Regular.ttf": "c8e58befd2433eb89589dd1d23225c4e",
"assets/assets/google_fonts/NotoSans-Medium.ttf": "09dc02dbe8133545806d275a2fec2ca7",
"assets/assets/google_fonts/NotoSans-MediumItalic.ttf": "56b26130ad737af823876161cbf59aac",
"assets/assets/google_fonts/NotoSans-Black.ttf": "45e579d4c5952595df0d5b0dfe75d53e",
"assets/assets/google_fonts/NotoSans-Bold.ttf": "ef4b39fb4d49db8beed2966debc0f477",
"assets/assets/google_fonts/NotoSans-Thin.ttf": "1cf299dc471a137219ca9570173f53a1",
"assets/assets/google_fonts/NotoSans-SemiBold.ttf": "dfad8b708bc7b6911ed49a6f35680b10",
"assets/assets/google_fonts/NotoSans-SemiBoldItalic.ttf": "57e2664158eac90f6a0a5de9b1291e63",
"assets/assets/google_fonts/OFL.txt": "2e3a777b99ade88bf4b23a103dabf96c",
"assets/assets/google_fonts/NotoSans-LightItalic.ttf": "5d9af1e34bdeb2efb70c6daab7cf0317",
"assets/assets/google_fonts/NotoSans-Light.ttf": "9f45a3e1e6aa474995ba423d6137e5c7",
"assets/assets/google_fonts/NotoSans-BoldItalic.ttf": "7b50b562b03b059512d9fd54573dca13",
"assets/assets/google_fonts/NotoSans-BlackItalic.ttf": "4da79193c9e346ea5877bf31ba3f94e0",
"assets/assets/google_fonts/NotoSans-ExtraBoldItalic.ttf": "21e246f744cf6c5826e93b410aca6d46",
"assets/assets/google_fonts/NotoSans-ExtraLight.ttf": "457f3e71429cfa0fb7fc7e79d2505389",
"assets/assets/google_fonts/NotoSans-ThinItalic.ttf": "25497ed489bcc742bbe91f27d2ad467c",
"assets/assets/google_fonts/NotoSans-ExtraLightItalic.ttf": "aa3d89b196996882493b38598b44f18f",
"assets/assets/google_fonts/NotoSans-ExtraBold.ttf": "d46a62701edeada8a839b0be13da8406",
"assets/assets/google_fonts/NotoSans-Italic.ttf": "2e8c77fbd2f734c19879c7e61f4f1cdd",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
