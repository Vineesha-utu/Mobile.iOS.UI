//
//  ViewController.swift
//  Room
//
//  Created by Lakshmana Sattineedi on 12/11/17.
//  Copyright © 2017 swamy. All rights reserved.
//

#import "CustomModalPresentViewController.h"
#import <QuartzCore/QuartzCore.h>

#define kLeading        20
#define kTrailing       20
#define kTop            100
#define kBottom         100
#define kCornerRadius   50.0

@interface CustomModalPresentViewController ()<UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UIViewController *rootViewController;
@property (nonatomic, strong) UIViewController *fromViewController;
@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, strong) UIView *leadingOverlayView;
@property (nonatomic, strong) UIView *trailingOverlayView;
@property (nonatomic, strong) UIView *topOverlayView;
@property (nonatomic, strong) UIView *bottomOverlayView;
@property (nonatomic, strong) UINavigationBar *contentNavBar;
@property (nonatomic, getter = isPresenting) BOOL presenting;

@end

@implementation CustomModalPresentViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    
    if (self = [super init]) {
        _rootViewController = rootViewController;
        _animationDuration = 0.30;
        _currentPresentationStyle = MZCustomModalPresentViewControllerPartScreen;
        _overlayView = [[UIView alloc]init];
        [self addTapGesture:_overlayView];
        [_overlayView setUserInteractionEnabled:YES];
        
        [self setModalPresentationStyle:UIModalPresentationCustom];
        [self setTransitioningDelegate:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.rootViewController willMoveToParentViewController:self];
    [self addChildViewController:self.rootViewController];
    [self.view addSubview:self.rootViewController.view];
    [self.rootViewController didMoveToParentViewController:self];
    [self.rootViewController.view setUserInteractionEnabled:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    if (_currentPresentationStyle == MZCustomModalPresentViewControllerPartScreen && self.rootViewController.view.frame.origin.y == 0) {
        for (UIView *view in self.rootViewController.view.subviews) {
            if ([view isKindOfClass:[UINavigationBar class]]) {
                _contentNavBar = (UINavigationBar *)view;
                [self addPanGesture:_contentNavBar];
                [self.contentNavBar setUserInteractionEnabled:YES];
                break;
            }
        }
        self.view.backgroundColor = [UIColor colorWithRed:30.0/255.0
                                                    green:30.0/255.0
                                                     blue:32.0/255.0
                                                    alpha:0.6];
        self.rootViewController.view.frame = CGRectMake(0, screenSize.height, screenSize.width, screenSize.height);
    }
    else if(_currentPresentationStyle == MZCustomModalPresentViewControllerFullScreen) {
        self.rootViewController.view.frame = CGRectMake(0, screenSize.height, screenSize.width, screenSize.height);
    }
    else if(_currentPresentationStyle == MZCustomModalPresentViewControllerPopUp) {
        
        self.view.backgroundColor = [UIColor colorWithRed:30.0/255.0
                                                    green:30.0/255.0
                                                     blue:32.0/255.0
                                                    alpha:0.6];
        
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        float width = screenSize.width - kLeading - kTrailing;
        float height = screenSize.height - kTop - kBottom;
        self.rootViewController.view.frame = CGRectMake(kLeading, screenSize.height, width, height);
        _leadingOverlayView = [self createOverLayView];
        _trailingOverlayView = [self createOverLayView];
        _topOverlayView = [self createOverLayView];
        _bottomOverlayView = [self createOverLayView];
    }
    [self updateNavBarStyle];
}

- (void)updateNavBarStyle {
    if (_contentNavBar) {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_contentNavBar.bounds
                                                       byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                             cornerRadii:CGSizeMake(kCornerRadius, kCornerRadius)];
        
        // Create the shape layer and set its path
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = _contentNavBar.bounds;
        maskLayer.path = maskPath.CGPath;
        _contentNavBar.layer.mask = maskLayer;
    
    }
}

- (UIView *)createOverLayView {
    UIView *overLayView = [[UIView alloc]init];
    [self addTapGesture:overLayView];
    [overLayView setUserInteractionEnabled:YES];
    return overLayView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//----------------------------------------------------------------------------------
#pragma mark - UIViewControllerTransitioningDelegate
//----------------------------------------------------------------------------------
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    _presenting = YES;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    _presenting = NO;
    return self;
}


