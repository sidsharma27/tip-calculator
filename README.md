# Pre-work - TipEm

TipEm is a tip calculator application for iOS.

Submitted by: Sidharth (Sid) Sharma 

Time spent: 5-6 hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations 
* [X] Remembering the bill amount across app restarts (if <10mins) <- did not implement the time factor
* [ ] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='https://github.com/sidsharma27/tip-calculator/blob/master/tipCalcDemo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

I *really* like the iOS platform. I've been exposed to Swift before and it's a really great language as the readibility is easy but is very powerful. Xcode is an awesome IDE with a clean/lean approach which makes the deveelopers job much easier. Storyboards help developers also get a decent looking UI going with no prior design experience which is really thoughtful. In my own words, I would describe outlets and actions to another developer by talking about the MVC pattern. The C(ontroller) and the V(iew) need to communicate with one another to functionality to the app. When you link a specific element to view controller, you can link it as an outlet and change the value/properties of the element and reflect the change to the user. When you link a specific element as an action, it actually runs the code within everytime the action (button click for example) is performed like a function. After diving deeper into the storyboard, it seems that the outlets/actions are being implemented in XML. They each have a unique identifier and a destination. The actions also have an event type which reflects which event is being listened for (valueChanged in this case).

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

Classes & closures are both reference types in Swift. If you assign a closure to a property of the class instance and the body of the closure captures the instance (by accessing a property of the instance class self), it will create a strong reference cycle because the instance class and closure are keeping each other alive.

## License

Copyright 2017 Sidharth Sharma

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
