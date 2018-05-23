//
//  Person.h
//  New-project_28-Coders
//
//  Created by Geraint on 2018/5/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// 一个人（Person），拥有名字（firstName属性）、姓氏（lastName属性）、全名（fullName属性）。
@property (readonly) NSString *fullName;
@property NSString *firstName;
@property NSString *lastName;

- (id)initWithFirstName:(NSString *)fname lastName:(NSString *)lname;

@end
