//
//  ViewController.swift
//  Room
//
//  Created by Lakshmana Sattineedi on 12/11/17.
//  Copyright © 2017 swamy. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, MZCustomModalPresentViewControllerPresentationStyle) {
    MZCustomModalPresentViewControllerPartScreen,
    MZCustomModalPresentViewControllerFullScreen,
    MZCustomModalPresentViewControllerPopUp
};


@public @interface CustomModalPresentViewController : UIViewController

/**
 The animation duration
 The default value is 0.30
 */
@property (nonatomic, readwrite) CGFloat animationDuration;


/**
 The presentation style
 The default presentation style is MZCustomModalPresentViewControllerPartScreen(partial screen)
 */
@property (nonatomic, readwrite) MZCustomModalPresentViewControllerPresentationStyle currentPresentationStyle;
@property (nonatomic, readwrite) float partScreenPresentYPos;

- (id)initWithRootViewController:(UIViewController *)rootViewController;

@end
