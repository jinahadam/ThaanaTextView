//
//  ThaanaTextView.m
//  ThaanaTextField
//
//  Created by Mohamed Jinah Adam on 6/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThaanaTextView.h"
#define FONT_USED @"A_Faseyha"
#define FONT_SIZE 25

@implementation ThaanaTextView


/*
 This allows for creating of ThaanaTextView in Code
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = UITextAlignmentRight;
        self.font = [UIFont fontWithName:FONT_USED size:FONT_SIZE];
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.autocorrectionType = UITextAutocorrectionTypeNo;
        //maybe there is a better way to do this???
        _thaanaDelegate = [ThaanaDelegate thaanaDelegate];
        self.delegate = _thaanaDelegate;
    
    }
    return self;
}

/*
 This allows for creating of ThaanaTextView in Storyboard and NIB
 */
- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        
        self.textAlignment = UITextAlignmentRight;
        self.font = [UIFont fontWithName:FONT_USED size:FONT_SIZE];
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.autocorrectionType = UITextAutocorrectionTypeNo;
        _thaanaDelegate = [ThaanaDelegate thaanaDelegate];
        self.delegate = _thaanaDelegate;
    
    }
    return self;
}

@end
