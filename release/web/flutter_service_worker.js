'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "73aa7dee953b14f9d5f6e63c2ee6cbc4",
"index.html": "708737fd83d46d860133db060558d540",
"/": "708737fd83d46d860133db060558d540",
"main.dart.js": "7503c99de134f1b837bf8b769a7c03cd",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "865d699869babdbe3a48b45afb619e75",
"assets/AssetManifest.json": "cafbb0a70bf003fe218529722dde7e4e",
"assets/NOTICES": "e89db3844c8bd153d394bddaa704e503",
"assets/FontManifest.json": "329280abf9076497e2ea276d37738a5b",
"assets/packages/window_manager/images/ic_chrome_unmaximize.png": "4a90c1909cb74e8f0d35794e2f61d8bf",
"assets/packages/window_manager/images/ic_chrome_minimize.png": "4282cd84cb36edf2efb950ad9269ca62",
"assets/packages/window_manager/images/ic_chrome_maximize.png": "af7499d7657c8b69d23b85156b60298c",
"assets/packages/window_manager/images/ic_chrome_close.png": "75f4b8ab3608a05461a31fc18d6b47c2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/ui_kit/fonts/NotoSans-Regular.ttf": "ac08e269b7f479624b266c0ea20013b4",
"assets/packages/ui_kit/fonts/NotoSans-Medium.ttf": "f2197cc8a55ba75995cd38d00e8be599",
"assets/packages/ui_kit/fonts/IBMPlexSans-Medium.ttf": "ee83103a4a777209b0f759a4ff598066",
"assets/packages/ui_kit/fonts/NotoSans-Black.ttf": "bd5128e54a5262c4ceacd4a823dc2fc8",
"assets/packages/ui_kit/fonts/NotoSans-Bold.ttf": "8ac165243fb633296963b149f206a377",
"assets/packages/ui_kit/fonts/NotoSans-Thin.ttf": "80459ea7de432a2999dd0c3afa6fe747",
"assets/packages/ui_kit/fonts/NotoColorEmoji.ttf": "b0b162dbe8fe80adae4f553c67f812dc",
"assets/packages/ui_kit/fonts/NotoSans-SemiBold.ttf": "63bbc52e6ef89a5b1a50f1c9c4710d1b",
"assets/packages/ui_kit/fonts/IBMPlexSans-SemiBold.ttf": "1ca9107e7544d3424419585c7c84cb67",
"assets/packages/ui_kit/fonts/NotoSans-Light.ttf": "1853a578246d1b2182b73ee5fadd57b7",
"assets/packages/ui_kit/fonts/IBMPlexSans-ExtraLight.ttf": "dc4c7cbc44c833f9a7540a6464a015fa",
"assets/packages/ui_kit/fonts/IBMPlexSans-Thin.ttf": "969246a285e76a59329d5e003f1a28a0",
"assets/packages/ui_kit/fonts/NotoSans-ExtraLight.ttf": "2e7ecb3f8f24b1f0c331f76a405281e5",
"assets/packages/ui_kit/fonts/IBMPlexSans-Light.ttf": "29047654270fd882ab9e9ec10e28f7c5",
"assets/packages/ui_kit/fonts/IBMPlexSans-Regular.ttf": "c02b4dc6554c116e4c40f254889d5871",
"assets/packages/ui_kit/fonts/NotoSans-ExtraBold.ttf": "2cc6e79e65da29bd416f187ececac850",
"assets/packages/ui_kit/fonts/IBMPlexSans-Bold.ttf": "5159a5d89abe8bf68b09b569dbeccbc0",
"assets/packages/ui_kit/assets/json/special_emoji.json": "a47c59e387c2b94c9aec41940ee7690a",
"assets/packages/ui_kit/assets/json/updates_notifications.json": "e5e8e84d3c6fe5182105d7d9a23a9cb9",
"assets/packages/ui_kit/assets/json/emojis.json": "a987d3ce87eab5842b16a709c55b8452",
"assets/packages/ui_kit/assets/icons/vk_logo_white.svg": "0bfffef24e3efdcdaa72ed74291446e4",
"assets/packages/ui_kit/assets/icons/instagram_logo_black.png": "0e84d5926187e7a3b785febd3a55bf1d",
"assets/packages/ui_kit/assets/icons/instagram_logo_colorful.png": "afac8448aec704bc200f2201682cab1d",
"assets/packages/ui_kit/assets/icons/fb_logo_black.png": "6c4026e15399f60aac211c1a25fdd639",
"assets/packages/ui_kit/assets/icons/vk_logo_blue.svg": "6caeb44b369b1f795ae7f54e0c93a5e4",
"assets/packages/ui_kit/assets/icons/twitter_logo_black.svg": "7ea02ead698ec08221e2f79eb7be05af",
"assets/packages/ui_kit/assets/icons/discord_logo_white.svg": "145dc557845548a36a82337912ca3ac5",
"assets/packages/ui_kit/assets/icons/discord_logo_blue.svg": "3437c10597c1526c3dbd98c737c2bcae",
"assets/packages/ui_kit/assets/icons/logo_512.png": "aeff152814c020c3850eefa1ecc07d6f",
"assets/packages/ui_kit/assets/icons/logo_24.png": "80470217d51eb26600393fe2b5978a00",
"assets/packages/ui_kit/assets/icons/logo_300.png": "f33d1924cd5211e245b8704e372e6be9",
"assets/packages/ui_kit/assets/icons/logo_128.png": "284cc488405f72b961646d401cc316b7",
"assets/packages/ui_kit/assets/icons/logo_32.png": "3542b91e98205f7c567d0d6b147965f0",
"assets/packages/ui_kit/assets/icons/logo_16.png": "16e424e171d2abe7aaa2a68f2c66740c",
"assets/packages/ui_kit/assets/icons/vk_logo_black.svg": "fbf3b077472ced584c891620bec6fd65",
"assets/packages/ui_kit/assets/icons/logo.png": "479d556fb2eb36f25a63441f0e18ab75",
"assets/packages/ui_kit/assets/icons/fb_logo_white.png": "d651082e2134a2aad22e1db5b734942b",
"assets/packages/ui_kit/assets/icons/fb_logo_blue.png": "5d6ea38a769498dfc19fe6389d14db39",
"assets/packages/ui_kit/assets/icons/logo_1024.png": "e9e64361f5c8f766c9fbfa90fdc02491",
"assets/packages/ui_kit/assets/icons/idea.svg": "8411d4099a55bbf70ee17a9abfbe760b",
"assets/packages/ui_kit/assets/icons/logo_256.png": "c20d6aa6835172132af5ab3f48c977bb",
"assets/packages/ui_kit/assets/icons/discord_logo_black.svg": "2d20a45d79110dc5bf947137e9d99b66",
"assets/packages/ui_kit/assets/icons/twitter_logo_white.svg": "fb08dd7a2ba24fe54c0d2078375a5467",
"assets/packages/ui_kit/assets/icons/logo_1080.png": "8f5b2b37f8e8bebefc80746558e309d9",
"assets/packages/ui_kit/assets/icons/logo_48.png": "13244eda7664626702bb1f65a316acc2",
"assets/packages/ui_kit/assets/icons/logo_192.png": "934f771e6d8f388259f602dcbeb5aa23",
"assets/packages/ui_kit/assets/icons/twitter_logo_blue.svg": "5c23880d6c21f45e5e8581fde45a89a1",
"assets/packages/ui_kit/assets/icons/logo_64.png": "7ead2e6d1c0e59d9dca59679b9acb8f4",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.bin": "6af76cc68cb559ee8db9287aaaae99de",
"assets/fonts/MaterialIcons-Regular.otf": "837f0c7e2c621dd013143bfd754b46e5",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
