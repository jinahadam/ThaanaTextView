//
//  ThaanaDelegate.h
//  ThaanaTextField
//
//  Created by Mohamed Jinah Adam on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface ThaanaDelegate : NSObject <UITextViewDelegate> {

    NSMutableArray* _lines;
}

//factory method that returns a thaanaDelegate Object. 
+(ThaanaDelegate *) thaanaDelegate;
//main logic
+(NSString*) reverseText:(NSString*) text withFont:(UIFont*) font carretPosition:(NSRange*) cpos Lines:(NSMutableArray*) lines Bounds:(CGRect) bounds;

@end
