//
//  QwwTopicItem.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/19.
//

#import "QwwTopicItem.h"

@implementation QwwTopicItem
- (CGFloat)cellHeight {
    // 如果计算了高度，直接返回
    if(_cellHeight) return _cellHeight;
//    NSLog(@"%s",__func__);
    // 文字的y值
    _cellHeight += 35 + 2 * QwwMargin;
    
    // 文字的高度
    CGSize maxSize = CGSizeMake(XMGScreenW - 2 * QwwMargin, MAXFLOAT);
//    cellHeight += [topic.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:maxSize].height + QwwMargin;
    _cellHeight += [self.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height + QwwMargin;
    
    // 中间内容的高度
    if(self.type != QwwTopicTypeWord) {
        CGFloat middleWidth = maxSize.width;
        CGFloat middleHeight = middleWidth * self.height / self.width;
        
        if(middleHeight >= XMGScreenH) {
            middleHeight = 200;
            self.bigPicture = YES;
        }
        CGFloat middleY = _cellHeight;
        CGFloat middleX = QwwMargin;
        self.middleFrame = CGRectMake(middleX, middleY, middleWidth, middleHeight);
        _cellHeight += middleHeight + QwwMargin;
    }
    
    // 最热评论
    if(self.top_cmt.count) { // 有最热评论
        // 标题
        _cellHeight += 21;
        // 内容
        NSDictionary *top_cmt = self.top_cmt;
        NSString *topcmt_name = top_cmt[@"user_name"];
        NSString *content = top_cmt[@"content"];
        if(content.length == 0) {
            content = @"[语音评论]";
        }
        NSString *cmtText = [NSString stringWithFormat:@"%@ : %@", topcmt_name, content];
        _cellHeight += [cmtText boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height + QwwMargin;
    }
    
    // 工具条
    _cellHeight += 35 + QwwMargin;
    return _cellHeight;
}
@end
