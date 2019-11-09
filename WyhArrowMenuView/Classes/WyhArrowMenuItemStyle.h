//
//  WyhArrowMenuItemStyle.h
//  Arm
//
//  Created by Michael Wu on 2019/7/3.
//  Copyright © 2019 iTalkBB. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, WyhArrowMenuItemType) {
    
    WyhArrowMenuItemTypeIconAndText,
    WyhArrowMenuItemTypeTitleAndDetailText,
};


/**
 Actually, I don't want to interface this type for different items' base style,
 
 Otherwise, I want to interface an protocol to custom WyhArrowMenuItem , using it like <tableView delegate>.
 But ,UI be changing so fast such that I don't have enough time to do what I thought, so you can use it enum to change your item style temporary,
 
 @! Attention:
 itemLeftRightMargion、itemImageTextSpace will be disabled when type is WyhArrowMenuItemTypeTitleAndDetailText.
 */
@interface WyhArrowMenuItemStyle : NSObject

@property (nonatomic, assign) WyhArrowMenuItemType type;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detailText;

@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, assign) CGSize itemIconSize;

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *pressBackgroundColor;
@property (nonatomic, strong) UIColor *selectedBackgroundColor;

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *detailTextColor;

@property (nonatomic, strong) UIColor *pressTextColor;

@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, strong) UIFont *detailTextFont;

@property (nonatomic, assign) CGFloat itemLeftRightMargion;
@property (nonatomic, assign) CGFloat itemImageTextSpace;

@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat itemHeight;

- (CGSize)textSize;
- (CGSize)detailTextSize;

- (CGSize)itemSize;

@end

