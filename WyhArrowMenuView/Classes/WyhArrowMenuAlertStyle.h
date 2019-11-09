//
//  WyhArrowMenuAlertStyle.h
//  Arm
//
//  Created by Michael Wu on 2019/7/3.
//  Copyright © 2019 iTalkBB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WyhArrowMenuAlertStyle : NSObject

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, assign) BOOL showSeparateLine;

@property (nonatomic, strong) UIColor *lineColor;

@property (nonatomic, assign) CGSize triangleSize;

@property (nonatomic, assign) CGFloat triangleLeftMargion;

@property (nonatomic, assign) BOOL enableShadow;//!< default is YES

@property (nonatomic, assign) CGFloat cornerRadius;//!< default is 5.f

@end
