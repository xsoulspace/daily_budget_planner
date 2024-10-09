gen-rewrite:
	fvm flutter pub run build_runner build --delete-conflicting-outputs
gen:
	fvm flutter pub run build_runner build

build-apk-rustore-local:
	fvm flutter build apk --flavor prod --dart-define-from-file=configs/rustore_local.json --dart-define=STORE=rustore
build-apk-rustore-prod:
	fvm flutter build apk --flavor prod --dart-define-from-file=configs/rustore_prod.json --dart-define=STORE=rustore
