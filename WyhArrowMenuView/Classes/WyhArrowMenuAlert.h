//
//  WyhArrowMenuAlert.h
//  Arm
//
//  Created by Michael Wu on 2019/7/3.
//  Copyright © 2019 iTalkBB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WyhArrowMenuItemStyle.h"
#import "WyhArrowMenuItem.h"
#import "WyhArrowMenuAlertStyle.h"

typedef NS_ENUM(NSUInteger, WyhArrowMenuViewDirection) {
    WyhArrowMenuViewDirectionLeftTop ,
    WyhArrowMenuViewDirectionCenterTop,
    WyhArrowMenuViewDirectionRightTop,
    
    WyhArrowMenuViewDirectionLeftBottom ,
    WyhArrowMenuViewDirectionCenterBottom,
    WyhArrowMenuViewDirectionRightBottom,
    
};

typedef void(^WyhArrowMenuAlertItemClickBlock)(WyhArrowMenuItem *item, NSInteger index);
typedef void(^WyhArrowMenuAlertCancelBlock)(void);


@interface WyhArrowMenuAlert : UIView

@property (nonatomic, assign, readonly) BOOL isAppear;

+ (instancetype)showToast:(WyhArrowMenuAlertStyle *)style
                    items:(NSArray<WyhArrowMenuItemStyle *>*)items
                    point:(CGPoint)point
                direction:(WyhArrowMenuViewDirection)direction
                superView:(UIView *)superView
                   cancel:(WyhArrowMenuAlertCancelBlock)cancelClosure
                itemClick:(WyhArrowMenuAlertItemClickBlock)clickClosure;

- (instancetype)initWitWyhtyle:(WyhArrowMenuAlertStyle *)style
                        items:(NSArray<WyhArrowMenuItemStyle *>*)items
                        point:(CGPoint)point
                    direction:(WyhArrowMenuViewDirection)direction
                    superView:(UIView *)superView
                       cancel:(WyhArrowMenuAlertCancelBlock)cancelClosure
                    itemClick:(WyhArrowMenuAlertItemClickBlock)clickClosure;

- (void)show;



@end
