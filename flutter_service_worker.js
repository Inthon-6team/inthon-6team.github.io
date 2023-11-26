'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"manifest.json": "a2dd5c91eb77b6c345a95c410b472875",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"version.json": "a4e31bfb27be8199a2232a39e9aa84ca",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "144a3353cd005950073901a030e3718c",
"/": "144a3353cd005950073901a030e3718c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"assets/FontManifest.json": "9c49814b6b741ca92df3dabf38086f5d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/NOTICES": "5b0bcadd73d313a41d2a971ed123f8d9",
"assets/AssetManifest.json": "037999373e7b39507228b58c691f8a0f",
"assets/AssetManifest.bin.json": "b9935af214efb10bdf4a125379a8d82e",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/assets/svg/add.svg": "737f9213d26b0f6ffee6b31c78abdc75",
"assets/assets/svg/profile.svg": "147c8ae5d230acd4dd95d38f770938d4",
"assets/assets/svg/click.svg": "b05b3d47308bd7dac7f770286532f5de",
"assets/assets/svg/pencil.svg": "fa151b9186cbbe4737dab88bf3fc1e96",
"assets/assets/svg/camera.svg": "ebd304fc64da73b7a586bf8634411147",
"assets/assets/images/story.png": "ebe3d1a6789a35d806138383deac1055",
"assets/assets/images/google_logo.png": "630a67b353f13216bc77aba9de624a5b",
"assets/assets/images/intro_unpressed.png": "c5ec0acf03ade6e71ffa07e8acf208f4",
"assets/assets/images/intro1.png": "5f612c5e52d38bb1dc6bc6e84ceae3bd",
"assets/assets/images/index2.png": "0887f64e1e4fa8862de9081cf3c305f7",
"assets/assets/images/alarm.png": "3b87c7c0dbe00d4d50e30a2655ad4ec7",
"assets/assets/images/intro3.png": "3c94ad087fab6bf918f211515ca5c97d",
"assets/assets/images/myPage.png": "57e61d7c0d22f7081dc528c44089b0db",
"assets/assets/images/family2.png": "b817022c71893029d3654f9522f5e05a",
"assets/assets/images/intro2.png": "b05ca9d40b92df742f676512b0c736aa",
"assets/assets/images/index1.png": "ff2ceeca0490a897ec685ebadfde1cd2",
"assets/assets/images/chatBox.png": "e40b1e316bbec5b36b4a10bc823c37e7",
"assets/assets/images/intro4.png": "727b2bc57caf21cd33e8a426fb50748a",
"assets/assets/images/inhome_logo.png": "970b3658be4a832db741570e3ed6eef7",
"assets/assets/images/family1.png": "7f73b4b71579536b6741893f3b21c55b",
"assets/assets/images/intro_pressed.png": "9a96bfbcb8195318555787286fbfce75",
"assets/assets/fonts/Poppins-Black.ttf": "14d00dab1f6802e787183ecab5cce85e",
"assets/assets/fonts/NanumSquareRoundL.ttf": "924b9ea5f0305f8dc6371fc4f12da37a",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/Poppins-SemiBold.ttf": "6f1520d107205975713ba09df778f93f",
"assets/assets/fonts/OFL.txt": "69045d03afdf61aeb37246af6001af9c",
"assets/assets/fonts/Poppins-ExtraLight.ttf": "6f8391bbdaeaa540388796c858dfd8ca",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Poppins-Thin.ttf": "9ec263601ee3fcd71763941207c9ad0d",
"assets/assets/fonts/Poppins-MediumItalic.ttf": "cf5ba39d9ac24652e25df8c291121506",
"assets/assets/fonts/NanumSquareRoundOTFEB.otf": "80d60e4eb529133db2d93250100760f5",
"assets/assets/fonts/NanumSquareRoundEB.ttf": "00f73012c2e65950de3d7fa2be640c95",
"assets/assets/fonts/Poppins-LightItalic.ttf": "0613c488cf7911af70db821bdd05dfc4",
"assets/assets/fonts/Poppins-ThinItalic.ttf": "01555d25092b213d2ea3a982123722c9",
"assets/assets/fonts/NanumSquareRoundOTFR.otf": "30caed9c2deb38480396e8ed892dc3cc",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"assets/assets/fonts/NanumSquareRoundOTFL.otf": "75662d6e584f51c83a805698c3de0f20",
"assets/assets/fonts/Poppins-BlackItalic.ttf": "e9c5c588e39d0765d30bcd6594734102",
"assets/assets/fonts/Poppins-Italic.ttf": "c1034239929f4651cc17d09ed3a28c69",
"assets/assets/fonts/NanumSquareRoundOTFB.otf": "d1b7d1fc8bfe4eccc8aeb7ff95bad663",
"assets/assets/fonts/Poppins-ExtraBold.ttf": "d45bdbc2d4a98c1ecb17821a1dbbd3a4",
"assets/assets/fonts/Poppins-ExtraLightItalic.ttf": "a9bed017984a258097841902b696a7a6",
"assets/assets/fonts/Poppins-Light.ttf": "fcc40ae9a542d001971e53eaed948410",
"assets/assets/fonts/Poppins-ExtraBoldItalic.ttf": "8afe4dc13b83b66fec0ea671419954cc",
"assets/assets/fonts/Poppins-SemiBoldItalic.ttf": "9841f3d906521f7479a5ba70612aa8c8",
"assets/assets/fonts/Poppins-BoldItalic.ttf": "19406f767addf00d2ea82cdc9ab104ce",
"assets/assets/fonts/NanumSquareRoundR.ttf": "4ba97a2a508f59611d45c41e7414ba66",
"assets/assets/fonts/NanumSquareRoundB.ttf": "ecc61bfabe0637e8367a734e718a4f8e",
"assets/AssetManifest.bin": "fdd329291a8743282af977aaf9010180",
"assets/fonts/MaterialIcons-Regular.otf": "c2c661def16d2c2a135fbfb594cf3baf",
"canvaskit/skwasm.wasm": "3dc7377060b01843eee7f4b43d1ea150",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js.symbols": "f4547f77f7e30fe3ed27bad64065449f",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/canvaskit.wasm": "028d34fce7142a2c2e614bfe2d38b3bf",
"canvaskit/canvaskit.js.symbols": "52699b49aa67316d1d5c41dbc6fcebab",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "15fc408f7ac36b0f8b3b59818f0bec81",
"canvaskit/chromium/canvaskit.js.symbols": "509750b12143dc83eb2ce94db3e803c7",
"main.dart.js": "5f30ffc1bd4323a377b934c3468d4307",
"firebase-messaging-sw.js": "d52c66142f443b022687ecec2605eca6"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
