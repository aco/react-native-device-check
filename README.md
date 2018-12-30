# react-native-device-check
📱 Native bridge to the iOS DeviceCheck API

## Introduction
DeviceCheck helps identify a particular device (per development account) and authenticate a request's origin. Check out the [Apple Developer Doc](https://developer.apple.com/documentation/devicecheck) for more detail. This module returns the token in base64 ready for serialization.

The API was introduced in iOS 11 and requires a physical device, running on a lower target or simulator will throw an exception.

## Usage

Async/await:
```js
getDeviceToken = async () => {
  try {
    let token = await DeviceCheck.getDeviceToken();
  } catch (error) {
    console.log(error);
  }
}
```

Promise:
```js
getDeviceToken() {
  DeviceCheck.getDeviceToken().then(token =>
    //
  ).catch(err =>
    console.log(err)
  );
}
```

## License
MIT
