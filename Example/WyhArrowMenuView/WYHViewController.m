//
//  WYHViewController.m
//  WyhArrowMenuView
//
//  Created by 609223770@qq.com on 11/09/2019.
//  Copyright (c) 2019 609223770@qq.com. All rights reserved.
//

#import "WYHViewController.h"
#import <WyhArrowMenuAlert.h>

@interface WYHViewController ()

@end

@implementation WYHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)leftTop:(id)sender {
    
    [self alertWithTouchView:sender dir:(WyhArrowMenuViewDirectionLeftTop)];
}

- (IBAction)leftBottom:(id)sender {
    
    [self alertWithTouchView:sender dir:(WyhArrowMenuViewDirectionLeftBottom)];
    
}
- (IBAction)rightTop:(id)sender {
    
    [self alertWithTouchView:sender dir:(WyhArrowMenuViewDirectionRightTop)];
    
}
- (IBAction)rightBottom:(id)sender {
    
    [self alertWithTouchView:sender dir:(WyhArrowMenuViewDirectionRightBottom)];
}

#pragma mark - Getter

- (WyhArrowMenuAlert *)alertWithTouchView:(UIView *)view dir:(WyhArrowMenuViewDirection)direction{
    
    CGPoint point = CGPointMake(view.frame.origin.x + view.bounds.size.width*0.5, view.frame.origin.y + view.bounds.size.height*0.5);
    
    WyhArrowMenuAlertStyle *style = ({
        style = [[WyhArrowMenuAlertStyle alloc]init];
        style;
    });
    
    NSArray *items = ({
        NSMutableArray *arr = [NSMutableArray new];
        for (int i = 0; i < 5; i++) {
            WyhArrowMenuItemStyle *item = [[WyhArrowMenuItemStyle alloc]init];
            //            item.type = WyhArrowMenuItemTypeTitleAndDetailText;
            item.icon = [UIImage imageNamed:[NSString stringWithFormat:@"flag_%d",i]];
            item.title = [NSString stringWithFormat:@"flag %d",i];
            [arr addObject:item];
        }
        arr.copy;
    });
    
    return [WyhArrowMenuAlert showToast:style
                           items:items
                           point:point
                       direction:(direction)
                       superView:self.view
                          cancel:^{
                              
                              NSLog(@"Alert will dismiss ~");
                              
                          } itemClick:^(WyhArrowMenuItem *item, NSInteger index) {
                              
                              NSLog(@"You click on %zd",index);
                              
                          }];
}

@end
