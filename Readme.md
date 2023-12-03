# SDD Case Study

4 Case Study:
1. QRIS Payment App
2. Promo App
3. Chart Portofolio App
4. Firebase Push Notification App

## Tech Stack
- Architecture: Clean Swift - VIP [link](https://www.netguru.com/blog/clean-swift-ios-architecture-pattern)
- Charts: DGCharts [link](https://www.netguru.com/blog/clean-swift-ios-architecture-pattern)
- PushNotification: Firebase Cloud Messaging
- Cocoapods
- Modular Project


## Installation

Upon clone/fork
```bash
1. Setup Team and Push Notification Entitlements
2. Setup FCM from Google Console
3. Create .xcconfig and add your 'FCM_API_KEY'
```
Then
```bash
pod install
```

## 1. QRIS Payment App
- Can see balance
- Can scan QR
- Can confirm/make QR payment
- Can see payment history

[demo](https://drive.google.com/file/d/1ouYXLfBCxaAeUjeOTWL0EUG0CEn1LQfg/view?usp=sharing)

## 2. Promo App (X)
- Access promo API and Show Promo list.
- API error.

## 3. Chart Portofolio App
- Decode JSON file and show Charts
- Show Line Chart and Donut Chart
- Can select part of Donut Chart and see transaction detail.

[demo](https://drive.google.com/file/d/1NuBkaU94xKtZKP6w41clHACk0z1h6z0O/view?usp=sharing)

## 4. Firebase Push Notification App
- Receive and show Push Notification from FCM
- Can tap Push Notification and directs user to Detail Page by Deep Link.

[demo](https://drive.google.com/file/d/1Z1aTEA6a-uGxc5mJNldCew34UhZxCKBm/view?usp=sharing)