# sms-transform
A basic XSLT transform for converting the output of the Microsoft "Contacts+Message Backup" app into 
the format required by the "SMS Backup &amp; Restore" android app so that you can migrate your SMS 
messages from Windows Phone to Android.

There's a bunch of assumptions baked into this transform so just use it as a starting point for your 
migration from windows phone to android. For example:
* I assume that all messages are SMS.
* I assume that the sent and received times for inbound messages are the same.

The steps I took to export from Windows Phone 8.1 to Android 5.x were:

* Migrate contacts from windows phone to android (easy as they were all associated with gmail/outlook cloud accounts) - used outlook app to get outlook contacts.
* Install "Contacts+Message Backup" app on Windows Phone: https://www.microsoft.com/en-nz/store/apps/contacts-message-backup/9nblgggz57gm
* Install "SMS Backup &amp; Restore" on Android phone.
* Opened the windows phone app (from the settings screen) & exported SMS to a local folder
* Applied XSLT (I used visual studio but I'm sure there's loads of tools that can do this)
* Copied output to android phone
* Ran the Android app and restored from the file



