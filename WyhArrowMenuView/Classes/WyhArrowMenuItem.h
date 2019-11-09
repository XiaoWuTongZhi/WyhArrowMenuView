//
//  WyhArrowMenuItem.h
//  Arm
//
//  Created by Michael Wu on 2019/7/3.
//  Copyright © 2019 iTalkBB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WyhArrowMenuItemStyle, WyhArrowMenuItem;

@protocol WyhArrowMenuItemDelegate <NSObject>

- (void)arrowMenuItem:(WyhArrowMenuItem *)item didClickAtIndex:(NSInteger)index;

@end

@interface WyhArrowMenuItem : UIView

- (instancetype)initWithItemStyle:(WyhArrowMenuItemStyle *)style
                         delegate:(id<WyhArrowMenuItemDelegate>)delegate
                            index:(NSInteger)index
                     cornerRadius:(CGFloat)cornerRadius
                       isNeedLine:(BOOL)isNeedLine;

@end
