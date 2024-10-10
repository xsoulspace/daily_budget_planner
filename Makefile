gen-icons:
	fvm flutter pub run flutter_launcher_icons:main
build-web-prod:
	fvm flutter build web --csp --dart-define-from-file=configs/prod.json
build-rustore-prod:
	fvm flutter build apk --dart-define-from-file=configs/rustore_prod.json
build-rustore-local:
	fvm flutter build apk --dart-define-from-file=configs/rustore_local.json
build-google-prod:
	fvm flutter build appbundle --dart-define-from-file=configs/google_play_prod.json
