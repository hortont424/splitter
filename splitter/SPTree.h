#import <Foundation/Foundation.h>

typedef enum
{
    SPHorizontalDirection,
    SPVerticalDirection
} SPDirection;

@interface SPTree : NSObject
{
    NSMutableArray * children;
    float fraction;
    SPDirection direction;
}

@property (nonatomic,assign) NSMutableArray * children;
@property (nonatomic,assign) float fraction;
@property (nonatomic,assign) SPDirection direction;

@end
