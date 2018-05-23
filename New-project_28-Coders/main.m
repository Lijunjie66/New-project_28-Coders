//
//  main.m
//  New-project_28-Coders
//
//  Created by Geraint on 2018/5/18.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"
#import "Coder.h"
#import "Coders.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // 先， 创建了一个Person实例，然后使用键值编码获取该实例的属性值。
        Person *curly = [[Person alloc] initWithFirstName:@"Curly" lastName:@"Howard"];
        NSLog(@"Person first name: %@", [curly valueForKey:@"firstName"]);
        NSLog(@"Person full name: %@", [curly valueForKey:@"fullName"]);
        NSArray *langs1 = @[@"Objecttive-C",@"C"];
        
        // 接着， 创建了一个Coder实例，并设置了它的person和languages属性。这样键值编码API就被用于获取相应的属性值。
        Coder *coder1 = [Coder new];
        coder1.person = curly;
        coder1.languages = [langs1 mutableCopy];
        NSLog(@"\nCoder name: %@\n\t languages: %@", [coder1 valueForKeyPath:@"person.fullName"], [coder1 valueForKey:@"languages"]);
        // 又 创建了一个Coder实例，并设置了该实例的属性值
        Coder *coder2 = [Coder new];
        coder2.person = [[Person alloc] initWithFirstName:@"Larry" lastName:@"Fine"];
        coder2.languages = [@[@"Objective-C", @"C"] mutableCopy];
        NSLog(@"\nCoder name: %@\n\t languages: %@", [coder2 valueForKeyPath:@"person.fullName"], [coder2 valueForKey:@"languages"]);
        
        // 然后， 通过（键值观察）注册了一个Coder实例，当Person实例fullName属性更改时，该Coder实例就会收到通知。
        [curly addObserver:coder1 forKeyPath:@"fullName" options:NSKeyValueObservingOptionNew context:NULL];
        curly.lastName = @"Fine";
        [curly removeObserver:coder1 forKeyPath:@"fullName"];
        
        // 创建了一个Coders实例，（Coders类含有Coder实例的一个集合），并将它的developers属性赋予前面创建的Coder实例集合。
        // 然后， 使用集合操作符计算并返回了Coder实例集合中的实例总数。
        Coders *bestCoders = [Coders new];
        bestCoders.developers = [[NSSet alloc] initWithArray:@[coder1, coder2]];
        [bestCoders valueForKey:@"developers"];
        NSLog(@"Number of coders = %@", [bestCoders.developers valueForKeyPath:@"@count"]);
        
        // 最后， 使用键值编码检验方法检查了Person实例的lastName方法。
        NSError *error;
        NSString *emptyName = @"";
        BOOL valid = [curly validateValue:&emptyName forKey:@"lastName" error:&error];
        if (!valid) {
            NSLog(@"Error : %@", ([error userInfo])[NSLocalizedDescriptionKey]);
        }
        
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
