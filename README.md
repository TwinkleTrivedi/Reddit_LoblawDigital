# Reddit_LoblawDigital
Reddit_LoblawDigital App
Loblaw Digital 
iOS Take home project 
As an iOS developer, we inherently love Swift- and part of keeping up with Apple is being in touch with  news as it breaks! We would like to task you with building a simple iOS application that will ingest 'Swift  News' JSON feed from Reddit, displaying the results in a table / collection view with the ability to tap  into the full article. 
The 'main' view should implement a tableView or collectionView that displays a list of the articles. If the  article contains a thumbnail image, we should display that image in the cell with the article title on top  of the image. If the article doesn't contain an image, just display the article title. The cells should size to  accommodate for the image, preserving aspect ratio. If the cell is just text, make sure to shrink the cell  to the size of the title. This 'main' view should be presented inside of a navigation controller, with the  title "Swift News". 
Once we can scroll a list of articles, we will want a way to display the full article in a new view. In the  case the article contains a thumbnail image, we'd like to show that image at the top of the article and  article body. If no thumbnail, just article body. There should also be a way to return to the 'main' view.  The navigation bar title should contain the article title. 
It's up to you how you'd like to architect the data source and models, but know you will be asked to  explain your decisions. We don't need you to over engineer a simple app, but design your classes to be  maintainable and readable. When you come in for an in-person interview we will ask you to build a new  feature or two on top of this codebase so having a solid foundation will definitely help later on. You are  free to use any 3rd party dependencies (Cocoapods etc.) but also be prepared to explain why! 
Acceptance Criteria: 
-This application should pull JSON data from the following: https://www.reddit.com/r/swift/.json -The data should be serialized into some kind of type safe object or objects 
-The 'main' view must pass the article 'object' in some way to the 'article view' 
-The app should be tested to run on a real iPhone / iPod device- meaning auto-layout works on different  size devices as intended and ATS set up correctly and safely 
-The codebase should be written entirely using Swift, build for iOS 12.x 
-You must upload your completed code to a public GitHub repository and send us the link! 
What we are looking for: 
-You are comfortable developing in Swift and are familiar with the iOS platform -You have experience using auto-layout as well as interfacing with the various UIKit controls -You use design patterns tastefully and can explain tradeoffs ie. pros and cons 
-You have an understanding of higher order functions and Swift specific paradigms -You know how to design a data source and make REST calls efficiently 
-You understand how to handle network errors or missing data (optional) 
-You have experience using source control
-You have experience designing architecture that is easily scaled and maintained

