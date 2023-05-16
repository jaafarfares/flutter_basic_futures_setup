# geolocator_setup



## Test App 


The geolocator package in this Flutter code is used to retrieve the device's current location. It provides functions to check if location services are enabled, request location permission, and obtain the device's latitude and longitude coordinates.

The getposition() function first checks if location services are enabled by calling Geolocator.isLocationServiceEnabled(). If the services are disabled, an AwesomeDialog is displayed to notify the user.

Next, it checks the location permission status using Geolocator.checkPermission(). If the permission is denied, it requests permission by calling Geolocator.requestPermission(). If the permission is granted, it calls the getlongatti() function, which uses Geolocator.getCurrentPosition() to retrieve the current position as a Position object.

The getlongatti() function is an asynchronous function that returns a Future<Position>. It uses Geolocator.getCurrentPosition() to obtain the device's latitude and longitude coordinates.

In the build() method, when the "location" button is pressed, it awaits the result of the getlongatti() function and assigns the position to the correntlocation variable. The latitude and longitude values are then printed to the console.

Overall, the geolocator package enables the Flutter application to access the device's location by checking and requesting permissions, and retrieving latitude and longitude coordinates.


### Made by [Jaafar Fares](https://github.com/jaafarfares) for [Holberton School](https://www.holbertonschool.com/)

