DCHideableSectionViewController
===============================

A UITableViewController subclass that can hide sections of a grouped table without displaying random padding where the section should be.

### Usage

First, make your UITableViewController a subclass of DCHideableSectionViewController.

```objective-c
#import <UIKit/UIKit.h>
#import "DCHideableSectionViewController.h"

@interface DCMainTableViewController : DCHideableSectionViewController

@end
```

Next, in your UITableViewController's viewDidLoad, set the two properties of the DCHideableSectionViewController that define the height of the header and footer views.

```objective-c```
    self.headerViewHeight = 33.0f;
    self.footerViewHeight = 0.0f;
```

That's it!
