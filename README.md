# OptionalBlockAnimation
A convenient extension to block animation

[![Version](http://cocoapod-badges.herokuapp.com/v/OptionalBlockAnimation/badge.png)](http://cocoadocs.org/docsets/OptionalBlockAnimation)
[![Platform](http://cocoapod-badges.herokuapp.com/p/OptionalBlockAnimation/badge.png)](http://cocoadocs.org/docsets/OptionalBlockAnimation)

## The Problem

How many times have you written code like this?

```
- (void)viewWillAppear:(BOOL)animated
{
	if (animated)
	{
		[UIView animateWithDuration:0.25 animations:^
		{
			// Some manipulation
		} completion:^
		{
			// Some completion action
		}]
	}
	else
	{
		// The SAME manipulation
		// The SAME completion action
	}
}
```

Perhaps, like me, you've made the transition to doing this in a _slightly_ neater way.

```
- (void)viewWillAppear:(BOOL)animated
{
	
	void (^animations)() = ^
	{
		// Some manipulation
	};
	
	void (^completion)(BOOL) = ^void(BOOL didFinish)
	{
		// Some completion action
	};
	
	if (animated)
	{
		[UIView animateWithDuration:0.25 animations:animations completion:completion];
	}
	else
	{
		animations();
		completion(YES);
	}
}
```

## The Solution

Well, maybe it's more of a workaround than a solution, but it sure makes the problem a lot neater.

```
- (void)viewWillAppear:(BOOL)animated
{
	[UIView OBA_animate:animated withDuration:0.25 animations:^
	{
		// Some manipulation
	} 
	completion:^void(BOOL didFinish)
	{
		// Some completion action
	}];
}
```

All but one class method from `UIView (UIViewAnimationWithBlocks)` have been extended to include `animate` as a boolean argument.

- If `animate` is `YES` then you can expect the same behaviour as calling the ordinary method.
- If `animate` is `NO`, then the animations and completion blocks are called just like the second example above. 

There are some minor variations for some calls, so feel free to peruse the code. As usual, pull requests are welcome.

## Addendum: Why Not Zero Duration?

Several helpful friends on Twitter asked why not use this approach:

```
- (void)viewWillAppear:(BOOL)animated
{
	[UIView animateWithDuration:animated ? 0.0 : 0.25 animations:^
	{
		// Some manipulation
	} 
	completion:^void(BOOL didFinish)
	{
		// Some completion action
	}];
}
```

At first, this seemed like a much cleaner answer to the problem, but when I tested it, the fact that the animation block is not executed immediately when requesting _no animation_ can cause flicker or incorrect UI to display. 

I use this class a lot in `viewWillAppear:` and when not animating, I want the view to be configured and ready for display __before__ it appears on screen. If the zero duration approach is used, the animations block will be run too late.

Thanks to [@shaps](https://twitter.com/shaps), [@merowing_](https://twitter.com/merowing_), [@myell0w](https://twitter.com/myell0w), [@iMartinKiss](https://twitter.com/iMartinKiss) and [@orta](https://twitter.com/orta) for their input!

## Requirements

- UIKit

## Installation

OptionalBlockAnimation is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "OptionalBlockAnimation"

## Author

Adam Iredale, [@iosengineer on Twitter](https://twitter.com/iosengineer)

## License

OptionalBlockAnimation is available under the MIT license. See the LICENSE file for more info.
