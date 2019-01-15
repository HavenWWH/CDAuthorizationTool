# CDAuthorizationTool


## Requirements
* Xcode 7 or higher
* iOS 8.0 or higher
* ARC

## Installation
CDLyricParser is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CDAuthorizationTool'
```

### 使用方法
```objc

[CDAuthorizationTool requestCameraAuthorization:^(CDAuthorizationStatus status) {

if (status == CDAuthorizationStatusAuthorized) {

} 

}];

```


## Contact
如果你发现bug，please pull reqeust me <br>
如果你有更好的改进，please pull reqeust me <br>
- Author：cqz
- Email： cqz@ttsing.com
- 微信群
<div>
<img src="/images/weixin.png" width = "182" height = "235" alt="微信群" />
</div>

## License

CDLyricParser is available under the MIT license. See the LICENSE file for more info.
