//
//  ThaanaDelegate.m
//  ThaanaTextField
//
//  Created by Mohamed Jinah Adam on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThaanaDelegate.h"

@implementation ThaanaDelegate

#pragma mark -
#pragma mark Overide UITextViewDelegate

- (id)init
{
    self = [super init];
    if (self) {
        _lines = [[NSMutableArray alloc] initWithCapacity: 10];
        [_lines addObject: [NSMutableString stringWithCapacity: 255]];
       
    }
    return self;
}


+(ThaanaDelegate *) thaanaDelegate {
       return [[ThaanaDelegate alloc] init];
}

//overiding the UITextViewDelegate Method
-(BOOL) textView:(UITextView*) textView shouldChangeTextInRange:(NSRange) range replacementText:(NSString*) text {
    NSRange rng;
    textView.text = [ThaanaDelegate reverseText: text
                                       withFont: textView.font
                                 carretPosition: &rng 
                                          Lines: _lines
                                         Bounds: textView.bounds];
    
    textView.selectedRange = rng;
    return NO;
}


#pragma mark -
#pragma mark Main Logic

+(NSString*) reverseText:(NSString*) text withFont:(UIFont*) font carretPosition:(NSRange*) cpos Lines:(NSMutableArray*) lines Bounds:(CGRect) bounds {
    
    cpos->length = 0;
    cpos->location = 0;
    if( [text length] ) {
        if( ![text isEqualToString: @"\n"] ) {
            [(NSMutableString*)[lines lastObject] insertString: text
                                                       atIndex: 0];
        } else {
            [lines addObject: [NSMutableString stringWithCapacity: 255]];
        }
    } else {
        //backspace
        //TODO:
        NSRange del_rng;
        del_rng.length = 1;
        del_rng.location = 0;
        if( [(NSMutableString*)[lines lastObject] length] ) {
            [(NSMutableString*)[lines lastObject] deleteCharactersInRange: del_rng];
        }
        if( ![(NSMutableString*)[lines lastObject] length] ) {
            // NSLog(@"%d is the line count", [lines count]);
            if([lines count] > 1) [lines removeLastObject];
        }
    }
    
    CGSize sz = [(NSString*)[lines lastObject] sizeWithFont: font];
    if( sz.width >= bounds.size.width-15 ) {
        NSMutableArray* words = [NSMutableArray arrayWithArray: [(NSString*)[lines lastObject] componentsSeparatedByString: @" "]];
        NSString* first_word = words[0];
        [words removeObjectAtIndex: 0];
        [(NSMutableString*)[lines lastObject] setString: [words componentsJoinedByString: @" "]];
        [lines addObject: [NSMutableString stringWithString: first_word]];
    }
    
    NSMutableString* txt = [NSMutableString stringWithCapacity: 100];
    for(int i=0; i<[lines count]; ++i) {
        NSString* line = lines[i];
        if( i<([lines count]-1) ) {
            [txt appendFormat: @"%@\n", line];
            cpos->location += [line length]+1;
        } else {
            [txt appendFormat: @"%@", line];
        }
    }

    
    return txt;

}


@end
