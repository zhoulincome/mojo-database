//
//  RootViewController.h
//  indexpath
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 Hong XIing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
- (IBAction)buttonOnClick:(UIButton *)sender;


#pragma mark -模型转字典
+ (NSDictionary *)dictionaryWithModel:(id)model;

@end
