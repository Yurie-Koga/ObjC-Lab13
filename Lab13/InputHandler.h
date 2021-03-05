//
//  InputHandler.h
//  Lab3
//
//  Created by Uji Saori on 2021-02-25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputHandler : NSObject

+ (NSString *) getUserInputWithMax:(int) maxLength AndPrompt:(NSString *)prompt;

@end

NS_ASSUME_NONNULL_END
