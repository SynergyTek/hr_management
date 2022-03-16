Reference: https://pub.dev/packages/flutter_downloader

### pubspec.yaml:

Add the following packages' latest versions:

- flutter_downloader
- path_provider
- permission_handler

### Android Manifest xml file

- above the application tag:

```
    <!-- Permission for downloading via internet and accessing the device memory to read and write. -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

- under application tag:

```
    <!-- Code to enable on click from notification when download has completed. -->
    <provider
        android:name="vn.hunghd.flutterdownloader.DownloadedFileProvider"
        android:authorities="${applicationId}.flutter_downloader.provider"
        android:exported="false"
        android:grantUriPermissions="true">
        <meta-data
            android:name="android.support.FILE_PROVIDER_PATHS"
            android:resource="@xml/provider_paths"/>
    </provider>

    <!-- Configuration to manage maximum number of concurrent download tasks. -->
    <provider
        android:name="androidx.work.impl.WorkManagerInitializer"
        android:authorities="${applicationId}.workmanager-init"
        tools:node="remove" />
    <provider
        android:name="vn.hunghd.flutterdownloader.FlutterDownloaderInitializer"
        android:authorities="${applicationId}.flutter-downloader-init"
        android:exported="false">
        <!-- changes this number to configure the maximum number of concurrent tasks -->
        <meta-data
            android:name="vn.hunghd.flutterdownloader.MAX_CONCURRENT_TASKS"
            android:value="1" />
    </provider>
```

### main.dart:

```
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);
```
