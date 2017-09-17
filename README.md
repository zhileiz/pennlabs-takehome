# Penn Mobile Dining - PennLabs TakeHome

## File Explanation
### Models
##### Venue
* Represent a dining hall or a retail dining place.
* Has ```name``` for name, ```type``` to indicate whether it is a retail or a residential dining, ```id``` for reference, ```facilityUrl``` for detail views, and ```imageName``` to access image in the assets folder.
* No information of "openning/closing" status is stored in Venue class, as will be stored in ```Services/StatusInfo```.
### Views
##### CustomViewCell
* Is the cell for the Main UI.
* autolayout done in code with [SnapKit](http://snapkit.io/docs/).
### Controllers
##### ViewController
* Contains a tableView to display the main UI, and is initial ViewController.
* Initiates asynchronous call to API to fetch JSON, which will be processed in ```Services/StatusInfo".
* Has segue to ```DetailsController``` to display webView for ```facilityUrl```.
##### DetailsController
* Contains webView for ```facilityUrl```.
* Has loading indicator for webView.
* Checks internet connectivity, and display alert information if disconnected.
### Services
##### VenuesInfo
* Static info about Dining places.
* Does not contain information about "openning/closing" status.
##### StatusInfo
* Keeps a dictionary of current-day dining availablities.
* Processes JSON fetched by the ViewController and updates the dictionary.

## 3rd-Party Libraries
##### [SnapKit](https://github.com/SnapKit/SnapKit) - DSL to make Auto Layout
##### [Alamofire](https://github.com/Alamofire/Alamofire) - HTTP networking library written in Swift
##### [SwiftyJson](https://github.com/SwiftyJSON/SwiftyJSON) - makes it easy to deal with JSON data in Swift
##### [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView)- a collection of awesome loading animation
##### [Hue](https://github.com/hyperoslo/Hue) - all-in-one coloring utility
