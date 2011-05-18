#import "SPTree.h"

@implementation SPTree

@synthesize children, fraction, direction;

- (id)init
{
    self = [super init];
    
    if(self)
    {
        children = nil;
        fraction = 1.0f;
        direction = SPHorizontalDirection;
    }
    return self;
}


@end
