//
//  InputHandler.m
//  Lab3
//
//  Created by Uji Saori on 2021-02-25.
//

#import "InputHandler.h"

@implementation InputHandler


+ (NSString *) getUserInputWithMax:(int) maxLength AndPrompt:(NSString *)prompt {
    // default
    if (maxLength < 1) {
        maxLength = 255;
    }
    NSLog(@"%@ ", prompt);
    char inputChars[maxLength];
    char *result = fgets(inputChars, maxLength, stdin);
    if (result != NULL) {
        // call class method: 'ClassName MethodName'
        NSString *objCString = [NSString stringWithUTF8String: inputChars];
        NSCharacterSet *whitespaces = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimmedInput = [objCString stringByTrimmingCharactersInSet: whitespaces];
        return trimmedInput;
    }
    return NULL;
}


@end
