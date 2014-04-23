//
//  UIView+OptionalBlockAnimation.m
//
//  Created by Adam Iredale on 28/03/2014.
//  Copyright (c) 2014 Bionic Monocle Pty Ltd. All rights reserved.
//

#import "UIView+OptionalBlockAnimation.h"

@implementation UIView (OBA_OptionalBlockAnimation)

+ (void)OBA_animate:(BOOL)animated withDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
{
    if (animated)
    {
        [self animateWithDuration:duration delay:delay options:options animations:animations completion:completion];
    }
    else
    {
        if (animations)
        {
            animations();
        }
        
        if (completion)
        {
            completion(YES);
        }
    }
}

+ (void)OBA_animate:(BOOL)animated withDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
{
    if (animated)
    {
        [self animateWithDuration:duration animations:animations completion:completion];
    }
    else
    {
        if (animations)
        {
            animations();
        }
        
        if (completion)
        {
            completion(YES);
        }
    }
}

+ (void)OBA_animate:(BOOL)animated withDuration:(NSTimeInterval)duration animations:(void (^)(void))animations
{
    if (animated)
    {
        [self animateWithDuration:duration animations:animations];
    }
    else
    {
        if (animations)
        {
            animations();
        }
    }
}

+ (void)OBA_animate:(BOOL)animated withDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion
{
    if (animated)
    {
        [self animateWithDuration:duration delay:delay usingSpringWithDamping:dampingRatio initialSpringVelocity:velocity options:options animations:animations completion:completion];
    }
    else
    {
        if (animations)
        {
            animations();
        }
        
        if (completion)
        {
            completion(YES);
        }
    }
}

+ (void)OBA_transition:(BOOL)animated withView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(4_0)
{
    if (animated)
    {
        [self transitionWithView:view duration:duration options:options animations:animations completion:completion];
    }
    else
    {
        if (animations)
        {
            animations();
        }
        
        if (completion)
        {
            completion(YES);
        }
    }
}

+ (void)OBA_transition:(BOOL)animated fromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(4_0)
{
    if (animated)
    {
        [self transitionFromView:fromView toView:toView duration:duration options:options completion:completion];
    }
    else
    {
        if (options & UIViewAnimationOptionShowHideTransitionViews)
        {
            // Just hide and show
            [fromView setHidden:YES];
            [toView setHidden:NO];
        }
        else
        {
            // Add and remove
            [fromView.superview addSubview:toView];
            [fromView removeFromSuperview];
        }

        if (completion)
        {
            completion(YES);
        }
    }
}

//+ (void)OBA_performSystemAnimation:(BOOL)animated animation:(UISystemAnimation)animation onViews:(NSArray *)views options:(UIViewAnimationOptions)options animations:(void (^)(void))parallelAnimations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(7_0)
//{
//    
//}


@end

