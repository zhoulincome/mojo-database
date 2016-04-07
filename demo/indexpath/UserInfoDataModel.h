//
//  UserInfoDataModel.h
//  indexpath
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 Hong XIing. All rights reserved.
//

#import "MojoModel.h"

@interface UserInfoDataModel : MojoModel

@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *phone;
@property (nonatomic,assign)uint age;
@property (nonatomic,assign)BOOL sex;
@property (nonatomic,copy)NSString *uid;

@end
