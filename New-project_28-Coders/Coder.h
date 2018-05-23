//
//  Coder.h
//  New-project_28-Coders
//
//  Created by Geraint on 2018/5/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Person;       // @class指令用于提前声明Person类 ，因此无须再改接口中导入该类的头文件

@interface Coder : NSObject

@property Person *person;
@property NSMutableArray *languages;

@end