//----------------------------------------------------------------------------------
#pragma mark - UIViewControllerAnimatedTransitioning
//----------------------------------------------------------------------------------

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return _animationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext  {
    
    if(self.isPresenting) {
        [self executePresentationAnimation:transitionContext];
    }
    else{
        [self executeDismissalAnimation:transitionContext];
    }
}

- (void)executePresentationAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext respondsToSelector:@selector(viewForKey:)] ? [transitionContext viewForKey:UITransitionContextFromViewKey] : fromViewController.view;
    UIView *toView = [transitionContext respondsToSelector:@selector(viewForKey:)] ? [transitionContext viewForKey:UITransitionContextToViewKey] : toViewController.view;

    [transitionContext.containerView addSubview:toView];
    [transitionContext.containerView addSubview:fromView];
    
    [toViewController beginAppearanceTransition:YES animated:YES];
    [fromViewController beginAppearanceTransition:NO animated:YES];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:0 animations:^{
        [self updatePresentationAnimationFrames];
        if (_currentPresentationStyle == MZCustomModalPresentViewControllerPartScreen) {
            [transitionContext.containerView addSubview:_overlayView];
        }
        else if(_currentPresentationStyle == MZCustomModalPresentViewControllerPopUp) {
            [transitionContext.containerView addSubview:_leadingOverlayView];
            [transitionContext.containerView addSubview:_trailingOverlayView];
            [transitionContext.containerView addSubview:_topOverlayView];
            [transitionContext.containerView addSubview:_bottomOverlayView];
        }
    } completion:^(BOOL finished) {
        [toViewController endAppearanceTransition];
        [fromViewController endAppearanceTransition];
        [transitionContext completeTransition:finished];
    }];
}

- (void)executeDismissalAnimation:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *fromView = [transitionContext respondsToSelector:@selector(viewForKey:)] ? [transitionContext viewForKey:UITransitionContextFromViewKey] : fromViewController.view;
    UIView *toView = [transitionContext respondsToSelector:@selector(viewForKey:)] ? [transitionContext viewForKey:UITransitionContextToViewKey] : toViewController.view;
    
    [transitionContext.containerView addSubview:fromView];
    [transitionContext.containerView addSubview:toView];
    
    [toViewController beginAppearanceTransition:YES animated:YES];
    [fromViewController beginAppearanceTransition:NO animated:YES];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:0 animations:^{
        CGRect frame = _rootViewController.view.frame;
        frame.origin.y = [UIScreen mainScreen].bounds.size.height;
        [_rootViewController.view setFrame:frame];
    } completion:^(BOOL finished) {
        [toViewController endAppearanceTransition];
        [fromViewController endAppearanceTransition];
        [transitionContext completeTransition:finished];
    }];
}

//------------------------------------------------------------------------------
#pragma mark Gesture Methods
//------------------------------------------------------------------------------
- (void)addTapGesture:(UIView *)view {
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(dismissModalViewController)];
    tapRecognizer.numberOfTapsRequired = 1;
    [view addGestureRecognizer:tapRecognizer];
}

- (void)addPanGesture:(UIView *)view {
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(onPanGesture:)];
    [view addGestureRecognizer:panGesture];
}

//----------------------------------------------------------------------------------
#pragma mark - Gesture Actions
//----------------------------------------------------------------------------------
- (void)dismissModalViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onPanGesture:(UIPanGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        [self moveView:recognizer];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded ||
             recognizer.state == UIGestureRecognizerStateCancelled) {
        if (_rootViewController.view.frame.origin.y + _contentNavBar.frame.size.height >= [UIScreen mainScreen].bounds.size.height) {
            [self dismissModalViewController];
        }
    }
}

