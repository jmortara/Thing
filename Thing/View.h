//
//  View.h
//  Thing
//
//  Created by jason on 3/13/13.
//  Copyright (c) 2013 jfm. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Guy;

@interface View : UIView
{
    int speed;
    CGFloat lockedY;
	CGFloat screenW;
	CGFloat screenH;
    CGFloat guyW;
    CGFloat guyH;
    CGPoint locationOfTouch;
    Guy *guy;
}


- (void) animateGuyRight;
- (void) animateGuyLeft;
- (void) animateGuyToX:(CGFloat) newX;

@end
