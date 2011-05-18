#import <Foundation/Foundation.h>
#import "SPTree.h"

@interface SPView : NSView
{
    SPTree * root;
}

@property (nonatomic, assign) SPTree * root;

@end
