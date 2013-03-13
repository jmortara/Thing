//
//  View.m
//  Thing
//
//  Created by jason on 3/13/13.
//  Copyright (c) 2013 jfm. All rights reserved.
//

#import "View.h"
#import "Guy.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        
        screenW = self.bounds.size.width;
        screenH = self.bounds.size.height;
        guyW = 100;
        guyH = 20;
        lockedY = screenH - 70;
        
        CGRect f = CGRectMake(screenW/2 - guyW/2, lockedY, guyW, guyH);
        guy = [[Guy alloc] initWithFrame: f];
        [self addSubview: guy];
        
        guy.center = CGPointMake(screenW/2, lockedY);
        
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipe:)
                                                ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    NSLog(@"drawRect");
    
}


- (void) swipe: (UISwipeGestureRecognizer *) recognizer
{
    NSLog(@"swipe");
    
	if (recognizer.direction == UISwipeGestureRecognizerDirectionRight)
    {
		//[self animateGuyRight];
	}
    else if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft)
    {
		//[self animateGuyLeft];
	}
    
	for (NSUInteger i = 0; i < recognizer.numberOfTouches; ++i)
    {
		CGPoint p = [recognizer locationOfTouch: i inView: self];
	}
}


- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event
{
    NSLog(@"touchesEnded");
    
    if (touches.count > 0)
    {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
        [self animateGuyToX:point.x];
    }
}

- (void) animateGuyToX: (CGFloat) newX
{
    NSLog(@"animateGuyToX: %g", newX);
    
    [UIView animateWithDuration: 0.5
                          delay: 0.0
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         guy.center = CGPointMake(newX, lockedY);
                     }
                     completion: NULL
     ];
    
}

//unused
- (void) animateGuyRight
{
    NSLog(@"animateGuyRight");
    
    [UIView animateWithDuration: 0.5
                          delay: 0.0
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         guy.center = CGPointMake(guy.center.x + 50, lockedY);
                     }
                     completion: NULL
     ];
}

//unused
- (void) animateGuyLeft
{
    NSLog(@"animateGuyLeft");
    
    [UIView animateWithDuration: 0.5
                          delay: 0.0
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         guy.center = CGPointMake(guy.center.x - 50, lockedY);
                     }
                     completion: NULL
     ];
}


@end
