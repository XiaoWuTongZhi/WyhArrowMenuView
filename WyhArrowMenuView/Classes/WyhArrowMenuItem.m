//
//  WyhArrowMenuItem.m
//  Arm
//
//  Created by Michael Wu on 2019/7/3.
//  Copyright © 2019 iTalkBB. All rights reserved.
//

#import "WyhArrowMenuItem.h"
#import "WyhArrowMenuItemStyle.h"

#define kRGBHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


typedef NS_ENUM(NSUInteger, MenuItemTouchType) {
    MenuItemTouchTypeNormal,
    MenuItemTouchTypeHighlight,
    
};


static BOOL IfContainTouchPoint(UIEvent *event, UIView *target) {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:target];
    
    return CGRectContainsPoint(target.bounds, location);
}

@interface WyhArrowMenuItem ()

@property (nonatomic, weak) id<WyhArrowMenuItemDelegate> delegate;

@property (nonatomic, assign) MenuItemTouchType currentTouchType;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, strong) WyhArrowMenuItemStyle *style;

@property (nonatomic, assign) BOOL isNeedLine;

@property (nonatomic, assign) CGFloat cornerRadius;

@property (nonatomic, strong) UIColor *currentTextColor;
@property (nonatomic, strong) UIColor *currentBackgroundColor;

@end

@implementation WyhArrowMenuItem

- (instancetype)initWithItemStyle:(WyhArrowMenuItemStyle *)style delegate:(id<WyhArrowMenuItemDelegate>)delegate index:(NSInteger)index cornerRadius:(CGFloat)cornerRadius isNeedLine:(BOOL)isNeedLine {
    
    if (self = [super initWithFrame:CGRectMake(0, 0, style.itemSize.width, style.itemSize.height)]) {
        
        NSParameterAssert(style);
        
        _delegate = delegate;
        _cornerRadius = cornerRadius;
        _style = style;
        _index = index;
        _currentTouchType = MenuItemTouchTypeNormal;
        
        // initialize
        _currentBackgroundColor = _style.backgroundColor;
        _currentTextColor = _style.textColor;
        
        _isNeedLine = isNeedLine;
        
        self.clipsToBounds = YES;
        self.layer.cornerRadius = cornerRadius;
        
        [self setNeedsDisplay];

    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    [self private_drawRect:rect contextHandler:^(CGContextRef context) {
        
        [_currentBackgroundColor setStroke];
        [_currentBackgroundColor setFill];
        
        // square
        UIBezierPath *squarePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,0,self.bounds.size.width,self.bounds.size.height) cornerRadius:_cornerRadius];
//        UIBezierPath *squarePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,0,self.bounds.size.width,self.bounds.size.height) byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(_cornerRadius, 0)];
        
        [squarePath stroke];
        [squarePath fill];
        
        
        switch (_style.type) {
            case WyhArrowMenuItemTypeIconAndText:
            {
                // icon
                CGRect iconFrame = CGRectMake(_style.itemLeftRightMargion, (_style.itemHeight-_style.itemIconSize.height)*0.5, _style.itemIconSize.width, _style.itemIconSize.height);
                [_style.icon drawInRect:iconFrame];
                
                // text
                CGRect textFrame = CGRectMake(_style.itemLeftRightMargion+_style.itemIconSize.width+_style.itemImageTextSpace, (_style.itemHeight-_style.textSize.height)*0.5, _style.textSize.width, _style.textSize.height);
                [_style.title drawInRect:textFrame withAttributes:@{
                                                                    NSForegroundColorAttributeName:_currentTextColor,
                                                                    NSFontAttributeName:_style.textFont,
                                                                    }];
                // line
                CGFloat lineHeight = 1.f;
                [kRGBHex(0xededed) setStroke];
                CGContextSetLineWidth(context, lineHeight);
                if (_isNeedLine) {
                    CGPoint pointLeft = CGPointMake(_style.itemLeftRightMargion + _style.itemIconSize.width + _style.itemImageTextSpace, self.bounds.size.height); //lineHeight*0.5
                    CGPoint pointRight = CGPointMake(self.bounds.size.width, pointLeft.y);
                    
                    CGContextMoveToPoint(context, pointLeft.x, pointLeft.y);
                    CGContextAddLineToPoint(context, pointRight.x, pointRight.y);
                    CGContextStrokePath(context);
                }
            }
                break;
            case WyhArrowMenuItemTypeTitleAndDetailText:
            {
                CGFloat margion = 10.f;

                // title
                CGRect textFrame = CGRectMake(margion, (_style.itemHeight-_style.textSize.height)*0.5, _style.textSize.width, _style.textSize.height);
                [_style.title drawInRect:textFrame withAttributes:@{
                                                                    NSForegroundColorAttributeName:_currentTextColor,
                                                                    NSFontAttributeName:_style.textFont,
                                                                    }];
                
                // detail text
                CGRect detailTextFrame = CGRectMake(_style.itemWidth - _style.detailTextSize.width - margion, (_style.itemHeight-_style.detailTextSize.height)*0.5, _style.detailTextSize.width, _style.detailTextSize.height);
                
                NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
                paragraphStyle.alignment = NSTextAlignmentRight;
                
                [_style.detailText drawInRect:detailTextFrame withAttributes:@{
                                                                               NSForegroundColorAttributeName:_style.detailTextColor,
                                                                               NSFontAttributeName:_style.detailTextFont,
                                                                               NSParagraphStyleAttributeName:paragraphStyle,
                                                                               }];
                
                // line
                CGFloat lineHeight = 1.f;
                [kRGBHex(0xededed) setStroke];
                CGContextSetLineWidth(context, lineHeight);
                if (_isNeedLine) {
                    CGPoint pointLeft = CGPointMake(margion, self.bounds.size.height); //lineHeight*0.5
                    CGPoint pointRight = CGPointMake(self.bounds.size.width - margion, pointLeft.y);
                    
                    CGContextMoveToPoint(context, pointLeft.x, pointLeft.y);
                    CGContextAddLineToPoint(context, pointRight.x, pointRight.y);
                    CGContextStrokePath(context);
                }
            }
                break;
            default:
                break;
        }
        
        
        
    }];
    
}

