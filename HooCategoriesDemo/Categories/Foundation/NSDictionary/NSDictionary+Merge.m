//
//  NSDictionary+Merge.m
//  iOS-Categories (https://github.com/shaojiankui/iOS-Categories)
//
//  Created by Jakey on 15/1/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "NSDictionary+Merge.h"

@implementation NSDictionary (Merge)
/**
 *  @brief  合并两个NSDictionary
 *
 *  @param dict1 NSDictionary
 *  @param dict2 NSDictionary
 *
 *  @return 合并后的NSDictionary
 */
+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2 {
    NSMutableDictionary * mutableDict1 = [NSMutableDictionary dictionaryWithDictionary:dict1];
    NSMutableDictionary * mutableDict2 = [NSMutableDictionary dictionaryWithDictionary:dict2];
    [mutableDict1 addEntriesFromDictionary:dict2];
    
    [mutableDict1 enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if([dict1 objectForKey:key]) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary * newVal = [[dict2 objectForKey: key] dictionaryByMergingWith: (NSDictionary *) obj];
                [mutableDict2 setObject:newVal forKey:key];
                
            } else if ([obj isKindOfClass:[NSMutableArray class]]) {
                
                if ([dict1[key] isKindOfClass:[NSMutableArray class]]) {
                    for (NSString *value in mutableDict2[key]) {
                        [obj addObject:value];
                    }
                } else {
                    [obj addObject:mutableDict2[key]];
                }
                [mutableDict2 setObject:obj forKey:key];
            } else  {
                NSMutableArray *array = [NSMutableArray array];
                [array addObject:obj];
                if ([dict2[key] isKindOfClass:[NSMutableArray class]]) {
                    for (NSString *value in mutableDict2[key]) {
                        [array addObject:value];
                    }
                } else {
                    [array addObject:mutableDict2[key]];
                }
                [mutableDict2 setObject:array forKey:key];
                NSLog(@"value:%@",mutableDict2[key]);
            }
        } else {
            NSMutableArray *array = [NSMutableArray array];
            if ([mutableDict2[key] isKindOfClass:[NSArray class]]) {
                for (NSString *value in mutableDict2[key]) {
                    [array addObject:value];
                }
            }
            [mutableDict2 setObject:array forKey:key];
        }
        
    }];
    return (NSDictionary *)[mutableDict2 mutableCopy];
    
    //    [resultTemp addEntriesFromDictionary:dict2];
    //    [resultTemp enumerateKeysAndObjectsUsingBlock: ^(id key, id obj, BOOL *stop) {
    //        if ([dict1 objectForKey:key]) {
    //            if ([obj isKindOfClass:[NSMutableArray class]]) {
    //                NSMutableArray * newVal = [obj addObject:<#(nonnull id)#>];
    //                [result setObject: newVal forKey: key];
    //            } else {
    //                [result setObject: obj forKey: key];
    //            }
    //        }
    //        else if([dict2 objectForKey:key])
    //        {
    //            if ([obj isKindOfClass:[NSDictionary class]]) {
    //                NSDictionary * newVal = [[dict2 objectForKey: key] dictionaryByMergingWith: (NSDictionary *) obj];
    //                [result setObject: newVal forKey: key];
    //            } else {
    //                [result setObject: obj forKey: key];
    //            }
    //        }
    //    }];
    //    return (NSDictionary *) [result mutableCopy];
    
}
/**
 *  @brief  并入一个NSDictionary
 *
 *  @param dict NSDictionary
 *
 *  @return 增加后的NSDictionary
 */
- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict {
    return [[self class] dictionaryByMerging:self with: dict];
}
@end
