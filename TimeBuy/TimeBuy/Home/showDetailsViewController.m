//
//  showDetailsViewController.m
//  TimeBuy
//
//  Created by yuweize on 15/8/29.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import "showDetailsViewController.h"
typedef NS_ENUM(NSInteger, FieldTag) {
    FieldTagHorizontalLayout = 1001,
    FieldTagVerticalLayout,
    FieldTagMaskType,
    FieldTagShowType,
    FieldTagDismissType,
    FieldTagBackgroundDismiss,
    FieldTagContentDismiss,
    FieldTagTimedDismiss,
};
@interface showDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *labelname;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollviewcontrol;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (nonatomic)UIView *footview;
@end

@implementation showDetailsViewController
//tableview 动态添加数据
-(void)createTableviewData
{
    Sections = [[NSMutableArray alloc] initWithObjects:@"记录", nil];
    self.repeatData=[[NSMutableArray alloc]init];
    NSMutableDictionary *s1=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"小刚",@"name",@"高挺.png",@"picture",@"你好",@"neirong" ,@"一分钟前",@"time",nil];
    NSMutableDictionary *s2=[[NSMutableDictionary alloc] initWithObjectsAndKeys:@"余维泽",@"name",@"portrait.png",@"picture",@"你好",@"neirong",@"一分钟前",@"time",nil];
    self.repeatData=[[NSMutableArray alloc]initWithObjects:s1,s2, nil];
    NSLog(@"%@",self.repeatData);
    //[self.tableview reloadData];
    NSLog(@"数目%lu",(unsigned long)[self.repeatData count]);
    NSLog(@"suc");
}
//分享按钮
-(void)fenXiang{
    
}
//留言按钮
-(void) MClick{
    self.footview.hidden=true;
    //清楚footview中原有的控件缓存
    /*NSArray *subviews = [[NSArray alloc] initWithArray:self.footview.subviews];
    for (UIView *subview in subviews) {
        [subview removeFromSuperview];
    }*/
    UITextField *repeat=[[UITextField alloc]initWithFrame:CGRectMake(14, 583+83*self.repeatData.count+10, 347, 45)];
    repeat.delegate=self;
    repeat.placeholder=@"说点什么吧";
    repeat.textColor=[UIColor colorWithRed:170.f/255 green:170.f/255  blue:170.f/255  alpha:100];
    repeat.backgroundColor=[UIColor colorWithRed:246.f/255 green:246.f/255  blue:246.f/255  alpha:100];
    [self.scrollviewcontrol addSubview: repeat];
    self.tableview.hidden=false;
    self.scrollviewcontrol.delegate=self;
    [self.scrollviewcontrol setContentOffset:CGPointMake(0,283+83*self.repeatData.count) animated:NO];
    [repeat becomeFirstResponder];
}
- (void)viewDidLoad {
    [self createTableviewData];
    [super viewDidLoad];
    self.tableview.frame=CGRectMake(23, 23, 23, 23);
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    self.tableview.hidden=true;
    //设置底部
    self.footview=[[UIView alloc]initWithFrame:CGRectMake(0,570,375,40)];
    UIButton *favorButton=[[UIButton alloc]initWithFrame:CGRectMake(14, 6, 22, 22)];
    [favorButton setImage:[UIImage imageNamed:@"wujiaoxing.png"]forState:UIControlStateNormal];
    [self.footview addSubview:favorButton];
    UILabel *favorLabel=[[UILabel alloc]initWithFrame:CGRectMake(37, 13, 7, 11)];
    favorLabel.text=@"7";
    favorLabel.font=[UIFont fontWithName:@"Heiti TC" size:11];
    favorLabel.textColor=[UIColor lightGrayColor];
    [self.footview addSubview:favorLabel];
    UIButton *MButton=[[UIButton alloc]initWithFrame:CGRectMake(58, 6, 22, 22)];
    [MButton setImage:[UIImage imageNamed:@"xiangqing xiaoxi.png"]forState:UIControlStateNormal];
    [self.footview addSubview:MButton];
    [MButton addTarget:self
                action:@selector(MClick)
      forControlEvents:UIControlEventTouchUpInside
     ];
    UILabel *MLabel=[[UILabel alloc]initWithFrame:CGRectMake(83, 13, 7, 11)];
    MLabel.text=@"8";
    MLabel.font=[UIFont fontWithName:@"Heiti TC" size:11];
    MLabel.textColor=[UIColor lightGrayColor];
    UIButton *fenxButton=[[UIButton alloc]initWithFrame:CGRectMake(102, 6, 22, 22)];
    [fenxButton setImage:[UIImage imageNamed:@"fengxiang.png"]forState:UIControlStateNormal];
    [self.footview addSubview:fenxButton];
    [fenxButton addTarget:self
                action:@selector(fenXiang)
      forControlEvents:UIControlEventTouchUpInside
     ];
    UILabel *fengxLabel=[[UILabel alloc]initWithFrame:CGRectMake(129, 13, 7, 11)];
    fengxLabel.text=@"7";
    fengxLabel.font=[UIFont fontWithName:@"Heiti TC" size:11];
    fengxLabel.textColor=[UIColor lightGrayColor];
    [self.footview addSubview:fenxButton];
    [self.footview addSubview:fengxLabel];
    [self.view addSubview:self.footview];
        //设置标题
    self.navigationItem.title=@"详情";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:20.0f], NSFontAttributeName, nil];
    self.labelname.text=@"余维泽";
    //设置圆形头像
    self.head.layer.masksToBounds=true;
    self.head.layer.cornerRadius=20;
    //设置滚动
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scrollviewcontrol.contentSize=CGSizeMake(375,583+83*self.repeatData.count+70 );
    NSLog(@"suc3");
    //textlabel行距设置
    self.textLabel.numberOfLines=2;
    //设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 5;
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:13],
                                  NSParagraphStyleAttributeName:paragraphStyle};
    self.textLabel.attributedText = [[NSAttributedString alloc]initWithString:self.textLabel.text attributes:attributes];
    // Do any additional setup after loading the view from its nib.
}
//点击textfield上移
/*- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"开始");
    CGRect frame = textField.frame;
    //在这里我多加了62，（加上了输入中文选择文字的view高度）这个依据自己需求而定
    int offset = (frame.origin.y+62)-(self.scrollviewcontrol.frame.size.height-216.0);//键盘高度216
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:0.30f];//动画持续时间
    NSLog(@"offset= %d",offset);
    if (offset>0) {
        //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
        self.scrollviewcontrol.frame = CGRectMake(0.0f, -700, self.view.frame.size.width, self.view.frame.size.height);
        [UIView commitAnimations];
    }
}*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    self.footview.hidden=false;
    return true;
}

//弹出框计数变动
-(void)keyboardDidChange{
    NSString *newString = [NSString stringWithFormat:@"%lu%@",(unsigned long)textview.text.length,@"/20"];
    label.text=newString;
}
-(void)keyboardDidHidden{
    NSLog(@"结束");
    //self.textfield.text=textview.text;
}
-(void)keyboardDidBegin{
    textview.text=nil;
}
//弹框结束输入
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        [popup dismiss:true];
        return NO;
    }
    return YES;
}
//弹出框设置
- (IBAction)pressdown:(id)sender {
    NSLog(@"输入框");
    // Generate content view to present
    UIView *contentView = [[UIView alloc] init];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.layer.cornerRadius = 12.0;
    contentView.frame=CGRectMake(45, 208, 285, 179);
    textview=[[UITextView alloc]init];
    textview.frame=CGRectMake(0, 0, 285, 179);
    textview.text=@"想对Ta说点什么";
    textview.font=[UIFont fontWithName:@"Arial" size:18];
    [textview setTextColor:[UIColor lightGrayColor]];
    //textview.keyboardType=UIKeyboardTypeDefault;
    textview.layer.cornerRadius=12.0;
    textview.delegate=self;
    textview.editable=true;
    [[NSNotificationCenter
      defaultCenter] addObserver:self selector:@selector(keyboardDidBegin)name:UITextViewTextDidBeginEditingNotification object:textview];
    [[NSNotificationCenter
      defaultCenter] addObserver:self selector:@selector(keyboardDidChange)name:UITextViewTextDidChangeNotification object:textview];
    [[NSNotificationCenter
      defaultCenter] addObserver:self selector:@selector(keyboardDidHidden)name:UITextViewTextDidEndEditingNotification object:textview];
    label=[[UILabel alloc]initWithFrame:CGRectMake(233, 140, 50, 19)];
    label.text=@"8/20";
    label.font=[UIFont fontWithName:@"Arial" size:18];
    [label setTextColor:[UIColor lightGrayColor]];
    [contentView addSubview:textview];
    [contentView addSubview:label];
    popup = [KLCPopup popupWithContentView:contentView showType:KLCPopupShowTypeSlideInFromTop dismissType:KLCPopupDismissTypeSlideOutToBottom maskType:KLCPopupMaskTypeDimmed dismissOnBackgroundTouch:YES dismissOnContentTouch:NO];
    [popup show];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.repeatData count];
}
// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [Sections count];
}

//设置tableviewcell的样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(tableView==self.tableview && [self.repeatData objectAtIndex:indexPath.row]!=nil)
    {
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        // Configure the cell.
        cell.backgroundColor=[UIColor whiteColor];
        [cell setAccessoryType:UITableViewCellAccessoryNone]; 
        //添加名字
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 10, 300, 19)];
        label1.textColor=[UIColor blackColor];
        label1.font=[UIFont fontWithName:@"Arial" size:18];
        [label1 setText:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"name"]];
        [cell.contentView addSubview:label1];
        //添加回复
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 64, 40, 300, 19)];
        label2.textColor=[UIColor blackColor];
        label2.font=[UIFont fontWithName:@"Arial" size:18];
        [label2 setText:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"neirong"]];
        [cell.contentView addSubview:label2];
        //添加日期label
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake( 314, 10, 60, 13)];
        label3.textColor=[UIColor lightGrayColor];
        //label3.text =@"1分钟前";
        label3.font=[UIFont fontWithName:@"Arial" size:13];
        [label3 setText:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"time"]];
        [cell.contentView addSubview:label3];
        //添加image
        //[[cell textLabel] setText:[[repeatData objectAtIndex: indexPath.row] objectForKey:@"name"]];
        UIImageView *image=[[UIImageView alloc]init];
        image.frame=CGRectMake(14, 10, 39, 39);
        image.layer.masksToBounds=true;
        image.layer.cornerRadius=20;
        [image setImage:[UIImage imageNamed:[[self.repeatData objectAtIndex:indexPath.row]objectForKey:@"picture"]]];
        [cell.contentView addSubview:image];
        return cell;
    }
    return NULL;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete)
 {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert)
 {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
