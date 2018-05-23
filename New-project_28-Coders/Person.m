//
//  Person.m
//  New-project_28-Coders
//
//  Created by Geraint on 2018/5/23.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import "Person.h"
#define CodersErrorDomain @"CodersErrorDomain"
#define kInvalidValueError 1

@implementation Person

- (id)initWithFirstName:(NSString *)fname lastName:(NSString *)lname {
    if (self = [super init]) {
        _firstName = fname;
        _lastName = lname;
    }
    return self;
}

// 全名 = [ 名 + 姓]
// 访问方法fullName会返回Person对象的fullName属性值，该属性为firstName和lastName属性值拼接的结果
- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

// validateLastName: error: 方法用于对lastName属性执行KVC属性检验操作
- (BOOL)validateLastName:(id *)value error:(NSError * __autoreleasing *)error {
    
    // 检查是否存在nil值
     //在implementation里面加这个方法，它会验证是否设了非法的value
    NSString *countString = *value;  // 将 id*类型 改NSString类型
    if (countString == nil) {
        if (error != NULL) {
            NSDictionary *reason = @{NSLocalizedDescriptionKey:@"Last name cannot be nil"};
            *error = [NSError errorWithDomain:CodersErrorDomain code:kInvalidValueError userInfo:reason];
        }
        return NO;
    }
    // 检查空值
    NSUInteger length = [[countString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length];
    if (length == 0) {
        if (error != NULL) {
            NSDictionary *reason = @{NSLocalizedDescriptionKey:@"Last name cannot be empty"};
            *error = [NSError errorWithDomain:CodersErrorDomain code:kInvalidValueError userInfo:reason];
        }
        return NO;
    }
    return YES;
}

// *** keyPathsForValuesAffectingValueForkey: 方法用于注册依赖键，它会使用fullName属性获取添加到返回键路径中的键
+ (NSSet *)keyPathsForValuesAffectingValueForkey:(NSString *)key {
    NSSet *keyPaths= [super keyPathsForValuesAffectingValueForKey:key];
    
    if ([key isEqualToString:@"fullName"]) {
        NSArray *affectingKeys = @[@"firstName", @"lastName"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    return keyPaths;
}

@end
