//
//  AppDelegate.h
//  Thing
//
//  Created by jason on 3/13/13.
//  Copyright (c) 2013 jfm. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface AppDelegate: UIResponder <UIApplicationDelegate> {
    View *view;
    UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;
@end
