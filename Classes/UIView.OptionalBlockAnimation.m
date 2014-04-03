
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
        animations();
        completion(YES);
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
        animations();
        completion(YES);
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
        animations();
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
        animations();
        completion(YES);
    }
}

@end