- (void)private_drawRect:(CGRect)rect contextHandler:(void(^)(CGContextRef context))contextHandler {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextBeginPath(context);
    
    contextHandler(context);
    
//    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}


- (void)changeUI:(MenuItemTouchType)touchType {
    
    if (_currentTouchType == touchType) {
        return;
    }
    _currentTouchType = touchType;
    
    switch (touchType) {
        case MenuItemTouchTypeNormal:
        {
            _currentBackgroundColor = _style.backgroundColor;
            _currentTextColor = _style.textColor;
        }
            break;
        case MenuItemTouchTypeHighlight:
        {
            _currentBackgroundColor = _style.pressBackgroundColor;
            _currentTextColor = _style.pressTextColor;
        }
            break;
        default:
            break;
    }
    [self setNeedsDisplay];
}

#pragma mark - Touch Status

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [super touchesBegan:touches withEvent:event];
    [self changeUI:(MenuItemTouchTypeHighlight)];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [super touchesEnded:touches withEvent:event];
    
    BOOL shouldResponse = IfContainTouchPoint(event, self);
    if (shouldResponse) {
        // click index
        if ([self.delegate respondsToSelector:@selector(arrowMenuItem:didClickAtIndex:)]) {
            [self.delegate arrowMenuItem:self didClickAtIndex:_index];
        }
        [self changeUI:(MenuItemTouchTypeNormal)];
    } else {
        
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesMoved:touches withEvent:event];
    
    BOOL shouldResponse = IfContainTouchPoint(event, self);
    if (shouldResponse) {
        
        [self changeUI:(MenuItemTouchTypeHighlight)];
    } else {
        [self changeUI:MenuItemTouchTypeNormal];
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [super touchesCancelled:touches withEvent:event];
    [self changeUI:MenuItemTouchTypeNormal];
}



@end
