#!/bin/bash

# Define the path to the AndroidManifest.xml file
MANIFEST_PATH="android/app/src/main/AndroidManifest.xml"

# Check if the AndroidManifest.xml file exists
if [ ! -f "$MANIFEST_PATH" ]; then
    echo "Error: AndroidManifest.xml not found at $MANIFEST_PATH"
    exit 1
fi

# Define the scheme to be added
read -p "Enter your app's scheme (e.g., ru.package.name.rustore.scheme): " APP_SCHEME

# Define the content to be added
INTENT_FILTER="
        <intent-filter>
            <action android:name=\"android.intent.action.VIEW\"/>
            <category android:name=\"android.intent.category.DEFAULT\"/>
            <category android:name=\"android.intent.category.BROWSABLE\"/>
            <data android:scheme=\"$APP_SCHEME\"/>
        </intent-filter>"

# Check if the intent-filter already exists
if grep -q "$APP_SCHEME" "$MANIFEST_PATH"; then
    echo "The scheme $APP_SCHEME is already present in the AndroidManifest.xml"
    exit 0
fi

# Add the intent-filter to the AndroidManifest.xml
sed -i "/<activity/,/<\/activity>/ {
    /<\/activity>/i\\$INTENT_FILTER
}" "$MANIFEST_PATH"

echo "RuStore Android scheme has been added to AndroidManifest.xml"

# Reminder for the user
echo "
Remember to initialize RuStore Billing in your Dart code:

// Usage:
final AbstractPurchaseManager purchaseManager = FlutterRustoreBillingManager();
await purchaseManager.init();
"

echo "Script completed successfully!"