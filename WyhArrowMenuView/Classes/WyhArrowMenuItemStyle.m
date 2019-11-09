//
//  WyhArrowMenuItemStyle.m
//  Arm
//
//  Created by Michael Wu on 2019/7/3.
//  Copyright © 2019 iTalkBB. All rights reserved.
//

#define kMaxMenuWidth 200
#define kMaxDetailTextWidth 50

#define kRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "WyhArrowMenuItemStyle.h"

@implementation WyhArrowMenuItemStyle

- (instancetype)init {
    if (self = [super init]) {
        
        _type = WyhArrowMenuItemTypeIconAndText;
        
        _icon = nil;
        _title = nil;
        _backgroundColor = [UIColor whiteColor];
        _pressBackgroundColor = kRGBHex(0xfafafa);
        
        _textFont = [UIFont systemFontOfSize:15.f];
        _detailTextFont = [UIFont systemFontOfSize:14.f];
        _textColor = kRGBHex(0x000000);
        _detailTextColor = kRGBHex(0x000000);
        _pressTextColor = [UIColor lightGrayColor];        
        
        _itemLeftRightMargion = 15.f;
        _itemImageTextSpace = 10.f;
        
        _itemHeight = 42.f;
        _itemWidth = 150.f;
        
        _itemIconSize = CGSizeMake(25.f, 25.f);
    }
    return self;
}

- (CGSize)textSize {
    CGSize textSize = [_title boundingRectWithSize:CGSizeMake(kMaxMenuWidth, _itemHeight)
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:@{
                                                     NSForegroundColorAttributeName:_textColor,
                                                     NSFontAttributeName:_textFont,
                                                     }
                                           context:nil].size;
    return textSize;
}

- (CGSize)detailTextSize {
    
    NSMutableParagraphStyle * paragrapWyhtyle = [[NSMutableParagraphStyle alloc] init];
    paragrapWyhtyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragrapWyhtyle.alignment = NSTextAlignmentRight;
    
    CGSize textSize = [_detailText boundingRectWithSize:CGSizeMake(kMaxDetailTextWidth, _itemHeight)
                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:@{
                                                     NSForegroundColorAttributeName:_detailTextColor,
                                                     NSFontAttributeName:_detailTextFont,
                                                     NSParagraphStyleAttributeName:paragrapWyhtyle,
                                                     }
                                           context:nil].size;
    return textSize;
}

- (CGSize)itemSize {
    
    CGFloat width = 0.f;
    
    if (_type == WyhArrowMenuItemTypeIconAndText) {
        width = _itemLeftRightMargion*2 + _itemImageTextSpace + self.textSize.width + _itemIconSize.width;
    }else {
        width = _itemWidth;
    }
    
    return CGSizeMake(width, _itemHeight);
}

@end
