//
//  main.m
//  Lab13
//
//  Created by Uji Saori on 2021-03-05.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (YES) {
            // sample input  : Kale Chips
            // sample output : Alekay Ipschay
            NSString *inputStr = [InputHandler getUserInputWithMax:255 AndPrompt:@"input any word(s): "];
            inputStr = [inputStr lowercaseString];
            if([inputStr isEqualToString:@"q"]) { break; }
            
            NSArray *commandWords = [inputStr componentsSeparatedByString:@" "];
        
            NSMutableArray *results = [NSMutableArray array];
            for(NSString *firstWord in commandWords) {
                NSError *error = nil;
                NSRange searchedRange = NSMakeRange(0, [firstWord length]);
                NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^aeiou]+" options:0 error:&error];
                NSTextCheckingResult *firstMatch = [regex firstMatchInString:firstWord options:0 range:searchedRange];
                NSString *matchedText = [firstWord substringWithRange:[firstMatch range]];
                NSRange range = [firstWord rangeOfString:matchedText];
                NSString *result = [firstWord substringFromIndex:range.location + [matchedText length]];
                result = [result stringByAppendingFormat:@"%@ay", matchedText];
                result = [NSString stringWithFormat:@"%@%@",[[result substringToIndex:1] uppercaseString], [result substringFromIndex:1]];
                [results addObject:result];
            }
            NSLog(@"result: %@", [results componentsJoinedByString:@" "]);
        }
    }
    return 0;
}
