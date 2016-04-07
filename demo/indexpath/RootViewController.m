//
//  RootViewController.m
//  indexpath
//
//  Created by apple on 16/4/6.
//  Copyright © 2016年 Hong XIing. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "UserInfoDataModel.h"
#import <objc/runtime.h>
@interface RootViewController ()

@end

@implementation RootViewController
- (IBAction)buttononlcick:(id)sender {
    UIViewController *vc = [[UIViewController alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/*
 @property (nonatomic,copy)NSString *name;
 @property (nonatomic,copy)NSString *phone;
 @property (nonatomic,assign)uint age;
 @property (nonatomic,assign)BOOL sex;
 */
- (IBAction)buttonOnClick:(UIButton *)sender {
    NSInteger tag = sender.tag;
    if (tag == 10) { //增
        for (int i = 0; i < 5; i++) {
            UserInfoDataModel *model = [[UserInfoDataModel alloc] init];
            model.name = [NSString stringWithFormat:@"周林-%d",i];
            model.phone = [NSString stringWithFormat:@"1588211425%d",i];
            model.age = 20+i;
            if (i % 2) {
                model.sex= YES;
            }else{
                model.sex= NO;
            }
            model.uid = [NSString stringWithFormat:@"%d",10000+i];
            [model save];
        }
    }else if (tag == 11){//删除
        NSDictionary *pamters = @{@"uid":@"10003",@"sex":@"1"};
        UserInfoDataModel *model = [[UserInfoDataModel alloc] init];
//        [model whereRaw:@"uid = ? AND sex = ?" value:pamters];
        [model where:pamters];//删除uid为10003的数据
        [model delete];
    }else if (tag == 12){//修改
        NSDictionary *pamters = @{@"uid":@"10002",@"sex":@"0"};
        UserInfoDataModel *model1 = [[UserInfoDataModel alloc] init];
        model1.name = @"吴丹";
        model1.age = 30;
        model1.sex = YES;
        model1.uid = @"111";
        model1.phone = @"110";
//        [model1 where:pamters];//修改uid为1002数据
        [model1 whereRaw:@"uid = ? AND sex = ?" value:pamters];
        [model1 update:[RootViewController dictionaryWithModel:model1]];
    }else if (tag == 13){//查找
        NSArray *array = [UserInfoDataModel findAll];
        [UserInfoDataModel deleteAll];
        NSLog(@"arrary = %@",array);
    }
    
}

#pragma mark -模型转字典
+ (NSDictionary *)dictionaryWithModel:(id)model{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    if (model == nil) {
        return dict;
    }
    // 获取类名/根据类名获取类对象
    NSString *className = NSStringFromClass([model class]);
    id classObject = objc_getClass([className UTF8String]);
    
    // 获取所有属性
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList(classObject, &count);
    
    // 遍历所有属性
    for (int i = 0; i < count; i++) {
        // 取得属性
        objc_property_t property = properties[i];
        // 取得属性名
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property)
                                                          encoding:NSUTF8StringEncoding];
        // 取得属性值
        id propertyValue = nil;
        id valueObject = [model valueForKey:propertyName];
        
        if ([valueObject isKindOfClass:[NSDictionary class]]) {
            propertyValue = [NSDictionary dictionaryWithDictionary:valueObject];
        } else if ([valueObject isKindOfClass:[NSArray class]]) {
            propertyValue = [NSArray arrayWithArray:valueObject];
        } else {
            propertyValue = [NSString stringWithFormat:@"%@", [model valueForKey:propertyName]];
        }
        
        [dict setObject:propertyValue forKey:propertyName];
    }
    return [dict copy];
}


@end