//----------------------------------------------------------------------------------
#pragma mark - Update Frames
//----------------------------------------------------------------------------------
- (void)updatePresentationAnimationFrames {
    if (_currentPresentationStyle == MZCustomModalPresentViewControllerPartScreen) {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        if (_partScreenPresentYPos == 0.0) {
            _partScreenPresentYPos = screenSize.height/2;
        }
        float yPos = _partScreenPresentYPos;
        float height = screenSize.height - yPos;
        self.rootViewController.view.frame = CGRectMake(0, yPos, screenSize.width, height);
        float overlayViewHeight = self.rootViewController.view.frame.origin.y;
        _overlayView.frame = CGRectMake(0, 0, screenSize.width, overlayViewHeight);
    }
    else if(_currentPresentationStyle == MZCustomModalPresentViewControllerFullScreen) {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        float minY;
        if ([UIApplication sharedApplication].isStatusBarHidden) {
            minY = 0;
        }
        else {
            minY = [UIApplication sharedApplication].statusBarFrame.size.height;
        }
        
        float yPos = minY;
        float height = screenSize.height - yPos;
        self.rootViewController.view.frame = CGRectMake(0, yPos, screenSize.width, height);
    }
    else if(_currentPresentationStyle == MZCustomModalPresentViewControllerPopUp) {
        CGSize screenSize = [[UIScreen mainScreen] bounds].size;
        float width = screenSize.width - kLeading - kTrailing;
        float height = screenSize.height - kTop - kBottom;
        self.rootViewController.view.frame = CGRectMake(kLeading, kTop, width, height);
        
        CGRect rootViewFrame = self.rootViewController.view.frame;
        
        CGRect leadingOverLayViewFrame = CGRectZero;
        leadingOverLayViewFrame.origin.x = 0;
        leadingOverLayViewFrame.origin.y = rootViewFrame.origin.y;
        leadingOverLayViewFrame.size.width = kLeading;
        leadingOverLayViewFrame.size.height = rootViewFrame.size.height;
        _leadingOverlayView.frame = leadingOverLayViewFrame;
        
        CGRect trailingOverLayViewFrame = CGRectZero;
        trailingOverLayViewFrame.origin.x = rootViewFrame.origin.x + rootViewFrame.size.width;
        trailingOverLayViewFrame.origin.y = rootViewFrame.origin.y;
        trailingOverLayViewFrame.size.width = kTrailing;
        trailingOverLayViewFrame.size.height = rootViewFrame.size.height;
        _trailingOverlayView.frame = trailingOverLayViewFrame;
        
        
        CGRect topOverLayViewFrame = CGRectZero;
        topOverLayViewFrame.origin.x = 0;
        topOverLayViewFrame.origin.y = 0;
        topOverLayViewFrame.size.width = screenSize.width;
        topOverLayViewFrame.size.height = kTop;
        _topOverlayView.frame = topOverLayViewFrame;
        
        CGRect bottomOverLayViewFrame = CGRectZero;
        bottomOverLayViewFrame.origin.x = 0;
        bottomOverLayViewFrame.origin.y = rootViewFrame.origin.y + rootViewFrame.size.height;
        bottomOverLayViewFrame.size.width = screenSize.width;
        bottomOverLayViewFrame.size.height = kBottom;
        _bottomOverlayView.frame = bottomOverLayViewFrame;
    }
}

- (void)moveView:(UIPanGestureRecognizer *)recognizer {
    UIView *draggableView = self.rootViewController.view;
    CGPoint translation = [recognizer translationInView:[draggableView superview]];
    CGPoint newPoint = CGPointMake([draggableView center].x ,
                                   [draggableView center].y + translation.y);
    [draggableView setCenter:newPoint];
    [recognizer setTranslation:CGPointZero inView:[draggableView superview]];
    
    CGRect rootViewFrame = _rootViewController.view.frame;
    float minY;
    if ([UIApplication sharedApplication].isStatusBarHidden) {
        minY = 0;
    }
    else {
        minY = [UIApplication sharedApplication].statusBarFrame.size.height;
    }
    if (rootViewFrame.origin.y <= minY) {
        rootViewFrame.origin.y = minY;
    }
    
    rootViewFrame.size.height = [UIScreen mainScreen].bounds.size.height - rootViewFrame.origin.y;
    _rootViewController.view.frame = rootViewFrame;
    
    CGRect overlayViewFrame = _overlayView.frame;
    overlayViewFrame.size.height = self.rootViewController.view.frame.origin.y;
    _overlayView.frame = overlayViewFrame;
}

@end
